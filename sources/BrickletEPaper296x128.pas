{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletEPaper296x128;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletEPaper296x128.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To431OfBoolean = array [0..431] of boolean;
  TArray0To463OfBoolean = array [0..463] of boolean;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfBoolean = array of boolean;

  TBrickletEPaper296x128 = class;
  TBrickletEPaper296x128NotifyDrawStatus = procedure(aSender: TBrickletEPaper296x128; const aDrawStatus: byte) of object;

  /// <summary>
  ///  Three color 296x128 e-paper display
  /// </summary>
  TBrickletEPaper296x128 = class(TThreadedDevice)
  private
    fDrawStatusCallback: TBrickletEPaper296x128NotifyDrawStatus;
    procedure CallbackWrapperDrawStatus(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Draws the current black/white and red or gray buffer to the e-paper display.
    ///  
    ///  The Bricklet does not have any double-buffering. You should not call
    ///  this function while writing to the buffer. See <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.GetDrawStatus"/>.
    /// </summary>
    procedure Draw; virtual;

    /// <summary>
    ///  Returns one of three draw statuses:
    ///  
    ///  * Idle
    ///  * Copying: Data is being copied from the buffer of the Bricklet to the buffer of the display.
    ///  * Drawing: The display is updating its content (during this phase the flickering etc happens).
    ///  
    ///  You can write to the buffer (through one of the write or draw functions) when the status is
    ///  either *idle* or *drawing*. You should not write to the buffer while it is being *copied* to the
    ///  display. There is no double-buffering.
    /// </summary>
    function GetDrawStatus: byte; virtual;

    /// <summary>
    ///  Writes black/white pixels to the specified window into the buffer.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The value 0 (false) corresponds to a black pixel and the value 1 (true) to a
    ///  white pixel.
    ///  
    ///  This function writes the pixels into the black/white pixel buffer, to draw the
    ///  buffer to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    ///  
    ///  Use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteColor"/> to write red or gray pixels.
    /// </summary>
    procedure WriteBlackWhiteLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixelsLength: word;
                                      const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To431OfBoolean); virtual;

    /// <summary>
    ///  Writes black/white pixels to the specified window into the buffer.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The value 0 (false) corresponds to a black pixel and the value 1 (true) to a
    ///  white pixel.
    ///  
    ///  This function writes the pixels into the black/white pixel buffer, to draw the
    ///  buffer to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    ///  
    ///  Use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteColor"/> to write red or gray pixels.
    /// </summary>
    procedure WriteBlackWhite(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixels: array of boolean); virtual;

    /// <summary>
    ///  Returns the current content of the black/white pixel buffer for the specified window.
    ///  
    ///  The pixels are read into the window line by line top to bottom and
    ///  each line is read from left to right.
    ///  
    ///  The current content of the buffer does not have to be the current content of the display.
    ///  It is possible that the data was not drawn to the display yet and after a restart of
    ///  the Bricklet the buffer will be reset to black, while the display retains its content.
    /// </summary>
    procedure ReadBlackWhiteLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; out aPixelsLength: word;
                                     out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To463OfBoolean); virtual;

    /// <summary>
    ///  Returns the current content of the black/white pixel buffer for the specified window.
    ///  
    ///  The pixels are read into the window line by line top to bottom and
    ///  each line is read from left to right.
    ///  
    ///  The current content of the buffer does not have to be the current content of the display.
    ///  It is possible that the data was not drawn to the display yet and after a restart of
    ///  the Bricklet the buffer will be reset to black, while the display retains its content.
    /// </summary>
    function ReadBlackWhite(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte): TArrayOfBoolean; virtual;

    /// <summary>
    ///  The E-Paper 296x128 Bricklet is available with the colors black/white/red and
    ///  black/white/gray. Depending on the model this function writes either red or
    ///  gray pixels to the specified window into the buffer.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The value 0 (false) means that this pixel does not have color. It will be either black
    ///  or white (see <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteBlackWhite"/>). The value 1 (true) corresponds to a red or gray
    ///  pixel, depending on the Bricklet model.
    ///  
    ///  This function writes the pixels into the red or gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    ///  
    ///  Use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteBlackWhite"/> to write black/white pixels.
    /// </summary>
    procedure WriteColorLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte;
                                 const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To431OfBoolean); virtual;

    /// <summary>
    ///  The E-Paper 296x128 Bricklet is available with the colors black/white/red and
    ///  black/white/gray. Depending on the model this function writes either red or
    ///  gray pixels to the specified window into the buffer.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The value 0 (false) means that this pixel does not have color. It will be either black
    ///  or white (see <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteBlackWhite"/>). The value 1 (true) corresponds to a red or gray
    ///  pixel, depending on the Bricklet model.
    ///  
    ///  This function writes the pixels into the red or gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    ///  
    ///  Use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteBlackWhite"/> to write black/white pixels.
    /// </summary>
    procedure WriteColor(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixels: array of boolean); virtual;

    /// <summary>
    ///  Returns the current content of the red or gray pixel buffer for the specified window.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The current content of the buffer does not have to be the current content of the display.
    ///  It is possible that the data was not drawn to the display yet and after a restart of
    ///  the Bricklet the buffer will be reset to black, while the display retains its content.
    /// </summary>
    procedure ReadColorLowLevel(const aXStart: word; const aYStart: byte; const XEnd: word; const aYEnd: byte; out aPixelsLength: word;
                                out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To463OfBoolean); virtual;

    /// <summary>
    ///  Returns the current content of the red or gray pixel buffer for the specified window.
    ///  
    ///  The pixels are written into the window line by line top to bottom
    ///  and each line is written from left to right.
    ///  
    ///  The current content of the buffer does not have to be the current content of the display.
    ///  It is possible that the data was not drawn to the display yet and after a restart of
    ///  the Bricklet the buffer will be reset to black, while the display retains its content.
    /// </summary>
    function ReadColor(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte): TArrayOfBoolean; virtual;

    /// <summary>
    ///  Fills the complete content of the display with the given color.
    ///  
    ///  This function writes the pixels into the black/white/red|gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    /// </summary>
    procedure FillDisplay(const aColor: byte); virtual;

    /// <summary>
    ///  Draws a text with up to 50 characters at the pixel position (x, y).
    ///  
    ///  You can use one of 9 different font sizes and draw the text in
    ///  black/white/red|gray. The text can be drawn horizontal or vertical.
    ///  
    ///  This function writes the pixels into the black/white/red|gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    /// </summary>
    procedure DrawText(const aPositionX: word; const aPositionY: byte; const aFont: byte; const aColor: byte;
                       const aOrientation: byte; const aText: string); virtual;

    /// <summary>
    ///  Draws a line from (x, y)-start to (x, y)-end in the given color.
    ///  
    ///  This function writes the pixels into the black/white/red|gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    /// </summary>
    procedure DrawLine(const aPositionXStart: word; const aPositionYStart: byte; const aPositionXEnd: word;
                       const aPositionYEnd: byte; const aColor: byte); virtual;

    /// <summary>
    ///  Draws a box from (x, y)-start to (x, y)-end in the given color.
    ///  
    ///  If you set fill to true, the box will be filled with the
    ///  color. Otherwise only the outline will be drawn.
    ///  
    ///  This function writes the pixels into the black/white/red|gray pixel buffer, to draw the buffer
    ///  to the display use <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.Draw"/>.
    /// </summary>
    procedure DrawBox(const aPositionXStart: word; const aPositionYStart: byte; const aPositionXEnd: word;
                      const aPositionYEnd: byte; const aFill: boolean; const aColor: byte); virtual;

    /// <summary>
    ///  <note>
    ///   The default update mode corresponds to the default e-paper display
    ///   manufacturer settings. All of the other modes are experimental and
    ///   will Result in increased ghosting and possibly other long-term
    ///   side effects.
    ///  </note>
    ///  
    ///   If you want to know more about the inner workings of an e-paper display
    ///   take a look at this excellent video from Ben Krasnow:
    ///   `https://www.youtube.com/watch?v=MsbiO8EAsGw &lt;https://www.youtube.com/watch?v=MsbiO8EAsGw&gt;`__.
    ///  
    ///   If you are not sure about this option, leave the update mode at default.
    ///  
    ///  Currently there are three update modes available:
    ///  
    ///  * Default: Settings as given by the manufacturer. An update will take about
    ///    7.5 seconds and during the update the screen will flicker several times.
    ///  * Black/White: This will only update the black/white pixel. It uses the manufacturer
    ///    settings for black/white and ignores the red or gray pixel buffer. With this mode the
    ///    display will flicker once and it takes about 2.5 seconds. Compared to the default settings
    ///    there is more ghosting.
    ///  * Delta: This will only update the black/white pixel. It uses an aggressive method where
    ///    the changes are not applied for a whole buffer but only for the delta between the last
    ///    and the next buffer. With this mode the display will not flicker during an update and
    ///    it takes about 900-950ms. Compared to the other two settings there is more ghosting. This
    ///    mode can be used for something like a flicker-free live update of a text.
    ///  
    ///  With the black/white/red display if you use either the black/white or the delta mode,
    ///  after a while of going back and forth between black and white the white color will
    ///  start to appear red-ish or pink-ish.
    ///  
    ///  If you use the aggressive delta mode and rapidly change the content, we recommend that you
    ///  change back to the default mode every few hours and in the default mode cycle between the
    ///  three available colors a few times. This will get rid of the ghosting and after that you can
    ///  go back to the delta mode with flicker-free updates.
    /// </summary>
    procedure SetUpdateMode(const aUpdateMode: byte); virtual;

    /// <summary>
    ///  Returns the update mode as set by <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.SetUpdateMode"/>.
    /// </summary>
    function GetUpdateMode: byte; virtual;

    /// <summary>
    ///  Sets the type of the display. The e-paper display is available
    ///  in black/white/red and black/white/gray. This will be factory set
    ///  during the flashing and testing phase. The value is saved in
    ///  non-volatile memory and will stay after a power cycle.
    /// </summary>
    procedure SetDisplayType(const aDisplayType: byte); virtual;

    /// <summary>
    ///  Returns the type of the e-paper display. It can either be
    ///  black/white/red or black/white/gray.
    /// </summary>
    function GetDisplayType: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.SetStatusLEDConfig"/>
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
    ///  Callback for the current draw status. Will be called every time the
    ///  draw status changes (see <see cref="BrickletEPaper296x128.TBrickletEPaper296x128.GetDrawStatus"/>).
    /// </summary>
    property OnDrawStatus: TBrickletEPaper296x128NotifyDrawStatus read fDrawStatusCallback write fDrawStatusCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletEPaper296x128.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletEPaper296x128.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_DRAW]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_DRAW_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_BLACK_WHITE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_READ_BLACK_WHITE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_COLOR_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_READ_COLOR_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_FILL_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_TEXT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_BOX]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_SET_UPDATE_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_UPDATE_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_SET_DISPLAY_TYPE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_DISPLAY_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_E_PAPER_296X128_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletEPaper296x128.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_E_PAPER_296X128_CALLBACK_DRAW_STATUS]:= {$ifdef FPC}@{$endif}CallbackWrapperDrawStatus;
