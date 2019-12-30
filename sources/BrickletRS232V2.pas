{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRS232V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletRS232V2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfChar = array [0..59] of char;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfChar = array of char;

  TReadHighLevelCallbackState = record data: TArrayOfChar; length: word; end;

  TBrickletRS232V2 = class;
  TBrickletRS232V2NotifyReadLowLevel = procedure(sender: TBrickletRS232V2; const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar) of object;
  TBrickletRS232V2NotifyRead = procedure(sender: TBrickletRS232V2; const message: TArrayOfChar) of object;
  TBrickletRS232V2NotifyErrorCount = procedure(sender: TBrickletRS232V2; const errorCountOverrun: longword; const errorCountParity: longword) of object;

  /// <summary>
  ///  Communicates with RS232 devices
  /// </summary>
  TBrickletRS232V2 = class(TThreadedDevice)
  private
    fReadHighLevelCallbackState: TReadHighLevelCallbackState;
    fReadLowLevelCallback: TBrickletRS232V2NotifyReadLowLevel;
    fReadCallback: TBrickletRS232V2NotifyRead;
    fErrorCountCallback: TBrickletRS232V2NotifyErrorCount;
    procedure CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperErrorCount(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Writes characters to the RS232 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.SetConfiguration"/> for configuration possibilities
    ///  regarding baud rate, parity and so on.
    /// </summary>
    function WriteLowLevel(const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar): byte; virtual;

    /// <summary>
    ///  Writes characters to the RS232 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.SetConfiguration"/> for configuration possibilities
    ///  regarding baud rate, parity and so on.
    /// </summary>
    function Write(const message: array of char): word; virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.EnableReadCallback"/> and <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    /// </summary>
    procedure ReadLowLevel(const length_: word; out messageLength: word; out messageChunkOffset: word; out messageChunkData: TArray0To59OfChar); virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.EnableReadCallback"/> and <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    /// </summary>
    function Read(const length_: word): TArrayOfChar; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableReadCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableReadCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback is enabled,
    ///  *false* otherwise.
    /// </summary>
    function IsReadCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the configuration for the RS232 communication. Available options:
    ///  
    ///  * Baud rate between 100 and 2000000 baud.
    ///  * Parity of none, odd or even.
    ///  * Stop bits can be 1 or 2.
    ///  * Word length of 5 to 8.
    ///  * Flow control can be off, software or hardware.
    ///  
    ///  The default is: 115200 baud, parity none, 1 stop bit, word length 8.
    /// </summary>
    procedure SetConfiguration(const baudrate: longword; const parity: byte; const stopbits: byte; const wordlength: byte; const flowcontrol: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS232V2.TBrickletRS232V2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out baudrate: longword; out parity: byte; out stopbits: byte; out wordlength: byte; out flowcontrol: byte); virtual;

    /// <summary>
    ///  Sets the send and receive buffer size in byte. In total the buffers have to be
    ///  10240 byte (10kb) in size, the minimum buffer size is 1024 byte (1kb) for each.
    ///  
    ///  The current buffer content is lost if this function is called.
    ///  
    ///  The send buffer holds data that is given by <see cref="BrickletRS232V2.TBrickletRS232V2.Write"/> and
    ///  can not be written yet. The receive buffer holds data that is
    ///  received through RS232 but could not yet be send to the
    ///  user, either by <see cref="BrickletRS232V2.TBrickletRS232V2.Read"/> or through <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    ///  
    ///  The default configuration is 5120 byte (5kb) per buffer.
    /// </summary>
    procedure SetBufferConfig(const sendBufferSize: word; const receiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the buffer configuration as set by <see cref="BrickletRS232V2.TBrickletRS232V2.SetBufferConfig"/>.
    /// </summary>
    procedure GetBufferConfig(out sendBufferSize: word; out receiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the currently used bytes for the send and received buffer.
    ///  
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.SetBufferConfig"/> for buffer size configuration.
    /// </summary>
    procedure GetBufferStatus(out sendBufferUsed: word; out receiveBufferUsed: word); virtual;

    /// <summary>
    ///  Returns the current number of overrun and parity errors.
    /// </summary>
    procedure GetErrorCount(out errorCountOverrun: longword; out errorCountParity: longword); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletRS232V2.TBrickletRS232V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletRS232V2.TBrickletRS232V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletRS232V2.TBrickletRS232V2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletRS232V2.TBrickletRS232V2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/>
    /// </summary>
    property OnReadLowLevel: TBrickletRS232V2NotifyReadLowLevel read fReadLowLevelCallback write fReadLowLevelCallback;

    /// <summary>
    ///  This callback is called if new data is available.
    ///  
    ///  To enable this callback, use <see cref="BrickletRS232V2.TBrickletRS232V2.EnableReadCallback"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for message_.
    ///  </note>
    /// </summary>
    property OnRead: TBrickletRS232V2NotifyRead read fReadCallback write fReadCallback;

    /// <summary>
    ///  This callback is called if a new error occurs. It returns
    ///  the current overrun and parity error count.
    /// </summary>
    property OnErrorCount: TBrickletRS232V2NotifyErrorCount read fErrorCountCallback write fErrorCountCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

constructor TBrickletRS232V2.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(fReadHighLevelCallbackState.data, 0);
  fReadHighLevelCallbackState.data:= nil;
  fReadHighLevelCallbackState.length:= 0;
end;


procedure TBrickletRS232V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRS232V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_WRITE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_READ_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_ENABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_DISABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_IS_READ_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_SET_BUFFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS232_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRS232V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_RS232_V2_CALLBACK_READ_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperReadLowLevel;
  aCallBacks[BRICKLET_RS232_V2_CALLBACK_ERROR_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperErrorCount;
end;

function TBrickletRS232V2.WriteLowLevel(const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_WRITE_LOW_LEVEL, 72);
  LEConvertUInt16To(messageLength, 8, _request);
  LEConvertUInt16To(messageChunkOffset, 10, _request);
  for _i:= 0 to Length(messageChunkData) - 1 do LEConvertCharTo(messageChunkData[_i], 12 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS232V2.Write(const message: array of char): word;
var
  messageLength: word;
  messageChunkOffset: word;
  messageChunkLength: word;
  messageChunkData: TArray0To59OfChar;
  messageChunkWritten: byte;
begin
  if (Length(message) > 65535) then begin
    raise EInvalidParameterException.Create('Message can be at most 65535 items long');
  end;

  messageLength:= Length(message);
  messageChunkOffset:= 0;
  Result:= 0;

  if (messageLength = 0) then begin
    FillChar(messageChunkData[0], SizeOf(char) * 60, 0);
    Result:= WriteLowLevel(messageLength, messageChunkOffset, messageChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (messageChunkOffset < messageLength) do begin
        messageChunkLength:= messageLength - messageChunkOffset;

        if (messageChunkLength > 60) then messageChunkLength:= 60;

        FillChar(messageChunkData[0], SizeOf(char) * 60, 0);
        Move(message[messageChunkOffset], messageChunkData[0], SizeOf(char) * messageChunkLength);

        messageChunkWritten:= WriteLowLevel(messageLength, messageChunkOffset, messageChunkData);
        Inc(Result, messageChunkWritten);

        if (messageChunkWritten < 60) then break; { Either last chunk or short write }

        Inc(messageChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS232V2.ReadLowLevel(const length_: word; out messageLength: word; out messageChunkOffset: word; out messageChunkData: TArray0To59OfChar);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_READ_LOW_LEVEL, 10);
  LEConvertUInt16To(length_, 8, _request);
  _response:= SendRequest(_request);
  messageLength:= LEConvertUInt16From(8, _response);
  messageChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), _response);
end;

function TBrickletRS232V2.Read(const length_: word): TArrayOfChar;
var
  message: TArrayOfChar;
  messageCurrentLength: word;
  messageLength: word;
  messageChunkOffset: word;
  messageChunkData: TArray0To59OfChar;
  messageOutOfSync: boolean;
  messageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(message, 0);
  StreamMutex.Acquire;
  try
    messageLength:= 0;
    ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
    SetLength(message, messageLength);
    messageOutOfSync:= (messageChunkOffset <> 0);

    if ((not messageOutOfSync) and (messageLength > 0)) then begin
      messageChunkLength:= messageLength - messageChunkOffset;
      if (messageChunkLength > 60) then messageChunkLength:= 60;
      Move(messageChunkData, message[0], SizeOf(char) * messageChunkLength);
      messageCurrentLength:= messageChunkLength;

      while ((not messageOutOfSync) and (messageCurrentLength < messageLength)) do begin
        ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
        messageOutOfSync:= messageChunkOffset <> messageCurrentLength;
        messageChunkLength:= messageLength - messageChunkOffset;
        if (messageChunkLength > 60) then messageChunkLength:= 60;
        Move(messageChunkData, message[messageCurrentLength], SizeOf(char) * messageChunkLength);
        Inc(messageCurrentLength, messageChunkLength);
      end;
    end;

    if (messageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (messageChunkOffset + 60 < messageLength) do begin
        ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Message stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= message;
end;

procedure TBrickletRS232V2.EnableReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_ENABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.DisableReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_DISABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletRS232V2.IsReadCallbackEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_IS_READ_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletRS232V2.SetConfiguration(const baudrate: longword; const parity: byte; const stopbits: byte; const wordlength: byte; const flowcontrol: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_CONFIGURATION, 16);
  LEConvertUInt32To(baudrate, 8, _request);
  LEConvertUInt8To(parity, 12, _request);
  LEConvertUInt8To(stopbits, 13, _request);
  LEConvertUInt8To(wordlength, 14, _request);
  LEConvertUInt8To(flowcontrol, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.GetConfiguration(out baudrate: longword; out parity: byte; out stopbits: byte; out wordlength: byte; out flowcontrol: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  baudrate:= LEConvertUInt32From(8, _response);
  parity:= LEConvertUInt8From(12, _response);
  stopbits:= LEConvertUInt8From(13, _response);
  wordlength:= LEConvertUInt8From(14, _response);
  flowcontrol:= LEConvertUInt8From(15, _response);
end;

procedure TBrickletRS232V2.SetBufferConfig(const sendBufferSize: word; const receiveBufferSize: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_BUFFER_CONFIG, 12);
  LEConvertUInt16To(sendBufferSize, 8, _request);
  LEConvertUInt16To(receiveBufferSize, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.GetBufferConfig(out sendBufferSize: word; out receiveBufferSize: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_CONFIG, 8);
  _response:= SendRequest(_request);
  sendBufferSize:= LEConvertUInt16From(8, _response);
  receiveBufferSize:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS232V2.GetBufferStatus(out sendBufferUsed: word; out receiveBufferUsed: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_STATUS, 8);
  _response:= SendRequest(_request);
  sendBufferUsed:= LEConvertUInt16From(8, _response);
  receiveBufferUsed:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS232V2.GetErrorCount(out errorCountOverrun: longword; out errorCountParity: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountOverrun:= LEConvertUInt32From(8, _response);
  errorCountParity:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletRS232V2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletRS232V2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS232V2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS232V2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS232V2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS232V2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS232V2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS232V2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletRS232V2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS232V2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRS232V2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRS232V2.CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray);
var messageLength: word; messageChunkOffset: word; messageChunkData: TArray0To59OfChar; messageChunkLength: word; _i: longint;
begin
  messageLength:= LEConvertUInt16From(8, aPacket);
  messageChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 59 do messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), aPacket);

  messageChunkLength:= messageLength - messageChunkOffset;
  if (messageChunkLength > 60) then begin
    messageChunkLength:= 60;
  end;
  if (fReadHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (messageChunkOffset = 0) then begin { Stream starts }
      SetLength(fReadHighLevelCallbackState.data, messageLength);
      Move(messageChunkData[0], fReadHighLevelCallbackState.data[0], SizeOf(char) * messageChunkLength);
      fReadHighLevelCallbackState.length:= messageChunkLength;

      if (fReadHighLevelCallbackState.length >= messageLength) then begin { Stream complete }
        if (Assigned(fReadCallback)) then begin
          fReadCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (messageChunkOffset <> fReadHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fReadHighLevelCallbackState.data, 0);
      fReadHighLevelCallbackState.data:= nil;
      fReadHighLevelCallbackState.length:= 0;
      if (Assigned(fReadCallback)) then begin
        fReadCallback(self, fReadHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(messageChunkData[0], fReadHighLevelCallbackState.data[fReadHighLevelCallbackState.length], SizeOf(char) * messageChunkLength);
      Inc(fReadHighLevelCallbackState.length, messageChunkLength);

      if fReadHighLevelCallbackState.length >= messageLength then begin { Stream complete }
        if (Assigned(fReadCallback)) then begin
          fReadCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fReadLowLevelCallback)) then begin
    fReadLowLevelCallback(self, messageLength, messageChunkOffset, messageChunkData);
  end;
end;

procedure TBrickletRS232V2.CallbackWrapperErrorCount(const aPacket: TDynamicByteArray);
var errorCountOverrun: longword; errorCountParity: longword;
begin
  errorCountOverrun:= LEConvertUInt32From(8, aPacket);
  errorCountParity:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fErrorCountCallback)) then begin
    fErrorCountCallback(self, errorCountOverrun, errorCountParity);
  end;
end;

end.
