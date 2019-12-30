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
    procedure SetRGBValue(const r: byte; const g: byte; const b: byte); virtual;

    /// <summary>
    ///  Returns the *r*, *g* and *b* values of the LED as set by <see cref="BrickletRGBLED.TBrickletRGBLED.SetRGBValue"/>.
    /// </summary>
    procedure GetRGBValue(out r: byte; out g: byte; out b: byte); virtual;

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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;
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

procedure TBrickletRGBLED.SetRGBValue(const r: byte; const g: byte; const b: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_SET_RGB_VALUE, 11);
  LEConvertUInt8To(r, 8, _request);
  LEConvertUInt8To(g, 9, _request);
  LEConvertUInt8To(b, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRGBLED.GetRGBValue(out r: byte; out g: byte; out b: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_GET_RGB_VALUE, 8);
  _response:= SendRequest(_request);
  r:= LEConvertUInt8From(8, _response);
  g:= LEConvertUInt8From(9, _response);
  b:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletRGBLED.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
