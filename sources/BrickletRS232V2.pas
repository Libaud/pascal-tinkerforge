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

  TReadHighLevelCallbackState = record
    data: TArrayOfChar;
    length: word;
  end;

  TBrickletRS232V2 = class;
  TBrickletRS232V2NotifyReadLowLevel = procedure(aSender: TBrickletRS232V2; const aMessageLength: word; const aMessageChunkOffset: word;
                                                 const aMessageChunkData: TArray0To59OfChar) of object;
  TBrickletRS232V2NotifyRead = procedure(aSender: TBrickletRS232V2; const aMessage: TArrayOfChar) of object;
  TBrickletRS232V2NotifyErrorCount = procedure(aSender: TBrickletRS232V2; const aErrorCountOverrun: longword; const aEerrorCountParity: longword) of object;

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
    function WriteLowLevel(const aMessageLength: word; const aMessageChunkOffset: word; const aMessageChunkData: TArray0To59OfChar): byte; virtual;

    /// <summary>
    ///  Writes characters to the RS232 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.SetConfiguration"/> for configuration possibilities
    ///  regarding baud rate, parity and so on.
    /// </summary>
    function Write(const aMessage: array of char): word; virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.EnableReadCallback"/> and <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    /// </summary>
    procedure ReadLowLevel(const aLength: word; out aMessageLength: word; out aMessageChunkOffset: word; out aMessageChunkData: TArray0To59OfChar); virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.EnableReadCallback"/> and <see cref="BrickletRS232V2.TBrickletRS232V2.OnRead"/> callback.
    /// </summary>
    function Read(const aLength: word): TArrayOfChar; virtual;

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
    procedure SetConfiguration(const aBaudrate: longword; const aParity: byte; const aStopbits: byte; const aWordlength: byte; const aFlowcontrol: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS232V2.TBrickletRS232V2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aBaudrate: longword; out aParity: byte; out aStopbits: byte; out aWordlength: byte; out aFlowcontrol: byte); virtual;

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
    procedure SetBufferConfig(const aSendBufferSize: word; const aReceiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the buffer configuration as set by <see cref="BrickletRS232V2.TBrickletRS232V2.SetBufferConfig"/>.
    /// </summary>
    procedure GetBufferConfig(out aSendBufferSize: word; out aReceiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the currently used bytes for the send and received buffer.
    ///  
    ///  See <see cref="BrickletRS232V2.TBrickletRS232V2.SetBufferConfig"/> for buffer size configuration.
    /// </summary>
    procedure GetBufferStatus(out aSendBufferUsed: word; out aReceiveBufferUsed: word); virtual;

    /// <summary>
    ///  Returns the current number of overrun and parity errors.
    /// </summary>
    procedure GetErrorCount(out aErrorCountOverrun: longword; out aErrorCountParity: longword); virtual;

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
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

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

function TBrickletRS232V2.WriteLowLevel(const aMessageLength: word; const aMessageChunkOffset: word; const aMessageChunkData: TArray0To59OfChar): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_WRITE_LOW_LEVEL, 72);
  LEConvertUInt16To(aMessageLength, 8, _request);
  LEConvertUInt16To(aMessageChunkOffset, 10, _request);
  for _i:= 0 to Length(aMessageChunkData) - 1 do LEConvertCharTo(aMessageChunkData[_i], 12 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS232V2.Write(const aMessage: array of char): word;
var
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkLength: word;
  _messageChunkData: TArray0To59OfChar;
  _messageChunkWritten: byte;
begin
  if (Length(aMessage) > 65535) then begin
    raise EInvalidParameterException.Create('Message can be at most 65535 items long');
  end;

  _messageLength:= Length(aMessage);
  _messageChunkOffset:= 0;
  Result:= 0;

  if (_messageLength = 0) then begin
    FillChar(_messageChunkData[0], SizeOf(char) * 60, 0);
    Result:= WriteLowLevel(_messageLength, _messageChunkOffset, _messageChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_messageChunkOffset < _messageLength) do begin
        _messageChunkLength:= _messageLength - _messageChunkOffset;

        if (_messageChunkLength > 60) then _messageChunkLength:= 60;

        FillChar(_messageChunkData[0], SizeOf(char) * 60, 0);
        Move(aMessage[_messageChunkOffset], _messageChunkData[0], SizeOf(char) * _messageChunkLength);

        _messageChunkWritten:= WriteLowLevel(_messageLength, _messageChunkOffset, _messageChunkData);
        Inc(Result, _messageChunkWritten);

        if (_messageChunkWritten < 60) then break; { Either last chunk or short write }

        Inc(_messageChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS232V2.ReadLowLevel(const aLength: word; out aMessageLength: word; out aMessageChunkOffset: word; out aMessageChunkData: TArray0To59OfChar);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_READ_LOW_LEVEL, 10);
  LEConvertUInt16To(aLength, 8, _request);
  _response:= SendRequest(_request);
  aMessageLength:= LEConvertUInt16From(8, _response);
  aMessageChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aMessageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), _response);
end;

