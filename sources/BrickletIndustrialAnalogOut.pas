{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialAnalogOut;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialAnalogOut.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Generates configurable DC voltage and current, 0V to 10V and 4mA to 20mA
  /// </summary>
  TBrickletIndustrialAnalogOut = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Enables the output of voltage and current.
    ///  
    ///  The default is disabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the output of voltage and current.
    ///  
    ///  The default is disabled.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if output of voltage and current is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the output voltage.
    ///  
    ///  The output voltage and output current are linked. Changing the output voltage
    ///  also changes the output current.
    /// </summary>
    procedure SetVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetVoltage"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Sets the output current.
    ///  
    ///  The output current and output voltage are linked. Changing the output current
    ///  also changes the output voltage.
    /// </summary>
    procedure SetCurrent(const current: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetCurrent"/>.
    /// </summary>
    function GetCurrent: word; virtual;

    /// <summary>
    ///  Configures the voltage and current range.
    ///  
    ///  Possible voltage ranges are:
    ///  
    ///  * 0V to 5V
    ///  * 0V to 10V
    ///  
    ///  Possible current ranges are:
    ///  
    ///  * 4mA to 20mA
    ///  * 0mA to 20mA
    ///  * 0mA to 24mA
    ///  
    ///  The resolution will always be 12 bit. This means, that the
    ///  precision is higher with a smaller range.
    /// </summary>
    procedure SetConfiguration(const aVoltageRange: byte; const aCurrentRange: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aVoltageRange: byte; out aCurrentRange: byte); virtual;

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

procedure TBrickletIndustrialAnalogOut.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialAnalogOut.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_DISABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_IS_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialAnalogOut.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletIndustrialAnalogOut.Enable;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_ENABLE, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialAnalogOut.Disable;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_DISABLE, 8);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOut.IsEnabled: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_IS_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletIndustrialAnalogOut.SetVoltage(const voltage: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOut.GetVoltage: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialAnalogOut.SetCurrent(const current: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CURRENT, 10);
  LEConvertUInt16To(current, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOut.GetCurrent: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialAnalogOut.SetConfiguration(const aVoltageRange: byte; const aCurrentRange: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(aVoltageRange, 8, _request);
  LEConvertUInt8To(aCurrentRange, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialAnalogOut.GetConfiguration(out aVoltageRange: byte; out aCurrentRange: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aVoltageRange:= LEConvertUInt8From(8, _response);
  aCurrentRange:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIndustrialAnalogOut.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
