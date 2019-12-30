unit TinkerforgeCommon;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils;

//{$I Tinkerforge.inc}

type
  PDynamicByteArray = ^TDynamicByteArray;
  TDynamicByteArray = array of byte;
  TUIDArray = array of longword;
  TTFResponseExpected = array [0..255] of byte;
  TTFCallbackWrapper = procedure(const aPacket: TDynamicByteArray) of object;
  TTFCallbackWrappers = array [0..255] of TTFCallbackWrapper;
  TTFVersionNumber = array [0..2] of byte;

function GetResponseExpectedFromData(const aData: TDynamicByteArray): boolean;
function GetFunctionIDFromData(const aData: TDynamicByteArray): byte;
function GetSequenceNumberFromData(const aData: TDynamicByteArray): byte;
function GetErrorCodeFromData(const aData: TDynamicByteArray): byte;

implementation

function GetResponseExpectedFromData(const aData: TDynamicByteArray): boolean;
begin
  if (((aData[6] shr 3) and $01) = 1) then begin
    Result:= true;
  end
  else begin
    Result:= false;
  end;
end;

function GetFunctionIDFromData(const aData: TDynamicByteArray): byte;
begin
  Result:= aData[5];
end;

function GetSequenceNumberFromData(const aData: TDynamicByteArray): byte;
begin
  Result:= (aData[6] shr 4) and $0F;
end;

function GetErrorCodeFromData(const aData: TDynamicByteArray): byte;
begin
  Result:= (aData[7] shr 6) and $03;
end;

end.

