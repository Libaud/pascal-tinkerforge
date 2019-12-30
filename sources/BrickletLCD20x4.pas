{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLCD20x4;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLCD20x4.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To7OfUInt8 = array [0..7] of byte;

  TBrickletLCD20x4 = class;
  TBrickletLCD20x4NotifyButtonPressed = procedure(aSender: TBrickletLCD20x4; const button: byte) of object;
  TBrickletLCD20x4NotifyButtonReleased = procedure(aSender: TBrickletLCD20x4; const button: byte) of object;

  /// <summary>
  ///  20x4 character alphanumeric display with blue backlight
  /// </summary>
  TBrickletLCD20x4 = class(TDevice)
  private
    fButtonPressedCallback: TBrickletLCD20x4NotifyButtonPressed;
    fButtonReleasedCallback: TBrickletLCD20x4NotifyButtonReleased;
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
    ///  The text can have a maximum of 20 characters.
    ///  
    ///  For example: (0, 7, "Hello") will write *Hello* in the middle of the
    ///  first line of the display.
    ///  
    ///  The display uses a special charset that includes all ASCII characters except
    ///  backslash and tilde. The LCD charset also includes several other non-ASCII characters, see
    ///  the `charset specification &lt;https://github.com/Tinkerforge/lcd-20x4-bricklet/raw/master/datasheets/standard_charset.pdf&gt;`__
    ///  for details. The Unicode example above shows how to specify non-ASCII characters
    ///  and how to translate from Unicode to the LCD charset.
    /// </summary>
    procedure WriteLine(const line: byte; const position: byte; const text: string); virtual;

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
    ///  <see cref="BrickletLCD20x4.TBrickletLCD20x4.WriteLine"/>.
    /// </summary>
    procedure SetConfig(const cursor: boolean; const blinking: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetConfig"/>.
    /// </summary>
    procedure GetConfig(out cursor: boolean; out blinking: boolean); virtual;

    /// <summary>
    ///  Returns *true* if the button (0 to 2 or 0 to 3 since hardware version 1.2)
    ///  is pressed.
    ///  
    ///  If you want to react on button presses and releases it is recommended to use
    ///  the <see cref="BrickletLCD20x4.TBrickletLCD20x4.OnButtonPressed"/> and <see cref="BrickletLCD20x4.TBrickletLCD20x4.OnButtonReleased"/> callbacks.
    /// </summary>
    function IsButtonPressed(const button: byte): boolean; virtual;

    /// <summary>
    ///  The LCD 20x4 Bricklet can store up to 8 custom characters. The characters
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
    ///  The characters can later be written with <see cref="BrickletLCD20x4.TBrickletLCD20x4.WriteLine"/> by using the
    ///  characters with the byte representation 8 ("\x08") to 15 ("\x0F").
    ///  
    ///  You can play around with the custom characters in Brick Viewer version
    ///  since 2.0.1.
    ///  
    ///  Custom characters are stored by the LCD in RAM, so they have to be set
    ///  after each startup.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetCustomCharacter(const index: byte; const character: array of byte); virtual;

    /// <summary>
    ///  Returns the custom character for a given index, as set with
    ///  <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetCustomCharacter"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetCustomCharacter(const index: byte): TArray0To7OfUInt8; virtual;

    /// <summary>
    ///  Sets the default text for lines 0-3. The max number of characters
    ///  per line is 20.
    ///  
    ///  The default text is shown on the LCD, if the default text counter
    ///  expires, see <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetDefaultTextCounter"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetDefaultText(const line: byte; const text: string); virtual;

    /// <summary>
    ///  Returns the default text for a given line (0-3) as set by
    ///  <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetDefaultText"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetDefaultText(const line: byte): string; virtual;

    /// <summary>
    ///  Sets the default text counter in ms. This counter is decremented each
    ///  ms by the LCD firmware. If the counter reaches 0, the default text
    ///  (see <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetDefaultText"/>) is shown on the LCD.
    ///  
    ///  This functionality can be used to show a default text if the controlling
    ///  program crashes or the connection is interrupted.
    ///  
    ///  A possible approach is to call <see cref="BrickletLCD20x4.TBrickletLCD20x4.SetDefaultTextCounter"/> every
    ///  minute with the parameter 1000*60*2 (2 minutes). In this case the
    ///  default text will be shown no later than 2 minutes after the
    ///  controlling program crashes.
    ///  
    ///  A negative counter turns the default text functionality off.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetDefaultTextCounter(const counter: longint); virtual;

    /// <summary>
    ///  Returns the current value of the default text counter.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetDefaultTextCounter: longint; virtual;

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
    ///  This callback is triggered when a button is pressed. The parameter is
    ///  the number of the button (0 to 2 or 0 to 3 since hardware version 1.2).
    /// </summary>
    property OnButtonPressed: TBrickletLCD20x4NotifyButtonPressed read fButtonPressedCallback write fButtonPressedCallback;

    /// <summary>
    ///  This callback is triggered when a button is released. The parameter is
    ///  the number of the button (0 to 2 or 0 to 3 since hardware version 1.2).
    /// </summary>
    property OnButtonReleased: TBrickletLCD20x4NotifyButtonReleased read fButtonReleasedCallback write fButtonReleasedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletLCD20x4.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 2;
end;

procedure TBrickletLCD20x4.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_BACKLIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_BACKLIGHT_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_IS_BACKLIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_SET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_GET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_IS_BUTTON_PRESSED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_SET_CUSTOM_CHARACTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_GET_CUSTOM_CHARACTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_SET_DEFAULT_TEXT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_GET_DEFAULT_TEXT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_SET_DEFAULT_TEXT_COUNTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_GET_DEFAULT_TEXT_COUNTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_20X4_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLCD20x4.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LCD_20X4_CALLBACK_BUTTON_PRESSED]:= {$ifdef FPC}@{$endif}CallbackWrapperButtonPressed;
  aCallBacks[BRICKLET_LCD_20X4_CALLBACK_BUTTON_RELEASED]:= {$ifdef FPC}@{$endif}CallbackWrapperButtonReleased;
end;

procedure TBrickletLCD20x4.WriteLine(const line: byte; const position: byte; const text: string);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_WRITE_LINE, 30);
  LEConvertUInt8To(line, 8, _request);
  LEConvertUInt8To(position, 9, _request);
  LEConvertStringTo(text, 10, 20, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD20x4.ClearDisplay;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD20x4.BacklightOn;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_BACKLIGHT_ON, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD20x4.BacklightOff;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_BACKLIGHT_OFF, 8);
  SendRequest(_request);