end;

procedure TBrickletEPaper296x128.Draw;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_DRAW, 8);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.GetDrawStatus: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_DRAW_STATUS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEPaper296x128.WriteBlackWhiteLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To431OfBoolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..53] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_BLACK_WHITE_LOW_LEVEL, 72);
  LEConvertUInt16To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 10, _request);
  LEConvertUInt16To(aXEnd, 11, _request);
  LEConvertUInt8To(aYEnd, 13, _request);
  LEConvertUInt16To(aPixelsLength, 14, _request);
  LEConvertUInt16To(aPixelsChunkOffset, 16, _request);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 431 do if aPixelsChunkData[_i] then _pixelsChunkDataBits[Floor(_i / 8)]:= _pixelsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 53 do LEConvertUInt8To(_pixelsChunkDataBits[_i], 18 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.WriteBlackWhite(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixels: array of boolean);
var
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To431OfBoolean;
  _pixelsChunkLength: word;
  _pixelsLength: word;
begin
  if (Length(aPixels) > 65535) then begin
    raise EInvalidParameterException.Create('Pixels can be at most 65535 items long');
  end;

  _pixelsLength:= Length(aPixels);
  _pixelsChunkOffset:= 0;

  if (_pixelsLength = 0) then begin
    FillChar(_pixelsChunkData[0], SizeOf(boolean) * 432, 0);
    WriteBlackWhiteLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_pixelsChunkOffset < _pixelsLength) do begin
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;

        if (_pixelsChunkLength > 432) then _pixelsChunkLength:= 432;

        FillChar(_pixelsChunkData[0], SizeOf(boolean) * 432, 0);
        Move(aPixels[_pixelsChunkOffset], _pixelsChunkData[0], SizeOf(boolean) * _pixelsChunkLength);

        WriteBlackWhiteLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        Inc(_pixelsChunkOffset, 432);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletEPaper296x128.ReadBlackWhiteLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; out aPixelsLength: word; out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To463OfBoolean);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..57] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_READ_BLACK_WHITE_LOW_LEVEL, 14);
  LEConvertUInt16To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 10, _request);
  LEConvertUInt16To(aXEnd, 11, _request);
  LEConvertUInt8To(aYEnd, 13, _request);
  _response:= SendRequest(_request);
  aPixelsLength:= LEConvertUInt16From(8, _response);
  aPixelsChunkOffset:= LEConvertUInt16From(10, _response);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do _pixelsChunkDataBits[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  for _i:= 0 to 463 do aPixelsChunkData[_i]:= ((_pixelsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

function TBrickletEPaper296x128.ReadBlackWhite(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte): TArrayOfBoolean;
var
  _pixels: TArrayOfBoolean;
  _pixelsCurrentLength: word;
  _pixelsLength: word;
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To463OfBoolean;
  _pixelsOutOfSync: boolean;
  _pixelsChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_pixels, 0);
  StreamMutex.Acquire;
  try
    _pixelsLength:= 0;
    ReadBlackWhiteLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
    SetLength(_pixels, _pixelsLength);
    _pixelsOutOfSync:= (_pixelsChunkOffset <> 0);

    if ((not _pixelsOutOfSync) and (_pixelsLength > 0)) then begin
      _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
      if (_pixelsChunkLength > 464) then _pixelsChunkLength:= 464;
      Move(_pixelsChunkData, _pixels[0], SizeOf(boolean) * _pixelsChunkLength);
      _pixelsCurrentLength:= _pixelsChunkLength;

      while ((not _pixelsOutOfSync) and (_pixelsCurrentLength < _pixelsLength)) do begin
        ReadBlackWhiteLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        _pixelsOutOfSync:= _pixelsChunkOffset <> _pixelsCurrentLength;
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
        if (_pixelsChunkLength > 464) then _pixelsChunkLength:= 464;
        Move(_pixelsChunkData, _pixels[_pixelsCurrentLength], SizeOf(boolean) * _pixelsChunkLength);
        Inc(_pixelsCurrentLength, _pixelsChunkLength);
      end;
    end;

    if (_pixelsOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_pixelsChunkOffset + 464 < _pixelsLength) do begin
        ReadBlackWhiteLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Pixels stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _pixels;
end;

procedure TBrickletEPaper296x128.WriteColorLowLevel(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To431OfBoolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..53] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_COLOR_LOW_LEVEL, 72);
  LEConvertUInt16To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 10, _request);
  LEConvertUInt16To(aXEnd, 11, _request);
  LEConvertUInt8To(aYEnd, 13, _request);
  LEConvertUInt16To(aPixelsLength, 14, _request);
  LEConvertUInt16To(aPixelsChunkOffset, 16, _request);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 431 do if aPixelsChunkData[_i] then _pixelsChunkDataBits[Floor(_i / 8)]:= _pixelsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 53 do LEConvertUInt8To(_pixelsChunkDataBits[_i], 18 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.WriteColor(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte; const aPixels: array of boolean);
var
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To431OfBoolean;
  _pixelsChunkLength: word;
  _pixelsLength: word;
begin
  if (Length(aPixels) > 65535) then begin
    raise EInvalidParameterException.Create('Pixels can be at most 65535 items long');
  end;

  _pixelsLength:= Length(aPixels);
  _pixelsChunkOffset:= 0;

  if (_pixelsLength = 0) then begin
    FillChar(_pixelsChunkData[0], SizeOf(boolean) * 432, 0);
    WriteColorLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_pixelsChunkOffset < _pixelsLength) do begin
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;

        if (_pixelsChunkLength > 432) then _pixelsChunkLength:= 432;

        FillChar(_pixelsChunkData[0], SizeOf(boolean) * 432, 0);
        Move(aPixels[_pixelsChunkOffset], _pixelsChunkData[0], SizeOf(boolean) * _pixelsChunkLength);

        WriteColorLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        Inc(_pixelsChunkOffset, 432);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletEPaper296x128.ReadColorLowLevel(const aXStart: word; const aYStart: byte; const XEnd: word; const aYEnd: byte; out aPixelsLength: word; out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To463OfBoolean);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..57] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_READ_COLOR_LOW_LEVEL, 14);
  LEConvertUInt16To(aXStart, 8, _request);
  LEConvertUInt8To(aYStart, 10, _request);
  LEConvertUInt16To(XEnd, 11, _request);
  LEConvertUInt8To(aYEnd, 13, _request);
  _response:= SendRequest(_request);
  aPixelsLength:= LEConvertUInt16From(8, _response);
  aPixelsChunkOffset:= LEConvertUInt16From(10, _response);
  FillChar(_pixelsChunkDataBits[0], Length(_pixelsChunkDataBits) * SizeOf(_pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do _pixelsChunkDataBits[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  for _i:= 0 to 463 do aPixelsChunkData[_i]:= ((_pixelsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

function TBrickletEPaper296x128.ReadColor(const aXStart: word; const aYStart: byte; const aXEnd: word; const aYEnd: byte): TArrayOfBoolean;
var
  _pixels: TArrayOfBoolean;
  _pixelsCurrentLength: word;
  _pixelsLength: word;
  _pixelsChunkOffset: word;
  _pixelsChunkData: TArray0To463OfBoolean;
  _pixelsOutOfSync: boolean;
  _pixelsChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_pixels, 0);
  StreamMutex.Acquire;
  try
    _pixelsLength:= 0;
    ReadColorLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
    SetLength(_pixels, _pixelsLength);
    _pixelsOutOfSync:= (_pixelsChunkOffset <> 0);

    if ((not _pixelsOutOfSync) and (_pixelsLength > 0)) then begin
      _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
      if (_pixelsChunkLength > 464) then _pixelsChunkLength:= 464;
      Move(_pixelsChunkData, _pixels[0], SizeOf(boolean) * _pixelsChunkLength);
      _pixelsCurrentLength:= _pixelsChunkLength;

      while ((not _pixelsOutOfSync) and (_pixelsCurrentLength < _pixelsLength)) do begin
        ReadColorLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
        _pixelsOutOfSync:= _pixelsChunkOffset <> _pixelsCurrentLength;
        _pixelsChunkLength:= _pixelsLength - _pixelsChunkOffset;
        if (_pixelsChunkLength > 464) then _pixelsChunkLength:= 464;
        Move(_pixelsChunkData, _pixels[_pixelsCurrentLength], SizeOf(boolean) * _pixelsChunkLength);
        Inc(_pixelsCurrentLength, _pixelsChunkLength);
      end;
    end;

    if (_pixelsOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_pixelsChunkOffset + 464 < _pixelsLength) do begin
        ReadColorLowLevel(aXStart, aYStart, aXEnd, aYEnd, _pixelsLength, _pixelsChunkOffset, _pixelsChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Pixels stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _pixels;
end;

procedure TBrickletEPaper296x128.FillDisplay(const aColor: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_FILL_DISPLAY, 9);
  LEConvertUInt8To(aColor, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.DrawText(const aPositionX: word; const aPositionY: byte; const aFont: byte; const aColor: byte; const aOrientation: byte; const aText: string);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_TEXT, 64);
  LEConvertUInt16To(aPositionX, 8, _request);
  LEConvertUInt8To(aPositionY, 10, _request);
  LEConvertUInt8To(aFont, 11, _request);
  LEConvertUInt8To(aColor, 12, _request);
  LEConvertUInt8To(aOrientation, 13, _request);
  LEConvertStringTo(aText, 14, 50, _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.DrawLine(const aPositionXStart: word; const aPositionYStart: byte; const aPositionXEnd: word; const aPositionYEnd: byte; const aColor: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_LINE, 15);
  LEConvertUInt16To(aPositionXStart, 8, _request);
  LEConvertUInt8To(aPositionYStart, 10, _request);
  LEConvertUInt16To(aPositionXEnd, 11, _request);
  LEConvertUInt8To(aPositionYEnd, 13, _request);
  LEConvertUInt8To(aColor, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.DrawBox(const aPositionXStart: word; const aPositionYStart: byte; const aPositionXEnd: word; const aPositionYEnd: byte; const aFill: boolean; const aColor: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_DRAW_BOX, 16);
  LEConvertUInt16To(aPositionXStart, 8, _request);
  LEConvertUInt8To(aPositionYStart, 10, _request);
  LEConvertUInt16To(aPositionXEnd, 11, _request);
  LEConvertUInt8To(aPositionYEnd, 13, _request);
  LEConvertBooleanTo(aFill, 14, _request);
  LEConvertUInt8To(aColor, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.SetUpdateMode(const aUpdateMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_SET_UPDATE_MODE, 9);
  LEConvertUInt8To(aUpdateMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.GetUpdateMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_UPDATE_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEPaper296x128.SetDisplayType(const aDisplayType: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_SET_DISPLAY_TYPE, 9);
  LEConvertUInt8To(aDisplayType, 8, _request);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.GetDisplayType: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_DISPLAY_TYPE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEPaper296x128.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletEPaper296x128.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletEPaper296x128.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEPaper296x128.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEPaper296x128.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletEPaper296x128.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletEPaper296x128.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletEPaper296x128.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletEPaper296x128.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletEPaper296x128.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_E_PAPER_296X128_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletEPaper296x128.CallbackWrapperDrawStatus(const aPacket: TDynamicByteArray);
var
  _drawStatus: byte;
begin
  _drawStatus:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fDrawStatusCallback)) then begin
    fDrawStatusCallback(self, _drawStatus);
  end;
end;

end.
