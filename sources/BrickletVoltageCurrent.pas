{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletVoltageCurrent;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletVoltageCurrent.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletVoltageCurrent = class;
  TBrickletVoltageCurrentNotifyCurrent = procedure(aSender: TBrickletVoltageCurrent; const current: longint) of object;
  TBrickletVoltageCurrentNotifyVoltage = procedure(aSender: TBrickletVoltageCurrent; const voltage: longint) of object;
  TBrickletVoltageCurrentNotifyPower = procedure(aSender: TBrickletVoltageCurrent; const power: longint) of object;
  TBrickletVoltageCurrentNotifyCurrentReached = procedure(aSender: TBrickletVoltageCurrent; const current: longint) of object;
  TBrickletVoltageCurrentNotifyVoltageReached = procedure(aSender: TBrickletVoltageCurrent; const voltage: longint) of object;
  TBrickletVoltageCurrentNotifyPowerReached = procedure(aSender: TBrickletVoltageCurrent; const power: longint) of object;

  /// <summary>
  ///  Measures power, DC voltage and DC current up to 720W/36V/20A
  /// </summary>
  TBrickletVoltageCurrent = class(TDevice)
  private
    fCurrentCallback: TBrickletVoltageCurrentNotifyCurrent;
    fVoltageCallback: TBrickletVoltageCurrentNotifyVoltage;
    fPowerCallback: TBrickletVoltageCurrentNotifyPower;
    fCurrentReachedCallback: TBrickletVoltageCurrentNotifyCurrentReached;
    fVoltageReachedCallback: TBrickletVoltageCurrentNotifyVoltageReached;
    fPowerReachedCallback: TBrickletVoltageCurrentNotifyPowerReached;
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPower(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPowerReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the current. The value is in mA
    ///  and between -20000mA and 20000mA.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrent"/> callback and set the period with
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent: longint; virtual;

    /// <summary>
    ///  Returns the voltage. The value is in mV
    ///  and between 0mV and 36000mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltage"/> callback and set the period with
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: longint; virtual;

    /// <summary>
    ///  Returns the power. The value is in mW
    ///  and between 0mV and 720000mW.
    ///  
    ///  If you want to get the power periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPower"/> callback and set the period with
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackPeriod"/>.
    /// </summary>
    function GetPower: longint; virtual;

    /// <summary>
    ///  Sets the configuration of the Voltage/Current Bricklet. It is
    ///  possible to configure number of averages as well as
    ///  voltage and current conversion time.
    ///  
    ///  Averaging:
    ///  
    ///  <code>
    ///   "Value", "Number of Averages"
    ///  
    ///   "0",    "1"
    ///   "1",    "4"
    ///   "2",    "16"
    ///   "3",    "64"
    ///   "4",    "128"
    ///   "5",    "256"
    ///   "6",    "512"
    ///   "&gt;=7",  "1024"
    ///  </code>
    ///  
    ///  Voltage/Current conversion:
    ///  
    ///  <code>
    ///   "Value", "Conversion time"
    ///  
    ///   "0",    "140µs"
    ///   "1",    "204µs"
    ///   "2",    "332µs"
    ///   "3",    "588µs"
    ///   "4",    "1.1ms"
    ///   "5",    "2.116ms"
    ///   "6",    "4.156ms"
    ///   "&gt;=7",  "8.244ms"
    ///  </code>
    ///  
    ///  The default values are 3, 4 and 4 (64, 1.1ms, 1.1ms) for averaging, voltage
    ///  conversion and current conversion.
    /// </summary>
    procedure SetConfiguration(const averaging: byte; const voltageConversionTime: byte; const currentConversionTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out averaging: byte; out voltageConversionTime: byte; out currentConversionTime: byte); virtual;

    /// <summary>
    ///  Since the shunt resistor that is used to measure the current is not
    ///  perfectly precise, it needs to be calibrated by a multiplier and
    ///  divisor if a very precise reading is needed.
    ///  
    ///  For example, if you are expecting a measurement of 1000mA and you
    ///  are measuring 1023mA, you can calibrate the Voltage/Current Bricklet
    ///  by setting the multiplier to 1000 and the divisor to 1023.
    /// </summary>
    procedure SetCalibration(const gainMultiplier: word; const gainDivisor: word); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out gainMultiplier: word; out gainDivisor: word); virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrent"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrent"/> callback is only triggered if the current has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPower"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPower"/> callback is only triggered if the power has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetPowerCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.GetPowerCallbackPeriod"/>.
    /// </summary>
    function GetPowerCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrentReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCurrentCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltageReached"/> callback.
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
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetVoltageCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPowerReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the power is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the power is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the power is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the power is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).                                                   _responseExpected
    /// </summary>
    procedure SetPowerCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/>.
    /// </summary>
    procedure GetPowerCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrentReached"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltageReached"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPowerReached"/>
    ///                                                                                      _responseExpected
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

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
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnCurrent"/> callback is only triggered if the current has changed since
    ///  the last triggering.
    /// </summary>
    property OnCurrent: TBrickletVoltageCurrentNotifyCurrent read fCurrentCallback write fCurrentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackPeriod"/>. The parameter is the voltage of
    ///  the sensor.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnVoltage"/> callback is only triggered if the voltage has changed since
    ///  the last triggering.
    /// </summary>
    property OnVoltage: TBrickletVoltageCurrentNotifyVoltage read fVoltageCallback write fVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackPeriod"/>. The parameter is the power of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.OnPower"/> callback is only triggered if the power has changed since the
    ///  last triggering.
    /// </summary>
    property OnPower: TBrickletVoltageCurrentNotifyPower read fPowerCallback write fPowerCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletVoltageCurrentNotifyCurrentReached read fCurrentReachedCallback write fCurrentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletVoltageCurrentNotifyVoltageReached read fVoltageReachedCallback write fVoltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetPowerCallbackThreshold"/> is reached.
    ///  The parameter is the power of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletVoltageCurrent.TBrickletVoltageCurrent.SetDebouncePeriod"/>.
    /// </summary>
    property OnPowerReached: TBrickletVoltageCurrentNotifyPowerReached read fPowerReachedCallback write fPowerReachedCallback;
  end;

