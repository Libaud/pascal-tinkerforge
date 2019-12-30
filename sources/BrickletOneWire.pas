{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletOneWire;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletOneWire.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArray0To6OfUInt64 = array [0..6] of uint64;
  TArrayOfUInt64 = array of uint64;

  /// <summary>
  ///  Communicates with up 64 1-Wire devices
  /// </summary>
  TBrickletOneWire = class(TThreadedDevice)
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns a list of up to 64 identifiers of the connected 1-Wire devices.
    ///  Each identifier is 64-bit and consists of 8-bit family code, 48-bit ID and
    ///  8-bit CRC.
    ///  
    ///  To get these identifiers the Bricklet runs the
    ///  `SEARCH ROM algorithm &lt;https://www.maximintegrated.com/en/app-notes/index.mvp/id/187&gt;`__,
    ///  as defined by Maxim.
    /// </summary>
    procedure SearchBusLowLevel(out aIdentifierLength: word; out aIdentifierChunkOffset: word; out aIdentifierChunkData: TArray0To6OfUInt64; out aStatus: byte); virtual;

    /// <summary>
    ///  Returns a list of up to 64 identifiers of the connected 1-Wire devices.
    ///  Each identifier is 64-bit and consists of 8-bit family code, 48-bit ID and
    ///  8-bit CRC.
    ///  
    ///  To get these identifiers the Bricklet runs the
    ///  `SEARCH ROM algorithm &lt;https://www.maximintegrated.com/en/app-notes/index.mvp/id/187&gt;`__,
    ///  as defined by Maxim.
    /// </summary>
    procedure SearchBus(out aIdentifier: TArrayOfUInt64; out aStatus: byte); virtual;

    /// <summary>
    ///  Resets the bus with the 1-Wire reset operation.
    /// </summary>
    function ResetBus: byte; virtual;

    /// <summary>
    ///  Writes a byte of data to the 1-Wire bus.
    /// </summary>
    function Write(const aData: byte): byte; virtual;

    /// <summary>
    ///  Reads a byte of data from the 1-Wire bus.
    /// </summary>
    procedure Read(out aData: byte; out status: byte); virtual;

    /// <summary>
    ///  Writes a command to the 1-Wire device with the given identifier. You can obtain
    ///  the identifier by calling <see cref="BrickletOneWire.TBrickletOneWire.SearchBus"/>. The MATCH ROM operation is used to
    ///  write the command.
    ///  
    ///  If you only have one device connected or want to broadcast to all devices
    ///  you can set the identifier to 0. In this case the SKIP ROM operation is used to
    ///  write the command.
    /// </summary>
    function WriteCommand(const aIdentifier: uint64; const aCommand: byte): byte; virtual;

    /// <summary>
    ///  Sets the communication LED configuration. By default the LED shows 1-wire
    ///  communication traffic by flickering.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetCommunicationLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOneWire.TBrickletOneWire.SetCommunicationLEDConfig"/>
    /// </summary>
    function GetCommunicationLEDConfig: byte; virtual;

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
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletOneWire.TBrickletOneWire.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletOneWire.TBrickletOneWire.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletOneWire.TBrickletOneWire.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletOneWire.TBrickletOneWire.SetStatusLEDConfig"/>
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
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletOneWire.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletOneWire.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_SEARCH_BUS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_RESET_BUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_WRITE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_READ]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_WRITE_COMMAND]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_SET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ONE_WIRE_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletOneWire.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletOneWire.SearchBusLowLevel(out aIdentifierLength: word; out aIdentifierChunkOffset: word; out aIdentifierChunkData: TArray0To6OfUInt64; out aStatus: byte);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_SEARCH_BUS_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aIdentifierLength:= LEConvertUInt16From(8, _response);
  aIdentifierChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 6 do aIdentifierChunkData[_i]:= LEConvertUInt64From(12 + (_i * 8), _response);
  aStatus:= LEConvertUInt8From(68, _response);
end;

procedure TBrickletOneWire.SearchBus(out aIdentifier: TArrayOfUInt64; out aStatus: byte);
var
  _identifierCurrentLength: word;
  _identifierLength: word;
  _identifierChunkOffset: word;
  _identifierChunkData: TArray0To6OfUInt64;
  _identifierOutOfSync: boolean;
  _identifierChunkLength: word;
begin
  StreamMutex.Acquire;
  try
    _identifierLength:= 0;
    SearchBusLowLevel(_identifierLength, _identifierChunkOffset, _identifierChunkData, aStatus);
    SetLength(aIdentifier, _identifierLength);
    _identifierOutOfSync:= (_identifierChunkOffset <> 0);

    if ((not _identifierOutOfSync) and (_identifierLength > 0)) then begin
      _identifierChunkLength:= _identifierLength - _identifierChunkOffset;
      if (_identifierChunkLength > 7) then _identifierChunkLength:= 7;
      Move(_identifierChunkData, aIdentifier[0], SizeOf(uint64) * _identifierChunkLength);
      _identifierCurrentLength:= _identifierChunkLength;

      while ((not _identifierOutOfSync) and (_identifierCurrentLength < _identifierLength)) do begin
        SearchBusLowLevel(_identifierLength, _identifierChunkOffset, _identifierChunkData, aStatus);
        _identifierOutOfSync:= _identifierChunkOffset <> _identifierCurrentLength;
        _identifierChunkLength:= _identifierLength - _identifierChunkOffset;
        if (_identifierChunkLength > 7) then _identifierChunkLength:= 7;
        Move(_identifierChunkData, aIdentifier[_identifierCurrentLength], SizeOf(uint64) * _identifierChunkLength);
        Inc(_identifierCurrentLength, _identifierChunkLength);
      end;
    end;

    if (_identifierOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_identifierChunkOffset + 7 < _identifierLength) do begin
        SearchBusLowLevel(_identifierLength, _identifierChunkOffset, _identifierChunkData, aStatus);
      end;

      raise EStreamOutOfSyncException.Create('Identifier stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
end;

function TBrickletOneWire.ResetBus: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_RESET_BUS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOneWire.Write(const aData: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_WRITE, 9);
  LEConvertUInt8To(aData, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOneWire.Read(out aData: byte; out status: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_READ, 8);
  _response:= SendRequest(_request);
  aData:= LEConvertUInt8From(8, _response);
  status:= LEConvertUInt8From(9, _response);
end;

function TBrickletOneWire.WriteCommand(const aIdentifier: uint64; const aCommand: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_WRITE_COMMAND, 17);
  LEConvertUInt64To(aIdentifier, 8, _request);
  LEConvertUInt8To(aCommand, 16, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOneWire.SetCommunicationLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_SET_COMMUNICATION_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletOneWire.GetCommunicationLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_COMMUNICATION_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOneWire.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletOneWire.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOneWire.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOneWire.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletOneWire.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOneWire.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletOneWire.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOneWire.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletOneWire.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletOneWire.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletOneWire.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletOneWire.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ONE_WIRE_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
