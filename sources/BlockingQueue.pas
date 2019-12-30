{
  Copyright (C) 2012 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit BlockingQueue;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

{$ifndef FPC}
 {$ifdef CONDITIONALEXPRESSIONS}
  {$if CompilerVersion >= 20.0}
   {$define USE_GENERICS}
  {$ifend}
 {$endif}
{$endif}

interface

uses
  SysUtils, TinkerforgeCommon,
{$ifdef USE_GENERICS}
  Generics.Collections,
{$else}
  Contnrs,
{$endif}
  SyncObjs, LEConverter, TimedSemaphore;

type
  TBlockingQueue = class
  private
    _Mutex: TCriticalSection;
    _Semaphore: TTimedSemaphore;
{$ifdef USE_GENERICS}
    _kinds: TQueue<PByte>;
    _items: TQueue<PDynamicByteArray>;
{$else}
    _Kinds: TQueue;
    _Items: TQueue;
{$endif}
  public
    constructor Create;
    destructor Destroy; override;
    procedure Enqueue(const aKind: byte; const aItem: TDynamicByteArray);
    function Dequeue(out aKind: byte; out aItem: TDynamicByteArray; const aTimeout: longint): boolean;
  end;

implementation

constructor TBlockingQueue.Create;
begin
  inherited;
  _Mutex:= TCriticalSection.Create;
  _Semaphore:= TTimedSemaphore.Create;
{$ifdef USE_GENERICS}
  _kinds:= TQueue<PByte>.Create;
  _items:= TQueue<PDynamicByteArray>.Create;
{$else}
  _Kinds:= TQueue.Create;
  _Items:= TQueue.Create;
{$endif}
end;

destructor TBlockingQueue.Destroy;
var
  pkind: PByte;
  pitem: PDynamicByteArray;
begin
  _Mutex.Acquire;
  try
    while (_Kinds.Count > 0) do begin
{$ifdef USE_GENERICS}
      pkind:= _kinds.Dequeue;
{$else}
      pkind:= _Kinds.Pop;
{$endif}
      Dispose(pkind);
    end;
    while (_Items.Count > 0) do begin
{$ifdef USE_GENERICS}
      pitem:= _items.Dequeue;
{$else}
      pitem:= _Items.Pop;
{$endif}
      Dispose(pitem);
    end;
  finally
    _Mutex.Release;
  end;
  _Mutex.Destroy;
  _Semaphore.Destroy;
  _Kinds.Destroy;
  _Items.Destroy;
  inherited Destroy;
end;

procedure TBlockingQueue.Enqueue(const aKind: byte; const aItem: TDynamicByteArray);
var
  pkind: PByte;
  pitem: PDynamicByteArray;
begin
  _Mutex.Acquire;
  try
    New(pkind);
    pkind^:= aKind;
{$ifdef USE_GENERICS}
    _kinds.Enqueue(pkind);
{$else}
    _Kinds.Push(pkind);
{$endif}
    New(pitem);
    pitem^:= aItem;
{$ifdef USE_GENERICS}
    _items.Enqueue(pitem);
{$else}
    _Items.Push(pitem);
{$endif}
    _Semaphore.Release;
  finally
    _Mutex.Release;
  end;
end;

function TBlockingQueue.Dequeue(out aKind: byte; out aItem: TDynamicByteArray; const aTimeout: longint): boolean;
var pkind: PByte; pitem: PDynamicByteArray;
begin
  Result:= false;
  if (_Semaphore.Acquire(aTimeout)) then begin
    _Mutex.Acquire;
    try
{$ifdef USE_GENERICS}
      pkind:= _kinds.Dequeue;
{$else}
      pkind:= _Kinds.Pop;
{$endif}
      aKind:= pkind^;
      Dispose(pkind);
{$ifdef USE_GENERICS}
      pitem:= _items.Dequeue;
{$else}
      pitem:= _Items.Pop;
{$endif}
      aItem:= pitem^;
      Dispose(pitem);
      Result:= true;
    finally
      _Mutex.Release;
    end;
  end;
end;

end.
