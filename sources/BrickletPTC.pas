{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletPTC;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletPTC.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPTC = class;
  TBrickletPTCNotifyTemperature = procedure(aSender: TBrickletPTC; const aTemperature: longint) of object;
  TBrickletPTCNotifyTemperatureReached = procedure(aSender: TBrickletPTC; const aTemperature: longint) of object;
  TBrickletPTCNotifyResistance = procedure(aSender: TBrickletPTC; const aResistance: longint) of object;
  TBrickletPTCNotifyResistanceReached = procedure(aSender: TBrickletPTC; const aResistance: longint) of object;
  TBrickletPTCNotifySensorConnected = procedure(aSender: TBrickletPTC; const aConnected: boolean) of object;

  /// <summary>
  ///  Reads temperatures from Pt100 und Pt1000 sensors
  /// </summary>
  TBrickletPTC = class(TDevice)
  private
    fTemperatureCallback: TBrickletPTCNotifyTemperature;
    fTemperatureReachedCallback: TBrickletPTCNotifyTemperatureReached;
    fResistanceCallback: TBrickletPTCNotifyResistance;
    fResistanceReachedCallback: TBrickletPTCNotifyResistanceReached;
    fSensorConnectedCallback: TBrickletPTCNotifySensorConnected;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperResistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperResistanceReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperSensorConnected(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the temperature of connected sensor. The value
    ///  has a range of -246 to 849 °C and is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended
    ///  to use the <see cref="BrickletPTC.TBrickletPTC.OnTemperature"/> callback and set the period with
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  Returns the value as measured by the MAX31865 precision delta-sigma ADC.
    ///  
    ///  The value can be converted with the following formulas:
    ///  
    ///  * Pt100:  resistance = (value * 390) / 32768
    ///  * Pt1000: resistance = (value * 3900) / 32768
    ///  
    ///  If you want to get the resistance periodically, it is recommended
    ///  to use the <see cref="BrickletPTC.TBrickletPTC.OnResistance"/> callback and set the period with
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>.
    /// </summary>
    function GetResistance: longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletPTC.TBrickletPTC.OnTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletPTC.TBrickletPTC.OnTemperature"/> callback is only triggered if the temperature has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletPTC.TBrickletPTC.OnResistance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletPTC.TBrickletPTC.OnResistance"/> callback is only triggered if the resistance has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetResistanceCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>.
    /// </summary>
    function GetResistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletPTC.TBrickletPTC.OnTemperatureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetTemperatureCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletPTC.TBrickletPTC.OnResistanceReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetResistanceCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetResistanceCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletPTC.TBrickletPTC.OnTemperatureReached"/>,
    ///  * <see cref="BrickletPTC.TBrickletPTC.OnResistanceReached"/>
    ///  
    ///  is triggered, if the threshold            Create(const uid__: string; ipcon_: TIPConnection);
    ///  
    ///  * <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/>,
    ///  * <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the noise rejection filter to either 50Hz (0) or 60Hz (1).
    ///  Noise from 50Hz or 60Hz power sources (including
    ///  harmonics of the AC power's fundamental frequency) is
    ///  attenuated by 82dB.
    ///  
    ///  Default value is 0 = 50Hz.
    /// </summary>
    procedure SetNoiseRejectionFilter(const aFilter: byte); virtual;

    /// <summary>
    ///  Returns the noise rejection filter option as set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetNoiseRejectionFilter"/>
    /// </summary>
    function GetNoiseRejectionFilter: byte; virtual;

    /// <summary>
    ///  Returns *true* if the sensor is connected correctly.
    ///  
    ///  If this function
    ///  returns *false*, there is either no Pt100 or Pt1000 sensor connected,
    ///  the sensor is connected incorrectly or the sensor itself is faulty.
    /// </summary>
    function IsSensorConnected: boolean; virtual;

    /// <summary>
    ///  Sets the wire mode of the sensor. Possible values are 2, 3 and 4 which
    ///  correspond to 2-, 3- and 4-wire sensors. The value has to match the jumper
    ///  configuration on the Bricklet.
    ///  
    ///  The default value is 2 = 2-wire.
    /// </summary>
    procedure SetWireMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the wire mode as set by <see cref="BrickletPTC.TBrickletPTC.SetWireMode"/>
    /// </summary>
    function GetWireMode: byte; virtual;

    /// <summary>
    ///  If you enable this callback, the <see cref="BrickletPTC.TBrickletPTC.OnSensorConnected"/> callback is triggered
    ///  every time a Pt sensor is connected/disconnected.
    ///  
    ///  By default this callback is disabled.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetSensorConnectedCallbackConfiguration(const aEnabled: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletPTC.TBrickletPTC.SetSensorConnectedCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetSensorConnectedCallbackConfiguration: boolean; virtual;

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
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackPeriod"/>. The parameter is the
    ///  temperature of the connected sensor.
    ///  
    ///  The <see cref="BrickletPTC.TBrickletPTC.OnTemperature"/> callback is only triggered if the temperature has changed
    ///  since the last triggering.
    /// </summary>
    property OnTemperature: TBrickletPTCNotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the connected sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletPTCNotifyTemperatureReached read fTemperatureReachedCallback write fTemperatureReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackPeriod"/>. The parameter is the resistance
    ///  of the connected sensor.
    ///  
    ///  The <see cref="BrickletPTC.TBrickletPTC.OnResistance"/> callback is only triggered if the resistance has changed
    ///  since the last triggering.
    /// </summary>
    property OnResistance: TBrickletPTCNotifyResistance read fResistanceCallback write fResistanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetResistanceCallbackThreshold"/> is reached.
    ///  The parameter is the resistance of the connected sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletPTC.TBrickletPTC.SetDebouncePeriod"/>.
    /// </summary>
    property OnResistanceReached: TBrickletPTCNotifyResistanceReached read fResistanceReachedCallback write fResistanceReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletPTC.TBrickletPTC.SetSensorConnectedCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletPTC.TBrickletPTC.IsSensorConnected"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    property OnSensorConnected: TBrickletPTCNotifySensorConnected read fSensorConnectedCallback write fSensorConnectedCallback;
  end;

implementation

procedure TBrickletPTC.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletPTC.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_NOISE_REJECTION_FILTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_NOISE_REJECTION_FILTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_IS_SENSOR_CONNECTED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_WIRE_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_WIRE_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_SET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletPTC.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PTC_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_PTC_CALLBACK_TEMPERATURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
  aCallBacks[BRICKLET_PTC_CALLBACK_RESISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperResistance;
  aCallBacks[BRICKLET_PTC_CALLBACK_RESISTANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperResistanceReached;
  aCallBacks[BRICKLET_PTC_CALLBACK_SENSOR_CONNECTED]:= {$ifdef FPC}@{$endif}CallbackWrapperSensorConnected;
end;

function TBrickletPTC.GetTemperature: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickletPTC.GetResistance: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletPTC.SetTemperatureCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetTemperatureCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletPTC.SetResistanceCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetResistanceCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletPTC.SetTemperatureCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletPTC.GetTemperatureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletPTC.SetResistanceCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_RESISTANCE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletPTC.GetResistanceCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_RESISTANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletPTC.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletPTC.SetNoiseRejectionFilter(const aFilter: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_NOISE_REJECTION_FILTER, 9);
  LEConvertUInt8To(aFilter, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetNoiseRejectionFilter: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_NOISE_REJECTION_FILTER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPTC.IsSensorConnected: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_IS_SENSOR_CONNECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletPTC.SetWireMode(const aMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_WIRE_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetWireMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_WIRE_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPTC.SetSensorConnectedCallbackConfiguration(const aEnabled: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_SET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTC.GetSensorConnectedCallbackConfiguration: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletPTC.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletPTC.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickletPTC.CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureReachedCallback)) then begin
    fTemperatureReachedCallback(self, _temperature);
  end;
end;

procedure TBrickletPTC.CallbackWrapperResistance(const aPacket: TDynamicByteArray);
var
  _resistance: longint;
begin
  _resistance:= LEConvertInt32From(8, aPacket);

  if (Assigned(fResistanceCallback)) then begin
    fResistanceCallback(self, _resistance);
  end;
end;

procedure TBrickletPTC.CallbackWrapperResistanceReached(const aPacket: TDynamicByteArray);
var
  _resistance: longint;
begin
  _resistance:= LEConvertInt32From(8, aPacket);

  if (Assigned(fResistanceReachedCallback)) then begin
    fResistanceReachedCallback(self, _resistance);
  end;
end;

procedure TBrickletPTC.CallbackWrapperSensorConnected(const aPacket: TDynamicByteArray);
var
  _connected: boolean;
begin
  _connected:= LEConvertBooleanFrom(8, aPacket);

  if (Assigned(fSensorConnectedCallback)) then begin
    fSensorConnectedCallback(self, _connected);
  end;
end;

end.
