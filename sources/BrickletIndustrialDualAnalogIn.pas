{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDualAnalogIn;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDualAnalogIn.inc}

type
  TArray0To1OfInt32 = array [0..1] of longint;
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletIndustrialDualAnalogIn = class;
  TBrickletIndustrialDualAnalogInNotifyVoltage = procedure(sender: TBrickletIndustrialDualAnalogIn; const channel: byte; const voltage: longint) of object;
  TBrickletIndustrialDualAnalogInNotifyVoltageReached = procedure(sender: TBrickletIndustrialDualAnalogIn; const channel: byte; const voltage: longint) of object;

  /// <summary>
  ///  Measures two DC voltages between -35V and +35V with 24bit resolution each
  /// </summary>
  TBrickletIndustrialDualAnalogIn = class(TDevice)
  private
    voltageCallback: TBrickletIndustrialDualAnalogInNotifyVoltage;
    voltageReachedCallback: TBrickletIndustrialDualAnalogInNotifyVoltageReached;
  protected
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the voltage for the given channel.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltage"/> callback and set the period with
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage(const channel: byte): longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltage"/> callback is triggered
    ///  periodically for the given channel. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltage"/> callback is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const channel: byte; const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod(const channel: byte): longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltageReached"/> callback for the given
    ///  channel.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetVoltageCallbackThreshold(const channel: byte; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(const channel: byte; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltageReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the sample rate. The sample rate can be between 1 sample per second
    ///  and 976 samples per second. Decreasing the sample rate will also decrease the
    ///  noise on the data.
    /// </summary>
    procedure SetSampleRate(const rate: byte); virtual;

    /// <summary>
    ///  Returns the sample rate as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

    /// <summary>
    ///  Sets offset and gain of MCP3911 internal calibration registers.
    ///  
    ///  See MCP3911 datasheet 7.7 and 7.8. The Industrial Dual Analog In Bricklet
    ///  is already factory calibrated by Tinkerforge. It should not be necessary
    ///  for you to use this function
    /// </summary>
    procedure SetCalibration(const offset: array of longint; const gain: array of longint); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out offset: TArray0To1OfInt32; out gain: TArray0To1OfInt32); virtual;

    /// <summary>
    ///  Returns the ADC values as given by the MCP3911 IC. This function
    ///  is needed for proper calibration, see <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetCalibration"/>.
    /// </summary>
    function GetADCValues: TArray0To1OfInt32; virtual;

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

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  channel.
    ///  
    ///  The <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.OnVoltage"/> callback is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnVoltage: TBrickletIndustrialDualAnalogInNotifyVoltage read voltageCallback write voltageCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the channel.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletIndustrialDualAnalogInNotifyVoltageReached read voltageReachedCallback write voltageReachedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialDualAnalogIn.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialDualAnalogIn.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_ADC_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDualAnalogIn.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
end;

function TBrickletIndustrialDualAnalogIn.GetVoltage(const channel: byte): longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod(const channel: byte; const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 13);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt32To(period, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogIn.GetVoltageCallbackPeriod(const channel: byte): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold(const channel: byte; const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 18);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertCharTo(option, 9, _request);
  LEConvertInt32To(min, 10, _request);
  LEConvertInt32To(max, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogIn.GetVoltageCallbackThreshold(const channel: byte; out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt32From(9, _response);
  max:= LEConvertInt32From(13, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogIn.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetSampleRate(const rate: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(rate, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogIn.GetSampleRate: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_SAMPLE_RATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetCalibration(const offset: array of longint; const gain: array of longint);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_CALIBRATION, 24);
  if (Length(offset) <> 2) then raise EInvalidParameterException.Create('Offset has to be exactly 2 items long');
  for _i:= 0 to Length(offset) - 1 do LEConvertInt32To(offset[_i], 8 + (_i * 4), _request);
  if (Length(gain) <> 2) then raise EInvalidParameterException.Create('Gain has to be exactly 2 items long');
  for _i:= 0 to Length(gain) - 1 do LEConvertInt32To(gain[_i], 16 + (_i * 4), _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogIn.GetCalibration(out offset: TArray0To1OfInt32; out gain: TArray0To1OfInt32);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 1 do offset[_i]:= LEConvertInt32From(8 + (_i * 4), _response);
  for _i:= 0 to 1 do gain[_i]:= LEConvertInt32From(16 + (_i * 4), _response);
end;

function TBrickletIndustrialDualAnalogIn.GetADCValues: TArray0To1OfInt32;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_ADC_VALUES, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 1 do Result[_i]:= LEConvertInt32From(8 + (_i * 4), _response);
end;

procedure TBrickletIndustrialDualAnalogIn.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDualAnalogIn.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var channel: byte; voltage: longint;
begin
  channel:= LEConvertUInt8From(8, aPacket);
  voltage:= LEConvertInt32From(9, aPacket);

  if (Assigned(voltageCallback)) then begin
    voltageCallback(self, channel, voltage);
  end;
end;

procedure TBrickletIndustrialDualAnalogIn.CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray);
var channel: byte; voltage: longint;
begin
  channel:= LEConvertUInt8From(8, aPacket);
  voltage:= LEConvertInt32From(9, aPacket);

  if (Assigned(voltageReachedCallback)) then begin
    voltageReachedCallback(self, channel, voltage);
  end;
end;

end.
