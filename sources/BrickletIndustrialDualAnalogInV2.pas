{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDualAnalogInV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDualAnalogInV2.inc}

type
  TArray0To1OfInt32 = array [0..1] of longint;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIndustrialDualAnalogInV2 = class;
  TBrickletIndustrialDualAnalogInV2NotifyVoltage = procedure(aSender: TBrickletIndustrialDualAnalogInV2; const aChannel: byte; const aVoltage: longint) of object;

  /// <summary>
  ///  Measures two DC voltages between -35V and +35V with 24bit resolution each
  /// </summary>
  TBrickletIndustrialDualAnalogInV2 = class(TDevice)
  private
    fVoltageCallback: TBrickletIndustrialDualAnalogInV2NotifyVoltage;
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the voltage for the given channel.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.OnVoltage"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    function GetVoltage(const aChannel: byte): longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.OnVoltage"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.OnVoltage"/> callback.
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
    procedure SetVoltageCallbackConfiguration(const aChannel: byte; const aPeriod: longword; const aValueHasToChange: boolean;
                                              const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    procedure GetVoltageCallbackConfiguration(const aChannel: byte; out aPeriod: longword; out aValueHasToChange: boolean;
                                              out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the sample rate. The sample rate can be between 1 sample per second
    ///  and 976 samples per second. Decreasing the sample rate will also decrease the
    ///  noise on the data.
    /// </summary>
    procedure SetSampleRate(const aRate: byte); virtual;

    /// <summary>
    ///  Returns the sample rate as set by <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

    /// <summary>
    ///  Sets offset and gain of MCP3911 internal calibration registers.
    ///  
    ///  See MCP3911 datasheet 7.7 and 7.8. The Industrial Dual Analog In Bricklet 2.0
    ///  is already factory calibrated by Tinkerforge. It should not be necessary
    ///  for you to use this function
    /// </summary>
    procedure SetCalibration(const aOffset: array of longint; const aGain: array of longint); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out aOffset: TArray0To1OfInt32; out aGain: TArray0To1OfInt32); virtual;

    /// <summary>
    ///  Returns the ADC values as given by the MCP3911 IC. This function
    ///  is needed for proper calibration, see <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetCalibration"/>.
    /// </summary>
    function GetADCValues: TArray0To1OfInt32; virtual;

    /// <summary>
    ///  Each channel has a corresponding LED. You can turn the LED off, on or show a
    ///  heartbeat. You can also set the LED to "Channel Status". In this mode the
    ///  LED can either be turned on with a pre-defined threshold or the intensity
    ///  of the LED can change with the measured value.
    ///  
    ///  You can configure the channel status behavior with <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetChannelLEDStatusConfig"/>.
    ///  
    ///  By default all channel LEDs are configured as "Channel Status".
    /// </summary>
    procedure SetChannelLEDConfig(const aChannel: byte; const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the channel LED configuration as set by <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetChannelLEDConfig"/>
    /// </summary>
    function GetChannelLEDConfig(const aChannel: byte): byte; virtual;

    /// <summary>
    ///  Sets the channel LED status config. This config is used if the channel LED is
    ///  configured as "Channel Status", see <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetChannelLEDConfig"/>.
    ///  
    ///  For each channel you can choose between threshold and intensity mode.
    ///  
    ///  In threshold mode you can define a positive or a negative threshold.
    ///  For a positive threshold set the "min" parameter to the threshold value in mV
    ///  above which the LED should turn on and set the "max" parameter to 0. Example:
    ///  If you set a positive threshold of 10V, the LED will turn on as soon as the
    ///  voltage exceeds 10V and turn off again if it goes below 10V.
    ///  For a negative threshold set the "max" parameter to the threshold value in mV
    ///  below which the LED should turn on and set the "min" parameter to 0. Example:
    ///  If you set a negative threshold of 10V, the LED will turn on as soon as the
    ///  voltage goes below 10V and the LED will turn off when the voltage exceeds 10V.
    ///  
    ///  In intensity mode you can define a range in mV that is used to scale the brightness
    ///  of the LED. Example with min=4V, max=20V: The LED is off at 4V, on at 20V
    ///  and the brightness is linearly scaled between the values 4V and 20V. If the
    ///  min value is greater than the max value, the LED brightness is scaled the other
    ///  way around.
    /// </summary>
    procedure SetChannelLEDStatusConfig(const aChannel: byte; const aMin: longint; const aMax: longint; const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the channel LED status configuration as set by
    ///  <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetChannelLEDStatusConfig"/>.
    /// </summary>
    procedure GetChannelLEDStatusConfig(const aChannel: byte; out aMin: longint; out aMax: longint; out aConfig: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.SetVoltageCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletIndustrialDualAnalogInV2.TBrickletIndustrialDualAnalogInV2.GetVoltage"/>.
    /// </summary>
    property OnVoltage: TBrickletIndustrialDualAnalogInV2NotifyVoltage read fVoltageCallback write fVoltageCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialDualAnalogInV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialDualAnalogInV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_ADC_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CHANNEL_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHANNEL_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDualAnalogInV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
end;

function TBrickletIndustrialDualAnalogInV2.GetVoltage(const aChannel: byte): longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetVoltageCallbackConfiguration(const aChannel: byte; const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION, 23);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertUInt32To(aPeriod, 9, _request);
  LEConvertBooleanTo(aValueHasToChange, 13, _request);
  LEConvertCharTo(aOption, 14, _request);
  LEConvertInt32To(aMin, 15, _request);
  LEConvertInt32To(aMax, 19, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogInV2.GetVoltageCallbackConfiguration(const aChannel: byte; out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetSampleRate(const aRate: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(aRate, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogInV2.GetSampleRate: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_SAMPLE_RATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetCalibration(const aOffset: array of longint; const aGain: array of longint);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CALIBRATION, 24);
  if (Length(aOffset) <> 2) then raise EInvalidParameterException.Create('Offset has to be exactly 2 items long');
  for _i:= 0 to Length(aOffset) - 1 do LEConvertInt32To(aOffset[_i], 8 + (_i * 4), _request);
  if (Length(aGain) <> 2) then raise EInvalidParameterException.Create('Gain has to be exactly 2 items long');
  for _i:= 0 to Length(aGain) - 1 do LEConvertInt32To(aGain[_i], 16 + (_i * 4), _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogInV2.GetCalibration(out aOffset: TArray0To1OfInt32; out aGain: TArray0To1OfInt32);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 1 do aOffset[_i]:= LEConvertInt32From(8 + (_i * 4), _response);
  for _i:= 0 to 1 do aGain[_i]:= LEConvertInt32From(16 + (_i * 4), _response);
end;

function TBrickletIndustrialDualAnalogInV2.GetADCValues: TArray0To1OfInt32;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_ADC_VALUES, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 1 do Result[_i]:= LEConvertInt32From(8 + (_i * 4), _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetChannelLEDConfig(const aChannel: byte; const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CHANNEL_LED_CONFIG, 10);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertUInt8To(aConfig, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogInV2.GetChannelLEDConfig(const aChannel: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHANNEL_LED_CONFIG, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetChannelLEDStatusConfig(const aChannel: byte; const aMin: longint; const aMax: longint; const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_CHANNEL_LED_STATUS_CONFIG, 18);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  LEConvertUInt8To(aConfig, 17, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogInV2.GetChannelLEDStatusConfig(const aChannel: byte; out aMin: longint; out aMax: longint; out aConfig: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHANNEL_LED_STATUS_CONFIG, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aMin:= LEConvertInt32From(8, _response);
  aMax:= LEConvertInt32From(12, _response);
  aConfig:= LEConvertUInt8From(16, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialDualAnalogInV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDualAnalogInV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogInV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogInV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDualAnalogInV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDualAnalogInV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDualAnalogInV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDualAnalogInV2.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  _channel: byte;
  _voltage: longint;
begin
  _channel:= LEConvertUInt8From(8, aPacket);
  _voltage:= LEConvertInt32From(9, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, _channel, _voltage);
  end;
end;

end.
