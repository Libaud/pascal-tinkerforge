{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAnalogIn;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAnalogIn.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAnalogIn = class;
  TBrickletAnalogInNotifyVoltage = procedure(aSender: TBrickletAnalogIn; const aVoltage: word) of object;
  TBrickletAnalogInNotifyAnalogValue = procedure(aSender: TBrickletAnalogIn; const aValue: word) of object;
  TBrickletAnalogInNotifyVoltageReached = procedure(aSender: TBrickletAnalogIn; const aVoltage: word) of object;
  TBrickletAnalogInNotifyAnalogValueReached = procedure(aSender: TBrickletAnalogIn; const aValue: word) of object;

  /// <summary>
  ///  Measures DC voltage between 0V and 45V
  /// </summary>
  TBrickletAnalogIn = class(TDevice)
  private
    fVoltageCallback: TBrickletAnalogInNotifyVoltage;
    fAnalogValueCallback: TBrickletAnalogInNotifyAnalogValue;
    fVoltageReachedCallback: TBrickletAnalogInNotifyVoltageReached;
    fAnalogValueReachedCallback: TBrickletAnalogInNotifyAnalogValueReached;
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
    ///  Returns the voltage of the sensor. The resolution between 0 and 6V is about 2mV.
    ///  Between 6 and 45V the resolution is about 10mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltage"/> callback and set the period with
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletAnalogIn.TBrickletAnalogIn.GetVoltage"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletAnalogIn.TBrickletAnalogIn.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletAnalogIn.TBrickletAnalogIn.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltageReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValueReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltageReached"/>,
    ///  * <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the measurement range. Possible ranges:
    ///  
    ///  * 0: Automatically switched
    ///  * 1: 0V - 6.05V, ~1.48mV resolution
    ///  * 2: 0V - 10.32V, ~2.52mV resolution
    ///  * 3: 0V - 36.30V, ~8.86mV resolution
    ///  * 4: 0V - 45.00V, ~11.25mV resolution
    ///  * 5: 0V - 3.3V, ~0.81mV resolution, new in version 2.0.3$nbsp;(Plugin)
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetRange(const aRange: byte); virtual;

    /// <summary>
    ///  Returns the measurement range as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetRange"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetRange: byte; virtual;

    /// <summary>
    ///  Set the length of a averaging for the voltage value.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. If the
    ///  averaging is off, there is more noise on the data, but the data is without
    ///  delay.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure SetAveraging(const aAverage: byte); virtual;

    /// <summary>
    ///  Returns the averaging configuration as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAveraging"/>.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    function GetAveraging: byte; virtual;

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

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    property OnVoltage: TBrickletAnalogInNotifyVoltage read fVoltageCallback write fVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackPeriod"/>. The parameter is the analog
    ///  value of the sensor.
    ///  
    ///  The <see cref="BrickletAnalogIn.TBrickletAnalogIn.OnAnalogValue"/> callback is only triggered if the voltage has changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletAnalogInNotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletAnalogInNotifyVoltageReached read fVoltageReachedCallback write fVoltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogIn.TBrickletAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletAnalogInNotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;
  end;

implementation

procedure TBrickletAnalogIn.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 3;
end;

procedure TBrickletAnalogIn.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_RANGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_RANGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_SET_AVERAGING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_AVERAGING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAnalogIn.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ANALOG_IN_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  aCallBacks[BRICKLET_ANALOG_IN_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_ANALOG_IN_CALLBACK_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  aCallBacks[BRICKLET_ANALOG_IN_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletAnalogIn.GetVoltage: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletAnalogIn.GetAnalogValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletAnalogIn.SetVoltageCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogIn.GetVoltageCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogIn.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogIn.GetAnalogValueCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogIn.SetVoltageCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogIn.GetVoltageCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAnalogIn.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogIn.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAnalogIn.SetDebouncePeriod(const aDebounce: longword);
var 
 _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogIn.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogIn.SetRange(const aRange: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_RANGE, 9);
  LEConvertUInt8To(aRange, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogIn.GetRange: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_RANGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogIn.SetAveraging(const aAverage: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_SET_AVERAGING, 9);
  LEConvertUInt8To(aAverage, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogIn.GetAveraging: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_AVERAGING, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogIn.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAnalogIn.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickletAnalogIn.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _value);
  end;
end;

procedure TBrickletAnalogIn.CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fVoltageReachedCallback)) then begin
    fVoltageReachedCallback(self, _voltage);
  end;
end;

procedure TBrickletAnalogIn.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _value);
  end;
end;

end.
