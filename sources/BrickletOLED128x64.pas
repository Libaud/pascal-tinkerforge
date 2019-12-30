{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletOLED128x64;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletOLED128x64.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  /// <summary>
  ///  3.3cm (1.3") OLED display with 128x64 pixels
  /// </summary>
  TBrickletOLED128x64 = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Appends 64 byte of data to the window as set by <see cref="BrickletOLED128x64.TBrickletOLED128x64.NewWindow"/>.
    ///  
    ///  Each row has a height of 8 pixels which corresponds to one byte of data.
    ///  
    ///  Example: if you call <see cref="BrickletOLED128x64.TBrickletOLED128x64.NewWindow"/> with column from 0 to 127 and row
    ///  from 0 to 7 (the whole display) each call of <see cref="BrickletOLED128x64.TBrickletOLED128x64.Write"/> (red arrow) will
    ///  write half of a row.
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_oled_128x64_display.png
    ///     :scale: 100 %
    ///     :alt: Display pixel order
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_oled_128x64_display.png
    ///  
    ///  The LSB (D0) of each data byte is at the top and the MSB (D7) is at the
    ///  bottom of the row.
    ///  
    ///  The next call of <see cref="BrickletOLED128x64.TBrickletOLED128x64.Write"/> will write the second half of the row
    ///  and the next two the second row and so on. To fill the whole display
    ///  you need to call <see cref="BrickletOLED128x64.TBrickletOLED128x64.Write"/> 16 times.
    /// </summary>
    procedure Write(const data: array of byte); virtual;

    /// <summary>
    ///  Sets the window in which you can write with <see cref="BrickletOLED128x64.TBrickletOLED128x64.Write"/>. One row
    ///  has a height of 8 pixels.
    /// </summary>
    procedure NewWindow(const columnFrom: byte; const columnTo: byte; const rowFrom: byte; const rowTo: byte); virtual;

    /// <summary>
    ///  Clears the current content of the window as set by <see cref="BrickletOLED128x64.TBrickletOLED128x64.NewWindow"/>.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Sets the configuration of the display.
    ///  
    ///  You can set a contrast value from 0 to 255 and you can invert the color
    ///  (black/white) of the display.
    /// </summary>
    procedure SetDisplayConfiguration(const contrast: byte; const invert: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOLED128x64.TBrickletOLED128x64.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out contrast: byte; out invert: boolean); virtual;

    /// <summary>
    ///  Writes text to a specific line with a specific position.
    ///  The text can have a maximum of 26 characters.
    ///  
    ///  For example: (1, 10, "Hello") will write *Hello* in the middle of the
    ///  second line of the display.
    ///  
    ///  You can draw to the display with <see cref="BrickletOLED128x64.TBrickletOLED128x64.Write"/> and then add text to it
    ///  afterwards.
    ///  
    ///  The display uses a special 5x7 pixel charset. You can view the characters
    ///  of the charset in Brick Viewer.
    /// </summary>
    procedure WriteLine(const line: byte; const position: byte; const text: string); virtual;

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
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletOLED128x64.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletOLED128x64.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_WRITE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_NEW_WINDOW]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_SET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_GET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_128X64_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletOLED128x64.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletOLED128x64.Write(const data: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_WRITE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64.NewWindow(const columnFrom: byte; const columnTo: byte; const rowFrom: byte; const rowTo: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_NEW_WINDOW, 12);
  LEConvertUInt8To(columnFrom, 8, _request);
  LEConvertUInt8To(columnTo, 9, _request);
  LEConvertUInt8To(rowFrom, 10, _request);
  LEConvertUInt8To(rowTo, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64.ClearDisplay;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64.SetDisplayConfiguration(const contrast: byte; const invert: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_SET_DISPLAY_CONFIGURATION, 10);
  LEConvertUInt8To(contrast, 8, _request);
  LEConvertBooleanTo(invert, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64.GetDisplayConfiguration(out contrast: byte; out invert: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  contrast:= LEConvertUInt8From(8, _response);
  invert:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletOLED128x64.WriteLine(const line: byte; const position: byte; const text: string);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_WRITE_LINE, 36);
  LEConvertUInt8To(line, 8, _request);
  LEConvertUInt8To(position, 9, _request);
  LEConvertStringTo(text, 10, 26, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED128x64.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_128X64_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
