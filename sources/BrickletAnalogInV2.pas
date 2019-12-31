{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAnalogInV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAnalogInV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAnalogInV2 = class;
  TBrickletAnalogInV2NotifyVoltage = procedure(aSender: TBrickletAnalogInV2; const aVoltage: word) of object;
  TBrickletAnalogInV2NotifyAnalogValue = procedure(aSender: TBrickletAnalogInV2; const aValue: word) of object;
  TBrickletAnalogInV2NotifyVoltageReached = procedure(aSender: TBrickletAnalogInV2; const aVoltage: word) of object;
  TBrickletAnalogInV2NotifyAnalogValueReached = procedure(aSender: TBrickletAnalogInV2; const aValue: word) of object;

  /// <summary>
  ///  Measures DC voltage between 0V and 42V
  /// </summary>
  TBrickletAnalogInV2 = class(TDevice)
  private
    fVoltageCallback: TBrickletAnalogInV2NotifyVoltage;
    fAnalogValueCallback: TBrickletAnalogInV2NotifyAnalogValue;
    fVoltageReachedCallback: TBrickletAnalogInV2NotifyVoltageReached;
    fAnalogValueReachedCallback: TBrickletAnalogInV2NotifyAnalogValueReached;
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured voltage. The resolution is approximately 10mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltage"/> callback and set the period with
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltageReached"/> callback.
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
    procedure SetVoltageCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValueReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltageReached"/>,
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the voltage.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const aAverage: byte); virtual;

    /// <summary>
    ///  Returns the length of the moving average as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

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
    procedure GetIdentity(out aUID: string; out ConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  Der <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    property OnVoltage: TBrickletAnalogInV2NotifyVoltage read fVoltageCallback write fVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>. The parameter is the analog
    ///  value of the sensor.
    ///  
    ///  The <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.OnAnalogValue"/> callback is only triggered if the voltage has changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletAnalogInV2NotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletAnalogInV2NotifyVoltageReached read fVoltageReachedCallback write fVoltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletAnalogInV2NotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;
  end;

implementation

procedure TBrickletAnalogInV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAnalogInV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAnalogInV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  aCallBacks[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  aCallBacks[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletAnalogInV2.GetVoltage: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletAnalogInV2.GetAnalogValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletAnalogInV2.SetVoltageCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV2.GetVoltageCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogInV2.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV2.GetAnalogValueCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogInV2.SetVoltageCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogInV2.GetVoltageCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAnalogInV2.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogInV2.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAnalogInV2.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV2.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogInV2.SetMovingAverage(const aAverage: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(aAverage, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV2.GetMovingAverage: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogInV2.GetIdentity(out aUID: string; out ConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  ConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAnalogInV2.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _value);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fVoltageReachedCallback)) then begin
    fVoltageReachedCallback(self, _voltage);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _value);
  end;
end;

end.