function TBrickletRS232V2.Read(const aLength: word): TArrayOfChar;
var
  _message: TArrayOfChar;
  _messageCurrentLength: word;
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkData: TArray0To59OfChar;
  _messageOutOfSync: boolean;
  _messageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_message, 0);
  StreamMutex.Acquire;
  try
    _messageLength:= 0;
    ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
    SetLength(_message, _messageLength);
    _messageOutOfSync:= (_messageChunkOffset <> 0);

    if ((not _messageOutOfSync) and (_messageLength > 0)) then begin
      _messageChunkLength:= _messageLength - _messageChunkOffset;
      if (_messageChunkLength > 60) then _messageChunkLength:= 60;
      Move(_messageChunkData, _message[0], SizeOf(char) * _messageChunkLength);
      _messageCurrentLength:= _messageChunkLength;

      while ((not _messageOutOfSync) and (_messageCurrentLength < _messageLength)) do begin
        ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
        _messageOutOfSync:= _messageChunkOffset <> _messageCurrentLength;
        _messageChunkLength:= _messageLength - _messageChunkOffset;
        if (_messageChunkLength > 60) then _messageChunkLength:= 60;
        Move(_messageChunkData, _message[_messageCurrentLength], SizeOf(char) * _messageChunkLength);
        Inc(_messageCurrentLength, _messageChunkLength);
      end;
    end;

    if (_messageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_messageChunkOffset + 60 < _messageLength) do begin
        ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Message stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _message;
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

procedure TBrickletRS232V2.SetConfiguration(const aBaudrate: longword; const aParity: byte; const aStopbits: byte; const aWordlength: byte; const aFlowcontrol: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_CONFIGURATION, 16);
  LEConvertUInt32To(aBaudrate, 8, _request);
  LEConvertUInt8To(aParity, 12, _request);
  LEConvertUInt8To(aStopbits, 13, _request);
  LEConvertUInt8To(aWordlength, 14, _request);
  LEConvertUInt8To(aFlowcontrol, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.GetConfiguration(out aBaudrate: longword; out aParity: byte; out aStopbits: byte; out aWordlength: byte; out aFlowcontrol: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aBaudrate:= LEConvertUInt32From(8, _response);
  aParity:= LEConvertUInt8From(12, _response);
  aStopbits:= LEConvertUInt8From(13, _response);
  aWordlength:= LEConvertUInt8From(14, _response);
  aFlowcontrol:= LEConvertUInt8From(15, _response);
end;

procedure TBrickletRS232V2.SetBufferConfig(const aSendBufferSize: word; const aReceiveBufferSize: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_BUFFER_CONFIG, 12);
  LEConvertUInt16To(aSendBufferSize, 8, _request);
  LEConvertUInt16To(aReceiveBufferSize, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRS232V2.GetBufferConfig(out aSendBufferSize: word; out aReceiveBufferSize: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_CONFIG, 8);
  _response:= SendRequest(_request);
  aSendBufferSize:= LEConvertUInt16From(8, _response);
  aReceiveBufferSize:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS232V2.GetBufferStatus(out aSendBufferUsed: word; out aReceiveBufferUsed: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_BUFFER_STATUS, 8);
  _response:= SendRequest(_request);
  aSendBufferUsed:= LEConvertUInt16From(8, _response);
  aReceiveBufferUsed:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS232V2.GetErrorCount(out aErrorCountOverrun: longword; out aErrorCountParity: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountOverrun:= LEConvertUInt32From(8, _response);
  aErrorCountParity:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletRS232V2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
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

procedure TBrickletRS232V2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS232V2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS232V2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletRS232V2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS232_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRS232V2.CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray);
var
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkData: TArray0To59OfChar;
  _messageChunkLength: word;
  _i: longint;
begin
  _messageLength:= LEConvertUInt16From(8, aPacket);
  _messageChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 59 do _messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), aPacket);

  _messageChunkLength:= _messageLength - _messageChunkOffset;
  if (_messageChunkLength > 60) then begin
    _messageChunkLength:= 60;
  end;
  if (fReadHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_messageChunkOffset = 0) then begin { Stream starts }
      SetLength(fReadHighLevelCallbackState.data, _messageLength);
      Move(_messageChunkData[0], fReadHighLevelCallbackState.data[0], SizeOf(char) * _messageChunkLength);
      fReadHighLevelCallbackState.length:= _messageChunkLength;

      if (fReadHighLevelCallbackState.length >= _messageLength) then begin { Stream complete }
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
    if (_messageChunkOffset <> fReadHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fReadHighLevelCallbackState.data, 0);
      fReadHighLevelCallbackState.data:= nil;
      fReadHighLevelCallbackState.length:= 0;
      if (Assigned(fReadCallback)) then begin
        fReadCallback(self, fReadHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_messageChunkData[0], fReadHighLevelCallbackState.data[fReadHighLevelCallbackState.length], SizeOf(char) * _messageChunkLength);
      Inc(fReadHighLevelCallbackState.length, _messageChunkLength);

      if fReadHighLevelCallbackState.length >= _messageLength then begin { Stream complete }
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
    fReadLowLevelCallback(self, _messageLength, _messageChunkOffset, _messageChunkData);
  end;
end;

procedure TBrickletRS232V2.CallbackWrapperErrorCount(const aPacket: TDynamicByteArray);
var
  _errorCountOverrun: longword;
  _errorCountParity: longword;
begin
  _errorCountOverrun:= LEConvertUInt32From(8, aPacket);
  _errorCountParity:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fErrorCountCallback)) then begin
    fErrorCountCallback(self, _errorCountOverrun, _errorCountParity);
  end;
end;

end.
