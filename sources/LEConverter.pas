{
  Copyright (C) 2012-2013 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit LEConverter;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  SysUtils, TinkerforgeCommon;

procedure LEConvertInt8To(const aValue: shortint; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertUInt8To(const aValue: byte; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertInt16To(const aValue: smallint; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertUInt16To(const aValue: word; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertInt32To(const aValue: longint; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertUInt32To(const aValue: longword; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertInt64To(const aValue: int64; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertUInt64To(const aValue: uint64; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertFloatTo(const aValue: single; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertBooleanTo(const aValue: boolean; const aOffset: longint; var aData: TDynamicByteArray);
procedure LEConvertStringTo(const aValue: string; const aOffset: longint; const aLen: longint; var aData: TDynamicByteArray);
procedure LEConvertCharTo(const aValue: char; const aOffset: longint; var aData: TDynamicByteArray);

function LEConvertInt8From(const aOffset: longint; const aData: TDynamicByteArray): shortint;
function LEConvertUInt8From(const aOffset: longint; const aData: TDynamicByteArray): byte;
function LEConvertInt16From(const aOffset: longint; const aData: TDynamicByteArray): smallint;
function LEConvertUInt16From(const aOffset: longint; const aData: TDynamicByteArray): word;
function LEConvertInt32From(const aOffset: longint; const aData: TDynamicByteArray): longint;
function LEConvertUInt32From(const aOffset: longint; const aData: TDynamicByteArray): longword;
function LEConvertInt64From(const aOffset: longint; const aData: TDynamicByteArray): int64;
function LEConvertUInt64From(const aOffset: longint; const aData: TDynamicByteArray): uint64;
function LEConvertFloatFrom(const aOffset: longint; const aData: TDynamicByteArray): single;
function LEConvertBooleanFrom(const aOffset: longint; const aData: TDynamicByteArray): boolean;
function LEConvertStringFrom(const aOffset: longint; const len: longint; const aData: TDynamicByteArray): string;
function LEConvertCharFrom(const aOffset: longint; const aData: TDynamicByteArray): char;

implementation

type
  TFloatAsBytes = record
    case boolean of
      true:  (bytes : packed array [0..3] of byte);
      false: (float : single);
  end;

procedure LEConvertInt8To(const aValue: shortint; const aOffset: longint; var aData: TDynamicByteArray);
begin
  LEConvertUInt8To(byte(aValue), aOffset, aData);
end;

procedure LEConvertUInt8To(const aValue: byte; const aOffset: longint; var aData: TDynamicByteArray);
begin
  aData[aOffset]:= aValue;
end;

procedure LEConvertInt16To(const aValue: smallint; const aOffset: longint; var aData: TDynamicByteArray);
begin
  LEConvertUInt16To(word(aValue), aOffset, aData);
end;

procedure LEConvertUInt16To(const aValue: word; const aOffset: longint; var aData: TDynamicByteArray);
begin
  aData[aOffset + 0]:= byte((aValue shr 0) and $FF);
  aData[aOffset + 1]:= byte((aValue shr 8) and $FF);
end;

procedure LEConvertInt32To(const aValue: longint; const aOffset: longint; var aData: TDynamicByteArray);
begin
  LEConvertUInt32To(longword(aValue), aOffset, aData);
end;

procedure LEConvertUInt32To(const aValue: longword; const aOffset: longint; var aData: TDynamicByteArray);
var _i: longint;
begin
  for _i:= 0 to 3 do begin
    aData[aOffset + _i]:= byte((aValue shr (_i * 8)) and $FF);
  end;
end;

procedure LEConvertInt64To(const aValue: int64; const aOffset: longint; var aData: TDynamicByteArray);
begin
  LEConvertUInt64To(uint64(aValue), aOffset, aData);
end;

procedure LEConvertUInt64To(const aValue: uint64; const aOffset: longint; var aData: TDynamicByteArray);
var _i: longint;
begin
  for _i:= 0 to 7 do begin
    aData[aOffset + _i]:= byte((aValue shr (_i * 8)) and $FF);
  end;
end;

procedure LEConvertFloatTo(const aValue: single; const aOffset: longint; var aData: TDynamicByteArray);
var _i: longint; fab: TFloatAsBytes;
begin
  fab.float:= aValue;
  for _i:= 0 to 3 do begin
    aData[aOffset + _i]:= fab.bytes[_i];
  end;
end;

procedure LEConvertBooleanTo(const aValue: boolean; const aOffset: longint; var aData: TDynamicByteArray);
begin
  if (aValue) then begin
    aData[aOffset]:= 1;
  end
  else begin
    aData[aOffset]:= 0;
  end;
end;

procedure LEConvertStringTo(const aValue: string; const aOffset: longint; const aLen: longint; var aData: TDynamicByteArray);
var _i: longint;
begin
  _i:= 0;
  while ((_i < aLen) and (_i < Length(aValue))) do begin
    aData[aOffset + _i]:= byte(aValue[_i + 1]);
    _i:= _i + 1;
  end;
  while (_i < aLen) do begin
    aData[aOffset + _i]:= 0;
    _i:= _i + 1;
  end;
end;

procedure LEConvertCharTo(const aValue: char; const aOffset: longint; var aData: TDynamicByteArray);
begin
  aData[aOffset]:= byte(aValue);
end;

function LEConvertInt8From(const aOffset: longint; const aData: TDynamicByteArray): shortint;
begin
  Result:= shortint(LEConvertUInt8From(aOffset, aData));
end;

function LEConvertUInt8From(const aOffset: longint; const aData: TDynamicByteArray): byte;
begin
  Result:= aData[aOffset];
end;

function LEConvertInt16From(const aOffset: longint; const aData: TDynamicByteArray): smallint;
begin
  Result:= smallint(LEConvertUInt16From(aOffset, aData));
end;

function LEConvertUInt16From(const aOffset: longint; const aData: TDynamicByteArray): word;
begin
  Result:= word(aData[aOffset + 0]) shl 0 or
            word(aData[aOffset + 1]) shl 8;
end;

function LEConvertInt32From(const aOffset: longint; const aData: TDynamicByteArray): longint;
begin
  Result:= longint(LEConvertUInt32From(aOffset, aData));
end;

function LEConvertUInt32From(const aOffset: longint; const aData: TDynamicByteArray): longword;
var _i: longint;
begin
  Result:= 0;
  for _i:= 0 to 3 do begin
    Result:= Result or (longword(aData[aOffset + _i]) shl (_i * 8));
  end;
end;

function LEConvertInt64From(const aOffset: longint; const aData: TDynamicByteArray): int64;
begin
  Result:= int64(LEConvertUInt64From(aOffset, aData));
end;

function LEConvertUInt64From(const aOffset: longint; const aData: TDynamicByteArray): uint64;
var _i: longint;
begin
  { Avoid compiler bug when assigning constants to a uint64 variable:
    https://qc.embarcadero.com/wc/qcmain.aspx?d=9411 }
  Result:= uint64(0);
  for _i:= 0 to 7 do begin
    Result:= Result or (uint64(aData[aOffset + _i]) shl (_i * 8));
  end;
end;

function LEConvertFloatFrom(const aOffset: longint; const aData: TDynamicByteArray): single;
var _i: longint; fab: TFloatAsBytes;
begin
  for _i:= 0 to 3 do begin
    fab.bytes[_i]:= aData[aOffset + _i];
  end;
  Result:= fab.float;
end;

function LEConvertBooleanFrom(const aOffset: longint; const aData: TDynamicByteArray): boolean;
begin
  Result:= aData[aOffset] <> 0;
end;

function LEConvertStringFrom(const aOffset: longint; const len: longint; const aData: TDynamicByteArray): string;
var _i: longint;
begin
  Result:= '';
  for _i:= aOffset to aOffset + len - 1 do begin
    if (aData[_i] = 0) then begin
      break;
    end;
    Result:= Result + char(aData[_i]);
  end;
end;

function LEConvertCharFrom(const aOffset: longint; const aData: TDynamicByteArray): char;
begin
  Result:= char(aData[aOffset]);
end;

end.
