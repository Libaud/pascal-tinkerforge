{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLEDStrip;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLEDStrip.inc}

type
  TArray0To11OfUInt8 = array [0..11] of byte;
  TArray0To15OfUInt8 = array [0..15] of byte;
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLEDStrip = class;
  TBrickletLEDStripNotifyFrameRendered = procedure(aSender: TBrickletLEDStrip; const length_: word) of object;

  /// <summary>
  ///  Controls up to 320 RGB LEDs
  /// </summary>
  TBrickletLEDStrip = class(TDevice)
  private
    frameRenderedCallback: TBrickletLEDStripNotifyFrameRendered;
    procedure CallbackWrapperFrameRendered(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets *length* RGB values for the LEDs starting from *index*.
    ///  
    ///  To make the colors show correctly you need to configure the chip type
    ///  (<see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChipType"/>) and a 3-channel channel mapping (<see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChannelMapping"/>)
    ///  according to the connected LEDs.
    ///  
    ///  Example: If you set
    ///  
    ///  * index to 5,
    ///  * length to 3,
    ///  * r to [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ///  * g to [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] and
    ///  * b to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ///  
    ///  the LED with index 5 will be red, 6 will be green and 7 will be blue.
    ///  
    ///  .. note:: Depending on the LED circuitry colors can be permuted.
    ///  
    ///  The colors will be transfered to actual LEDs when the next
    ///  frame duration ends, see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetFrameDuration"/>.
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents
    ///    the number of frames per second you want to achieve.
    ///  * Set all of the LED colors for one frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  * Set all of the LED colors for next frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  * and so on.
    ///  
    ///  This approach ensures that you can change the LED colors with
    ///  a fixed frame rate.
    ///  
    ///  The actual number of controllable LEDs depends on the number of free
    ///  Bricklet ports. See :ref:`here &lt;led_strip_bricklet_ram_constraints&gt;` for more
    ///  information. A call of <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/> with index + length above the
    ///  bounds is ignored completely.
    /// </summary>
    procedure SetRGBValues(const index: word; const length_: byte; const r: array of byte; const g: array of byte; const b: array of byte); virtual;

    /// <summary>
    ///  Returns *length* R, G and B values starting from the
    ///  given LED *index*.
    ///  
    ///  The values are the last values that were set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    /// </summary>
    procedure GetRGBValues(const index: word; const length_: byte; out r: TArray0To15OfUInt8; out g: TArray0To15OfUInt8; out b: TArray0To15OfUInt8); virtual;

    /// <summary>
    ///  Sets the frame duration.
    ///  
    ///  Example: If you want to achieve 20 frames per second, you should
    ///  set the frame duration to 50ms (50ms * 20 = 1 second).
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    /// </summary>
    procedure SetFrameDuration(const duration: word); virtual;

    /// <summary>
    ///  Returns the frame duration as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetFrameDuration"/>.
    /// </summary>
    function GetFrameDuration: word; virtual;

    /// <summary>
    ///  Returns the current supply voltage of the LEDs.
    /// </summary>
    function GetSupplyVoltage: word; virtual;

    /// <summary>
    ///  Sets the frequency of the clock.
    ///  
    ///  The Bricklet will choose the nearest achievable frequency, which may
    ///  be off by a few Hz. You can get the exact frequency that is used by
    ///  calling <see cref="BrickletLEDStrip.TBrickletLEDStrip.GetClockFrequency"/>.
    ///  
    ///  If you have problems with flickering LEDs, they may be bits flipping. You
    ///  can fix this by either making the connection between the LEDs and the
    ///  Bricklet shorter or by reducing the frequency.
    ///  
    ///  With a decreasing frequency your maximum frames per second will decrease
    ///  too.
    ///  
    ///  <note>
    ///   The frequency in firmware version 2.0.0 is fixed at 2MHz.
    ///  </note>
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetClockFrequency(const frequency: longword); virtual;

    /// <summary>
    ///  Returns the currently used clock frequency as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetClockFrequency"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetClockFrequency: longword; virtual;

    /// <summary>
    ///  Sets the type of the LED driver chip. We currently support the chips
    ///  
    ///  * WS2801,
    ///  * WS2811,
    ///  * WS2812 / SK6812 / NeoPixel RGB,
    ///  * SK6812RGBW / NeoPixel RGBW (Chip Type = WS2812),
    ///  * LPD8806 and
    ///  * APA102 / DotStar.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetChipType(const chip: word); virtual;

    /// <summary>
    ///  Returns the currently used chip type as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChipType"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetChipType: word; virtual;

    /// <summary>
    ///  Sets *length* RGBW values for the LEDs starting from *index*.
    ///  
    ///  To make the colors show correctly you need to configure the chip type
    ///  (<see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChipType"/>) and a 4-channel channel mapping (<see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChannelMapping"/>)
    ///  according to the connected LEDs.
    ///  
    ///  The maximum length is 12, the index goes from 0 to 239 and the rgbw values
    ///  have 8 bits each.
    ///  
    ///  Example: If you set
    ///  
    ///  * index to 5,
    ///  * length to 4,
    ///  * r to [255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ///  * g to [0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    ///  * b to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0] and
    ///  * w to [0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    ///  
    ///  the LED with index 5 will be red, 6 will be green, 7 will be blue and 8 will be white.
    ///  
    ///  .. note:: Depending on the LED circuitry colors can be permuted.
    ///  
    ///  The colors will be transfered to actual LEDs when the next
    ///  frame duration ends, see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetFrameDuration"/>.
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents
    ///    the number of frames per second you want to achieve.
    ///  * Set all of the LED colors for one frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  * Set all of the LED colors for next frame.
    ///  * Wait for the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  * and so on.
    ///  
    ///  This approach ensures that you can change the LED colors with
    ///  a fixed frame rate.
    ///  
    ///  The actual number of controllable LEDs depends on the number of free
    ///  Bricklet ports. See :ref:`here &lt;led_strip_bricklet_ram_constraints&gt;` for more
    ///  information. A call of <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBWValues"/> with index + length above the
    ///  bounds is ignored completely.
    ///  
    ///  The LPD8806 LED driver chips have 7-bit channels for RGB. Internally the LED
    ///  Strip Bricklets divides the 8-bit values set using this function by 2 to make
    ///  them 7-bit. Therefore, you can just use the normal value range (0-255) for
    ///  LPD8806 LEDs.
    ///  
    ///  The brightness channel of the APA102 LED driver chips has 5-bit. Internally the
    ///  LED Strip Bricklets divides the 8-bit values set using this function by 8 to make
    ///  them 5-bit. Therefore, you can just use the normal value range (0-255) for
    ///  the brightness channel of APA102 LEDs.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    procedure SetRGBWValues(const index: word; const length_: byte; const r: array of byte; const g: array of byte; const b: array of byte; const w: array of byte); virtual;

    /// <summary>
    ///  Returns *length* RGBW values starting from the given *index*.
    ///  
    ///  The values are the last values that were set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBWValues"/>.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    procedure GetRGBWValues(const index: word; const length_: byte; out r: TArray0To11OfUInt8; out g: TArray0To11OfUInt8; out b: TArray0To11OfUInt8; out w: TArray0To11OfUInt8); virtual;

    /// <summary>
    ///  Sets the channel mapping for the connected LEDs.
    ///  
    ///  <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/> and <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBWValues"/> take the data in RGB(W) order.
    ///  But the connected LED driver chips might have their 3 or 4 channels in a
    ///  different order. For example, the WS2801 chips typically use BGR order, the
    ///  WS2812 chips typically use GRB order and the APA102 chips typically use WBGR
    ///  order.
    ///  
    ///  The APA102 chips are special. They have three 8-bit channels for RGB
    ///  and an additional 5-bit channel for the overall brightness of the RGB LED
    ///  making them 4-channel chips. Internally the brightness channel is the first
    ///  channel, therefore one of the Wxyz channel mappings should be used. Then
    ///  the W channel controls the brightness.
    ///  
    ///  If a 3-channel mapping is selected then <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/> has to be used.
    ///  Calling <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBWValues"/> with a 3-channel mapping will produce incorrect
    ///  results. Vice-versa if a 4-channel mapping is selected then
    ///  <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBWValues"/> has to be used. Calling <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/> with a
    ///  4-channel mapping will produce incorrect results.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    procedure SetChannelMapping(const mapping: byte); virtual;

    /// <summary>
    ///  Returns the currently used channel mapping as set by <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetChannelMapping"/>.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    function GetChannelMapping: byte; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  
    ///  By default the callback is enabled.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    procedure EnableFrameRenderedCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback.
    ///  
    ///  By default the callback is enabled.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    procedure DisableFrameRenderedCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletLEDStrip.TBrickletLEDStrip.OnFrameRendered"/> callback is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.6$nbsp;(Plugin)
    /// </summary>
    function IsFrameRenderedCallbackEnabled: boolean; virtual;

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
    ///  This callback is triggered directly after a new frame is rendered. The
    ///  parameter is the number of RGB or RGBW LEDs in that frame.
    ///  
    ///  You should send the data for the next frame directly after this callback
    ///  was triggered.
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStrip.TBrickletLEDStrip.SetRGBValues"/>.
    /// </summary>
    property OnFrameRendered: TBrickletLEDStripNotifyFrameRendered read frameRenderedCallback write frameRenderedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletLEDStrip.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 3;
end;

procedure TBrickletLEDStrip.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_RGB_VALUES]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_RGB_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_SUPPLY_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_CLOCK_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_CLOCK_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_CHIP_TYPE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_CHIP_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_RGBW_VALUES]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_RGBW_VALUES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_SET_CHANNEL_MAPPING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_CHANNEL_MAPPING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_ENABLE_FRAME_RENDERED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_DISABLE_FRAME_RENDERED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_IS_FRAME_RENDERED_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLEDStrip.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LED_STRIP_CALLBACK_FRAME_RENDERED]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameRendered;
end;

