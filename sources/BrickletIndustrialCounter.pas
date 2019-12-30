{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialCounter;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialCounter.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfBoolean = array [0..3] of boolean;
  TArray0To3OfInt64 = array [0..3] of int64;
  TArray0To3OfUInt16 = array [0..3] of word;
  TArray0To3OfUInt32 = array [0..3] of longword;
  TArray0To3OfUInt64 = array [0..3] of uint64;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIndustrialCounter = class;
  TBrickletIndustrialCounterNotifyAllCounter = procedure(aSender: TBrickletIndustrialCounter; const counter: TArray0To3OfInt64) of object;
  TBrickletIndustrialCounterNotifyAllSignalData = procedure(aSender: TBrickletIndustrialCounter; const dutyCycle: TArray0To3OfUInt16; const period: TArray0To3OfUInt64; const frequency: TArray0To3OfUInt32; const value: TArray0To3OfBoolean) of object;

  /// <summary>
  ///  4 channel counter up to 4MHz
  /// </summary>
  TBrickletIndustrialCounter = class(TDevice)
  private
    allCounterCallback: TBrickletIndustrialCounterNotifyAllCounter;
    allSignalDataCallback: TBrickletIndustrialCounterNotifyAllSignalData;
  protected
    procedure CallbackWrapperAllCounter(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllSignalData(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current counter value for the given channel.
    /// </summary>
    function GetCounter(const channel: byte): int64; virtual;

    /// <summary>
    ///  Returns the current counter values for all four channels.
    /// </summary>
    function GetAllCounter: TArray0To3OfInt64; virtual;

    /// <summary>
    ///  Sets the counter value for the given channel.
    ///  
    ///  The default value for the counters on startup is 0.
    /// </summary>
    procedure SetCounter(const channel: byte; const counter: int64); virtual;

    /// <summary>
    ///  Sets the counter values for all four channels.
    ///  
    ///  The default value for the counters on startup is 0.
    /// </summary>
    procedure SetAllCounter(const counter: array of int64); virtual;

    /// <summary>
    ///  Returns the signal data (duty cycle, period, frequency and value) for the
    ///  given channel.
    /// </summary>
    procedure GetSignalData(const channel: byte; out dutyCycle: word; out period: uint64; out frequency: longword; out aValue: boolean); virtual;

    /// <summary>
    ///  Returns the signal data (duty cycle, period, frequency and value) for all four
    ///  channels.
    /// </summary>
    procedure GetAllSignalData(out dutyCycle: TArray0To3OfUInt16; out period: TArray0To3OfUInt64; out frequency: TArray0To3OfUInt32; out aValue: TArray0To3OfBoolean); virtual;

    /// <summary>
    ///  Activates/deactivates the counter of the given channel.
    ///  
    ///  true = activate, false = deactivate.
    ///  
    ///  By default all channels are activated.
    /// </summary>
    procedure SetCounterActive(const channel: byte; const active: boolean); virtual;

    /// <summary>
    ///  Activates/deactivates the counter of all four channels.
    ///  
    ///  true = activate, false = deactivate.
    ///  
    ///  By default all channels are activated.
    /// </summary>
    procedure SetAllCounterActive(const active: array of boolean); virtual;

    /// <summary>
    ///  Returns the activation state of the given channel.
    ///  
    ///  true = activated, false = deactivated.
    /// </summary>
    function GetCounterActive(const channel: byte): boolean; virtual;

    /// <summary>
    ///  Returns the activation state of all four channels.
    ///  
    ///  true = activated, false = deactivated.
    /// </summary>
    function GetAllCounterActive: TArray0To3OfBoolean; virtual;

    /// <summary>
    ///  Sets the counter configuration for the given channel.
    ///  
    ///  * Count Edge: Counter can count on rising, falling or both edges.
    ///  * Count Direction: Counter can count up or down. You can also use
    ///    another channel as direction input, see
    ///    `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Industrial_Counter.html#external-count-direction&gt;`__
    ///    for details.
    ///  * Duty Cycle Prescaler: Sets a divider for the internal clock. See
    ///    `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Industrial_Counter.html#duty-cycle-prescaler-and-frequency-integration-time&gt;`__
    ///    for details.
    ///  * Frequency Integration Time: Sets the integration time for the
    ///    frequency measurement. See
    ///    `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Industrial_Counter.html#duty-cycle-prescaler-and-frequency-integration-time&gt;`__
    ///    for details.
    /// </summary>
    procedure SetCounterConfiguration(const channel: byte; const countEdge: byte; const countDirection: byte; const dutyCyclePrescaler: byte; const frequencyIntegrationTime: byte); virtual;

    /// <summary>
    ///  Returns the counter configuration as set by <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetCounterConfiguration"/>.
    /// </summary>
    procedure GetCounterConfiguration(const channel: byte; out countEdge: byte; out countDirection: byte; out dutyCyclePrescaler: byte; out frequencyIntegrationTime: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.OnAllCounter"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllCounterCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetAllCounterCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllCounterCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.OnAllSignalData"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetAllSignalDataCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetAllSignalDataCallbackConfiguration"/>.
    /// </summary>
    procedure GetAllSignalDataCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Each channel has a corresponding LED. You can turn the LED off, on or show a
    ///  heartbeat. You can also set the LED to "Channel Status". In this mode the
    ///  LED is on if the channel is high and off otherwise.
    ///  
    ///  By default all channel LEDs are configured as "Channel Status".
    /// </summary>
    procedure SetChannelLEDConfig(const channel: byte; const config: byte); virtual;

    /// <summary>
    ///  Returns the channel LED configuration as set by <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetChannelLEDConfig"/>
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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  for every 10 received data packets.                                                                       r
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetAllCounterCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.GetAllCounter"/>.
    /// </summary>
    property OnAllCounter: TBrickletIndustrialCounterNotifyAllCounter read allCounterCallback write allCounterCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.SetAllSignalDataCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletIndustrialCounter.TBrickletIndustrialCounter.GetAllSignalData"/>.
    /// </summary>
    property OnAllSignalData: TBrickletIndustrialCounterNotifyAllSignalData read allSignalDataCallback write allSignalDataCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletIndustrialCounter.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialCounter.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_SIGNAL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_SIGNAL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER_ACTIVE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER_ACTIVE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER_ACTIVE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER_ACTIVE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_SIGNAL_DATA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_SIGNAL_DATA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_CHANNEL_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialCounter.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_COUNTER_CALLBACK_ALL_COUNTER]:= {$ifdef FPC}@{$endif}CallbackWrapperAllCounter;
  aCallBacks[BRICKLET_INDUSTRIAL_COUNTER_CALLBACK_ALL_SIGNAL_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperAllSignalData;
end;

function TBrickletIndustrialCounter.GetCounter(const channel: byte): int64;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt64From(8, _response);
end;

function TBrickletIndustrialCounter.GetAllCounter: TArray0To3OfInt64;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do Result[_i]:= LEConvertInt64From(8 + (_i * 8), _response);
end;

procedure TBrickletIndustrialCounter.SetCounter(const channel: byte; const counter: int64);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER, 17);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertInt64To(counter, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.SetAllCounter(const counter: array of int64);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER, 40);
  if (Length(counter) <> 4) then raise EInvalidParameterException.Create('Counter has to be exactly 4 items long');
  for _i:= 0 to Length(counter) - 1 do LEConvertInt64To(counter[_i], 8 + (_i * 8), _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.GetSignalData(const channel: byte; out dutyCycle: word; out period: uint64; out frequency: longword; out aValue: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_SIGNAL_DATA, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  dutyCycle:= LEConvertUInt16From(8, _response);
  period:= LEConvertUInt64From(10, _response);
  frequency:= LEConvertUInt32From(18, _response);
  aValue:= LEConvertBooleanFrom(22, _response);
end;

procedure TBrickletIndustrialCounter.GetAllSignalData(out dutyCycle: TArray0To3OfUInt16; out period: TArray0To3OfUInt64; out frequency: TArray0To3OfUInt32; out aValue: TArray0To3OfBoolean);
var 
_request, _response: TDynamicByteArray; _i: longint; valueBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_SIGNAL_DATA, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do dutyCycle[_i]:= LEConvertUInt16From(8 + (_i * 2), _response);
  for _i:= 0 to 3 do period[_i]:= LEConvertUInt64From(16 + (_i * 8), _response);
  for _i:= 0 to 3 do frequency[_i]:= LEConvertUInt32From(48 + (_i * 4), _response);
  FillChar(valueBits[0], Length(valueBits) * SizeOf(valueBits[0]), 0);
  for _i:= 0 to 0 do valueBits[_i]:= LEConvertUInt8From(64 + (_i * 1), _response);
  for _i:= 0 to 3 do avalue[_i]:= ((valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletIndustrialCounter.SetCounterActive(const channel: byte; const active: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER_ACTIVE, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertBooleanTo(active, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.SetAllCounterActive(const active: array of boolean);
var 
_request: TDynamicByteArray; _i: longint; activeBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER_ACTIVE, 9);
  if (Length(active) <> 4) then raise EInvalidParameterException.Create('Active has to be exactly 4 items long');
  FillChar(activeBits[0], Length(activeBits) * SizeOf(activeBits[0]), 0);
  for _i:= 0 to 3 do if active[_i] then activeBits[Floor(_i / 8)]:= activeBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(activeBits[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletIndustrialCounter.GetCounterActive(const channel: byte): boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER_ACTIVE, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletIndustrialCounter.GetAllCounterActive: TArray0To3OfBoolean;
var 
_request, _response: TDynamicByteArray; _i: longint; activeBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER_ACTIVE, 8);
  _response:= SendRequest(_request);
  FillChar(activeBits[0], Length(activeBits) * SizeOf(activeBits[0]), 0);
  for _i:= 0 to 0 do activeBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 3 do Result[_i]:= ((activeBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletIndustrialCounter.SetCounterConfiguration(const channel: byte; const countEdge: byte; const countDirection: byte; const dutyCyclePrescaler: byte; const frequencyIntegrationTime: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_COUNTER_CONFIGURATION, 13);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(countEdge, 9, _request);
  LEConvertUInt8To(countDirection, 10, _request);
  LEConvertUInt8To(dutyCyclePrescaler, 11, _request);
  LEConvertUInt8To(frequencyIntegrationTime, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.GetCounterConfiguration(const channel: byte; out countEdge: byte; out countDirection: byte; out dutyCyclePrescaler: byte; out frequencyIntegrationTime: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_COUNTER_CONFIGURATION, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  countEdge:= LEConvertUInt8From(8, _response);
  countDirection:= LEConvertUInt8From(9, _response);
  dutyCyclePrescaler:= LEConvertUInt8From(10, _response);
  frequencyIntegrationTime:= LEConvertUInt8From(11, _response);
end;

procedure TBrickletIndustrialCounter.SetAllCounterCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_COUNTER_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.GetAllCounterCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_COUNTER_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIndustrialCounter.SetAllSignalDataCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_ALL_SIGNAL_DATA_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.GetAllSignalDataCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_ALL_SIGNAL_DATA_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIndustrialCounter.SetChannelLEDConfig(const channel: byte; const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_CHANNEL_LED_CONFIG, 10);
  LEConvertUInt8To(channel, 8, _request);
  LEConvertUInt8To(config, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialCounter.GetChannelLEDConfig(const channel: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_CHANNEL_LED_CONFIG, 9);
  LEConvertUInt8To(channel, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialCounter.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialCounter.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialCounter.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialCounter.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialCounter.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialCounter.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialCounter.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialCounter.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialCounter.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialCounter.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialCounter.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialCounter.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_COUNTER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialCounter.CallbackWrapperAllCounter(const aPacket: TDynamicByteArray);
var counter: TArray0To3OfInt64; _i: longint;
begin
  for _i:= 0 to 3 do counter[_i]:= LEConvertInt64From(8 + (_i * 8), aPacket);

  if (Assigned(allCounterCallback)) then begin
    allCounterCallback(self, counter);
  end;
end;

procedure TBrickletIndustrialCounter.CallbackWrapperAllSignalData(const aPacket: TDynamicByteArray);
var dutyCycle: TArray0To3OfUInt16; period: TArray0To3OfUInt64; frequency: TArray0To3OfUInt32; value: TArray0To3OfBoolean; _i: longint; valueBits: array [0..0] of byte;
begin
  for _i:= 0 to 3 do dutyCycle[_i]:= LEConvertUInt16From(8 + (_i * 2), aPacket);
  for _i:= 0 to 3 do period[_i]:= LEConvertUInt64From(16 + (_i * 8), aPacket);
  for _i:= 0 to 3 do frequency[_i]:= LEConvertUInt32From(48 + (_i * 4), aPacket);
  FillChar(valueBits[0], Length(valueBits) * SizeOf(valueBits[0]), 0);
  for _i:= 0 to 0 do valueBits[_i]:= LEConvertUInt8From(64 + (_i * 1), aPacket);
  for _i:= 0 to 3 do value[_i]:= ((valueBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  if (Assigned(allSignalDataCallback)) then begin
    allSignalDataCallback(self, dutyCycle, period, frequency, value);
  end;
end;

end.
