{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletHumidityV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletHumidityV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletHumidityV2 = class;
  TBrickletHumidityV2NotifyHumidity = procedure(aSender: TBrickletHumidityV2; const aHumidity: word) of object;
  TBrickletHumidityV2NotifyTemperature = procedure(aSender: TBrickletHumidityV2; const aTemperature: smallint) of object;

  /// <summary>
  ///  Measures relative humidity
  /// </summary>
  TBrickletHumidityV2 = class(TDevice)
  private
    fHumidityCallback: TBrickletHumidityV2NotifyHumidity;
    fTemperatureCallback: TBrickletHumidityV2NotifyTemperature;
    procedure CallbackWrapperHumidity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the humidity measured by the sensor.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnHumidity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    function GetHumidity: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnHumidity"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnHumidity"/> callback.
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
                                               const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetHumidityCallbackConfiguration"/>.
    /// </summary>
    procedure GetHumidityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                               out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Returns the temperature measured by the sensor.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletHumidityV2.TBrickletHumidityV2.OnTemperature"/> callback.
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
    ///  </code>                                                                     max
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                  const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Enables/disables the heater. The heater can be used to dry the sensor in
    ///  extremely wet conditions.
    /// </summary>
    procedure SetHeaterConfiguration(const aHeaterConfig: byte); virtual;

    /// <summary>
    ///  Returns the heater configuration as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetHeaterConfiguration"/>.
    /// </summary>
    function GetHeaterConfiguration: byte; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the humidity and temperature.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  New data is gathered every 50ms*. With a moving average of length 1000 the resulting
    ///  averaging window has a length of 50s. If you want to do long term measurements the longest
    ///  moving average will give the cleanest results.
    ///  
    ///  \* In firmware version 2.0.3 we added the <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetSamplesPerSecond"/> function. It
    ///  configures the measurement frequency. Since high frequencies can Result in self-heating
    ///  of th IC, changed the default value from 20 samples per second to 1. With 1 sample per second
    ///  a moving average length of 1000 would Result in an averaging window of 1000 seconds!
    /// </summary>
    procedure SetMovingAverageConfiguration(const aMovingAverageLengthHumidity: word; const aMovingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  Returns the moving average configuration as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetMovingAverageConfiguration"/>.
    /// </summary>
    procedure GetMovingAverageConfiguration(out aMovingAverageLengthHumidity: word; out aMovingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  Sets the samples per second that are gathered by the humidity/temperature sensor HDC1080.
    ///  
    ///  We added this function since we found out that a high measurement frequency can lead to
    ///  self-heating of the sensor. Which can distort the temperature measurement.
    ///  
    ///  If you don't need a lot of measurements, you can use the lowest available measurement
    ///  frequency of 0.1 samples per second for the least amount of self-heating.
    ///  
    ///  Before version 2.0.3 the default was 20 samples per second. The new default is 1 sample per second.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure SetSamplesPerSecond(const aSPS: byte); virtual;

    /// <summary>
    ///  Returnes the samples per second, as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetSamplesPerSecond"/>.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    function GetSamplesPerSecond: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletHumidityV2.TBrickletHumidityV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetHumidityCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletHumidityV2.TBrickletHumidityV2.GetHumidity"/>.
    /// </summary>
    property OnHumidity: TBrickletHumidityV2NotifyHumidity read fHumidityCallback write fHumidityCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletHumidityV2.TBrickletHumidityV2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletHumidityV2.TBrickletHumidityV2.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletHumidityV2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletHumidityV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 2;
end;

procedure TBrickletHumidityV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_HUMIDITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_HEATER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_HEATER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_SAMPLES_PER_SECOND]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_SAMPLES_PER_SECOND]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletHumidityV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_HUMIDITY_V2_CALLBACK_HUMIDITY]:= {$ifdef FPC}@{$endif}CallbackWrapperHumidity;
  aCallBacks[BRICKLET_HUMIDITY_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
end;

function TBrickletHumidityV2.GetHumidity: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_HUMIDITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletHumidityV2.SetHumidityCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_HUMIDITY_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt16To(aMin, 14, _request);
  LEConvertUInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletHumidityV2.GetHumidityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_HUMIDITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt16From(14, _response);
  aMax:= LEConvertUInt16From(16, _response);
end;

function TBrickletHumidityV2.GetTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletHumidityV2.SetTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt16To(aMin, 14, _request);
  LEConvertInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletHumidityV2.GetTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt16From(14, _response);
  aMax:= LEConvertInt16From(16, _response);
end;

procedure TBrickletHumidityV2.SetHeaterConfiguration(const aHeaterConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_HEATER_CONFIGURATION, 9);
  LEConvertUInt8To(aHeaterConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidityV2.GetHeaterConfiguration: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_HEATER_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHumidityV2.SetMovingAverageConfiguration(const aMovingAverageLengthHumidity: word; const aMovingAverageLengthTemperature: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION, 12);
  LEConvertUInt16To(aMovingAverageLengthHumidity, 8, _request);
  LEConvertUInt16To(aMovingAverageLengthTemperature, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletHumidityV2.GetMovingAverageConfiguration(out aMovingAverageLengthHumidity: word; out aMovingAverageLengthTemperature: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aMovingAverageLengthHumidity:= LEConvertUInt16From(8, _response);
  aMovingAverageLengthTemperature:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletHumidityV2.SetSamplesPerSecond(const aSPS: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_SAMPLES_PER_SECOND, 9);
  LEConvertUInt8To(aSPS, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidityV2.GetSamplesPerSecond: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_SAMPLES_PER_SECOND, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHumidityV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletHumidityV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletHumidityV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHumidityV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidityV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHumidityV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidityV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletHumidityV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletHumidityV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletHumidityV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidityV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHumidityV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletHumidityV2.CallbackWrapperHumidity(const aPacket: TDynamicByteArray);
var
  _humidity: word;
begin
  _humidity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fHumidityCallback)) then begin
    fHumidityCallback(self, _humidity);
  end;
end;

procedure TBrickletHumidityV2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: smallint;
begin
  _temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

end.