procedure TBrickletLEDStrip.SetRGBValues(const index: word; const length_: byte; const r: array of byte; const g: array of byte; const b: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_RGB_VALUES, 59);
  LEConvertUInt16To(index, 8, _request);
  LEConvertUInt8To(length_, 10, _request);
  if (Length(r) <> 16) then raise EInvalidParameterException.Create('R has to be exactly 16 items long');
  for _i:= 0 to Length(r) - 1 do LEConvertUInt8To(r[_i], 11 + (_i * 1), _request);
  if (Length(g) <> 16) then raise EInvalidParameterException.Create('G has to be exactly 16 items long');
  for _i:= 0 to Length(g) - 1 do LEConvertUInt8To(g[_i], 27 + (_i * 1), _request);
  if (Length(b) <> 16) then raise EInvalidParameterException.Create('B has to be exactly 16 items long');
  for _i:= 0 to Length(b) - 1 do LEConvertUInt8To(b[_i], 43 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLEDStrip.GetRGBValues(const index: word; const length_: byte; out r: TArray0To15OfUInt8; out g: TArray0To15OfUInt8; out b: TArray0To15OfUInt8);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_RGB_VALUES, 11);
  LEConvertUInt16To(index, 8, _request);
  LEConvertUInt8To(length_, 10, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 15 do r[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 15 do g[_i]:= LEConvertUInt8From(24 + (_i * 1), _response);
  for _i:= 0 to 15 do b[_i]:= LEConvertUInt8From(40 + (_i * 1), _response);
end;

procedure TBrickletLEDStrip.SetFrameDuration(const duration: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_FRAME_DURATION, 10);
  LEConvertUInt16To(duration, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStrip.GetFrameDuration: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_FRAME_DURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletLEDStrip.GetSupplyVoltage: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_SUPPLY_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLEDStrip.SetClockFrequency(const frequency: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_CLOCK_FREQUENCY, 12);
  LEConvertUInt32To(frequency, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStrip.GetClockFrequency: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_CLOCK_FREQUENCY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLEDStrip.SetChipType(const chip: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_CHIP_TYPE, 10);
  LEConvertUInt16To(chip, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStrip.GetChipType: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_CHIP_TYPE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLEDStrip.SetRGBWValues(const index: word; const length_: byte; const r: array of byte; const g: array of byte; const b: array of byte; const w: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_RGBW_VALUES, 59);
  LEConvertUInt16To(index, 8, _request);
  LEConvertUInt8To(length_, 10, _request);
  if (Length(r) <> 12) then raise EInvalidParameterException.Create('R has to be exactly 12 items long');
  for _i:= 0 to Length(r) - 1 do LEConvertUInt8To(r[_i], 11 + (_i * 1), _request);
  if (Length(g) <> 12) then raise EInvalidParameterException.Create('G has to be exactly 12 items long');
  for _i:= 0 to Length(g) - 1 do LEConvertUInt8To(g[_i], 23 + (_i * 1), _request);
  if (Length(b) <> 12) then raise EInvalidParameterException.Create('B has to be exactly 12 items long');
  for _i:= 0 to Length(b) - 1 do LEConvertUInt8To(b[_i], 35 + (_i * 1), _request);
  if (Length(w) <> 12) then raise EInvalidParameterException.Create('W has to be exactly 12 items long');
  for _i:= 0 to Length(w) - 1 do LEConvertUInt8To(w[_i], 47 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLEDStrip.GetRGBWValues(const index: word; const length_: byte; out r: TArray0To11OfUInt8; out g: TArray0To11OfUInt8; out b: TArray0To11OfUInt8; out w: TArray0To11OfUInt8);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_RGBW_VALUES, 11);
  LEConvertUInt16To(index, 8, _request);
  LEConvertUInt8To(length_, 10, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 11 do r[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 11 do g[_i]:= LEConvertUInt8From(20 + (_i * 1), _response);
  for _i:= 0 to 11 do b[_i]:= LEConvertUInt8From(32 + (_i * 1), _response);
  for _i:= 0 to 11 do w[_i]:= LEConvertUInt8From(44 + (_i * 1), _response);
end;

procedure TBrickletLEDStrip.SetChannelMapping(const mapping: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_SET_CHANNEL_MAPPING, 9);
  LEConvertUInt8To(mapping, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStrip.GetChannelMapping: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_CHANNEL_MAPPING, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLEDStrip.EnableFrameRenderedCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_ENABLE_FRAME_RENDERED_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletLEDStrip.DisableFrameRenderedCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_DISABLE_FRAME_RENDERED_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletLEDStrip.IsFrameRenderedCallbackEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_IS_FRAME_RENDERED_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLEDStrip.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLEDStrip.CallbackWrapperFrameRendered(const aPacket: TDynamicByteArray);
var length_: word;
begin
  length_:= LEConvertUInt16From(8, aPacket);

  if (Assigned(frameRenderedCallback)) then begin
    frameRenderedCallback(self, length_);
  end;
end;

end.
