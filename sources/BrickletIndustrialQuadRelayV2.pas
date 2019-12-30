{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialQuadRelayV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialQuadRelayV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfBoolean = array [0..3] of boolean;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIndustrialQuadRelayV2 = class;
  TBrickletIndustrialQuadRelayV2NotifyMonoflopDone = procedure(aSender: TBrickletIndustrialQuadRelayV2; const channel: byte; const value: boolean) of object;

  /// <summary>
  ///  4 galvanically isolated solid state relays
  /// </summary>
  TBrickletIndustrialQuadRelayV2 = class(TDevice)
  private
    monoflopDoneCallback: TBrickletIndustrialQuadRelayV2NotifyMonoflopDone;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the value of all four relays. A value of *true* closes the
    ///  relay and a value of *false* opens the relay.
    ///  
    ///  Use <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetSelectedValue"/> to only change one relay.
    ///  
    ///  All running monoflop timers will be aborted if this function is called.
    /// </summary>
    procedure SetValue(const value: array of boolean); virtual;

    /// <summary>
    ///  Returns the values as set by <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetValue"/>.
    /// </summary>
    function GetValue: TArray0To3OfBoolean; virtual;

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
    ///  have a RS485 bus and a Industrial Quad Relay Bricklet 2.0 connected to one of
    ///  the slave stacks. You can now call this function every second, with a time
    ///  parameter of two seconds and channel 0 closed. Channel 0 will be closed all the
    ///  time. If now the RS485 connection is lost, then channel 0 will be opened in at
    ///  most two seconds.
    /// </summary>
    procedure SetMonoflop(const channel: byte; const value: boolean; const time: longword); virtual;

    /// <summary>
    ///  Returns (for the given channel) the current value and the time as set by
    ///  <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const channel: byte; out aValue: boolean; out time: longword; out timeRemaining: longword); virtual;

    /// <summary>
    ///  Sets the output value of the specified channel without affecting the other
    ///  channels.
    ///  
    ///  A running monoflop timer for the specified channel will be aborted if this
    ///  function is called.
    /// </summary>
    procedure SetSelectedValue(const channel: byte; const value: boolean); virtual;

    /// <summary>
    ///  Each channel has a corresponding LED. You can turn the LED off, on or show a
    ///  heartbeat. You can also set the LED to "Channel Status". In this mode the
    ///  LED is on if the channel is high and off otherwise.
    /// </summary>
    procedure SetChannelLEDConfig(const channel: byte; const config: byte); virtual;

    /// <summary>
    ///  Returns the channel LED configuration as set by <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetChannelLEDConfig"/>
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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIndustrialQuadRelayV2.TBrickletIndustrialQuadRelayV2.SetStatusLEDConfig"/>
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
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the channel and the current value of the channel
    ///  (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIndustrialQuadRelayV2NotifyMonoflopDone read monoflopDoneCallback write monoflopDoneCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletIndustrialQuadRelayV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialQuadRelayV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_SELECTED_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialQuadRelayV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIndustrialQuadRelayV2.SetValue(const value: array of boolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  _ValueBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_VALUE, 9);
  if (Length(value) <> 4) then raise EInvalidParameterException.Create('Value has to be exactly 4 items long');
  FillChar(_ValueBits[0], Length(_ValueBits) * SizeOf(_ValueBits[0]), 0);
  for _i:= 0 to 3 do if value[_i] then _ValueBits[Floor(_i/8)]:= _ValueBits[Floor(_i/8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_ValueBits[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelayV2.GetValue: TArray0To3OfBoolean;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  _ValueBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  FillChar(_ValueBits[0], Length(_ValueBits) * SizeOf(_ValueBits[0]), 0);
  for _i:= 0 to 0 do _ValueBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 3 do Result[_i]:= ((_ValueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletIndustrialQuadRelayV2.SetMonoflop(const channel: byte; const value: boolean; const time: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_MONOFLOP, 14);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertBooleanTo(value, 9, _request);
  LEConvertUInt32To(time, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialQuadRelayV2.GetMonoflop(const channel: byte; out aValue: boolean; out time: longword; out timeRemaining: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  aValue:= LEConvertBooleanFrom(8, _response);
  time:= LEConvertUInt32From(9, _response);
  timeRemaining:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.SetSelectedValue(const channel: byte; const value: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_SELECTED_VALUE, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertBooleanTo(value, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialQuadRelayV2.SetChannelLEDConfig(const channel: byte; const config: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_CHANNEL_LED_CONFIG, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(config, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelayV2.GetChannelLEDConfig(const channel: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_CHANNEL_LED_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialQuadRelayV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialQuadRelayV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.SetWriteFirmwarePointer(const pointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelayV2.WriteFirmware(const data: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.SetStatusLEDConfig(const config: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelayV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialQuadRelayV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialQuadRelayV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelayV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialQuadRelayV2.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  _Channel: byte;
  _Value: boolean;
begin
  _Channel:= LEConvertUInt8From(8, aPacket);
  _Value:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(monoflopDoneCallback)) then begin
    monoflopDoneCallback(self, _Channel, _Value);
  end;
end;

end.
