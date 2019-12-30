{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDigitalIn4V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDigitalIn4V2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfBoolean = array [0..3] of boolean;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIndustrialDigitalIn4V2 = class;
  TBrickletIndustrialDigitalIn4V2NotifyValue = procedure(aSender: TBrickletIndustrialDigitalIn4V2; const channel: byte; const changed: boolean; const value: boolean) of object;
  TBrickletIndustrialDigitalIn4V2NotifyAllValue = procedure(aSender: TBrickletIndustrialDigitalIn4V2; const changed: TArray0To3OfBoolean; const value: TArray0To3OfBoolean) of object;

  /// <summary>
  ///  4 galvanically isolated digital inputs
  /// </summary>
  TBrickletIndustrialDigitalIn4V2 = class(TDevice)
  private
    fValueCallback: TBrickletIndustrialDigitalIn4V2NotifyValue;
    fAllValueCallback: TBrickletIndustrialDigitalIn4V2NotifyAllValue;
    procedure CallbackWrapperValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllValue(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the input value as bools, *true* refers to highabstract; virtual; and *false* refers to low.
    /// </summary>
    function GetValue: TArray0To3OfBoolean; virtual;

    /// <summary>
    ///  This callback can be configured per channel.
    ///  
    ///  The period is the period with which the <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.OnValue"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.                             abstract; virtual;
    /// </summary>
    procedure SetValueCallbackConfiguration(const channel: byte; const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration for the given channel as set by
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetValueCallbackConfiguration"/>.
    /// </summary>
    procedure GetValueCallbackConfiguration(const channel: byte; out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.OnAllValue"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetAllValueCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected channel. You can
    ///  configure the edges that are counted with <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetEdgeCountConfiguration"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    /// </summary>
    function GetEdgeCount(const channel: byte; const resetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for a specific channel.
    ///  
    ///  The edge type parameter configures if rising edges, falling edges or both are
    ///  counted. Possible edge types are:
    ///  
    ///  * 0 = rising
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave iabstract; virtual;t at default. The
    ///  default configuration is very likely OK for you.
    /// </summary>
    procedure SetEdgeCountConfiguration(const channel: byte; const edgeType: byte; const debounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected channel as set by
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetEdgeCountConfiguration"/>.
    /// </summary>
    procedure GetEdgeCountConfiguration(const channel: byte; out edgeType: byte; out debounce: byte); virtual;

    /// <summary>
    ///  Each channel has a corresponding LED. You can turn the LED off, on or show a
    ///  heartbeat. You can also set the LED to "Channel Status". In this mode the
    ///  LED is on if the channel is high and off otherwise.
    ///                                                        abstract; virtual;
    ///  By default all channel LEDs are configured as "Channel Status".
    /// </summary>
    procedure SetChannelLEDConfig(const channel: byte; const config: byte); virtual;

    /// <summary>
    ///  Returns the channel LED configuration as set by <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetChannelLEDConfig"/>
    /// </summary>
    function GetChannelLEDConfig(const channel: byte): byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///                                                         abstract; virtual;
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
    ///  Returns the configuration as set by <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetValueCallbackConfiguration"/>.
    ///  
    ///  The parameters are the channel, a value-changed indicator and the actual
    ///  value for the channel. The `changed` parameter is true if the value has changed
    ///  since the last callback.
    /// </summary>
    property OnValue: TBrickletIndustrialDigitalIn4V2NotifyValue read fValueCallback write fValueCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.SetAllValueCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletIndustrialDigitalIn4V2.TBrickletIndustrialDigitalIn4V2.GetValue"/>. Additional the
    ///  `changed` parameter is true if the value has changed since
    ///  the last callback.
    /// </summary>
    property OnAllValue: TBrickletIndustrialDigitalIn4V2NotifyAllValue read fAllValueCallback write fAllValueCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletIndustrialDigitalIn4V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialDigitalIn4V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_ALL_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_ALL_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_EDGE_COUNT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_EDGE_COUNT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDigitalIn4V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CALLBACK_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperValue;
  aCallBacks[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CALLBACK_ALL_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAllValue;
end;

function TBrickletIndustrialDigitalIn4V2.GetValue: TArray0To3OfBoolean;
var 
_request, _response: TDynamicByteArray; _i: longint; valueBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  FillChar(valueBits[0], Length(valueBits) * SizeOf(valueBits[0]), 0);
  for _i:= 0 to 0 do valueBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 3 do Result[_i]:= ((valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetValueCallbackConfiguration(const channel: byte; const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_VALUE_CALLBACK_CONFIGURATION, 14);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt32To(period, 9, _request);
  LEConvertBooleanTo(valueHasToChange, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDigitalIn4V2.GetValueCallbackConfiguration(const channel: byte; out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_VALUE_CALLBACK_CONFIGURATION, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetAllValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_ALL_VALUE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDigitalIn4V2.GetAllValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_ALL_VALUE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletIndustrialDigitalIn4V2.GetEdgeCount(const channel: byte; const resetCounter: boolean): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertBooleanTo(resetCounter, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetEdgeCountConfiguration(const channel: byte; const edgeType: byte; const debounce: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_EDGE_COUNT_CONFIGURATION, 11);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(edgeType, 9, _request);
  LEConvertUInt8To(debounce, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDigitalIn4V2.GetEdgeCountConfiguration(const channel: byte; out edgeType: byte; out debounce: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_EDGE_COUNT_CONFIGURATION, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  edgeType:= LEConvertUInt8From(8, _response);
  debounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetChannelLEDConfig(const channel: byte; const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_CHANNEL_LED_CONFIG, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(config, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4V2.GetChannelLEDConfig(const channel: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_CHANNEL_LED_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialDigitalIn4V2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDigitalIn4V2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4V2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4V2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialDigitalIn4V2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDigitalIn4V2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4V2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDigitalIn4V2.CallbackWrapperValue(const aPacket: TDynamicByteArray);
var channel: byte; changed: boolean; value: boolean;
begin
  channel:= LEConvertUInt8From(8, aPacket);
  changed:= LEConvertBooleanFrom(9, aPacket);
  value:= LEConvertBooleanFrom(10, aPacket);

  if (Assigned(fValueCallback)) then begin
    fValueCallback(self, channel, changed, value);
  end;
end;

procedure TBrickletIndustrialDigitalIn4V2.CallbackWrapperAllValue(const aPacket: TDynamicByteArray);
var changed: TArray0To3OfBoolean; value: TArray0To3OfBoolean; _i: longint; changedBits: array [0..0] of byte; valueBits: array [0..0] of byte;
begin
  FillChar(changedBits[0], Length(changedBits) * SizeOf(changedBits[0]), 0);
  for _i:= 0 to 0 do changedBits[_i]:= LEConvertUInt8From(8 + (_i * 1), aPacket);
  for _i:= 0 to 3 do changed[_i]:= ((changedBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(valueBits[0], Length(valueBits) * SizeOf(valueBits[0]), 0);
  for _i:= 0 to 0 do valueBits[_i]:= LEConvertUInt8From(9 + (_i * 1), aPacket);
  for _i:= 0 to 3 do value[_i]:= ((valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  if (Assigned(fAllValueCallback)) then begin
    fAllValueCallback(self, changed, value);
  end;
end;

end.
