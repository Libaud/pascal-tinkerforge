{
  Copyright (C) 2014 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit BrickDaemon;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, DeviceAbstract, LEConverter, IPConnection;

{$I Tinkerforge.inc}
{$I BrickDaemon.inc}

type
  TArray0To3OfUInt8 = array [0..3] of byte;
  TArray0To19OfUInt8 = array [0..19] of byte;

  TBrickDaemon = class(TDeviceAbstract)
  private
    fResponseExpected: TTFResponseExpected;
    // Method's
    // Access method's
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); virtual;
  public
    constructor Create(aOwner: TComponent); override;
    function GetAuthenticationNonce: TArray0To3OfUInt8; virtual;
    procedure Authenticate(const aclientNonce: TArray0To3OfUInt8; const adigest: TArray0To19OfUInt8); virtual;
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word);
    // Properties
  end;

implementation

constructor TBrickDaemon.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  InitializeResponseExpected(fResponseExpected);
end;

procedure TBrickDaemon.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickDaemon.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_DAEMON_FUNCTION_GET_AUTHENTICATION_NONCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DAEMON_FUNCTION_AUTHENTICATE]:= DEVICE_RESPONSE_EXPECTED_TRUE;
end;

// Access method's

function TBrickDaemon.GetAuthenticationNonce: TArray0To3OfUInt8;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DAEMON_FUNCTION_GET_AUTHENTICATION_NONCE, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do Result[_i]:= LEConvertUInt8From(8 + _i, _response);
end;

procedure TBrickDaemon.Authenticate(const aclientNonce: TArray0To3OfUInt8; const adigest: TArray0To19OfUInt8);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DAEMON_FUNCTION_AUTHENTICATE, 32);
  for _i:= 0 to Length(aclientNonce) - 1 do LEConvertUInt8To(aclientNonce[_i], 8 + _i, _request);
  for _i:= 0 to Length(adigest) - 1 do LEConvertUInt8To(adigest[_i], 12 + _i, _request);
  SendRequest(_request);
end;

procedure TBrickDaemon.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                                   out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                                   out aDeviceIdentifier: word);
var
  _i: longint;
begin
  aUID:= '';
  aConnectedUid:= '';
  aPosition:= char(0);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= 0;
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= 0;
  aDeviceIdentifier:= 0;
end;

end.
