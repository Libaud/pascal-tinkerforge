{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAirQuality;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAirQuality.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletAirQuality = class;
  TBrickletAirQualityNotifyAllValues = procedure(aSender: TBrickletAirQuality; const aIAQIndex: longint; const aIAQIndexAccuracy: byte;
                                                 const aTemperature: longint; const aHumidity: longint; const aAirPressure: longint) of object;
  TBrickletAirQualityNotifyIAQIndex = procedure(aSender: TBrickletAirQuality; const aIAQIndex: longint; const aIAQIndexAccuracy: byte) of object;
  TBrickletAirQualityNotifyTemperature = procedure(aSender: TBrickletAirQuality; const aTemperature: longint) of object;
  TBrickletAirQualityNotifyHumidity = procedure(aSender: TBrickletAirQuality; const aHumidity: longint) of object;
  TBrickletAirQualityNotifyAirPressure = procedure(aSender: TBrickletAirQuality; const aAirPressure: longint) of object;

  /// <summary>
  ///  Measures IAQ index, temperature, humidity and air pressure
  /// </summary>
  TBrickletAirQuality = class(TDevice)
  private
    fAllValuesCallback: TBrickletAirQualityNotifyAllValues;
    fIaqIndexCallback: TBrickletAirQualityNotifyIAQIndex;
    fTemperatureCallback: TBrickletAirQualityNotifyTemperature;
    fHumidityCallback: TBrickletAirQualityNotifyHumidity;
    fAirPressureCallback: TBrickletAirQualityNotifyAirPressure;
    procedure CallbackWrapperAllValues(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIAQIndex(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperHumidity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAirPressure(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns all values measured by the Air Quality Bricklet. The values are
    ///  IAQ (Indoor Air Quality) Index, IAQ Index Accuracy, Temperature, Humidity and
    ///  Air Pressure.
    ///  
    ///  .. image:: /Images/Misc/bricklet_air_quality_iaq_index.png
    ///     :scale: 100 %
    ///     :alt: Air Quality Index description
    ///     :align: center
    ///     :target: ../../_images/Misc/bricklet_air_quality_iaq_index.png
    ///  
    ///  The values have these ranges and units:
    ///  
    ///  * IAQ Index: 0 to 500, higher value means greater level of air pollution
    ///  * IAQ Index Accuracy: 0 = unreliable to 3 = high
    ///  * Temperature: in steps of 0.01 °C
    ///  * Humidity: in steps of 0.01 %RH
    ///  * Air Pressure: in steps of 0.01 hPa
    /// </summary>
    procedure GetAllValues(out aIAQIndex: longint; out aIAQIndexAccuracy: byte; out aTemperature: longint;
                           out aHumidity: longint; out aAirPressure: longint); virtual;

    /// <summary>
    ///  Sets a temperature offset with resolution 1/100 °C. A offset of 10 will decrease
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
    ///  IAQ index measurements. In case the Bricklet is installed in an enclosure, we
    ///  recommend to measure and set the temperature offset to imporve the accuracy of
    ///  the measurements.
    /// </summary>
    procedure SetTemperatureOffset(const aOffset: longint); virtual;

    /// <summary>
    ///  Returns the temperature offset as set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetTemperatureOffset"/>.
    /// </summary>
    function GetTemperatureOffset: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAirQuality.TBrickletAirQuality.OnAllValues"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after at least one of the values has changed. If the values didn't
    ///  change within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllValuesCallbackConfiguration(const aPeriod: longword; const avalueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetAllValuesCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllValuesCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the IAQ index and accuracy. The IAQ index goes from
    ///  0 to 500. The higher the IAQ index, the greater the level of air pollution.
    ///  
    ///  .. image:: /Images/Misc/bricklet_air_quality_iaq_index.png
    ///     :scale: 100 %
    ///     :alt: IAQ index description
    ///     :align: center
    ///     :target: ../../_images/Misc/bricklet_air_quality_iaq_index.png
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.OnIAQIndex"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAirQuality.TBrickletAirQuality.SetIAQIndexCallbackConfiguration"/>.
    /// </summary>
    procedure GetIAQIndex(out aIAQIndex: longint; out aIAQIndexAccuracy: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAirQuality.TBrickletAirQuality.OnIAQIndex"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after at least one of the values has changed. If the values didn't
    ///  change within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetIAQIndexCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetIAQIndexCallbackConfiguration"/>.
    /// </summary>
    procedure GetIAQIndexCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns temperature in steps of 0.01 °C.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAirQuality.TBrickletAirQuality.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAirQuality.TBrickletAirQuality.OnTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletAirQuality.TBrickletAirQuality.OnTemperature"/> callback.
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
    ///  Returns the callback configuration as set by <see cref="BrickletAirQuality.TBrickletAirQuality.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns relative humidity in steps of 0.01 %RH.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.OnHumidity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAirQuality.TBrickletAirQuality.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    function GetHumidity: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAirQuality.TBrickletAirQuality.OnHumidity"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletAirQuality.TBrickletAirQuality.OnHumidity"/> callback.
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
    procedure SetHumidityCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean;
                                               const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletAirQuality.TBrickletAirQuality.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    procedure GetHumidityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns air pressure in steps of 0.01 hPa.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.OnAirPressure"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAirQuality.TBrickletAirQuality.SetAirPressureCallbackConfiguration"/>.
    /// </summary>
    function GetAirPressure: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAirQuality.TBrickletAirQuality.OnAirPressure"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletAirQuality.TBrickletAirQuality.OnAirPressure"/> callback.
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
    ///  Returns the callback configuration as set by <see cref="BrickletAirQuality.TBrickletAirQuality.SetAirPressureCallbackConfiguration"/>.
    /// </summary>
    procedure GetAirPressureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                  out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Deletes the calibration from flash. After you call this function,
    ///  you need to power cycle the Air Quality Bricklet.
    ///  
    ///  On the next power up the Bricklet will start a new calibration, as
    ///  if it was started for the very first time.
    ///  
    ///  The calibration is based on the data of the last four days, so it takes
    ///  four days until a full calibration is re-established.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure RemoveCalibration; virtual;

    /// <summary>
    ///  The Air Quality Bricklet uses an automatic background calibration mechanism to
    ///  calculate the IAQ Index. This calibration mechanism considers a history of
    ///  measured data. The duration of this history can be configured to either be
    ///  4 days or 28 days.
    ///  
    ///  If you keep the Bricklet mostly at one place and it does not get moved around
    ///  to different environments, we recommend that you use a duration of 28 days.
    ///  
    ///  If you change the duration, the current calibration will be discarded and
    ///  the calibration will start from beginning again. The configuration of the
    ///  duration is saved in flash, so you should only have to call this function
    ///  once in the lifetime of the Bricklet.
    ///  
    ///  The Bricklet has to be power cycled after this function is called
    ///  for a duration change to take effect.
    ///  
    ///  Before firmware version 2.0.3 this was not configurable and the duration was
    ///  4 days.
    ///  
    ///  The default value (since firmware version 2.0.3) is 28 days.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure SetBackgroundCalibrationDuration(const aDuration: byte); virtual;

    /// <summary>
    ///  Returns the background calibration duration as set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetBackgroundCalibrationDuration"/>.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    function GetBackgroundCalibrationDuration: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletAirQuality.TBrickletAirQuality.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletAirQuality.TBrickletAirQuality.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletAirQuality.TBrickletAirQuality.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetAllValuesCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletAirQuality.TBrickletAirQuality.GetAllValues"/>.
    /// </summary>
    property OnAllValues: TBrickletAirQualityNotifyAllValues read fAllValuesCallback write fAllValuesCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetIAQIndexCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletAirQuality.TBrickletAirQuality.GetIAQIndex"/>.
    /// </summary>
    property OnIAQIndex: TBrickletAirQualityNotifyIAQIndex read fIaqIndexCallback write fIaqIndexCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletAirQuality.TBrickletAirQuality.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletAirQualityNotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetHumidityCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletAirQuality.TBrickletAirQuality.GetHumidity"/>.
    /// </summary>
    property OnHumidity: TBrickletAirQualityNotifyHumidity read fHumidityCallback write fHumidityCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletAirQuality.TBrickletAirQuality.SetAirPressureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletAirQuality.TBrickletAirQuality.GetAirPressure"/>.
    /// </summary>
    property OnAirPressure: TBrickletAirQualityNotifyAirPressure read fAirPressureCallback write fAirPressureCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletAirQuality.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAirQuality.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_ALL_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_TEMPERATURE_OFFSET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE_OFFSET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_ALL_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_ALL_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_IAQ_INDEX]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_IAQ_INDEX_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_IAQ_INDEX_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_HUMIDITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_AIR_PRESSURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_REMOVE_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_BACKGROUND_CALIBRATION_DURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_BACKGROUND_CALIBRATION_DURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AIR_QUALITY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAirQuality.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_AIR_QUALITY_CALLBACK_ALL_VALUES]:= {$ifdef FPC}@{$endif}CallbackWrapperAllValues;
  aCallBacks[BRICKLET_AIR_QUALITY_CALLBACK_IAQ_INDEX]:= {$ifdef FPC}@{$endif}CallbackWrapperIAQIndex;
  aCallBacks[BRICKLET_AIR_QUALITY_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_AIR_QUALITY_CALLBACK_HUMIDITY]:= {$ifdef FPC}@{$endif}CallbackWrapperHumidity;
  aCallBacks[BRICKLET_AIR_QUALITY_CALLBACK_AIR_PRESSURE]:= {$ifdef FPC}@{$endif}CallbackWrapperAirPressure;
end;

procedure TBrickletAirQuality.GetAllValues(out aIAQIndex: longint; out aIAQIndexAccuracy: byte; out aTemperature: longint; out aHumidity: longint; out aAirPressure: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_ALL_VALUES, 8);
  _response:= SendRequest(_request);
  aIAQIndex:= LEConvertInt32From(8, _response);
  aIAQIndexAccuracy:= LEConvertUInt8From(12, _response);
  aTemperature:= LEConvertInt32From(13, _response);
  aHumidity:= LEConvertInt32From(17, _response);
  aAirPressure:= LEConvertInt32From(21, _response);
end;

procedure TBrickletAirQuality.SetTemperatureOffset(const aOffset: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_TEMPERATURE_OFFSET, 12);
  LEConvertInt32To(aOffset, 8, _request);
  SendRequest(_request);
end;

function TBrickletAirQuality.GetTemperatureOffset: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE_OFFSET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletAirQuality.SetAllValuesCallbackConfiguration(const aPeriod: longword; const avalueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_ALL_VALUES_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(avalueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.GetAllValuesCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_ALL_VALUES_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletAirQuality.GetIAQIndex(out aIAQIndex: longint; out aIAQIndexAccuracy: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_IAQ_INDEX, 8);
  _response:= SendRequest(_request);
  aIAQIndex:= LEConvertInt32From(8, _response);
  aIAQIndexAccuracy:= LEConvertUInt8From(12, _response);
end;

procedure TBrickletAirQuality.SetIAQIndexCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_IAQ_INDEX_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.GetIAQIndexCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_IAQ_INDEX_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletAirQuality.GetTemperature: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletAirQuality.SetTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletAirQuality.GetHumidity: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_HUMIDITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletAirQuality.SetHumidityCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.GetHumidityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletAirQuality.GetAirPressure: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_AIR_PRESSURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletAirQuality.SetAirPressureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_AIR_PRESSURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.GetAirPressureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_AIR_PRESSURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

procedure TBrickletAirQuality.RemoveCalibration;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_REMOVE_CALIBRATION, 8);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.SetBackgroundCalibrationDuration(const aDuration: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_BACKGROUND_CALIBRATION_DURATION, 9);
  LEConvertUInt8To(aDuration, 8, _request);
  SendRequest(_request);
end;

function TBrickletAirQuality.GetBackgroundCalibrationDuration: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_BACKGROUND_CALIBRATION_DURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAirQuality.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletAirQuality.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAirQuality.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAirQuality.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletAirQuality.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAirQuality.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletAirQuality.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAirQuality.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletAirQuality.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletAirQuality.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletAirQuality.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAirQuality.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AIR_QUALITY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAirQuality.CallbackWrapperAllValues(const aPacket: TDynamicByteArray);
var
  _iaqIndex: longint;
  _iaqIndexAccuracy: byte;
  _temperature: longint;
  _humidity: longint;
  _airPressure: longint;
begin
  _iaqIndex:= LEConvertInt32From(8, aPacket);
  _iaqIndexAccuracy:= LEConvertUInt8From(12, aPacket);
  _temperature:= LEConvertInt32From(13, aPacket);
  _humidity:= LEConvertInt32From(17, aPacket);
  _airPressure:= LEConvertInt32From(21, aPacket);

  if (Assigned(fAllValuesCallback)) then begin
    fAllValuesCallback(self, _iaqIndex, _iaqIndexAccuracy, _temperature, _humidity, _airPressure);
  end;
end;

procedure TBrickletAirQuality.CallbackWrapperIAQIndex(const aPacket: TDynamicByteArray);
var
  _iaqIndex: longint;
  _iaqIndexAccuracy: byte;
begin
  _iaqIndex:= LEConvertInt32From(8, aPacket);
  _iaqIndexAccuracy:= LEConvertUInt8From(12, aPacket);

  if (Assigned(fIaqIndexCallback)) then begin
    fIaqIndexCallback(self, _iaqIndex, _iaqIndexAccuracy);
  end;
end;

procedure TBrickletAirQuality.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: longint;
begin
  _temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickletAirQuality.CallbackWrapperHumidity(const aPacket: TDynamicByteArray);
var
  _humidity: longint;
begin
  _humidity:= LEConvertInt32From(8, aPacket);

  if (Assigned(fHumidityCallback)) then begin
    fHumidityCallback(self, _humidity);
  end;
end;

procedure TBrickletAirQuality.CallbackWrapperAirPressure(const aPacket: TDynamicByteArray);
var
  _airPressure: longint;
begin
  _airPressure:= LEConvertInt32From(8, aPacket);

  if (Assigned(fAirPressureCallback)) then begin
    fAirPressureCallback(self, _airPressure);
  end;
end;

end.
