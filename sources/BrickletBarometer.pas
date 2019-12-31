{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletBarometer;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletBarometer.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletBarometer = class;
  TBrickletBarometerNotifyAirPressure = procedure(aSender: TBrickletBarometer; const aAirPressure: longint) of object;
  TBrickletBarometerNotifyAltitude = procedure(aSender: TBrickletBarometer; const aAltitude: longint) of object;
  TBrickletBarometerNotifyAirPressureReached = procedure(aSender: TBrickletBarometer; const aAirPressure: longint) of object;
  TBrickletBarometerNotifyAltitudeReached = procedure(aSender: TBrickletBarometer; const aAltitude: longint) of object;

  /// <summary>
  ///  Measures air pressure and altitude changes
  /// </summary>
  TBrickletBarometer = class(TDevice)
  private
    fAirPressureCallback: TBrickletBarometerNotifyAirPressure;
    fAltitudeCallback: TBrickletBarometerNotifyAltitude;
    fAirPressureReachedCallback: TBrickletBarometerNotifyAirPressureReached;
    fAltitudeReachedCallback: TBrickletBarometerNotifyAltitudeReached;
    procedure CallbackWrapperAirPressure(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAltitude(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAirPressureReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAltitudeReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the air pressure of the air pressure sensor.
    ///  
    ///  If you want to get the air pressure periodically, it is recommended to use the
    ///  <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressure"/> callback and set the period with
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>.
    /// </summary>
    function GetAirPressure: longint; virtual;

    /// <summary>
    ///  Returns the relative altitude of the air pressure sensor. The value is
    ///  calculated based on the difference between the current air pressure
    ///  and the reference air pressure that can be set with <see cref="BrickletBarometer.TBrickletBarometer.SetReferenceAirPressure"/>.
    ///  
    ///  If you want to get the altitude periodically, it is recommended to use the
    ///  <see cref="BrickletBarometer.TBrickletBarometer.OnAltitude"/> callback and set the period with
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitude: longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressure"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressure"/> callback is only triggered if the air pressure has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAirPressureCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>.
    /// </summary>
    function GetAirPressureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletBarometer.TBrickletBarometer.OnAltitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletBarometer.TBrickletBarometer.OnAltitude"/> callback is only triggered if the altitude has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetAltitudeCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitudeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the air pressure is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the air pressure is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the air pressure is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the air pressure is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAirPressureCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/>.
    /// </summary>
    procedure GetAirPressureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletBarometer.TBrickletBarometer.OnAltitudeReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the altitude is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the altitude is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the altitude is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the altitude is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAltitudeCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/>.
    /// </summary>
    procedure GetAltitudeCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressureReached"/>,
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.OnAltitudeReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/>,
    ///  * <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the reference air pressure for the altitude calculation.
    ///  Setting the reference to the current air pressure results in a calculated
    ///  altitude of 0cm. Passing 0 is a shortcut for passing the current air pressure as
    ///  reference.
    ///  
    ///  Well known reference values are the Q codes
    ///  `QNH &lt;https://en.wikipedia.org/wiki/QNH&gt;`__ and
    ///  `QFE &lt;https://en.wikipedia.org/wiki/Mean_sea_level_pressure#Mean_sea_level_pressure&gt;`__
    ///  used in aviation.
    /// </summary>
    procedure SetReferenceAirPressure(const aAirPressure: longint); virtual;

    /// <summary>
    ///  Returns the temperature of the air pressure sensor.
    ///  
    ///  This temperature is used internally for temperature compensation of the air
    ///  pressure measurement. It is not as accurate as the temperature measured by the
    ///  :ref:`temperature_bricklet` or the :ref:`temperature_ir_bricklet`.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Returns the reference air pressure as set by <see cref="BrickletBarometer.TBrickletBarometer.SetReferenceAirPressure"/>.
    /// </summary>
    function GetReferenceAirPressure: longint; virtual;

    /// <summary>
    ///  Sets the different averaging parameters. It is possible to set
    ///  the length of a normal averaging for the temperature and pressure,
    ///  as well as an additional length of a
    ///  `moving average &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the pressure. The moving average is calculated from the normal
    ///  averages.  There is no moving average for the temperature.
    ///  
    ///  Setting the all three parameters to 0 will turn the averaging
    ///  completely off. If the averaging is off, there is lots of noise
    ///  on the data, but the data is without delay. Thus we recommend
    ///  to turn the averaging off if the Barometer Bricklet data is
    ///  to be used for sensor fusion with other sensors.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetAveraging(const aMovingAveragePressure: byte; const aAveragePressure: byte; const aAverageTemperature: byte); virtual;

    /// <summary>
    ///  Returns the averaging configuration as set by <see cref="BrickletBarometer.TBrickletBarometer.SetAveraging"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure GetAveraging(out aMovingAveragePressure: byte; out aAveragePressure: byte; out aAverageTemperature: byte); virtual;

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
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackPeriod"/>. The parameter is the air
    ///  pressure of the air pressure sensor.
    ///  
    ///  The <see cref="BrickletBarometer.TBrickletBarometer.OnAirPressure"/> callback is only triggered if the air pressure has
    ///  changed since the last triggering.
    /// </summary>
    property OnAirPressure: TBrickletBarometerNotifyAirPressure read fAirPressureCallback write fAirPressureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackPeriod"/>. The parameter is the altitude of
    ///  the air pressure sensor.
    ///  
    ///  The <see cref="BrickletBarometer.TBrickletBarometer.OnAltitude"/> callback is only triggered if the altitude has changed since
    ///  the last triggering.
    /// </summary>
    property OnAltitude: TBrickletBarometerNotifyAltitude read fAltitudeCallback write fAltitudeCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAirPressureCallbackThreshold"/> is reached.
    ///  The parameter is the air pressure of the air pressure sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAirPressureReached: TBrickletBarometerNotifyAirPressureReached read fAirPressureReachedCallback write fAirPressureReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletBarometer.TBrickletBarometer.SetAltitudeCallbackThreshold"/> is reached.
    ///  The parameter is the altitude of the air pressure sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletBarometer.TBrickletBarometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAltitudeReached: TBrickletBarometerNotifyAltitudeReached read fAltitudeReachedCallback write fAltitudeReachedCallback;
  end;

implementation

procedure TBrickletBarometer.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletBarometer.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_REFERENCE_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_REFERENCE_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_SET_AVERAGING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_AVERAGING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletBarometer.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE]:= {$ifdef FPC}@{$endif}CallbackWrapperAirPressure;
  aCallBacks[BRICKLET_BAROMETER_CALLBACK_ALTITUDE]:= {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  aCallBacks[BRICKLET_BAROMETER_CALLBACK_AIR_PRESSURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAirPressureReached;
  aCallBacks[BRICKLET_BAROMETER_CALLBACK_ALTITUDE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAltitudeReached;
end;

function TBrickletBarometer.GetAirPressure: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickletBarometer.GetAltitude: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometer.SetAirPressureCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometer.GetAirPressureCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletBarometer.SetAltitudeCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometer.GetAltitudeCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletBarometer.SetAirPressureCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AIR_PRESSURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometer.GetAirPressureCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AIR_PRESSURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletBarometer.SetAltitudeCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_ALTITUDE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometer.GetAltitudeCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_ALTITUDE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletBarometer.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometer.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletBarometer.SetReferenceAirPressure(const aAirPressure: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_REFERENCE_AIR_PRESSURE, 12);
  LEConvertInt32To(aAirPressure, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometer.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

function TBrickletBarometer.GetReferenceAirPressure: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_REFERENCE_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometer.SetAveraging(const aMovingAveragePressure: byte; const aAveragePressure: byte; const aAverageTemperature: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_SET_AVERAGING, 11);
  LEConvertUInt8To(aMovingAveragePressure, 8, _request);
  LEConvertUInt8To(aAveragePressure, 9, _request);
  LEConvertUInt8To(aAverageTemperature, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometer.GetAveraging(out aMovingAveragePressure: byte; out aAveragePressure: byte; out aAverageTemperature: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_AVERAGING, 8);
  _response:= SendRequest(_request);
  aMovingAveragePressure:= LEConvertUInt8From(8, _response);
  aAveragePressure:= LEConvertUInt8From(9, _response);
  aAverageTemperature:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletBarometer.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletBarometer.CallbackWrapperAirPressure(const aPacket: TDynamicByteArray);
var
  _airPressure: longint;
begin
  _airPressure:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAirPressureCallback)) then begin
    fAirPressureCallback(self, _airPressure);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAltitude(const aPacket: TDynamicByteArray);
var
  _altitude: longint;
begin
  _altitude:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAltitudeCallback)) then begin
    fAltitudeCallback(self, _altitude);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAirPressureReached(const aPacket: TDynamicByteArray);
var
  _airPressure: longint;
begin
  _airPressure:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAirPressureReachedCallback)) then begin
    fAirPressureReachedCallback(self, _airPressure);
  end;
end;

procedure TBrickletBarometer.CallbackWrapperAltitudeReached(const aPacket: TDynamicByteArray);
var
  _altitude: longint;
begin
  _altitude:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAltitudeReachedCallback)) then begin
    fAltitudeReachedCallback(self, _altitude);
  end;
end;

end.
