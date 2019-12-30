{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLCD16x2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletLCD16x2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To7OfUInt8 = array [0..7] of byte;

  TBrickletLCD16x2 = class;
  TBrickletLCD16x2NotifyButtonPressed = procedure(aSender: TBrickletLCD16x2; const aButton: byte) of object;
  TBrickletLCD16x2NotifyButtonReleased = procedure(aSender: TBrickletLCD16x2; const aButton: byte) of object;

  /// <summary>
  ///  16x2 character alphanumeric display with blue backlight
  /// </summary>
  TBrickletLCD16x2 = class(TDevice)
  private
    fButtonPressedCallback: TBrickletLCD16x2NotifyButtonPressed;
    fButtonReleasedCallback: TBrickletLCD16x2NotifyButtonReleased;
    procedure CallbackWrapperButtonPressed(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperButtonReleased(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Writes text to a specific line with a specific position.
    ///  The text can have a maximum of 16 characters.
    ///  
    ///  For example: (0, 5, "Hello") will write *Hello* in the middle of the
    ///  first line of the display.
    ///  
    ///  The display uses a special charset that includes all ASCII characters except
    ///  backslash and tilde. The LCD charset also includes several other non-ASCII characters, see
    ///  the `charset specification &lt;https://github.com/Tinkerforge/lcd-16x2-bricklet/raw/master/datasheets/standard_charset.pdf&gt;`__
    ///  for details. The Unicode example above shows how to specify non-ASCII characters
    ///  and how to translate from Unicode to the LCD charset.
    /// </summary>
    procedure WriteLine(const aLine: byte; const aPosition: byte; const aText: string); virtual;

    /// <summary>
    ///  Deletes all characters from the display.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Turns the backlight on.
    /// </summary>
    procedure BacklightOn; virtual;

    /// <summary>
    ///  Turns the backlight off.
    /// </summary>
    procedure BacklightOff; virtual;

    /// <summary>
    ///  Returns *true* if the backlight is on and *false* otherwise.
    /// </summary>
    function IsBacklightOn: boolean; virtual;

    /// <summary>
    ///  Configures if the cursor (shown as "_") should be visible and if it
    ///  should be blinking (shown as a blinking block). The cursor position
    ///  is one character behind the the last text written with
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.WriteLine"/>.
    /// </summary>
    procedure SetConfig(const aCursor: boolean; const aBlinking: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD16x2.TBrickletLCD16x2.SetConfig"/>.
    /// </summary>
    procedure GetConfig(out aCursor: boolean; out aBlinking: boolean); virtual;

    /// <summary>
    ///  Returns *true* if the button is pressed.
    ///  
    ///  If you want to react on button presses and releases it is recommended to use the
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.OnButtonPressed"/> and <see cref="BrickletLCD16x2.TBrickletLCD16x2.OnButtonReleased"/> callbacks.
    /// </summary>
    function IsButtonPressed(const aButton: byte): boolean; virtual;

    /// <summary>
    ///  The LCD 16x2 Bricklet can store up to 8 custom characters. The characters
    ///  consist of 5x8 pixels and can be addressed with the index 0-7. To describe
    ///  the pixels, the first 5 bits of 8 bytes are used. For example, to make
    ///  a custom character "H", you should transfer the following:
    ///  
    ///  * ``character[0] = 0b00010001`` (decimal value 17)
    ///  * ``character[1] = 0b00010001`` (decimal value 17)
    ///  * ``character[2] = 0b00010001`` (decimal value 17)
    ///  * ``character[3] = 0b00011111`` (decimal value 31)
    ///  * ``character[4] = 0b00010001`` (decimal value 17)
    ///  * ``character[5] = 0b00010001`` (decimal value 17)
    ///  * ``character[6] = 0b00010001`` (decimal value 17)
    ///  * ``character[7] = 0b00000000`` (decimal value 0)
    ///  
    ///  The characters can later be written with <see cref="BrickletLCD16x2.TBrickletLCD16x2.WriteLine"/> by using the
    ///  characters with the byte representation 8 to 15.
    ///  
    ///  You can play around with the custom characters in Brick Viewer since
    ///  version 2.0.1.
    ///                                     index
    ///  Custom characters are stored by the LCD in RAM, so they have to be set
    ///  after each startup.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetCustomCharacter(const aIndex: byte; const aCharacter: array of byte); virtual;

    /// <summary>
    ///  Returns the custom character for a given index, as set with
    ///  <see cref="BrickletLCD16x2.TBrickletLCD16x2.SetCustomCharacter"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetCustomCharacter(const aIndex: byte): TArray0To7OfUInt8; virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered when a button is pressed. The parameter is
    ///  the number of the button.
    /// </summary>
    property OnButtonPressed: TBrickletLCD16x2NotifyButtonPressed read fButtonPressedCallback write fButtonPressedCallback;

    /// <summary>
    ///  This callback is triggered when a button is released. The parameter is
    ///  the number of the button.
    /// </summary>
    property OnButtonReleased: TBrickletLCD16x2NotifyButtonReleased read fButtonReleasedCallback write fButtonReleasedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletLCD16x2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletLCD16x2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_IS_BACKLIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_SET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_IS_BUTTON_PRESSED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_SET_CUSTOM_CHARACTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_CUSTOM_CHARACTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_16X2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLCD16x2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LCD_16X2_CALLBACK_BUTTON_PRESSED]:= {$ifdef FPC}@{$endif}CallbackWrapperButtonPressed;
  aCallBacks[BRICKLET_LCD_16X2_CALLBACK_BUTTON_RELEASED]:= {$ifdef FPC}@{$endif}CallbackWrapperButtonReleased;
end;

procedure TBrickletLCD16x2.WriteLine(const aLine: byte; const aPosition: byte; const aText: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_WRITE_LINE, 26);
  LEConvertUInt8To(aLine, 8, _request);
  LEConvertUInt8To(aPosition, 9, _request);
  LEConvertStringTo(aText, 10, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD16x2.ClearDisplay;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD16x2.BacklightOn;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_ON, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD16x2.BacklightOff;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_BACKLIGHT_OFF, 8);
  SendRequest(_request);
end;

function TBrickletLCD16x2.IsBacklightOn: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_IS_BACKLIGHT_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD16x2.SetConfig(const aCursor: boolean; const aBlinking: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_SET_CONFIG, 10);
  LEConvertBooleanTo(aCursor, 8, _request);
  LEConvertBooleanTo(aBlinking, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD16x2.GetConfig(out aCursor: boolean; out aBlinking: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_CONFIG, 8);
  _response:= SendRequest(_request);
  aCursor:= LEConvertBooleanFrom(8, _response);
  aBlinking:= LEConvertBooleanFrom(9, _response);
end;

function TBrickletLCD16x2.IsButtonPressed(const aButton: byte): boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_IS_BUTTON_PRESSED, 9);
  LEConvertUInt8To(aButton, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD16x2.SetCustomCharacter(const aIndex: byte; const aCharacter: array of byte);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_SET_CUSTOM_CHARACTER, 17);
  LEConvertUInt8To(aIndex, 8, _request);
  if (Length(aCharacter) <> 8) then raise EInvalidParameterException.Create('Character has to be exactly 8 items long');
  for _i:= 0 to Length(aCharacter) - 1 do LEConvertUInt8To(aCharacter[_i], 9 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletLCD16x2.GetCustomCharacter(const aIndex: byte): TArray0To7OfUInt8;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_CUSTOM_CHARACTER, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 7 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletLCD16x2.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_16X2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLCD16x2.CallbackWrapperButtonPressed(const aPacket: TDynamicByteArray);
var
  _button: byte;
begin
  _button:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fButtonPressedCallback)) then begin
    fButtonPressedCallback(self, _button);
  end;
end;

procedure TBrickletLCD16x2.CallbackWrapperButtonReleased(const aPacket: TDynamicByteArray);
var
  _button: byte;
begin
  _button:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fButtonReleasedCallback)) then begin
    fButtonReleasedCallback(self, _button);
  end;
end;

end.
