{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletThermocouple;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletThermocouple.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletThermocouple = class;
  TBrickletThermocoupleNotifyTemperature = procedure(aSender: TBrickletThermocouple; const aTemperature: longint) of object;
  TBrickletThermocoupleNotifyTemperatureReached = procedure(aSender: TBrickletThermocouple; const aTemperature: longint) of object;
  TBrickletThermocoupleNotifyErrorState = procedure(aSender: TBrickletThermocouple; const aOverUnder: boolean; const aOpenCircuit: boolean) of object;

  /// <summary>
  ///  Measures temperature with thermocouples
  /// </summary>
  TBrickletThermocouple = class(TDevice)
  private
    fTemperatureCallback: TBrickletThermocoupleNotifyTemperature;
    fTemperatureReachedCallback: TBrickletThermocoupleNotifyTemperatureReached;
    fErrorStateCallback: TBrickletThermocoupleNotifyErrorState;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperErrorState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the temperature of the thermocouple. The value is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended
    ///  to use the <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperature"/> callback and set the period with
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperature"/> callback is only triggered if the temperature has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperatureReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperatureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  You can configure averaging size, thermocouple type and frequency
    ///  filtering.
    ///  
    ///  Available averaging sizes are 1, 2, 4, 8 and 16 samples.
    ///  
    ///  As thermocouple type you can use B, E, J, K, N, R, S and T. If you have a
    ///  different thermocouple or a custom thermocouple you can also use
    ///  G8 and G32. With these types the returned value will not be in °C/100,
    ///  it will be calculated by the following formulas:
    ///  
    ///  * G8: ``value = 8 * 1.6 * 2^17 * Vin``
    ///  * G32: ``value = 32 * 1.6 * 2^17 * Vin``
    ///  
    ///  where Vin is the thermocouple input voltage.
    ///  
    ///  The frequency filter can be either configured to 50Hz or to 60Hz. You should
    ///  configure it according to your utility frequency.
    ///  
    ///  The conversion time depends on the averaging and filter configuration, it can
    ///  be calculated as follows:
    ///  
    ///  * 60Hz: ``time = 82 + (samples - 1) * 16.67``
    ///  * 50Hz: ``time = 98 + (samples - 1) * 20``
    ///  
    ///  The default configuration is 16 samples, K type and 50Hz.
    /// </summary>
    procedure SetConfiguration(const aAveraging: byte; const aThermocoupleType: byte; const aFilter: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aAveraging: byte; out aThermocoupleType: byte; out aFilter: byte); virtual;

    /// <summary>
    ///  Returns the current error state. There are two possible errors:
    ///  
    ///  * Over/Under Voltage and
    ///  * Open Circuit.
    ///  
    ///  Over/Under Voltage happens for voltages below 0V or above 3.3V. In this case
    ///  it is very likely that your thermocouple is defective. An Open Circuit error
    ///  indicates that there is no thermocouple connected.
    ///  
    ///  You can use the <see cref="BrickletThermocouple.TBrickletThermocouple.OnErrorState"/> callback to automatically get triggered
    ///  when the error state changes.
    /// </summary>
    procedure GetErrorState(out aOverUnder: boolean; out aOpenCircuit: boolean); virtual;

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
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackPeriod"/>. The parameter is the
    ///  temperature of the thermocouple.
    ///  
    ///  The <see cref="BrickletThermocouple.TBrickletThermocouple.OnTemperature"/> callback is only triggered if the temperature has
    ///  changed since the last triggering.
    /// </summary>
    property OnTemperature: TBrickletThermocoupleNotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the thermocouple.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletThermocoupleNotifyTemperatureReached read fTemperatureReachedCallback write fTemperatureReachedCallback;

    /// <summary>
    ///  This Callback is triggered every time the error state changes
    ///  (see <see cref="BrickletThermocouple.TBrickletThermocouple.GetErrorState"/>).
    /// </summary>
    property OnErrorState: TBrickletThermocoupleNotifyErrorState read fErrorStateCallback write fErrorStateCallback;
  end;

implementation

procedure TBrickletThermocouple.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletThermocouple.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_ERROR_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletThermocouple.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
  aCallBacks[BRICKLET_THERMOCOUPLE_CALLBACK_ERROR_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperErrorState;
end;

function TBrickletThermocouple.GetTemperature: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletThermocouple.SetTemperatureCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermocouple.GetTemperatureCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletThermocouple.SetTemperatureCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletThermocouple.GetTemperatureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletThermocouple.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermocouple.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletThermocouple.SetConfiguration(const aAveraging: byte; const aThermocoupleType: byte; const aFilter: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(aAveraging, 8, _request);
  LEConvertUInt8To(aThermocoupleType, 9, _request);
  LEConvertUInt8To(aFilter, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletThermocouple.GetConfiguration(out aAveraging: byte; out aThermocoupleType: byte; out aFilter: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aAveraging:= LEConvertUInt8From(8, _response);
  aThermocoupleType:= LEConvertUInt8From(9, _response);
  aFilter:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletThermocouple.GetErrorState(out aOverUnder: boolean; out aOpenCircuit: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_ERROR_STATE, 8);
  _response:= SendRequest(_request);
  aOverUnder:= LEConvertBooleanFrom(8, _response);
  aOpenCircuit:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletThermocouple.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletThermocouple.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickletThermocouple.CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureReachedCallback)) then begin
    fTemperatureReachedCallback(self, _temperature);
  end;
end;

procedure TBrickletThermocouple.CallbackWrapperErrorState(const aPacket: TDynamicByteArray);
var
  _overUnder: boolean;
  _openCircuit: boolean;
begin
  _overUnder:= LEConvertBooleanFrom(8, aPacket);
  _openCircuit:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fErrorStateCallback)) then begin
    fErrorStateCallback(self, _overUnder, _openCircuit);
  end;
end;

end.
