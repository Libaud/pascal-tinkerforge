{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletOLED128x64V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletOLED128x64V2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To447OfBoolean = array [0..447] of boolean;
  TArray0To479OfBoolean = array [0..479] of boolean;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfBoolean = array of boolean;

  /// <summary>
  ///  3.3cm (1.3") OLED display with 128x64 pixels
  /// </summary>
  TBrickletOLED128x64V2 = class(TThreadedDevice)
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Writes pixels to the specified window.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  If automatic draw is enabled (default) the pixels are directly written to
    ///  the screen. Only pixels that have actually changed are updated on the screen,
    ///  the rest stays the same.
    ///  
    ///  If automatic draw is disabled the pixels are written to an internal buffer and
    ///  the buffer is transferred to the display only after <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure WritePixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte;
                                  const aYEnd: byte; const aPixelsLength: word; const aPixelsChunkOffset: word;
                                  const aPixelsChunkData: TArray0To447OfBoolean); virtual;

    /// <summary>
    ///  Writes pixels to the specified window.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  If automatic draw is enabled (default) the pixels are directly written to
    ///  the screen. Only pixels that have actually changed are updated on the screen,
    ///  the rest stays the same.
    ///  
    ///  If automatic draw is disabled the pixels are written to an internal buffer and
    ///  the buffer is transferred to the display only after <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure WritePixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte;
                          const aYEnd: byte; const aPixels: array of boolean); virtual;

    /// <summary>
    ///  Reads pixels from the specified window.
    ///  
    ///  The pixels are read from the window line by line top to bottom
    ///  and each line is read from left to right.
    ///  
    ///  If automatic draw is enabled (default) the pixels that are read are always the
    ///  same that are shown on the display.
    ///  
    ///  If automatic draw is disabled the pixels are read from the internal buffer
    ///  (see <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>).
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure ReadPixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte;
                                 const aYEnd: byte; out aPixelsLength: word; out aPixelsChunkOffset: word;
                                 out aPixelsChunkData: TArray0To479OfBoolean); virtual;

    /// <summary>
    ///  Reads pixels from the specified window.
    ///  
    ///  The pixels are read from the window line by line top to bottom
    ///  and each line is read from left to right.
    ///  
    ///  If automatic draw is enabled (default) the pixels that are read are always the
    ///  same that are shown on the display.
    ///  
    ///  If automatic draw is disabled the pixels are read from the internal buffer
    ///  (see <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>).
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    function ReadPixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte): TArrayOfBoolean; virtual;

    /// <summary>
    ///  Clears the complete content of the display.
    ///  
    ///  If automatic draw is enabled (default) the pixels are directly cleared.
    ///  
    ///  If automatic draw is disabled the the internal buffer is cleared and
    ///  the buffer is transferred to the display only after <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Sets the configuration of the display.
    ///  
    ///  You can set a contrast value from 0 to 255 and you can invert the color
    ///  (white/black) of the display.
    ///  
    ///  If automatic draw is set to *true*, the display is automatically updated with every
    ///  call of <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.WritePixels"/> or <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.WriteLine"/>. If it is set to false, the
    ///  changes are written into an internal buffer and only shown on the display after
    ///  a call of <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>.
    /// </summary>
    procedure SetDisplayConfiguration(const aContrast: byte; const aInvert: boolean; const aAutomaticDraw: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out aContrast: byte; out aInvert: boolean; out aAutomaticDraw: boolean); virtual;

    /// <summary>
    ///  Writes text to a specific line with a specific position.
    ///  The text can have a maximum of 22 characters.
    ///  
    ///  For example: (1, 10, "Hello") will write *Hello* in the middle of the
    ///  second line of the display.
    ///  
    ///  The display uses a special 5x7 pixel charset. You can view the characters
    ///  of the charset in Brick Viewer.
    ///  
    ///  If automatic draw is enabled (default) the text is directly written to
    ///  the screen. Only pixels that have actually changed are updated on the screen,
    ///  the rest stays the same.
    ///  
    ///  If automatic draw is disabled the text is written to an internal buffer and
    ///  the buffer is transferred to the display only after <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure WriteLine(const aLine: byte; const aPosition: byte; const aText: string); virtual;

    /// <summary>
    ///  Draws the currently buffered frame. Normally each call of <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.WritePixels"/> and
    ///  <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.WriteLine"/> draws directly onto the display. If you turn automatic draw off
    ///  (<see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetDisplayConfiguration"/>), the data is written in an internal buffer and
    ///  only transferred to the display by calling this function. This can be used to
    ///  avoid flicker when drawing a complex frame in multiple steps.
    ///  
    ///  Set the `force complete redraw` to *true* to redraw the whole display
    ///  instead of only the changed parts. Normally it should not be necessary to set this to
    ///  *true*. It may only become necessary in case of stuck pixels because of errors.
    /// </summary>
    procedure DrawBufferedFrame(const aForceCompleteRedraw: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletOLED128x64V2.TBrickletOLED128x64V2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletOLED128x64V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletOLED128x64V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_PIXELS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_READ_PIXELS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_SET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_DRAW_BUFFERED_FRAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletOLED128x64V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;


procedure TBrickletOLED128x64V2.WritePixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To447OfBoolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..55] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_PIXELS_LOW_LEVEL, 72);
  LEConvertUInt8To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 9, _request);
  LEConvertUInt8To(aXEnd, 10, _request);
  LEConvertUInt8To(aYEnd, 11, _request);
  LEConvertUInt16To(aPixelsLength, 12, _request);
  LEConvertUInt16To(aPixelsChunkOffset, 14, _request);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 447 do if aPixelsChunkData[_i] then _pixelsChunkDataBits[Floor(_i / 8)]:= _pixelsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 55 do LEConvertUInt8To(_pixelsChunkDataBits[_i], 16 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.WritePixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; const aPixels: array of boolean);
