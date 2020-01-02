{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRGBLED;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRGBLED.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Controls one RGB LED
  /// </summary>
  TBrickletRGBLED = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the *r*, *g* and *b* values for the LED. Each value can be between 0 and 255.
    /// </summary>
    procedure SetRGBValue(const aR: byte; const aG: byte; const aB: byte); virtual;

    /// <summary>
    ///  Returns the *r*, *g* and *b* values of the LED as set by <see cref="BrickletRGBLED.TBrickletRGBLED.SetRGBValue"/>.
    /// </summary>
    procedure GetRGBValue(out aR: byte; out aG: byte; out aB: byte); virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;
  end;

implementation

procedure TBrickletRGBLED.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRGBLED.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_RGB_LED_FUNCTION_SET_RGB_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_FUNCTION_GET_RGB_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRGBLED.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletRGBLED.SetRGBValue(const aR: byte; const aG: byte; const aB: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_SET_RGB_VALUE, 11);
  LEConvertUInt8To(aR, 8, _request);
  LEConvertUInt8To(aG, 9, _request);
  LEConvertUInt8To(aB, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRGBLED.GetRGBValue(out aR: byte; out aG: byte; out aB: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_GET_RGB_VALUE, 8);
  _response:= SendRequest(_request);
  aR:= LEConvertUInt8From(8, _response);
  aG:= LEConvertUInt8From(9, _response);
  aB:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletRGBLED.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
