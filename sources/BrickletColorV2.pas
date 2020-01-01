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
  TBrickletColorV2NotifyColor = procedure(aSender: TBrickletColorV2; const aR: word; const aG: word;
                                          const aB: word; const aC: word) of object;
  TBrickletColorV2NotifyIlluminance = procedure(aSender: TBrickletColorV2; const aIlluminance: longword) of object;
  TBrickletColorV2NotifyColorTemperature = procedure(aSender: TBrickletColorV2; const aColorTemperature: word) of object;

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
    procedure GetColor(out aR: word; out aG: word; out aB: word; out aC: word); virtual;

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
    procedure SetColorCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletColorV2.TBrickletColorV2.SetColorCallbackConfiguration"/>.
    /// </summary>
    procedure GetColorCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

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
    ///  <see cref="BrickletColorV2.TBrickletColorV2.OnIlluminanperiodce"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletColorV2.TBrickletColorV2.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletColorV2.TBrickletColorV2.OnIlluminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, periodthe callback is only
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
    procedure SetIlluminanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                  const aMin: longword; const aMax: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetIlluminanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                  out aMin: longword; out aMax: longword); virtual;

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
    procedure SetColorTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                       const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetColorTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetColorTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                       out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Turns the white LED on the Bricklet on/off.
    /// </summary>
    procedure SetLight(const aEnable: boolean); virtual;

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
    procedure SetConfiguration(const aGain: byte; const aIntegrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletColorV2.TBrickletColorV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aGain: byte; out aIntegrationTime: byte); virtual;

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
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

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

procedure TBrickletColorV2.GetColor(out aR: word; out aG: word; out aB: word; out aC: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR, 8);
  _response:= SendRequest(_request);
  aR:= LEConvertUInt16From(8, _response);
  aG:= LEConvertUInt16From(10, _response);
  aB:= LEConvertUInt16From(12, _response);
  aC:= LEConvertUInt16From(14, _response);
end;

procedure TBrickletColorV2.SetColorCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetColorCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletColorV2.GetIlluminance: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColorV2.SetIlluminanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longword; const aMax: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt32To(aMin, 14, _request);
  LEConvertUInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetIlluminanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longword; out aMax: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt32From(14, _response);
  aMax:= LEConvertUInt32From(18, _response);
end;

function TBrickletColorV2.GetColorTemperature: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletColorV2.SetColorTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt16To(aMin, 14, _request);
  LEConvertUInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetColorTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt16From(14, _response);
  aMax:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletColorV2.SetLight(const aEnable: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_LIGHT, 9);
  LEConvertBooleanTo(aEnable, 8, _request);
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

procedure TBrickletColorV2.SetConfiguration(const aGain: byte; const aIntegrationTime: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(aGain, 8, _request);
  LEConvertUInt8To(aIntegrationTime, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletColorV2.GetConfiguration(out aGain: byte; out aIntegrationTime: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aGain:= LEConvertUInt8From(8, _response);
  aIntegrationTime:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletColorV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
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

procedure TBrickletColorV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletColorV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletColorV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletColorV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletColorV2.CallbackWrapperColor(const aPacket: TDynamicByteArray);
var
  _r: word; _g: word; _b: word; _c: word;
begin
  _r:= LEConvertUInt16From(8, aPacket);
  _g:= LEConvertUInt16From(10, aPacket);
  _b:= LEConvertUInt16From(12, aPacket);
  _c:= LEConvertUInt16From(14, aPacket);

  if (Assigned(fColorCallback)) then begin
    fColorCallback(self, _r, _g, _b, _c);
  end;
end;

procedure TBrickletColorV2.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var
  _illuminance: longword;
begin
  _illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fIlluminanceCallback)) then begin
    fIlluminanceCallback(self, _illuminance);
  end;
end;

procedure TBrickletColorV2.CallbackWrapperColorTemperature(const aPacket: TDynamicByteArray);
var
  _colorTemperature: word;
begin
  _colorTemperature:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fColorTemperatureCallback)) then begin
    fColorTemperatureCallback(self, _colorTemperature);
  end;
end;

end.
