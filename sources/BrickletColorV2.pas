{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletColorV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletColorV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletColorV2 = class;
  TBrickletColorV2NotifyColor = procedure(aSender: TBrickletColorV2; const r: word; const g: word; const b: word; const c: word) of object;
  TBrickletColorV2NotifyIlluminance = procedure(aSender: TBrickletColorV2; const illuminance: longword) of object;
  TBrickletColorV2NotifyColorTemperature = procedure(aSender: TBrickletColorV2; const colorTemperature: word) of object;

  /// <summary>
  ///  Measures color (RGB value), illuminance and color temperature
  /// </summary>
  TBrickletColorV2 = class(TDevice)
  private
    fColorCallback: TBrickletColorV2NotifyColor;
    fIlluminanceCallback: TBrickletColorV2NotifyIlluminance;
    fColorTemperatureCallback: TBrickletColorV2NotifyColorTemperature;
    procedure CallbackWrapperColor(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIlluminance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperColorTemperature(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured color of the sensor.
    ///  
    ///  The red (r), green (g), blue (b) and clear (c) colors are measured
    ///  with four different photodiodes that are responsive at different
    ///  wavelengths:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///     :scale: 100 %
    ///     :alt: Chart Responsivity / Wavelength
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///  
    ///  If you want to get the color periodically, it is recommended
    ///  to use the <see cref="BrickletColorV2.TBrickletColorV2.OnColor"/> callback and set the period with
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetColorCallbackConfiguration"/>.
    /// </summary>
    procedure GetColor(out r: word; out g: word; out b: word; out c: word); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletColorV2.TBrickletColorV2.OnColor"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetColorCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetColorCallbackConfiguration"/>.
    /// </summary>
    procedure GetColorCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the illuminance affected by the gain and integration time as
    ///  set by <see cref="BrickletColorV2.TBrickletColorV2.SetConfiguration"/>. To get the illuminance in Lux apply this formula::
    ///  
    ///   lux = illuminance * 700 / gain / integration_time
    ///  
    ///  To get a correct illuminance measurement make sure that the color
    ///  values themselves are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColorV2.TBrickletColorV2.SetConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletColorV2.TBrickletColorV2.OnIlluminance"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletColorV2.TBrickletColorV2.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletColorV2.TBrickletColorV2.OnIlluminance"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletColorV2.TBrickletColorV2.OnIlluminance"/> callback.
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
    procedure SetIlluminanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetIlluminanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword); virtual;

    /// <summary>
    ///  Returns the color temperature.
    ///  
    ///  To get a correct color temperature measurement make sure that the color
    ///  values themselves are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColorV2.TBrickletColorV2.SetConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletColorV2.TBrickletColorV2.OnColorTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletColorV2.TBrickletColorV2.SetColorTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetColorTemperature: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletColorV2.TBrickletColorV2.OnColorTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletColorV2.TBrickletColorV2.OnColorTemperature"/> callback.
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
    procedure SetColorTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetColorTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetColorTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Turns the white LED on the Bricklet on/off.
    /// </summary>
    procedure SetLight(const enable: boolean); virtual;

    /// <summary>
    ///  Returns the value as set by <see cref="BrickletColorV2.TBrickletColorV2.SetLight"/>.
    /// </summary>
    function GetLight: boolean; virtual;

    /// <summary>
    ///  Sets the configuration of the sensor. Gain and integration time
    ///  can be configured this way.
    ///  
    ///  For configuring the gain:
    ///  
    ///  * 0: 1x Gain
    ///  * 1: 4x Gain
    ///  * 2: 16x Gain
    ///  * 3: 60x Gain
    ///  
    ///  For configuring the integration time:
    ///  
    ///  * 0: 2.4ms
    ///  * 1: 24ms
    ///  * 2: 101ms
    ///  * 3: 154ms
    ///  * 4: 700ms
    ///  
    ///  Increasing the gain enables the sensor to detect a
    ///  color from a higher distance.
    ///  
    ///  The integration time provides a trade-off between conversion time
    ///  and accuracy. With a longer integration time the values read will
    ///  be more accurate but it will take longer to get the conversion
    ///  results.
    /// </summary>
    procedure SetConfiguration(const gain: byte; const integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out gain: byte; out integrationTime: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletColorV2.TBrickletColorV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletColorV2.TBrickletColorV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetColorCallbackConfiguration"/>. The parameter is the color
    ///  of the sensor as RGBC.
    ///  
    ///  The <see cref="BrickletColorV2.TBrickletColorV2.OnColor"/> callback is only triggered if the color has changed since the
    ///  last triggering.
    /// </summary>
    property OnColor: TBrickletColorV2NotifyColor read fColorCallback write fColorCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetIlluminanceCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletColorV2.TBrickletColorV2.GetIlluminance"/>.
    /// </summary>
    property OnIlluminance: TBrickletColorV2NotifyIlluminance read fIlluminanceCallback write fIlluminanceCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetColorTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletColorV2.TBrickletColorV2.GetColorTemperature"/>.
    /// </summary>
    property OnColorTemperature: TBrickletColorV2NotifyColorTemperature read fColorTemperatureCallback write fColorTemperatureCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletColorV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletColorV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_COLOR]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_LIGHT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_LIGHT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletColorV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_COLOR_V2_CALLBACK_COLOR]:= {$ifdef FPC}@{$endif}CallbackWrapperColor;
  aCallBacks[BRICKLET_COLOR_V2_CALLBACK_ILLUMINANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  aCallBacks[BRICKLET_COLOR_V2_CALLBACK_COLOR_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperColorTemperature;
end;

procedure TBrickletColorV2.GetColor(out r: word; out g: word; out b: word; out c: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR, 8);
  _response:= SendRequest(_request);
  r:= LEConvertUInt16From(8, _response);
  g:= LEConvertUInt16From(10, _response);
  b:= LEConvertUInt16From(12, _response);
  c:= LEConvertUInt16From(14, _response);
end;

procedure TBrickletColorV2.SetColorCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetColorCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletColorV2.GetIlluminance: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColorV2.SetIlluminanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt32To(min, 14, _request);
  LEConvertUInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetIlluminanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt32From(14, _response);
  max:= LEConvertUInt32From(18, _response);
end;

function TBrickletColorV2.GetColorTemperature: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletColorV2.SetColorTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt16To(min, 14, _request);
  LEConvertUInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetColorTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt16From(14, _response);
  max:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletColorV2.SetLight(const enable: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_LIGHT, 9);
  LEConvertBooleanTo(enable, 8, _request);
  SendRequest(_request);
end;

function TBrickletColorV2.GetLight: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_LIGHT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletColorV2.SetConfiguration(const gain: byte; const integrationTime: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(gain, 8, _request);
  LEConvertUInt8To(integrationTime, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetConfiguration(out gain: byte; out integrationTime: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  gain:= LEConvertUInt8From(8, _response);
  integrationTime:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletColorV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletColorV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletColorV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletColorV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletColorV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletColorV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletColorV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletColorV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletColorV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletColorV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletColorV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColorV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletColorV2.CallbackWrapperColor(const aPacket: TDynamicByteArray);
var r: word; g: word; b: word; c: word;
begin
  r:= LEConvertUInt16From(8, aPacket);
  g:= LEConvertUInt16From(10, aPacket);
  b:= LEConvertUInt16From(12, aPacket);
  c:= LEConvertUInt16From(14, aPacket);

  if (Assigned(fColorCallback)) then begin
    fColorCallback(self, r, g, b, c);
  end;
end;

procedure TBrickletColorV2.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var illuminance: longword;
begin
  illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fIlluminanceCallback)) then begin
    fIlluminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletColorV2.CallbackWrapperColorTemperature(const aPacket: TDynamicByteArray);
var colorTemperature: word;
begin
  colorTemperature:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fColorTemperatureCallback)) then begin
    fColorTemperatureCallback(self, colorTemperature);
  end;
end;

end.
