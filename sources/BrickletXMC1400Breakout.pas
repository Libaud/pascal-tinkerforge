{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletXMC1400Breakout;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletXMC1400Breakout.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArray0To7OfUInt16 = array [0..7] of word;

  TBrickletXMC1400Breakout = class;
  TBrickletXMC1400BreakoutNotifyADCValues = procedure(aSender: TBrickletXMC1400Breakout; const aValues: TArray0To7OfUInt16) of object;
  TBrickletXMC1400BreakoutNotifyCount = procedure(aSender: TBrickletXMC1400Breakout; const count: longword) of object;

  /// <summary>
  ///  Breakout for Infineon XMC1400 microcontroller
  /// </summary>
  TBrickletXMC1400Breakout = class(TDevice)
  private
    fADCValuesCallback: TBrickletXMC1400BreakoutNotifyADCValues;
    fCountCallback: TBrickletXMC1400BreakoutNotifyCount;
  protected
    procedure CallbackWrapperADCValues(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCount(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Example for a setter function. The values are the values that can be given to
    ///  the XMC_GPIO_Init function. See communication.c in the firmware.
    /// </summary>
    procedure SetGPIOConfig(const aPort: byte; const aPin: byte; const aMode: byte; const inputHysteresis: byte; const outputLevel: boolean); virtual;

    /// <summary>
    ///  Example for a getter function. Returns the Result of a
    ///  XMC_GPIO_GetInput call for the given port/pin.
    /// </summary>
    function GetGPIOInput(const aPort: byte; const aPin: byte): boolean; virtual;

    /// <summary>
    ///  Enables a ADC channel for the ADC driver example (adc.c/adc.h).
    ///  
    ///  There are 8 ADC channels and they correspond to the following pins:
    ///  
    ///  * Channel 0: P2_6
    ///  * Channel 1: P2_8
    ///  * Channel 2: P2_9
    ///  * Channel 3: P2_10
    ///  * Channel 4: P2_11
    ///  * Channel 5: P2_0
    ///  * Channel 6: P2_1
    ///  * Channel 7: P2_2
    /// </summary>
    procedure SetADCChannelConfig(const channel: byte; const enable: boolean); virtual;

    /// <summary>
    ///  Returns the config for the given channel as set by <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetADCChannelConfig"/>.
    /// </summary>
    function GetADCChannelConfig(const channel: byte): boolean; virtual;

    /// <summary>
    ///  Returns the 12-bit value of the given ADC channel of the ADC driver example.
    /// </summary>
    function GetADCChannelValue(const channel: byte): word; virtual;

    /// <summary>
    ///  Returns the values for all 8 ADC channels of the adc driver example.
    ///  
    ///  This example function also has a corresponding callback.
    ///  
    ///  See <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetADCValuesCallbackConfiguration"/> and <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.OnADCValues"/> callback.
    /// </summary>
    function GetADCValues: TArray0To7OfUInt16; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.OnADCValues"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetADCValuesCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetADCValuesCallbackConfiguration"/>.
    /// </summary>
    procedure GetADCValuesCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the value of the example count (see example.c).
    ///  
    ///  This example function uses the "add_callback_value_function"-helper in the
    ///  generator. The getter as well as the callback and callback configuration
    ///  functions are auto-generated for the API as well as the firmware.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.OnCount"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetCountCallbackConfiguration"/>.
    /// </summary>
    function GetCount: longword; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.OnCount"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change                      {$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.OnCount"/> callback.
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
    procedure SetCountCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetCountCallbackConfiguration"/>.
    /// </summary>
    procedure GetCountCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword); virtual;

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

    /// <summary>                                                                               {$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

    ///  Returns the current bootloader mode, see <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetADCValuesCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.GetADCValues"/>.
    /// </summary>
    property OnADCValues: TBrickletXMC1400BreakoutNotifyADCValues read fADCValuesCallback write fADCValuesCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.SetCountCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletXMC1400Breakout.TBrickletXMC1400Breakout.GetCount"/>.
    /// </summary>
    property OnCount: TBrickletXMC1400BreakoutNotifyCount read fCountCallback write fCountCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletXMC1400Breakout.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletXMC1400Breakout.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_GPIO_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_GPIO_INPUT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_ADC_CHANNEL_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_CHANNEL_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_CHANNEL_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_ADC_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_VALUES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_COUNT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_COUNT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletXMC1400Breakout.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_XMC1400_BREAKOUT_CALLBACK_ADC_VALUES]:= {$ifdef FPC}@{$endif}CallbackWrapperADCValues;
  aCallBacks[BRICKLET_XMC1400_BREAKOUT_CALLBACK_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperCount;
end;

procedure TBrickletXMC1400Breakout.SetGPIOConfig(const aPort: byte; const aPin: byte; const aMode: byte; const inputHysteresis: byte; const outputLevel: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_GPIO_CONFIG, 13);
  LEConvertUInt8To(aPort, 8, _request);
  LEConvertUInt8To(aPin, 9, _request);
  LEConvertUInt8To(aMode, 10, _request);
  LEConvertUInt8To(inputHysteresis, 11, _request);
  LEConvertBooleanTo(outputLevel, 12, _request);
  SendRequest(_request);
end;

function TBrickletXMC1400Breakout.GetGPIOInput(const aPort: byte; const aPin: byte): boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_GPIO_INPUT, 10);
  LEConvertUInt8To(aPort, 8, _request);
  LEConvertUInt8To(aPin, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletXMC1400Breakout.SetADCChannelConfig(const channel: byte; const enable: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_ADC_CHANNEL_CONFIG, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertBooleanTo(enable, 9, _request);
  SendRequest(_request);
end;

function TBrickletXMC1400Breakout.GetADCChannelConfig(const channel: byte): boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_CHANNEL_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletXMC1400Breakout.GetADCChannelValue(const channel: byte): word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_CHANNEL_VALUE, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletXMC1400Breakout.GetADCValues: TArray0To7OfUInt16;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_VALUES, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 7 do Result[_i]:= LEConvertUInt16From(8 + (_i * 2), _response);
end;

procedure TBrickletXMC1400Breakout.SetADCValuesCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_ADC_VALUES_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletXMC1400Breakout.GetADCValuesCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_ADC_VALUES_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletXMC1400Breakout.GetCount: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_COUNT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletXMC1400Breakout.SetCountCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_COUNT_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt32To(min, 14, _request);
  LEConvertUInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletXMC1400Breakout.GetCountCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_COUNT_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt32From(14, _response);
  max:= LEConvertUInt32From(18, _response);
end;

procedure TBrickletXMC1400Breakout.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletXMC1400Breakout.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletXMC1400Breakout.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletXMC1400Breakout.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletXMC1400Breakout.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletXMC1400Breakout.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletXMC1400Breakout.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletXMC1400Breakout.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletXMC1400Breakout.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletXMC1400Breakout.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletXMC1400Breakout.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletXMC1400Breakout.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_XMC1400_BREAKOUT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletXMC1400Breakout.CallbackWrapperADCValues(const aPacket: TDynamicByteArray);
var values: TArray0To7OfUInt16; _i: longint;
begin
  for _i:= 0 to 7 do values[_i]:= LEConvertUInt16From(8 + (_i * 2), aPacket);

  if (Assigned(fADCValuesCallback)) then begin
    fADCValuesCallback(self, values);
  end;
end;

procedure TBrickletXMC1400Breakout.CallbackWrapperCount(const aPacket: TDynamicByteArray);
var count: longword;
begin
  count:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fCountCallback)) then begin
    fCountCallback(self, count);
  end;
end;

end.
