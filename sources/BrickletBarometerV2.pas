{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletBarometerV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletBarometerV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletBarometerV2 = class;
  TBrickletBarometerV2NotifyAirPressure = procedure(aSender: TBrickletBarometerV2; const aAirPressure: longint) of object;
  TBrickletBarometerV2NotifyAltitude = procedure(aSender: TBrickletBarometerV2; const aAltitude: longint) of object;
  TBrickletBarometerV2NotifyTemperature = procedure(aSender: TBrickletBarometerV2; const aTemperature: longint) of object;

  /// <summary>
  ///  Measures air pressure and altitude changes
  /// </summary>
  TBrickletBarometerV2 = class(TDevice)
  private
    fAIRPressureCallback: TBrickletBarometerV2NotifyAirPressure;
    fAltitudeCallback: TBrickletBarometerV2NotifyAltitude;
    fTemperatureCallback: TBrickletBarometerV2NotifyTemperature;
    procedure CallbackWrapperAirPressure(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAltitude(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured air pressure.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAirPressure"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAirPressureCallbackConfiguration"/>.
    /// </summary>
    function GetAirPressure: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAirPressure"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change
    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAirPressure"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Threshold is turned off"
    ///   "'o'",    "Threshold is triggered when the value is *outside* the min and max values"
    ///   "'i'",    "Threshold is triggered when the value is *inside* or equal to the min and max values"
    ///   "'&lt;'",    "Threshold is triggered when the value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Threshold is triggered when the value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetAirPressureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                  const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAirPressureCallbackConfiguration"/>.
    /// </summary>
    procedure GetAirPressureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                  out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the relative altitude of the air pressure sensor. The value
    ///  is calculated based on the difference between the
    ///  current air pressure and the reference air pressure that can be set
    ///  with <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetReferenceAirPressure"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the   max
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAltitude"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAltitudeCallbackConfiguration"/>.
    /// </summary>
    function GetAltitude: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAltitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change
    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnAltitude"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Threshold is turned off"
    ///   "'o'",    "Threshold is triggered when the value is *outside* the min and max values"
    ///   "'i'",    "Threshold is triggered when the value is *inside* or equal to the min and max values"
    ///   "'&lt;'",    "Threshold is triggered when the value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Threshold is triggered when the value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetAltitudeCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                               const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAltitudeCallbackConfiguration"/>.
    /// </summary>
    procedure GetAltitudeCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                               out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the temperature of the air pressure sensor.
    ///  
    ///  This temperature is used internally for temperature compensation
    ///  of the air pressure measurement. It is not as accurate as the
    ///  temperature measured by the :ref:`temperature_v2_bricklet` or the
    ///  :ref:`temperature_ir_v2_bricklet`.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change
    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletBarometerV2.TBrickletBarometerV2.OnTemperature"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Threshold is turned off"
    ///   "'o'",    "Threshold is triggered when the value is *outside* the min and max values"
    ///   "'i'",    "Threshold is triggered when the value is *inside* or equal to the min and max values"
    ///   "'&lt;'",    "Threshold is triggered when the value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Threshold is triggered when the value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                  const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                  out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the air pressure and temperature measurements.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  If you want to do long term measurements the longest moving average will give
    ///  the cleanest results.
    /// </summary>
    procedure SetMovingAverageConfiguration(const aMovingAverageLengthAirPressure: word; const aMovingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  Returns the moving average configuration as set by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetMovingAverageConfiguration"/>.
    /// </summary>
    procedure GetMovingAverageConfiguration(out aMovingAverageLengthAirPressure: word; out aMovingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  Sets the reference air pressure for the altitude calculation.
    ///  Setting the reference to the
    ///  current air pressure results in a calculated altitude of 0mm. Passing 0 is
    ///  a shortcut for passing the current air pressure as reference.
    ///  
    ///  Well known reference values are the Q codes
    ///  `QNH &lt;https://en.wikipedia.org/wiki/QNH&gt;`__ and
    ///  `QFE &lt;https://en.wikipedia.org/wiki/Mean_sea_level_pressure#Mean_sea_level_pressure&gt;`__
    ///  used in aviation.
    /// </summary>
    procedure SetReferenceAirPressure(const aAirPressure: longint); virtual;

    /// <summary>
    ///  Returns the reference air pressure as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetReferenceAirPressure"/>.
    /// </summary>
    function GetReferenceAirPressure: longint; virtual;

    /// <summary>
    ///  Sets the one point calibration (OPC) values for the air pressure measurement.
    ///  
    ///  Before the Bricklet can be calibrated any previous calibration has to be removed
    ///  by setting ``measured air pressure`` and ``actual air pressure`` to 0.
    ///  
    ///  Then the current air pressure has to be measured using the Bricklet
    ///  (``measured air pressure``) and with an accurate reference barometer
    ///  (``actual air pressure``) at the same time and passed to this function.
    ///  
    ///  After proper calibration the air pressure measurement can achieve an accuracy
    ///  up to 0.2 hPa.
    ///  
    ///  The calibration is saved in the EEPROM of the Bricklet and only needs to be
    ///  configured once.
    /// </summary>
    procedure SetCalibration(const aMeasuredAirPressure: longint; const aActualAirPressure: longint); virtual;

    /// <summary>
    ///  Returns the air pressure one point calibration values as set by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out aMeasuredAirPressure: longint; out aActualAirPressure: longint); virtual;

    /// <summary>
    ///  Configures the data rate and air pressure low pass filter. The low pass filter
    ///  cut-off frequency (if enabled) can be set to 1/9th or 1/20th of the configure
    ///  data rate to decrease the noise on the air pressure data.
    ///  
    ///  The low pass filter configuration only applies to the air pressure measurement.
    ///  There is no low pass filter for the temperature measurement.
    ///  
    ///  A higher data rate will Result in a less precise temperature because of
    ///  self-heating of the sensor. If the accuracy of the temperature reading is
    ///  important to you, we would recommend the 1Hz data rate.
    /// </summary>
    procedure SetSensorConfiguration(const aDataRate: byte; const aAirPressureLowPassFilter: byte); virtual;

    /// <summary>
    ///  Returns the sensor configuration as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetSensorConfiguration"/>.
    /// </summary>
    procedure GetSensorConfiguration(out aDataRate: byte; out aAirPressureLowPassFilter: byte); virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.
    /// </summary>
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletBarometerV2.TBrickletBarometerV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAirPressureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletBarometerV2.TBrickletBarometerV2.GetAirPressure"/>.
    /// </summary>
    property OnAirPressure: TBrickletBarometerV2NotifyAirPressure read fAIRPressureCallback write fAIRPressureCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetAltitudeCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletBarometerV2.TBrickletBarometerV2.GetAltitude"/>.
    /// </summary>
    property OnAltitude: TBrickletBarometerV2NotifyAltitude read fAltitudeCallback write fAltitudeCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletBarometerV2.TBrickletBarometerV2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletBarometerV2.TBrickletBarometerV2.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletBarometerV2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletBarometerV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletBarometerV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_ALTITUDE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_ALTITUDE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_ALTITUDE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_REFERENCE_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_REFERENCE_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_SENSOR_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_SENSOR_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_BAROMETER_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletBarometerV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_BAROMETER_V2_CALLBACK_AIR_PRESSURE]:= {$ifdef FPC}@{$endif}CallbackWrapperAirPressure;
  aCallBacks[BRICKLET_BAROMETER_V2_CALLBACK_ALTITUDE]:= {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  aCallBacks[BRICKLET_BAROMETER_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
end;

function TBrickletBarometerV2.GetAirPressure: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometerV2.SetAirPressureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetAirPressureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletBarometerV2.GetAltitude: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_ALTITUDE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometerV2.SetAltitudeCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_ALTITUDE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetAltitudeCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_ALTITUDE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletBarometerV2.GetTemperature: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometerV2.SetTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

procedure TBrickletBarometerV2.SetMovingAverageConfiguration(const aMovingAverageLengthAirPressure: word; const aMovingAverageLengthTemperature: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION, 12);
  LEConvertUInt16To(aMovingAverageLengthAirPressure, 8, _request);
  LEConvertUInt16To(aMovingAverageLengthTemperature, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetMovingAverageConfiguration(out aMovingAverageLengthAirPressure: word; out aMovingAverageLengthTemperature: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aMovingAverageLengthAirPressure:= LEConvertUInt16From(8, _response);
  aMovingAverageLengthTemperature:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletBarometerV2.SetReferenceAirPressure(const aAirPressure: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_REFERENCE_AIR_PRESSURE, 12);
  LEConvertInt32To(aAirPressure, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometerV2.GetReferenceAirPressure: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_REFERENCE_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletBarometerV2.SetCalibration(const aMeasuredAirPressure: longint; const aActualAirPressure: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_CALIBRATION, 16);
  LEConvertInt32To(aMeasuredAirPressure, 8, _request);
  LEConvertInt32To(aActualAirPressure, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetCalibration(out aMeasuredAirPressure: longint; out aActualAirPressure: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  aMeasuredAirPressure:= LEConvertInt32From(8, _response);
  aActualAirPressure:= LEConvertInt32From(12, _response);
end;

procedure TBrickletBarometerV2.SetSensorConfiguration(const aDataRate: byte; const aAirPressureLowPassFilter: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_SENSOR_CONFIGURATION, 10);
  LEConvertUInt8To(aDataRate, 8, _request);
  LEConvertUInt8To(aAirPressureLowPassFilter, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.GetSensorConfiguration(out aDataRate: byte; out aAirPressureLowPassFilter: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_SENSOR_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aDataRate:= LEConvertUInt8From(8, _response);
  aAirPressureLowPassFilter:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletBarometerV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletBarometerV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletBarometerV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletBarometerV2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometerV2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletBarometerV2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometerV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletBarometerV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletBarometerV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletBarometerV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletBarometerV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletBarometerV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_BAROMETER_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletBarometerV2.CallbackWrapperAirPressure(const aPacket: TDynamicByteArray);
var
  _airPressure: longint;
begin
  _airPressure:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAIRPressureCallback)) then begin
    fAIRPressureCallback(self, _airPressure);
  end;
end;

procedure TBrickletBarometerV2.CallbackWrapperAltitude(const aPacket: TDynamicByteArray);
var
  _altitude: longint;
begin
  _altitude:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAltitudeCallback)) then begin
    fAltitudeCallback(self, _altitude);
  end;
end;

procedure TBrickletBarometerV2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

end.
