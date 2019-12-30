{
  Copyright (C) 2012, 2014 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit TimedSemaphore;

{$ifdef FPC}
 {$mode OBJFPC}{$H+}
{$else}
 {$ifdef MACOS}{$define DELPHI_MACOS}{$endif}
{$endif}

interface

uses
  {$ifdef UNIX}CThreads,{$endif} {$ifdef MSWINDOWS}Windows{$else}SyncObjs{$endif};

type

{$ifndef MSWINDOWS}

  { Manual-Reset Event }
  TEventWrapper = class
  private
 {$ifdef DELPHI_MACOS}
    fEvent: TEvent;
 {$else}
    fEvent: PRTLEvent;
 {$endif}
  public
    constructor Create;
    destructor Destroy; override;
    procedure WaitFor(const aTimeout: longint);
    procedure SetEvent;
    procedure ResetEvent;
  end;

{$endif}

  { Semaphore with blocking lower bound, but without blocking upper bound }
  TTimedSemaphore = class
  private
    fAlive: boolean;
{$ifdef MSWINDOWS}
    fHandle: THandle;
{$else}
    fMutex: TCriticalSection;
    fEvent: TEventWrapper;
    fAvailable: longint;
{$endif}
  public
    constructor Create;
    destructor Destroy; override;
    function Acquire(const aTimeout: longint): boolean;
    procedure Release;
  end;

implementation

constructor TTimedSemaphore.Create;
begin
  inherited;
  fAlive:= true;
{$ifdef MSWINDOWS}
  fHandle:= CreateSemaphore(nil, 0, 2147483647, nil);
{$else}
  fMutex:= TCriticalSection.Create;
  fEvent:= TEventWrapper.Create;
  fAvailable:= 0;
{$endif}
end;

destructor TTimedSemaphore.Destroy;
begin
  if (not fAlive) then begin
    exit;
  end;
  fAlive:= false;
  Release;
{$ifdef MSWINDOWS}
  CloseHandle(fHandle);
{$else}
  fEvent.Destroy;
  fMutex.Destroy;
{$endif}
  inherited Destroy;
end;

function TTimedSemaphore.Acquire(const aTimeout: longint): boolean;
begin
{$ifdef MSWINDOWS}
  if (aTimeout < 0) then begin
    Result:= WaitForSingleObject(fhandle, INFINITE) = WAIT_OBJECT_0;
  end
  else begin
    Result:= WaitForSingleObject(fhandle, atimeout) = WAIT_OBJECT_0;
  end;
{$else}
  Result:= false;
  fMutex.Acquire;
  try
    if (fAvailable > 0) then begin
      Dec(fAvailable);
      Result:= true;
      if (fAvailable = 0) then begin
        fEvent.ResetEvent();
      end;
    end;
  finally
    fMutex.Release;
  end;
  if not Result then begin
    fEvent.WaitFor(aTimeout);
    fMutex.Acquire;
    try
      if (fAvailable > 0) then begin
        Dec(fAvailable);
        Result:= true;
        if (fAvailable = 0) then begin
          fEvent.ResetEvent();
        end;
      end;
    finally
      fMutex.Release;
    end;
  end;
{$endif}
  if (not fAlive) then begin
    Result:= false;
  end;
end;

procedure TTimedSemaphore.Release;
begin
{$ifdef MSWINDOWS}
  ReleaseSemaphore(fHandle, 1, nil);
{$else}
  fMutex.Acquire;
  try
    Inc(fAvailable);
  finally
    fMutex.Release;
  end;
  fEvent.SetEvent();
{$endif}
end;

{$ifndef MSWINDOWS}

{ TEventWrapper }
constructor TEventWrapper.Create;
begin
 {$ifdef DELPHI_MACOS}
  fEvent:= TEvent.Create(nil, true, false, '', false);
 {$else}
  fEvent:= RTLEventCreate; { This is a manual-reset fEvent }
 {$endif}
end;

destructor TEventWrapper.Destroy;
begin
 {$ifdef DELPHI_MACOS}
  fEvent.Destroy;
 {$else}
  RTLEventDestroy(fEvent);
 {$endif}
  inherited Destroy;
end;

procedure TEventWrapper.WaitFor(const aTimeout: longint);
begin
  if (aTimeout < 0) then begin
 {$ifdef DELPHI_MACOS}
    fevent.WaitFor(INFINITE);
 {$else}
    RTLEventWaitFor(fEvent);
 {$endif}
  end
  else begin
 {$ifdef DELPHI_MACOS}
    fevent.WaitFor(timeout);
 {$else}
    RTLEventWaitFor(fEvent, aTimeout);
 {$endif}
  end;
end;

procedure TEventWrapper.SetEvent;
begin
 {$ifdef DELPHI_MACOS}
  fevent.SetEvent();
 {$else}
  RTLEventSetEvent(fEvent);
 {$endif}
end;

procedure TEventWrapper.ResetEvent;
begin
 {$ifdef DELPHI_MACOS}
  fevent.ResetEvent();
 {$else}
  RTLEventResetEvent(fEvent);
 {$endif}
end;

{$endif}

end.
