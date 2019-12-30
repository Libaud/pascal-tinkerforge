{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCO2V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCO2V2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletCO2V2 = class;
  TBrickletCO2V2NotifyAllValues = procedure(sender: TBrickletCO2V2; const co2Concentration: word; const temperature: smallint; const humidity: word) of object;
  TBrickletCO2V2NotifyCO2Concentration = procedure(sender: TBrickletCO2V2; const co2Concentration: word) of object;
  TBrickletCO2V2NotifyTemperature = procedure(sender: TBrickletCO2V2; const temperature: smallint) of object;
  TBrickletCO2V2NotifyHumidity = procedure(sender: TBrickletCO2V2; const humidity: word) of object;

  /// <summary>
  ///  Measures CO2 concentration, temperature and humidity
  /// </summary>
  TBrickletCO2V2 = class(TDevice)
  private
    fAllValuesCallback: TBrickletCO2V2NotifyAllValues;
    fCO2ConcentrationCallback: TBrickletCO2V2NotifyCO2Concentration;
    fTemperatureCallback: TBrickletCO2V2NotifyTemperature;
    fHumidityCallback: TBrickletCO2V2NotifyHumidity;
    procedure CallbackWrapperAllValues(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCO2Concentration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperHumidity(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns all values measured by the CO2 Bricklet 2.0.
    ///  
    ///  If you want to get the values periodically, it is recommended to use the
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.OnAllValues"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCO2V2.TBrickletCO2V2.SetAllValuesCallbackConfiguration"/>.
    ///  
    ///  <note>
    ///   The sensor is able to messure up to 120 °C. However it is only specified up to 70 °C.
    ///   Exposing the Bricklet to higher temperatures might Result in permanent damage.
    ///  </note>
    /// </summary>
    procedure GetAllValues(out co2Concentration: word; out temperature: smallint; out humidity: word); virtual;

    /// <summary>
    ///  The CO2 concentration (among other things) depends on the ambient air pressure.
    ///  
    ///  To increase the accuracy of the CO2 Bricklet 2.0 you can set the current air pressure.
    ///  You use the :ref:`Barometer Bricklet 2.0 &lt;barometer_v2_bricklet&gt;` or the
    ///  :ref:`Air Quality Bricklet &lt;air_quality_bricklet&gt;` to get the current air pressure.
    ///  
    ///  By default air pressure compensation is disabled. Once you set a value it
    ///  will be used for compensation. You can turn the compensation off again by
    ///  setting the value to 0.
    ///  
    ///  It is sufficient to update the value every few minutes.
    /// </summary>
    procedure SetAirPressure(const airPressure: word); virtual;

    /// <summary>
    ///  Returns the ambient air pressure as set by <see cref="BrickletCO2V2.TBrickletCO2V2.SetAirPressure"/>.
    /// </summary>
    function GetAirPressure: word; virtual;

    /// <summary>
    ///  Sets a temperature offset. A offset of 10 will decrease
    ///  the measured temperature by 0.1 °C.
    ///  
    ///  If you install this Bricklet into an enclosure and you want to measure the ambient
    ///  temperature, you may have to decrease the measured temperature by some value to
    ///  compensate for the error because of the heating inside of the enclosure.
    ///  
    ///  We recommend that you leave the parts in the enclosure running for at least
    ///  24 hours such that a temperature equilibrium can be reached. After that you can measure
    ///  the temperature directly outside of enclosure and set the difference as offset.
    ///  
    ///  This temperature offset is used to calculate the relative humidity and
    ///  CO2 concentration. In case the Bricklet is installed in an enclosure, we
    ///  recommend to measure and set the temperature offset to improve the accuracy of
    ///  the measurements.
    ///  
    ///  It is sufficient to set the temperature offset once. The offset is saved in
    ///  non-volatile memory and is applied again after a power loss.
    /// </summary>
    procedure SetTemperatureOffset(const offset: word); virtual;

    /// <summary>
    ///  Returns the temperature offset as set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetTemperatureOffset"/>.
    /// </summary>
    function GetTemperatureOffset: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCO2V2.TBrickletCO2V2.OnAllValues"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after at least one of the values has changed. If the values didn't
    ///  change within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllValuesCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetAllValuesCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllValuesCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns CO2 concentration.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.OnCO2Concentration"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCO2V2.TBrickletCO2V2.SetCO2ConcentrationCallbackConfiguration"/>.
    /// </summary>
    function GetCO2Concentration: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCO2V2.TBrickletCO2V2.OnCO2Concentration"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletCO2V2.TBrickletCO2V2.OnCO2Concentration"/> callback.
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
    procedure SetCO2ConcentrationCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletCO2V2.TBrickletCO2V2.SetCO2ConcentrationCallbackConfiguration"/>.
    /// </summary>
    procedure GetCO2ConcentrationCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Returns temperature.
    ///  
    ///  <note>
    ///   The sensor is able to messure up to 120 °C. However it is only specified up to 70 °C.
    ///   Exposing the Bricklet to higher temperatures might Result in permanent damage.
    ///  </note>
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCO2V2.TBrickletCO2V2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCO2V2.TBrickletCO2V2.OnTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletCO2V2.TBrickletCO2V2.OnTemperature"/> callback.
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
    procedure SetTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletCO2V2.TBrickletCO2V2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Returns relative humidity.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.OnHumidity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCO2V2.TBrickletCO2V2.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    function GetHumidity: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCO2V2.TBrickletCO2V2.OnHumidity"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletCO2V2.TBrickletCO2V2.OnHumidity"/> callback.
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
    procedure SetHumidityCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletCO2V2.TBrickletCO2V2.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    procedure GetHumidityCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word); virtual;

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
    procedure GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletCO2V2.TBrickletCO2V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletCO2V2.TBrickletCO2V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const data: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCO2V2.TBrickletCO2V2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetAllValuesCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletCO2V2.TBrickletCO2V2.GetAllValues"/>.
    ///  
    ///  <note>
    ///   The sensor is able to messure up to 120 °C. However it is only specified up to 70 °C.
    ///   Exposing the Bricklet to higher temperatures might Result in permanent damage.
    ///  </note>
    /// </summary>
    property OnAllValues: TBrickletCO2V2NotifyAllValues read fAllValuesCallback write fAllValuesCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetCO2ConcentrationCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletCO2V2.TBrickletCO2V2.GetCO2Concentration"/>.
    /// </summary>
    property OnCO2Concentration: TBrickletCO2V2NotifyCO2Concentration read fCO2ConcentrationCallback write fCO2ConcentrationCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletCO2V2.TBrickletCO2V2.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletCO2V2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletCO2V2.TBrickletCO2V2.SetHumidityCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletCO2V2.TBrickletCO2V2.GetHumidity"/>.
    /// </summary>
    property OnHumidity: TBrickletCO2V2NotifyHumidity read fHumidityCallback write fHumidityCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletCO2V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCO2V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_ALL_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_TEMPERATURE_OFFSET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE_OFFSET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_ALL_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_ALL_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_CO2_CONCENTRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_HUMIDITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCO2V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CO2_V2_CALLBACK_ALL_VALUES]:= {$ifdef FPC}@{$endif}CallbackWrapperAllValues;
  aCallBacks[BRICKLET_CO2_V2_CALLBACK_CO2_CONCENTRATION]:= {$ifdef FPC}@{$endif}CallbackWrapperCO2Concentration;
  aCallBacks[BRICKLET_CO2_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_CO2_V2_CALLBACK_HUMIDITY]:= {$ifdef FPC}@{$endif}CallbackWrapperHumidity;
end;

procedure TBrickletCO2V2.GetAllValues(out co2Concentration: word; out temperature: smallint; out humidity: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_ALL_VALUES, 8);
  _response:= SendRequest(_request);
  co2Concentration:= LEConvertUInt16From(8, _response);
  temperature:= LEConvertInt16From(10, _response);
  humidity:= LEConvertUInt16From(12, _response);
end;

procedure TBrickletCO2V2.SetAirPressure(const airPressure: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_AIR_PRESSURE, 10);
  LEConvertUInt16To(airPressure, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2V2.GetAirPressure: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCO2V2.SetTemperatureOffset(const offset: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_TEMPERATURE_OFFSET, 10);
  LEConvertUInt16To(offset, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2V2.GetTemperatureOffset: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE_OFFSET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCO2V2.SetAllValuesCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_ALL_VALUES_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletCO2V2.GetAllValuesCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_ALL_VALUES_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletCO2V2.GetCO2Concentration: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_CO2_CONCENTRATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCO2V2.SetCO2ConcentrationCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt16To(min, 14, _request);
  LEConvertUInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletCO2V2.GetCO2ConcentrationCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt16From(14, _response);
  max:= LEConvertUInt16From(16, _response);
end;

function TBrickletCO2V2.GetTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCO2V2.SetTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt16To(min, 14, _request);
  LEConvertInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletCO2V2.GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt16From(14, _response);
  max:= LEConvertInt16From(16, _response);
end;

function TBrickletCO2V2.GetHumidity: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_HUMIDITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCO2V2.SetHumidityCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt16To(min, 14, _request);
  LEConvertUInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletCO2V2.GetHumidityCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt16From(14, _response);
  max:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletCO2V2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletCO2V2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCO2V2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCO2V2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2V2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCO2V2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2V2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCO2V2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCO2V2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletCO2V2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2V2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCO2V2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCO2V2.CallbackWrapperAllValues(const aPacket: TDynamicByteArray);
var co2Concentration: word; temperature: smallint; humidity: word;
begin
  co2Concentration:= LEConvertUInt16From(8, aPacket);
  temperature:= LEConvertInt16From(10, aPacket);
  humidity:= LEConvertUInt16From(12, aPacket);

  if (Assigned(fAllValuesCallback)) then begin
    fAllValuesCallback(self, co2Concentration, temperature, humidity);
  end;
end;

procedure TBrickletCO2V2.CallbackWrapperCO2Concentration(const aPacket: TDynamicByteArray);
var co2Concentration: word;
begin
  co2Concentration:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fCO2ConcentrationCallback)) then begin
    fCO2ConcentrationCallback(self, co2Concentration);
  end;
end;

procedure TBrickletCO2V2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletCO2V2.CallbackWrapperHumidity(const aPacket: TDynamicByteArray);
var humidity: word;
begin
  humidity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fHumidityCallback)) then begin
    fHumidityCallback(self, humidity);
  end;
end;

end.