var
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To447OfBoolean;
  _pixelsChunkLength: word;
  _pixelsLength: word;
begin
  if (Length(aPixels) > 65535) then begin
    raise EInvalidParameterException.Create('Pixels can be at most 65535 items long');
  end;

  _pixelsLength:= Length(aPixels);
  _pixelsChunkOffset:= 0;

  if (_pixelsLength = 0) then begin
    FillChar(_pixelsChunkData[0], SizeOf(boolean) * 448, 0);
    WritePixelsLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_pixelsChunkOffset < _pixelsLength) do begin
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;

        if (_pixelsChunkLength > 448) then _pixelsChunkLength:= 448;

        FillChar(_pixelsChunkData[0], SizeOf(boolean) * 448, 0);
        Move(aPixels[_pixelsChunkOffset], _pixelsChunkData[0], SizeOf(boolean) * _pixelsChunkLength);

        WritePixelsLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        Inc(_pixelsChunkOffset, 448);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletOLED128x64V2.ReadPixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; out aPixelsLength: word; out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To479OfBoolean);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..59] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_READ_PIXELS_LOW_LEVEL, 12);
  LEConvertUInt8To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 9, _request);
  LEConvertUInt8To(aXEnd, 10, _request);
  LEConvertUInt8To(aYEnd, 11, _request);
  _response:= SendRequest(_request);
  aPixelsLength:= LEConvertUInt16From(8, _response);
  aPixelsChunkOffset:= LEConvertUInt16From(10, _response);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 59 do _pixelsChunkDataBits[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  for _i:= 0 to 479 do aPixelsChunkData[_i]:= ((_pixelsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

function TBrickletOLED128x64V2.ReadPixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte): TArrayOfBoolean;
var
  _pixels: TArrayOfBoolean;
  _pixelsCurrentLength: word;
  _pixelsLength: word;
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To479OfBoolean;
  _pixelsOutOfSync: boolean;
  _pixelsChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_pixels, 0);
  StreamMutex.Acquire;
  try
    _pixelsLength:= 0;
    ReadPixelsLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
    SetLength(_pixels, _pixelsLength);
    _pixelsOutOfSync:= (_pixelsChunkOffset <> 0);

    if ((not _pixelsOutOfSync) and (_pixelsLength > 0)) then begin
      _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
      if (_pixelsChunkLength > 480) then _pixelsChunkLength:= 480;
      Move(_pixelsChunkData, _pixels[0], SizeOf(boolean) * _pixelsChunkLength);
      _pixelsCurrentLength:= _pixelsChunkLength;

      while ((not _pixelsOutOfSync) and (_pixelsCurrentLength < _pixelsLength)) do begin
        ReadPixelsLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        _pixelsOutOfSync:= _pixelsChunkOffset <> _pixelsCurrentLength;
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
        if (_pixelsChunkLength > 480) then _pixelsChunkLength:= 480;
        Move(_pixelsChunkData, _pixels[_pixelsCurrentLength], SizeOf(boolean) * _pixelsChunkLength);
        Inc(_pixelsCurrentLength, _pixelsChunkLength);
      end;
    end;

    if (_pixelsOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_pixelsChunkOffset + 480 < _pixelsLength) do begin
        ReadPixelsLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Pixels stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _pixels;
end;

procedure TBrickletOLED128x64V2.ClearDisplay;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.SetDisplayConfiguration(const aContrast: byte; const aInvert: boolean; const aAutomaticDraw: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_SET_DISPLAY_CONFIGURATION, 11);
  LEConvertUInt8To(aContrast, 8, _request);
  LEConvertBooleanTo(aInvert, 9, _request);
  LEConvertBooleanTo(aAutomaticDraw, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.GetDisplayConfiguration(out aContrast: byte; out aInvert: boolean; out aAutomaticDraw: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aContrast:= LEConvertUInt8From(8, _response);
  aInvert:= LEConvertBooleanFrom(9, _response);
  aAutomaticDraw:= LEConvertBooleanFrom(10, _response);
end;

procedure TBrickletOLED128x64V2.WriteLine(const aLine: byte; const aPosition: byte; const aText: string);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_LINE, 32);
  LEConvertUInt8To(aLine, 8, _request);
  LEConvertUInt8To(aPosition, 9, _request);
  LEConvertStringTo(aText, 10, 22, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.DrawBufferedFrame(const aForceCompleteRedraw: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_DRAW_BUFFERED_FRAME, 9);
  LEConvertBooleanTo(aForceCompleteRedraw, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletOLED128x64V2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOLED128x64V2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOLED128x64V2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletOLED128x64V2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOLED128x64V2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletOLED128x64V2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOLED128x64V2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletOLED128x64V2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64V2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletOLED128x64V2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletOLED128x64V2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
