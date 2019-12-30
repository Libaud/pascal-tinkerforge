{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDual020mAV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDual020mAV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIndustrialDual020mAV2 = class;
  TBrickletIndustrialDual020mAV2NotifyCurrent = procedure(aSender: TBrickletIndustrialDual020mAV2; const channel: byte; const current: longint) of object;

  /// <summary>
  ///  Measures two DC currents between 0mA and 20mA (IEC 60381-1)
  /// </summary>
  TBrickletIndustrialDual020mAV2 = class(TDevice)
  private
    fCurrentCallback: TBrickletIndustrialDual020mAV2NotifyCurrent;
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current of the specified channel.
    ///  
    ///  It is possible to detect if an IEC 60381-1 compatible sensor is connected
    ///  and if it works probably.
    ///  
    ///  If the returned current is below 4mA, there is likely no sensor connected
    ///  or the connected sensor is defective. If the returned current is over 20mA,
    ///  there might be a short circuit or the sensor is defective.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.OnCurrent"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetCurrentCallbackConfiguration"/>.
    /// </summary>
    function GetCurrent(const channel: byte): longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.OnCurrent"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.OnCurrent"/> callback.
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
    procedure SetCurrentCallbackConfiguration(const channel: byte; const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetCurrentCallbackConfiguration"/>.
    /// </summary>
    procedure GetCurrentCallbackConfiguration(const channel: byte; out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the sample rate to either 240, 60, 15 or 4 samples per second.
    ///  The resolution for the rates is 12, 14, 16 and 18 bit respectively.
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0",    "240 samples per second, 12 bit resolution"
    ///   "1",    "60 samples per second, 14 bit resolution"
    ///   "2",    "15 samples per second, 16 bit resolution"
    ///   "3",    "4 samples per second, 18 bit resolution"
    ///  </code>
    /// </summary>
    procedure SetSampleRate(const rate: byte); virtual;

    /// <summary>
    ///  Returns the gain as set by <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

    /// <summary>
    ///  Sets a gain between 1x and 8x. If you want to measure a very small current,
    ///  you can increase the gain to get some more resolution.
    ///  
    ///  Example: If you measure 0.5mA with a gain of 8x the return value will be
    ///  4mA.
    /// </summary>
    procedure SetGain(const gain: byte); virtual;

    /// <summary>
    ///  Returns the gain as set by <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetGain"/>.
    /// </summary>
    function GetGain: byte; virtual;

    /// <summary>
    ///  Each channel has a corresponding LED. You can turn the LED off, on or show a
    ///  heartbeat. You can also set the LED to "Channel Status". In this mode the
    ///  LED can either be turned on with a pre-defined threshold or the intensity
    ///  of the LED can change with the measured value.
    ///  
    ///  You can configure the channel status behavior with <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetChannelLEDStatusConfig"/>.
    /// </summary>
    procedure SetChannelLEDConfig(const channel: byte; const config: byte); virtual;

    /// <summary>
    ///  Returns the channel LED configuration as set by <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetChannelLEDConfig"/>
    /// </summary>
    function GetChannelLEDConfig(const channel: byte): byte; virtual;

    /// <summary>
    ///  Sets the channel LED status config. This config is used if the channel LED is
    ///  configured as "Channel Status", see <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetChannelLEDConfig"/>.
    ///  
    ///  For each channel you can choose between threshold and intensity mode.
    ///  
    ///  In threshold mode you can define a positive or a negative threshold.
    ///  For a positive threshold set the "min" parameter to the threshold value in nA
    ///  above which the LED should turn on and set the "max" parameter to 0. Example:
    ///  If you set a positive threshold of 10mA, the LED will turn on as soon as the
    ///  current exceeds 10mA and turn off again if it goes below 10mA.
    ///  For a negative threshold set the "max" parameter to the threshold value in nA
    ///  below which the LED should turn on and set the "min" parameter to 0. Example:
    ///  If you set a negative threshold of 10mA, the LED will turn on as soon as the
    ///  current goes below 10mA and the LED will turn off when the current exceeds 10mA.
    ///  
    ///  In intensity mode you can define a range in nA that is used to scale the brightness
    ///  of the LED. Example with min=4mA and max=20mA: The LED is off at 4mA and below,
    ///  on at 20mA and above and the brightness is linearly scaled between the values
    ///  4mA and 20mA. If the min value is greater than the max value, the LED brightness
    ///  is scaled the other way around.
    /// </summary>
    procedure SetChannelLEDStatusConfig(const channel: byte; const min: longint; const max: longint; const config: byte); virtual;

    /// <summary>
    ///  Returns the channel LED status configuration as set by
    ///  <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetChannelLEDStatusConfig"/>.
    /// </summary>
    procedure GetChannelLEDStatusConfig(const channel: byte; out min: longint; out max: longint; out config: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.SetCurrentCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletIndustrialDual020mAV2.TBrickletIndustrialDual020mAV2.GetCurrent"/>.
    /// </summary>
    property OnCurrent: TBrickletIndustrialDual020mAV2NotifyCurrent read fCurrentCallback write fCurrentCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialDual020mAV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialDual020mAV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CURRENT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CURRENT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_GAIN]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_GAIN]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CHANNEL_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHANNEL_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDual020mAV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
end;

function TBrickletIndustrialDual020mAV2.GetCurrent(const channel: byte): longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CURRENT, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetCurrentCallbackConfiguration(const channel: byte; const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CURRENT_CALLBACK_CONFIGURATION, 23);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt32To(period, 9, _request);
  LEConvertBooleanTo(valueHasToChange, 13, _request);
  LEConvertCharTo(option, 14, _request);
  LEConvertInt32To(min, 15, _request);
  LEConvertInt32To(max, 19, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDual020mAV2.GetCurrentCallbackConfiguration(const channel: byte; out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CURRENT_CALLBACK_CONFIGURATION, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt32From(14, _response);
  max:= LEConvertInt32From(18, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetSampleRate(const rate: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(rate, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.GetSampleRate: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_SAMPLE_RATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetGain(const gain: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_GAIN, 9);
  LEConvertUInt8To(gain, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.GetGain: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_GAIN, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetChannelLEDConfig(const channel: byte; const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CHANNEL_LED_CONFIG, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(config, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.GetChannelLEDConfig(const channel: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHANNEL_LED_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetChannelLEDStatusConfig(const channel: byte; const min: longint; const max: longint; const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_CHANNEL_LED_STATUS_CONFIG, 18);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertInt32To(min, 9, _request);
  LEConvertInt32To(max, 13, _request);
  LEConvertUInt8To(config, 17, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDual020mAV2.GetChannelLEDStatusConfig(const channel: byte; out min: longint; out max: longint; out config: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHANNEL_LED_STATUS_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  min:= LEConvertInt32From(8, _response);
  max:= LEConvertInt32From(12, _response);
  config:= LEConvertUInt8From(16, _response);
end;

procedure TBrickletIndustrialDual020mAV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialDual020mAV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDual020mAV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDual020mAV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDual020mAV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mAV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDual020mAV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDual020mAV2.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var channel: byte; current: longint;
begin
  channel:= LEConvertUInt8From(8, aPacket);
  current:= LEConvertInt32From(9, aPacket);

  if (Assigned(fCurrentCallback)) then begin
    fCurrentCallback(self, channel, current);
  end;
end;

end.
