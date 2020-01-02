{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletOLED64x48;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletOLED64x48.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  /// <summary>
  ///  1.68cm (0.66") OLED display with 64x48 pixels
  /// </summary>
  TBrickletOLED64x48 = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Appends 64 byte of data to the window as set by <see cref="BrickletOLED64x48.TBrickletOLED64x48.NewWindow"/>.
    ///  
    ///  Each row has a height of 8 pixels which corresponds to one byte of data.
    ///  
    ///  Example: if you call <see cref="BrickletOLED64x48.TBrickletOLED64x48.NewWindow"/> with column from 0 to 63 and row
    ///  from 0 to 5 (the whole display) each call of <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> (red arrow) will
    ///  write one row.
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_oled_64x48_display.png
    ///     :scale: 100 %
    ///     :alt: Display pixel order
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_oled_64x48_display.png
    ///  
    ///  The LSB (D0) of each data byte is at the top and the MSB (D7) is at the
    ///  bottom of the row.
    ///  
    ///  The next call of <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> will write the second row and so on. To
    ///  fill the whole display you need to call <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> 6 times.
    /// </summary>
    procedure Write(const aData: array of byte); virtual;

    /// <summary>
    ///  Sets the window in which you can write with <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/>. One row
    ///  has a height of 8 pixels.
    /// </summary>
    procedure NewWindow(const aColumnFrom: byte; const aColumnTo: byte; const aRowFrom: byte; const aRowTo: byte); virtual;

    /// <summary>
    ///  Clears the current content of the window as set by <see cref="BrickletOLED64x48.TBrickletOLED64x48.NewWindow"/>.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Sets the configuration of the display.
    ///  
    ///  You can set a contrast value from 0 to 255 and you can invert the color
    ///  (black/white) of the display.
    /// </summary>
    procedure SetDisplayConfiguration(const aContrast: byte; const aInvert: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOLED64x48.TBrickletOLED64x48.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out aContrast: byte; out aInvert: boolean); virtual;

    /// <summary>
    ///  Writes text to a specific line with a specific position.
    ///  The text can have a maximum of 13 characters.
    ///  
    ///  For example: (1, 4, "Hello") will write *Hello* in the middle of the
    ///  second line of the display.
    ///  
    ///  You can draw to the display with <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> and then add text to it
    ///  afterwards.
    ///  
    ///  The display uses a special 5x7 pixel charset. You can view the characters
    ///  of the charset in Brick Viewer.
    /// </summary>
    procedure WriteLine(const aLine: byte; const aPosition: byte; const aText: string); virtual;

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
  TinkerforgeExceptions;

procedure TBrickletOLED64x48.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletOLED64x48.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_WRITE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_NEW_WINDOW]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_SET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_GET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OLED_64X48_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletOLED64x48.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletOLED64x48.Write(const aData: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_WRITE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletOLED64x48.NewWindow(const aColumnFrom: byte; const aColumnTo: byte; const aRowFrom: byte; const aRowTo: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_NEW_WINDOW, 12);
  LEConvertUInt8To(aColumnFrom, 8, _request);
  LEConvertUInt8To(aColumnTo, 9, _request);
  LEConvertUInt8To(aRowFrom, 10, _request);
  LEConvertUInt8To(aRowTo, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED64x48.ClearDisplay;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletOLED64x48.SetDisplayConfiguration(const aContrast: byte; const aInvert: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_SET_DISPLAY_CONFIGURATION, 10);
  LEConvertUInt8To(aContrast, 8, _request);
  LEConvertBooleanTo(aInvert, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED64x48.GetDisplayConfiguration(out aContrast: byte; out aInvert: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aContrast:= LEConvertUInt8From(8, _response);
  aInvert:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletOLED64x48.WriteLine(const aLine: byte; const aPosition: byte; const aText: string);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_WRITE_LINE, 23);
  LEConvertUInt8To(aLine, 8, _request);
  LEConvertUInt8To(aPosition, 9, _request);
  LEConvertStringTo(aText, 10, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletOLED64x48.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                                         out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