implementation

procedure TBrickletVoltageCurrent.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletVoltageCurrent.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletVoltageCurrent.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER]:= {$ifdef FPC}@{$endif}CallbackWrapperPower;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_CURRENT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_VOLTAGE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_CALLBACK_POWER_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPowerReached;
end;

function TBrickletVoltageCurrent.GetCurrent: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickletVoltageCurrent.GetVoltage: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickletVoltageCurrent.GetPower: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletVoltageCurrent.SetConfiguration(const averaging: byte; const voltageConversionTime: byte; const currentConversionTime: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(averaging, 8, _request);
  LEConvertUInt8To(voltageConversionTime, 9, _request);
  LEConvertUInt8To(currentConversionTime, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrent.GetConfiguration(out averaging: byte; out voltageConversionTime: byte; out currentConversionTime: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  averaging:= LEConvertUInt8From(8, _response);
  voltageConversionTime:= LEConvertUInt8From(9, _response);
  currentConversionTime:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletVoltageCurrent.SetCalibration(const gainMultiplier: word; const gainDivisor: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CALIBRATION, 12);
  LEConvertUInt16To(gainMultiplier, 8, _request);
  LEConvertUInt16To(gainDivisor, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrent.GetCalibration(out gainMultiplier: word; out gainDivisor: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  gainMultiplier:= LEConvertUInt16From(8, _response);
  gainDivisor:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletVoltageCurrent.SetCurrentCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrent.GetCurrentCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletVoltageCurrent.SetVoltageCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrent.GetVoltageCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletVoltageCurrent.SetPowerCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrent.GetPowerCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletVoltageCurrent.SetCurrentCallbackThreshold(const option: char; const min: longint; const max: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt32To(min, 9, _request);
  LEConvertInt32To(max, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrent.GetCurrentCallbackThreshold(out option: char; out min: longint; out max: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt32From(9, _response);
  max:= LEConvertInt32From(13, _response);
end;

procedure TBrickletVoltageCurrent.SetVoltageCallbackThreshold(const option: char; const min: longint; const max: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt32To(min, 9, _request);
  LEConvertInt32To(max, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrent.GetVoltageCallbackThreshold(out option: char; out min: longint; out max: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt32From(9, _response);
  max:= LEConvertInt32From(13, _response);
end;

procedure TBrickletVoltageCurrent.SetPowerCallbackThreshold(const option: char; const min: longint; const max: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_POWER_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt32To(min, 9, _request);
  LEConvertInt32To(max, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrent.GetPowerCallbackThreshold(out option: char; out min: longint; out max: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_POWER_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt32From(9, _response);
  max:= LEConvertInt32From(13, _response);
end;

procedure TBrickletVoltageCurrent.SetDebouncePeriod(const debounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrent.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletVoltageCurrent.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletVoltageCurrent.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var
  current: longint;
begin
  current:= LEConvertInt32From(8, aPacket);

  if (Assigned(fCurrentCallback)) then begin
    fCurrentCallback(self, current);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  voltage: longint;
begin
  voltage:= LEConvertInt32From(8, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, voltage);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperPower(const aPacket: TDynamicByteArray);
var
  power: longint;
begin
  power:= LEConvertInt32From(8, aPacket);

  if (Assigned(fPowerCallback)) then begin
    fPowerCallback(self, power);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray);
var
  _current: longint;
begin
  _current:= LEConvertInt32From(8, aPacket);

  if (Assigned(fCurrentReachedCallback)) then begin
    fCurrentReachedCallback(self, _current);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperVoltageReached(const aPacket: TDynamicByteArray);
var
  _voltage: longint;
begin
  _voltage:= LEConvertInt32From(8, aPacket);

  if (Assigned(fVoltageReachedCallback)) then begin
    fVoltageReachedCallback(self, _voltage);
  end;
end;

procedure TBrickletVoltageCurrent.CallbackWrapperPowerReached(const aPacket: TDynamicByteArray);
var
  _power: longint;
begin
  _power:= LEConvertInt32From(8, aPacket);

  if (Assigned(fPowerReachedCallback)) then begin
    fPowerReachedCallback(self, _power);
  end;
end;

end.
