{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAnalogOutV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAnalogOutV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Generates configurable DC voltage between 0V and 12V
  /// </summary>
  TBrickletAnalogOutV2 = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the voltage.
    /// </summary>
    procedure SetOutputVoltage(const aVoltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletAnalogOutV2.TBrickletAnalogOutV2.SetOutputVoltage"/>.
    /// </summary>
    function GetOutputVoltage: word; virtual;

    /// <summary>
    ///  Returns the input voltage.
    /// </summary>
    function GetInputVoltage: word; virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;
  end;

implementation

procedure TBrickletAnalogOutV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletAnalogOutV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_SET_OUTPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_OUTPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAnalogOutV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletAnalogOutV2.SetOutputVoltage(const aVoltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_SET_OUTPUT_VOLTAGE, 10);
  LEConvertUInt16To(aVoltage, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogOutV2.GetOutputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_OUTPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletAnalogOutV2.GetInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletAnalogOutV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