end;

function TBrickletLCD20x4.IsBacklightOn: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_IS_BACKLIGHT_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD20x4.SetConfig(const cursor: boolean; const blinking: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_SET_CONFIG, 10);
  LEConvertBooleanTo(cursor, 8, _request);
  LEConvertBooleanTo(blinking, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD20x4.GetConfig(out cursor: boolean; out blinking: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_GET_CONFIG, 8);
  _response:= SendRequest(_request);
  cursor:= LEConvertBooleanFrom(8, _response);
  blinking:= LEConvertBooleanFrom(9, _response);
end;

function TBrickletLCD20x4.IsButtonPressed(const button: byte): boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_IS_BUTTON_PRESSED, 9);
  LEConvertUInt8To(button, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD20x4.SetCustomCharacter(const index: byte; const character: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_SET_CUSTOM_CHARACTER, 17);
  LEConvertUInt8To(index, 8, _request);
  if (Length(character) <> 8) then raise EInvalidParameterException.Create('Character has to be exactly 8 items long');
  for _i:= 0 to Length(character) - 1 do LEConvertUInt8To(character[_i], 9 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletLCD20x4.GetCustomCharacter(const index: byte): TArray0To7OfUInt8;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_GET_CUSTOM_CHARACTER, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 7 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletLCD20x4.SetDefaultText(const line: byte; const text: string);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_SET_DEFAULT_TEXT, 29);
  LEConvertUInt8To(line, 8, _request);
  LEConvertStringTo(text, 9, 20, _request);
  SendRequest(_request);
end;

function TBrickletLCD20x4.GetDefaultText(const line: byte): string;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_GET_DEFAULT_TEXT, 9);
  LEConvertUInt8To(line, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertStringFrom(8, 20, _response);
end;

procedure TBrickletLCD20x4.SetDefaultTextCounter(const counter: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_SET_DEFAULT_TEXT_COUNTER, 12);
  LEConvertInt32To(counter, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD20x4.GetDefaultTextCounter: longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_GET_DEFAULT_TEXT_COUNTER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletLCD20x4.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_20X4_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLCD20x4.CallbackWrapperButtonPressed(const aPacket: TDynamicByteArray);
var button: byte;
begin
  button:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fButtonPressedCallback)) then begin
    fButtonPressedCallback(self, button);
  end;
end;

procedure TBrickletLCD20x4.CallbackWrapperButtonReleased(const aPacket: TDynamicByteArray);
var button: byte;
begin
  button:= LEConvertUInt8From(8, aPacket);

  if (Assigned(fButtonReleasedCallback)) then begin
    fButtonReleasedCallback(self, button);
  end;
end;

end.
