{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIO16V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIO16V2.inc}

type
  TArray0To15OfBoolean = array [0..15] of boolean;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIO16V2 = class;
  TBrickletIO16V2NotifyInputValue = procedure(aSender: TBrickletIO16V2; const aChannel: byte; const aChanged: boolean; const aValue: boolean) of object;
  TBrickletIO16V2NotifyAllInputValue = procedure(aSender: TBrickletIO16V2; const aChanged: TArray0To15OfBoolean; const aValue: TArray0To15OfBoolean) of object;
  TBrickletIO16V2NotifyMonoflopDone = procedure(aSender: TBrickletIO16V2; const aChannel: byte; const aValue: boolean) of object;

  /// <summary>
  ///  16-channel digital input/output
  /// </summary>
  TBrickletIO16V2 = class(TDevice)
  private
    fInputValueCallback: TBrickletIO16V2NotifyInputValue;
    fAllInputValueCallback: TBrickletIO16V2NotifyAllInputValue;
    fMonoflopDoneCallback: TBrickletIO16V2NotifyMonoflopDone;
    procedure CallbackWrapperInputValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllInputValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the output value of all sixteen channels. A value of *true* or *false* outputs
    ///  logic 1 or logic 0 respectively on the corresponding channel.
    ///  
    ///  Use <see cref="BrickletIO16V2.TBrickletIO16V2.SetSelectedValue"/> to change only one output channel state.
    ///  
    ///  For example: (True, True, False, False, ..., False) will turn the channels 0-1
    ///  high and the channels 2-15 low.
    ///  
    ///  All running monoflop timers will be aborted if this function is called.
    ///  
    ///  <note>
    ///   This function does nothing for channels that are configured as input. Pull-up
    ///   resistors can be switched on with <see cref="BrickletIO16V2.TBrickletIO16V2.SetConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetValue(const aValue: array of boolean); virtual;

    /// <summary>
    ///  Returns the logic levels that are currently measured on the channels.
    ///  This function works if the channel is configured as input as well as if it is
    ///  configured as output.
    /// </summary>
    function GetValue: TArray0To15OfBoolean; virtual;

    /// <summary>
    ///  Sets the output value of a specific channel without affecting the other channels.
    ///  
    ///  A running monoflop timer for the specific channel will be aborted if this
    ///  function is called.
    ///  
    ///  <note>
    ///   This function does nothing for channels that are configured as input. Pull-up
    ///   resistors can be switched on with <see cref="BrickletIO16V2.TBrickletIO16V2.SetConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetSelectedValue(const aChannel: byte; const aValue: boolean); virtual;

    /// <summary>
    ///  Configures the value and direction of a specific channel. Possible directions
    ///  are 'i' and 'o' for input and output.
    ///  
    ///  If the direction is configured as output, the value is either high or low
    ///  (set as *true* or *false*).
    ///  
    ///  If the direction is configured as input, the value is either pull-up or
    ///  default (set as *true* or *false*).
    ///  
    ///  For example:
    ///  
    ///  * (0, 'i', true) will set channel-0 as input pull-up.
    ///  * (1, 'i', false) will set channel-1 as input default (floating if nothing is connected).
    ///  * (2, 'o', true) will set channel-2 as output high.
    ///  * (3, 'o', false) will set channel-3 as output low.
    ///  
    ///  A running monoflop timer for the specific channel will be aborted if this
    ///  function is called.
    /// </summary>
    procedure SetConfiguration(const aChannel: byte; const aDirection: char; const aValue: boolean); virtual;

    /// <summary>
    ///  Returns the channel configuration as set by <see cref="BrickletIO16V2.TBrickletIO16V2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(const aChannel: byte; out aDirection: char; out aValue: boolean); virtual;

    /// <summary>
    ///  This callback can be configured per channel.
    ///  
    ///  The period is the period with which the <see cref="BrickletIO16V2.TBrickletIO16V2.OnInputValue"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetInputValueCallbackConfiguration(const aChannel: byte; const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetInputValueCallbackConfiguration"/>.
    /// </summary>
    procedure GetInputValueCallbackConfiguration(const aChannel: byte; out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIO16V2.TBrickletIO16V2.OnAllInputValue"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the             valueHasToChange
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllInputValueCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetAllInputValueCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllInputValueCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Configures a monoflop of the specified channel.
    ///  
    ///  The second parameter is the desired value of the specified
    ///  channel. A *true* means relay closed and a *false* means relay open.
    ///  
    ///  The third parameter indicates the time that the channels should hold
    ///  the value.
    ///  
    ///  If this function is called with the parameters (0, 1, 1500) channel 0 will
    ///  close and in 1.5s channel 0 will open again
    ///  
    ///  A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
    ///  have a RS485 bus and a IO-16 Bricklet 2.0 connected to one of
    ///  the slave stacks. You can now call this function every second, with a time
    ///  parameter of two seconds and channel 0 closed. Channel 0 will be closed all the
    ///  time. If now the RS485 connection is lost, then channel 0 will be opened in at
    ///  most two seconds.
    /// </summary>
    procedure SetMonoflop(const aChannel: byte; const aValue: boolean; const aTime: longword); virtual;

    /// <summary>
    ///  Returns (for the given channel) the current value and the time as set by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const aChannel: byte; out aValue: boolean; out aTime: longword; out aTimeRemaining: longword); virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected channel. You can
    ///  configure the edges that are counted with <see cref="BrickletIO16V2.TBrickletIO16V2.SetEdgeCountConfiguration"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    /// </summary>
    function GetEdgeCount(const aChannel: byte; const aResetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for a specific channel.
    ///  
    ///  The edge type parameter configures if rising edges, falling edges or
    ///  both are counted if the channel is configured for input. Possible edge types are:
    ///  
    ///  * 0 = rising
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    /// </summary>
    procedure SetEdgeCountConfiguration(const aChannel: byte; const aEdgeType: byte; const aDebounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected channel as set by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetEdgeCountConfiguration"/>.
    /// </summary>
    procedure GetEdgeCountConfiguration(const aChannel: byte; out aEdgeType: byte; out aDebounce: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIO16V2.TBrickletIO16V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIO16V2.TBrickletIO16V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIO16V2.TBrickletIO16V2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetInputValueCallbackConfiguration"/>.
    ///  
    ///  The parameters are the channel, a value-changed indicator and the actual value
    ///  for the channel. The `changed` parameter is true if the value has changed since
    ///  the last callback.
    /// </summary>
    property OnInputValue: TBrickletIO16V2NotifyInputValue read fInputValueCallback write fInputValueCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletIO16V2.TBrickletIO16V2.SetAllInputValueCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletIO16V2.TBrickletIO16V2.GetValue"/>. Additional the
    ///  `changed` parameter is true if the value has changed since
    ///  the last callback.
    /// </summary>
    property OnAllInputValue: TBrickletIO16V2NotifyAllInputValue read fAllInputValueCallback write fAllInputValueCallback;

    /// <summary>
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the channel and the current value of the channel
    ///  (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIO16V2NotifyMonoflopDone read fMonoflopDoneCallback write fMonoflopDoneCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletIO16V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIO16V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_SELECTED_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_INPUT_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_INPUT_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_ALL_INPUT_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_ALL_INPUT_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_EDGE_COUNT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_EDGE_COUNT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIO16V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_IO16_V2_CALLBACK_INPUT_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperInputValue;
  aCallBacks[BRICKLET_IO16_V2_CALLBACK_ALL_INPUT_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAllInputValue;
  aCallBacks[BRICKLET_IO16_V2_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIO16V2.SetValue(const aValue: array of boolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _valueBits: array [0..1] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_VALUE, 10);
  if (Length(aValue) <> 16) then raise EInvalidParameterException.Create('Value has to be exactly 16 items long');
  FillChar(_valueBits[0], Length(_valueBits) * SizeOf(_valueBits[0]), 0);
  for _i:= 0 to 15 do if aValue[_i] then _valueBits[Floor(_i / 8)]:= _valueBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 1 do LEConvertUInt8To(_valueBits[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletIO16V2.GetValue: TArray0To15OfBoolean;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _valueBits: array [0..1] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  FillChar(_valueBits[0], Length(_valueBits) * SizeOf(_valueBits[0]), 0);
  for _i:= 0 to 1 do _valueBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 15 do Result[_i]:= ((_valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletIO16V2.SetSelectedValue(const aChannel: byte; const aValue: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_SELECTED_VALUE, 10);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertBooleanTo(aValue, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.SetConfiguration(const aChannel: byte; const aDirection: char; const aValue: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertCharTo(aDirection, 9, _request);
  LEConvertBooleanTo(aValue, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.GetConfiguration(const aChannel: byte; out aDirection: char; out aValue: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_CONFIGURATION, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aDirection:= LEConvertCharFrom(8, _response);
  aValue:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletIO16V2.SetInputValueCallbackConfiguration(const aChannel: byte; const aPeriod: longword; const aValueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_INPUT_VALUE_CALLBACK_CONFIGURATION, 14);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertUInt32To(aPeriod, 9, _request);
  LEConvertBooleanTo(aValueHasToChange, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.GetInputValueCallbackConfiguration(const aChannel: byte; out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_INPUT_VALUE_CALLBACK_CONFIGURATION, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIO16V2.SetAllInputValueCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_ALL_INPUT_VALUE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.GetAllInputValueCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_ALL_INPUT_VALUE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIO16V2.SetMonoflop(const aChannel: byte; const aValue: boolean; const aTime: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_MONOFLOP, 14);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertBooleanTo(aValue, 9, _request);
  LEConvertUInt32To(aTime, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.GetMonoflop(const aChannel: byte; out aValue: boolean; out aTime: longword; out aTimeRemaining: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aValue:= LEConvertBooleanFrom(8, _response);
  aTime:= LEConvertUInt32From(9, _response);
  aTimeRemaining:= LEConvertUInt32From(13, _response);
end;

function TBrickletIO16V2.GetEdgeCount(const aChannel: byte; const aResetCounter: boolean): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertBooleanTo(aResetCounter, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO16V2.SetEdgeCountConfiguration(const aChannel: byte; const aEdgeType: byte; const aDebounce: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_EDGE_COUNT_CONFIGURATION, 11);
  LEConvertUInt8To(aChannel, 8, _request);
  LEConvertUInt8To(aEdgeType, 9, _request);
  LEConvertUInt8To(aDebounce, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.GetEdgeCountConfiguration(const aChannel: byte; out aEdgeType: byte; out aDebounce: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_EDGE_COUNT_CONFIGURATION, 9);
  LEConvertUInt8To(aChannel, 8, _request);
  _response:= SendRequest(_request);
  aEdgeType:= LEConvertUInt8From(8, _response);
  aDebounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIO16V2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIO16V2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIO16V2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO16V2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO16V2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO16V2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO16V2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIO16V2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIO16V2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIO16V2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO16V2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO16V2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIO16V2.CallbackWrapperInputValue(const aPacket: TDynamicByteArray);
var
  _channel: byte;
  _changed: boolean;
  _value: boolean;
begin
  _channel:= LEConvertUInt8From(8, aPacket);
  _changed:= LEConvertBooleanFrom(9, aPacket);
  _value:= LEConvertBooleanFrom(10, aPacket);

  if (Assigned(fInputValueCallback)) then begin
    fInputValueCallback(self, _channel, _changed, _value);
  end;
end;

procedure TBrickletIO16V2.CallbackWrapperAllInputValue(const aPacket: TDynamicByteArray);
var
  _changed: TArray0To15OfBoolean;
  _value: TArray0To15OfBoolean;
  _i: longint;
  _changedBits: array [0..1] of byte;
  _valueBits: array [0..1] of byte;
begin
  FillChar(_changedBits[0], Length(_changedBits) * SizeOf(_changedBits[0]), 0);
  for _i:= 0 to 1 do _changedBits[_i]:= LEConvertUInt8From(8 + (_i * 1), aPacket);
  for _i:= 0 to 15 do _changed[_i]:= ((_changedBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(_valueBits[0], Length(_valueBits) * SizeOf(_valueBits[0]), 0);
  for _i:= 0 to 1 do _valueBits[_i]:= LEConvertUInt8From(10 + (_i * 1), aPacket);
  for _i:= 0 to 15 do _value[_i]:= ((_valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  if (Assigned(fAllInputValueCallback)) then begin
    fAllInputValueCallback(self, _changed, _value);
  end;
end;

procedure TBrickletIO16V2.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  _channel: byte;
  _value: boolean;
begin
  _channel:= LEConvertUInt8From(8, aPacket);
  _value:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fMonoflopDoneCallback)) then begin
    fMonoflopDoneCallback(self, _channel, _value);
  end;
end;

end.
