{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLCD128x64;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletLCD128x64.inc}

type
  TArray0To167OfBoolean = array [0..167] of boolean;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To447OfBoolean = array [0..447] of boolean;
  TArray0To479OfBoolean = array [0..479] of boolean;
  TArray0To58OfUInt8 = array [0..58] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfBoolean = array of boolean;
  TArrayOfUInt8 = array of byte;

  TBrickletLCD128x64 = class;
  TBrickletLCD128x64NotifyTouchPosition = procedure(aSender: TBrickletLCD128x64; const pressure: word; const x: word; const y: word; const age: longword) of object;
  TBrickletLCD128x64NotifyTouchGesture = procedure(aSender: TBrickletLCD128x64; const gesture: byte; const duration: longword; const pressureMax: word; const xStart: word; const yStart: word; const xEnd: word; const yEnd: word; const age: longword) of object;
  TBrickletLCD128x64NotifyGUIButtonPressed = procedure(aSender: TBrickletLCD128x64; const index: byte; const pressed: boolean) of object;
  TBrickletLCD128x64NotifyGUISliderValue = procedure(aSender: TBrickletLCD128x64; const index: byte; const value: byte) of object;
  TBrickletLCD128x64NotifyGUITabSelected = procedure(aSender: TBrickletLCD128x64; const index: shortint) of object;

  /// <summary>
  ///  7.1cm (2.8") display with 128x64 pixel and touch screen
  /// </summary>
  TBrickletLCD128x64 = class(TThreadedDevice)
  private
    fTouchPositionCallback: TBrickletLCD128x64NotifyTouchPosition;
    fTouchGestureCallback: TBrickletLCD128x64NotifyTouchGesture;
    fGUIButtonPressedCallback: TBrickletLCD128x64NotifyGUIButtonPressed;
    fGUISliderValueCallback: TBrickletLCD128x64NotifyGUISliderValue;
    fGUITabSelectedCallback: TBrickletLCD128x64NotifyGUITabSelected;
    procedure CallbackWrapperTouchPosition(const packet: TDynamicByteArray); virtual;
    procedure CallbackWrapperTouchGesture(const packet: TDynamicByteArray); virtual;
    procedure CallbackWrapperGUIButtonPressed(const packet: TDynamicByteArray); virtual;
    procedure CallbackWrapperGUISliderValue(const packet: TDynamicByteArray); virtual;
    procedure CallbackWrapperGUITabSelected(const packet: TDynamicByteArray); virtual;
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
    ///  the buffer is transferred to the display only after <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure WritePixelsLowLevel(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; const pixelsLength: word; const pixelsChunkOffset: word; const pixelsChunkData: TArray0To447OfBoolean); virtual;

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
    ///  the buffer is transferred to the display only after <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure WritePixels(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; const pixels: array of boolean); virtual;

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
    ///  (see <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>).
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure ReadPixelsLowLevel(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; out pixelsLength: word; out pixelsChunkOffset: word; out pixelsChunkData: TArray0To479OfBoolean); virtual;

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
    ///  (see <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>).
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    function ReadPixels(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte): TArrayOfBoolean; virtual;

    /// <summary>
    ///  Clears the complete content of the display.
    ///  
    ///  If automatic draw is enabled (default) the pixels are directly cleared.
    ///  
    ///  If automatic draw is disabled the the internal buffer is cleared and
    ///  the buffer is transferred to the display only after <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Sets the configuration of the display.
    ///  
    ///  If automatic draw is set to *true*, the display is automatically updated with every
    ///  call of <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/> and <see cref="BrickletLCD128x64.TBrickletLCD128x64.WriteLine"/>. If it is set to false, the
    ///  changes are written into an internal buffer and only shown on the display after
    ///  a call of <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>.
    /// </summary>
    procedure SetDisplayConfiguration(const contrast: byte; const backlight: byte; const invert: boolean; const automaticDraw: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out contrast: byte; out backlight: byte; out invert: boolean; out automaticDraw: boolean); virtual;

    /// <summary>
    ///  Writes text to a specific line with a specific position.
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
    ///  the buffer is transferred to the display only after <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawBufferedFrame"/>
    ///  is called. This can be used to avoid flicker when drawing a complex frame in
    ///  multiple steps.
    ///  
    ///  Automatic draw can be configured with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>
    ///  function.
    ///  
    ///  This function is a 1:1 replacement for the function with the same name
    ///  in the LCD 20x4 Bricklet. You can draw text at a specific pixel position
    ///  and with different font sizes with the <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawText"/> function.
    /// </summary>
    procedure WriteLine(const line: byte; const position: byte; const text: string); virtual;

    /// <summary>
    ///  Draws the currently buffered frame. Normally each call of <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/> and
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.WriteLine"/> draws directly onto the display. If you turn automatic draw off
    ///  (<see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>), the data is written in an internal buffer and
    ///  only transferred to the display by calling this function. This can be used to
    ///  avoid flicker when drawing a complex frame in multiple steps.
    ///  
    ///  Set the `force complete redraw` to *true* to redraw the whole display
    ///  instead of only the changed parts. Normally it should not be necessary to set this to
    ///  *true*. It may only become necessary in case of stuck pixels because of errors.
    /// </summary>
    procedure DrawBufferedFrame(const forceCompleteRedraw: boolean); virtual;

    /// <summary>
    ///  Returns the last valid touch position:
    ///  
    ///  * Pressure: Amount of pressure applied by the user
    ///  * X: Touch position on x-axis
    ///  * Y: Touch position on y-axis
    ///  * Age: Age of touch press in ms (how long ago it was)
    /// </summary>
    procedure GetTouchPosition(out pressure: word; out x: word; out y: word; out age: longword); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLCD128x64.TBrickletLCD128x64.OnTouchPosition"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetTouchPositionCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchPositionCallbackConfiguration"/>.
    /// </summary>
    procedure GetTouchPositionCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns one of four touch gestures that can be automatically detected by the Bricklet.
    ///  
    ///  The gestures are swipes from left to right, right to left, top to bottom and bottom to top.
    ///  
    ///  Additionally to the gestures a vector with a start and end position of the gesture is
    ///  provided. You can use this vector do determine a more exact location of the gesture (e.g.
    ///  the swipe from top to bottom was on the left or right part of the screen).
    ///  
    ///  The age parameter corresponds to the age of gesture (how long ago it was).
    /// </summary>
    procedure GetTouchGesture(out gesture: byte; out duration: longword; out pressureMax: word; out xStart: word; out yStart: word; out xEnd: word; out yEnd: word; out age: longword); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLCD128x64.TBrickletLCD128x64.OnTouchGesture"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetTouchGestureCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchGestureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTouchGestureCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Draws a white or black line from (x, y)-start to (x, y)-end.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawLine(const positionXStart: byte; const positionYStart: byte; const positionXEnd: byte; const positionYEnd: byte; const color: boolean); virtual;

    /// <summary>
    ///  Draws a white or black box from (x, y)-start to (x, y)-end.
    ///  
    ///  If you set fill to true, the box will be filled with the
    ///  color. Otherwise only the outline will be drawn.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawBox(const positionXStart: byte; const positionYStart: byte; const positionXEnd: byte; const positionYEnd: byte; const fill: boolean; const color: boolean); virtual;

    /// <summary>
    ///  Draws a text at the pixel position (x, y).
    ///  
    ///  You can use one of 9 different font sizes and draw the text in white or black.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawText(const positionX: byte; const positionY: byte; const font: byte; const color: boolean; const text: string); virtual;

    /// <summary>
    ///  Draws a clickable button at position (x, y) with the given text.
    ///  
    ///  You can use up to 12 buttons.
    ///  
    ///  The x position + width has to be within the range of 1 to 128 and the y
    ///  position + height has to be within the range of 1 to 64.
    ///  
    ///  The minimum useful width/height of a button is 3.
    ///  
    ///  You can enable a callback for a button press with
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration"/>. The callback will
    ///  be triggered for press and release-events.
    ///  
    ///  The button is drawn in a separate GUI buffer and the button-frame will
    ///  always stay on top of the graphics drawn with <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/>. To
    ///  remove the button use <see cref="BrickletLCD128x64.TBrickletLCD128x64.RemoveGUIButton"/>.
    ///  
    ///  If you want an icon instead of text, you can draw the icon inside of the
    ///  button with <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUIButton(const index: byte; const positionX: byte; const positionY: byte; const width: byte; const height: byte; const text: string); virtual;

    /// <summary>
    ///  Returns the button properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButton"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a button is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIButton(const index: byte; out active: boolean; out positionX: byte; out positionY: byte; out width: byte; out height: byte; out text: string); virtual;

    /// <summary>
    ///  Removes the button with the given index.
    ///  
    ///  You can use index 255 to remove all buttons.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUIButton(const index: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLCD128x64.TBrickletLCD128x64.OnGUIButtonPressed"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUIButtonPressedCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIButtonPressedCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the state of the button for the given index.
    ///  
    ///  The state can either be pressed (true) or released (false).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUIButtonPressed(const index: byte): boolean; virtual;

    /// <summary>
    ///  Draws a slider at position (x, y) with the given length.
    ///  
    ///  You can use up to 6 sliders.
    ///  
    ///  If you use the horizontal direction, the x position + length has to be
    ///  within the range of 1 to 128 and the y position has to be within
    ///  the range of 0 to 46.
    ///  
    ///  If you use the vertical direction, the y position + length has to be
    ///  within the range of 1 to 64 and the x position has to be within
    ///  the range of 0 to 110.
    ///  
    ///  The minimum length of a slider is 8.
    ///  
    ///  The parameter value is the start-position of the slider, it can
    ///  be between 0 and length-8.
    ///  
    ///  You can enable a callback for the slider value with
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration"/>.
    ///  
    ///  The slider is drawn in a separate GUI buffer and it will
    ///  always stay on top of the graphics drawn with <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/>. To
    ///  remove the button use <see cref="BrickletLCD128x64.TBrickletLCD128x64.RemoveGUISlider"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUISlider(const index: byte; const positionX: byte; const positionY: byte; const length_: byte; const direction: byte; const value: byte); virtual;

    /// <summary>
    ///  Returns the slider properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISlider"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a button is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUISlider(const index: byte; out active: boolean; out positionX: byte; out positionY: byte; out length_: byte; out direction: byte; out aValue: byte); virtual;

    /// <summary>
    ///  Removes the slider with the given index.
    ///  
    ///  You can use index 255 to remove all slider.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUISlider(const index: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLCD128x64.TBrickletLCD128x64.OnGUISliderValue"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUISliderValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUISliderValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the current slider value for the given index.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUISliderValue(const index: byte): byte; virtual;

    /// <summary>
    ///  Sets the general configuration for tabs. You can configure the tabs to only
    ///  accept clicks or only swipes (gesture left/right and right/left) or both.
    ///  
    ///  Additionally, if you set `Clear GUI` to true, all of the GUI elements (buttons,
    ///  slider, graphs) will automatically be removed on every tab change.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabConfiguration(const changeTabConfig: byte; const clearGUI: boolean); virtual;

    /// <summary>
    ///  Returns the tab configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabConfiguration(out changeTabConfig: byte; out clearGUI: boolean); virtual;

    /// <summary>
    ///  Adds a text-tab with the given index.
    ///  
    ///  You can use up to 10 tabs.
    ///  
    ///  A text-tab with the same index as a icon-tab will overwrite the icon-tab.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabText(const index: byte; const text: string); virtual;

    /// <summary>
    ///  Returns the text for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabText"/>.
    ///  
    ///  Additionally the `Active` parameter shows if the tab is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabText(const index: byte; out active: boolean; out text: string); virtual;

    /// <summary>
    ///  Adds a icon-tab with the given index. The icon can have a width of 28 pixels
    ///  with a height of 6 pixels. It is drawn line-by-line from left to right.
    ///  
    ///  You can use up to 10 tabs.
    ///  
    ///  A icon-tab with the same index as a text-tab will overwrite the text-tab.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabIcon(const index: byte; const icon: array of boolean); virtual;

    /// <summary>
    ///  Returns the icon for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabIcon"/>.
    ///  
    ///  Additionally the `Active` parameter shows if the tab is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabIcon(const index: byte; out active: boolean; out icon: TArray0To167OfBoolean); virtual;

    /// <summary>
    ///  Removes the tab with the given index.
    ///  
    ///  You can use index 255 to remove all tabs.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUITab(const index: byte); virtual;

    /// <summary>
    ///  Sets the tab with the given index as selected (drawn as selected on the display).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabSelected(const index: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLCD128x64.TBrickletLCD128x64.OnGUITabSelected"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabSelectedCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabSelectedCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabSelectedCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the index of the currently selected tab.
    ///  If there are not tabs, the returned index is -1.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUITabSelected: shortint; virtual;

    /// <summary>
    ///  Sets the configuration for up to four graphs.
    ///  
    ///  The graph type can be dot-, line- or bar-graph.
    ///  
    ///  The x and y position are pixel positions.
    ///  
    ///  You can add a text for the x and y axis.
    ///  The text is drawn at the inside of the graph and it can overwrite some
    ///  of the graph data. If you need the text outside of the graph you can
    ///  leave this text here empty and use <see cref="BrickletLCD128x64.TBrickletLCD128x64.DrawText"/> to draw the caption
    ///  outside of the graph.
    ///  
    ///  The data of the graph can be set and updated with <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphData"/>.
    ///  
    ///  The graph is drawn in a separate GUI buffer and the graph-frame and data will
    ///  always stay on top of the graphics drawn with <see cref="BrickletLCD128x64.TBrickletLCD128x64.WritePixels"/>. To
    ///  remove the graph use <see cref="BrickletLCD128x64.TBrickletLCD128x64.RemoveGUIGraph"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUIGraphConfiguration(const index: byte; const graphType: byte; const positionX: byte; const positionY: byte; const width: byte; const height: byte; const textX: string; const textY: string); virtual;

    /// <summary>
    ///  Returns the graph properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a graph is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIGraphConfiguration(const index: byte; out active: boolean; out graphType: byte; out positionX: byte; out positionY: byte; out width: byte; out height: byte; out textX: string; out textY: string); virtual;

    /// <summary>
    ///  Sets the data for a graph with the given index. You have to configure the graph with
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/> before you can set the first data.
    ///  
    ///  The graph will show the first n values of the data that you set, where
    ///  n is the width set with <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/>. If you set
    ///  less then n values it will show the rest of the values as zero.
    ///  
    ///  The maximum number of data-points you can set is 118 (which also corresponds to the
    ///  maximum width of the graph).
    ///  
    ///  You have to scale your values to be between 0 and 255. 0 will be shown
    ///  at the bottom of the graph and 255 at the top.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUIGraphDataLowLevel(const index: byte; const dataLength: word; const dataChunkOffset: word; const dataChunkData: TArray0To58OfUInt8); virtual;

    /// <summary>
    ///  Sets the data for a graph with the given index. You have to configure the graph with
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/> before you can set the first data.
    ///  
    ///  The graph will show the first n values of the data that you set, where
    ///  n is the width set with <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/>. If you set
    ///  less then n values it will show the rest of the values as zero.
    ///  
    ///  The maximum number of data-points you can set is 118 (which also corresponds to the
    ///  maximum width of the graph).
    ///  
    ///  You have to scale your values to be between 0 and 255. 0 will be shown
    ///  at the bottom of the graph and 255 at the top.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUIGraphData(const index: byte; const data: array of byte); virtual;

    /// <summary>
    ///  Returns the graph data for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphData"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIGraphDataLowLevel(const index: byte; out dataLength: word; out dataChunkOffset: word; out dataChunkData: TArray0To58OfUInt8); virtual;

    /// <summary>
    ///  Returns the graph data for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphData"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUIGraphData(const index: byte): TArrayOfUInt8; virtual;

    /// <summary>
    ///  Removes the graph with the given index.
    ///  
    ///  You can use index 255 to remove all graphs.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUIGraph(const index: byte); virtual;

    /// <summary>
    ///  Removes all GUI elements (buttons, slider, graphs, tabs).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveAllGUI; virtual;

    /// <summary>
    ///  Sets the touch LED configuration. By default the LED is on if the
    ///  LCD is touched.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetTouchLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchLEDConfig"/>
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetTouchLEDConfig: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletLCD128x64.TBrickletLCD128x64.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchPositionCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletLCD128x64.TBrickletLCD128x64.GetTouchPosition"/>.
    /// </summary>
    property OnTouchPosition: TBrickletLCD128x64NotifyTouchPosition read fTouchPositionCallback write fTouchPositionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchGestureCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletLCD128x64.TBrickletLCD128x64.GetTouchGesture"/>.
    /// </summary>
    property OnTouchGesture: TBrickletLCD128x64NotifyTouchGesture read fTouchGestureCallback write fTouchGestureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletLCD128x64.TBrickletLCD128x64.GetGUIButtonPressed"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    property OnGUIButtonPressed: TBrickletLCD128x64NotifyGUIButtonPressed read fGUIButtonPressedCallback write fGUIButtonPressedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletLCD128x64.TBrickletLCD128x64.GetGUISliderValue"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    property OnGUISliderValue: TBrickletLCD128x64NotifyGUISliderValue read fGUISliderValueCallback write fGUISliderValueCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabSelectedCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletLCD128x64.TBrickletLCD128x64.GetGUITabSelected"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    property OnGUITabSelected: TBrickletLCD128x64NotifyGUITabSelected read fGUITabSelectedCallback write fGUITabSelectedCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletLCD128x64.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletLCD128x64.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_WRITE_PIXELS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_READ_PIXELS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_CLEAR_DISPLAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_DISPLAY_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_WRITE_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_DRAW_BUFFERED_FRAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_POSITION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_GESTURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_DRAW_LINE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_DRAW_BOX]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_DRAW_TEXT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_BUTTON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_SLIDER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_TEXT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_TEXT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_ICON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_ICON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_TAB]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_DATA_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_DATA_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_GRAPH]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_REMOVE_ALL_GUI]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LCD_128X64_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLCD128x64.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LCD_128X64_CALLBACK_TOUCH_POSITION]:= {$ifdef FPC}@{$endif}CallbackWrapperTouchPosition;
  aCallBacks[BRICKLET_LCD_128X64_CALLBACK_TOUCH_GESTURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTouchGesture;
  aCallBacks[BRICKLET_LCD_128X64_CALLBACK_GUI_BUTTON_PRESSED]:= {$ifdef FPC}@{$endif}CallbackWrapperGUIButtonPressed;
  aCallBacks[BRICKLET_LCD_128X64_CALLBACK_GUI_SLIDER_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperGUISliderValue;
  aCallBacks[BRICKLET_LCD_128X64_CALLBACK_GUI_TAB_SELECTED]:= {$ifdef FPC}@{$endif}CallbackWrapperGUITabSelected;
end;

procedure TBrickletLCD128x64.WritePixelsLowLevel(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; const pixelsLength: word; const pixelsChunkOffset: word; const pixelsChunkData: TArray0To447OfBoolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  pixelsChunkDataBits: array [0..55] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_PIXELS_LOW_LEVEL, 72);
  LEConvertUInt8To(xStart, 8, _request);
  LEConvertUInt8To(yStart, 9, _request);
  LEConvertUInt8To(xEnd, 10, _request);
  LEConvertUInt8To(yEnd, 11, _request);
  LEConvertUInt16To(pixelsLength, 12, _request);
  LEConvertUInt16To(pixelsChunkOffset, 14, _request);
  FillChar(pixelsChunkDataBits[0], Length(pixelsChunkDataBits) * SizeOf(pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 447 do if pixelsChunkData[_i] then pixelsChunkDataBits[Floor(_i / 8)]:= pixelsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 55 do LEConvertUInt8To(pixelsChunkDataBits[_i], 16 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.WritePixels(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; const pixels: array of boolean);
var
  pixelsChunkOffset: word;
  pixelsChunkData: TArray0To447OfBoolean;
  pixelsChunkLength: word;
  pixelsLength: word;
begin
  if (Length(pixels) > 65535) then begin
    raise EInvalidParameterException.Create('Pixels can be at most 65535 items long');
  end;

  pixelsLength:= Length(pixels);
  pixelsChunkOffset:= 0;

  if (pixelsLength = 0) then begin
    FillChar(pixelsChunkData[0], SizeOf(boolean) * 448, 0);
    WritePixelsLowLevel(xStart, yStart, xEnd, yEnd, pixelsLength, pixelsChunkOffset, pixelsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (pixelsChunkOffset < pixelsLength) do begin
        pixelsChunkLength:= pixelsLength - pixelsChunkOffset;

        if (pixelsChunkLength > 448) then pixelsChunkLength:= 448;

        FillChar(pixelsChunkData[0], SizeOf(boolean) * 448, 0);
        Move(pixels[pixelsChunkOffset], pixelsChunkData[0], SizeOf(boolean) * pixelsChunkLength);

        WritePixelsLowLevel(xStart, yStart, xEnd, yEnd, pixelsLength, pixelsChunkOffset, pixelsChunkData);
        Inc(pixelsChunkOffset, 448);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletLCD128x64.ReadPixelsLowLevel(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte; out pixelsLength: word; out pixelsChunkOffset: word; out pixelsChunkData: TArray0To479OfBoolean);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  pixelsChunkDataBits: array [0..59] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_READ_PIXELS_LOW_LEVEL, 12);
  LEConvertUInt8To(xStart, 8, _request);
  LEConvertUInt8To(yStart, 9, _request);
  LEConvertUInt8To(xEnd, 10, _request);
  LEConvertUInt8To(yEnd, 11, _request);
  _response:= SendRequest(_request);
  pixelsLength:= LEConvertUInt16From(8, _response);
  pixelsChunkOffset:= LEConvertUInt16From(10, _response);
  FillChar(pixelsChunkDataBits[0], Length(pixelsChunkDataBits) * SizeOf(pixelsChunkDataBits[0]), 0);
  for _i:= 0 to 59 do pixelsChunkDataBits[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  for _i:= 0 to 479 do pixelsChunkData[_i]:= ((pixelsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

function TBrickletLCD128x64.ReadPixels(const xStart: byte; const yStart: byte; const xEnd: byte; const yEnd: byte): TArrayOfBoolean;
var
  pixels: TArrayOfBoolean;
  pixelsCurrentLength: word;
  pixelsLength: word;
  pixelsChunkOffset: word;
  pixelsChunkData: TArray0To479OfBoolean;
  pixelsOutOfSync: boolean;
  pixelsChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(pixels, 0);
  StreamMutex.Acquire;
  try
    pixelsLength:= 0;
    ReadPixelsLowLevel(xStart, yStart, xEnd, yEnd, pixelsLength, pixelsChunkOffset, pixelsChunkData);
    SetLength(pixels, pixelsLength);
    pixelsOutOfSync:= (pixelsChunkOffset <> 0);

    if ((not pixelsOutOfSync) and (pixelsLength > 0)) then begin
      pixelsChunkLength:= pixelsLength - pixelsChunkOffset;
      if (pixelsChunkLength > 480) then pixelsChunkLength:= 480;
      Move(pixelsChunkData, pixels[0], SizeOf(boolean) * pixelsChunkLength);
      pixelsCurrentLength:= pixelsChunkLength;

      while ((not pixelsOutOfSync) and (pixelsCurrentLength < pixelsLength)) do begin
        ReadPixelsLowLevel(xStart, yStart, xEnd, yEnd, pixelsLength, pixelsChunkOffset, pixelsChunkData);
        pixelsOutOfSync:= pixelsChunkOffset <> pixelsCurrentLength;
        pixelsChunkLength:= pixelsLength - pixelsChunkOffset;
        if (pixelsChunkLength > 480) then pixelsChunkLength:= 480;
        Move(pixelsChunkData, pixels[pixelsCurrentLength], SizeOf(boolean) * pixelsChunkLength);
        Inc(pixelsCurrentLength, pixelsChunkLength);
      end;
    end;

    if (pixelsOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (pixelsChunkOffset + 480 < pixelsLength) do begin
        ReadPixelsLowLevel(xStart, yStart, xEnd, yEnd, pixelsLength, pixelsChunkOffset, pixelsChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Pixels stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= pixels;
end;

procedure TBrickletLCD128x64.ClearDisplay;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetDisplayConfiguration(const contrast: byte; const backlight: byte; const invert: boolean; const automaticDraw: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_DISPLAY_CONFIGURATION, 12);
  LEConvertUInt8To(contrast, 8, _request);
  LEConvertUInt8To(backlight, 9, _request);
  LEConvertBooleanTo(invert, 10, _request);
  LEConvertBooleanTo(automaticDraw, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetDisplayConfiguration(out contrast: byte; out backlight: byte; out invert: boolean; out automaticDraw: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  contrast:= LEConvertUInt8From(8, _response);
  backlight:= LEConvertUInt8From(9, _response);
  invert:= LEConvertBooleanFrom(10, _response);
  automaticDraw:= LEConvertBooleanFrom(11, _response);
end;

procedure TBrickletLCD128x64.WriteLine(const line: byte; const position: byte; const text: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_LINE, 32);
  LEConvertUInt8To(line, 8, _request);
  LEConvertUInt8To(position, 9, _request);
  LEConvertStringTo(text, 10, 22, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawBufferedFrame(const forceCompleteRedraw: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_BUFFERED_FRAME, 9);
  LEConvertBooleanTo(forceCompleteRedraw, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchPosition(out pressure: word; out x: word; out y: word; out age: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION, 8);
  _response:= SendRequest(_request);
  pressure:= LEConvertUInt16From(8, _response);
  x:= LEConvertUInt16From(10, _response);
  y:= LEConvertUInt16From(12, _response);
  age:= LEConvertUInt32From(14, _response);
end;

procedure TBrickletLCD128x64.SetTouchPositionCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_POSITION_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchPositionCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletLCD128x64.GetTouchGesture(out gesture: byte; out duration: longword; out pressureMax: word; out xStart: word; out yStart: word; out xEnd: word; out yEnd: word; out age: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE, 8);
  _response:= SendRequest(_request);
  gesture:= LEConvertUInt8From(8, _response);
  duration:= LEConvertUInt32From(9, _response);
  pressureMax:= LEConvertUInt16From(13, _response);
  xStart:= LEConvertUInt16From(15, _response);
  yStart:= LEConvertUInt16From(17, _response);
  xEnd:= LEConvertUInt16From(19, _response);
  yEnd:= LEConvertUInt16From(21, _response);
  age:= LEConvertUInt32From(23, _response);
end;

procedure TBrickletLCD128x64.SetTouchGestureCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_GESTURE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchGestureCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletLCD128x64.DrawLine(const positionXStart: byte; const positionYStart: byte; const positionXEnd: byte; const positionYEnd: byte; const color: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_LINE, 13);
  LEConvertUInt8To(positionXStart, 8, _request);
  LEConvertUInt8To(positionYStart, 9, _request);
  LEConvertUInt8To(positionXEnd, 10, _request);
  LEConvertUInt8To(positionYEnd, 11, _request);
  LEConvertBooleanTo(color, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawBox(const positionXStart: byte; const positionYStart: byte; const positionXEnd: byte; const positionYEnd: byte; const fill: boolean; const color: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_BOX, 14);
  LEConvertUInt8To(positionXStart, 8, _request);
  LEConvertUInt8To(positionYStart, 9, _request);
  LEConvertUInt8To(positionXEnd, 10, _request);
  LEConvertUInt8To(positionYEnd, 11, _request);
  LEConvertBooleanTo(fill, 12, _request);
  LEConvertBooleanTo(color, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawText(const positionX: byte; const positionY: byte; const font: byte; const color: boolean; const text: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_TEXT, 34);
  LEConvertUInt8To(positionX, 8, _request);
  LEConvertUInt8To(positionY, 9, _request);
  LEConvertUInt8To(font, 10, _request);
  LEConvertBooleanTo(color, 11, _request);
  LEConvertStringTo(text, 12, 22, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIButton(const index: byte; const positionX: byte; const positionY: byte; const width: byte; const height: byte; const text: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON, 29);
  LEConvertUInt8To(index, 8, _request);
  LEConvertUInt8To(positionX, 9, _request);
  LEConvertUInt8To(positionY, 10, _request);
  LEConvertUInt8To(width, 11, _request);
  LEConvertUInt8To(height, 12, _request);
  LEConvertStringTo(text, 13, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIButton(const index: byte; out active: boolean; out positionX: byte; out positionY: byte; out width: byte; out height: byte; out text: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  active:= LEConvertBooleanFrom(8, _response);
  positionX:= LEConvertUInt8From(9, _response);
  positionY:= LEConvertUInt8From(10, _response);
  width:= LEConvertUInt8From(11, _response);
  height:= LEConvertUInt8From(12, _response);
  text:= LEConvertStringFrom(13, 16, _response);
end;

procedure TBrickletLCD128x64.RemoveGUIButton(const index: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_BUTTON, 9);
  LEConvertUInt8To(index, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIButtonPressedCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUIButtonPressed(const index: byte): boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD128x64.SetGUISlider(const index: byte; const positionX: byte; const positionY: byte; const length_: byte; const direction: byte; const value: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER, 14);
  LEConvertUInt8To(index, 8, _request);
  LEConvertUInt8To(positionX, 9, _request);
  LEConvertUInt8To(positionY, 10, _request);
  LEConvertUInt8To(length_, 11, _request);
  LEConvertUInt8To(direction, 12, _request);
  LEConvertUInt8To(value, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUISlider(const index: byte; out active: boolean; out positionX: byte; out positionY: byte; out length_: byte; out direction: byte; out aValue: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  active:= LEConvertBooleanFrom(8, _response);
  positionX:= LEConvertUInt8From(9, _response);
  positionY:= LEConvertUInt8From(10, _response);
  length_:= LEConvertUInt8From(11, _response);
  direction:= LEConvertUInt8From(12, _response);
  aValue:= LEConvertUInt8From(13, _response);
end;

procedure TBrickletLCD128x64.RemoveGUISlider(const index: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_SLIDER, 9);
  LEConvertUInt8To(index, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUISliderValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUISliderValue(const index: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetGUITabConfiguration(const changeTabConfig: byte; const clearGUI: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_CONFIGURATION, 10);
  LEConvertUInt8To(changeTabConfig, 8, _request);
  LEConvertBooleanTo(clearGUI, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabConfiguration(out changeTabConfig: byte; out clearGUI: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  changeTabConfig:= LEConvertUInt8From(8, _response);
  clearGUI:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletLCD128x64.SetGUITabText(const index: byte; const text: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_TEXT, 14);
  LEConvertUInt8To(index, 8, _request);
  LEConvertStringTo(text, 9, 5, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabText(const index: byte; out active: boolean; out text: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_TEXT, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  active:= LEConvertBooleanFrom(8, _response);
  text:= LEConvertStringFrom(9, 5, _response);
end;

procedure TBrickletLCD128x64.SetGUITabIcon(const index: byte; const icon: array of boolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  iconBits: array [0..20] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_ICON, 30);
  LEConvertUInt8To(index, 8, _request);
  if (Length(icon) <> 168) then raise EInvalidParameterException.Create('Icon has to be exactly 168 items long');
  FillChar(iconBits[0], Length(iconBits) * SizeOf(iconBits[0]), 0);
  for _i:= 0 to 167 do if icon[_i] then iconBits[Floor(_i / 8)]:= iconBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 20 do LEConvertUInt8To(iconBits[_i], 9 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabIcon(const index: byte; out active: boolean; out icon: TArray0To167OfBoolean);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  iconBits: array [0..20] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_ICON, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  active:= LEConvertBooleanFrom(8, _response);
  FillChar(iconBits[0], Length(iconBits) * SizeOf(iconBits[0]), 0);
  for _i:= 0 to 20 do iconBits[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  for _i:= 0 to 167 do icon[_i]:= ((iconBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletLCD128x64.RemoveGUITab(const index: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_TAB, 9);
  LEConvertUInt8To(index, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUITabSelected(const index: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED, 9);
  LEConvertUInt8To(index, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUITabSelectedCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabSelectedCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUITabSelected: shortint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetGUIGraphConfiguration(const index: byte; const graphType: byte; const positionX: byte; const positionY: byte; const width: byte; const height: byte; const textX: string; const textY: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_CONFIGURATION, 22);
  LEConvertUInt8To(index, 8, _request);
  LEConvertUInt8To(graphType, 9, _request);
  LEConvertUInt8To(positionX, 10, _request);
  LEConvertUInt8To(positionY, 11, _request);
  LEConvertUInt8To(width, 12, _request);
  LEConvertUInt8To(height, 13, _request);
  LEConvertStringTo(textX, 14, 4, _request);
  LEConvertStringTo(textY, 18, 4, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIGraphConfiguration(const index: byte; out active: boolean; out graphType: byte; out positionX: byte; out positionY: byte; out width: byte; out height: byte; out textX: string; out textY: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_CONFIGURATION, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  active:= LEConvertBooleanFrom(8, _response);
  graphType:= LEConvertUInt8From(9, _response);
  positionX:= LEConvertUInt8From(10, _response);
  positionY:= LEConvertUInt8From(11, _response);
  width:= LEConvertUInt8From(12, _response);
  height:= LEConvertUInt8From(13, _response);
  textX:= LEConvertStringFrom(14, 4, _response);
  textY:= LEConvertStringFrom(18, 4, _response);
end;

procedure TBrickletLCD128x64.SetGUIGraphDataLowLevel(const index: byte; const dataLength: word; const dataChunkOffset: word; const dataChunkData: TArray0To58OfUInt8);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_DATA_LOW_LEVEL, 72);
  LEConvertUInt8To(index, 8, _request);
  LEConvertUInt16To(dataLength, 9, _request);
  LEConvertUInt16To(dataChunkOffset, 11, _request);
  for _i:= 0 to Length(dataChunkData) - 1 do LEConvertUInt8To(dataChunkData[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIGraphData(const index: byte; const data: array of byte);
var
  dataChunkOffset: word;
  dataChunkData: TArray0To58OfUInt8;
  dataChunkLength: word;
  dataLength: word;
begin
  if (Length(data) > 65535) then begin
    raise EInvalidParameterException.Create('Data can be at most 65535 items long');
  end;

  dataLength:= Length(data);
  dataChunkOffset:= 0;

  if (dataLength = 0) then begin
    FillChar(dataChunkData[0], SizeOf(byte) * 59, 0);
    SetGUIGraphDataLowLevel(index, dataLength, dataChunkOffset, dataChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (dataChunkOffset < dataLength) do begin
        dataChunkLength:= dataLength - dataChunkOffset;

        if (dataChunkLength > 59) then dataChunkLength:= 59;

        FillChar(dataChunkData[0], SizeOf(byte) * 59, 0);
        Move(data[dataChunkOffset], dataChunkData[0], SizeOf(byte) * dataChunkLength);

        SetGUIGraphDataLowLevel(index, dataLength, dataChunkOffset, dataChunkData);
        Inc(dataChunkOffset, 59);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletLCD128x64.GetGUIGraphDataLowLevel(const index: byte; out dataLength: word; out dataChunkOffset: word; out dataChunkData: TArray0To58OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_DATA_LOW_LEVEL, 9);
  LEConvertUInt8To(index, 8, _request);
  _response:= SendRequest(_request);
  dataLength:= LEConvertUInt16From(8, _response);
  dataChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 58 do dataChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletLCD128x64.GetGUIGraphData(const index: byte): TArrayOfUInt8;
var
  data: TArrayOfUInt8;
  dataCurrentLength: word;
  dataLength: word;
  dataChunkOffset: word;
  dataChunkData: TArray0To58OfUInt8;
  dataOutOfSync: boolean;
  dataChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(data, 0);
  StreamMutex.Acquire;
  try
    dataLength:= 0;
    GetGUIGraphDataLowLevel(index, dataLength, dataChunkOffset, dataChunkData);
    SetLength(data, dataLength);
    dataOutOfSync:= (dataChunkOffset <> 0);

    if ((not dataOutOfSync) and (dataLength > 0)) then begin
      dataChunkLength:= dataLength - dataChunkOffset;
      if (dataChunkLength > 59) then dataChunkLength:= 59;
      Move(dataChunkData, data[0], SizeOf(byte) * dataChunkLength);
      dataCurrentLength:= dataChunkLength;

      while ((not dataOutOfSync) and (dataCurrentLength < dataLength)) do begin
        GetGUIGraphDataLowLevel(index, dataLength, dataChunkOffset, dataChunkData);
        dataOutOfSync:= dataChunkOffset <> dataCurrentLength;
        dataChunkLength:= dataLength - dataChunkOffset;
        if (dataChunkLength > 59) then dataChunkLength:= 59;
        Move(dataChunkData, data[dataCurrentLength], SizeOf(byte) * dataChunkLength);
        Inc(dataCurrentLength, dataChunkLength);
      end;
    end;

    if (dataOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (dataChunkOffset + 59 < dataLength) do begin
        GetGUIGraphDataLowLevel(index, dataLength, dataChunkOffset, dataChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Data stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= data;
end;

procedure TBrickletLCD128x64.RemoveGUIGraph(const index: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_GRAPH, 9);
  LEConvertUInt8To(index, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.RemoveAllGUI;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_ALL_GUI, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetTouchLEDConfig(const config: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD128x64.GetTouchLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletLCD128x64.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLCD128x64.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetWriteFirmwarePointer(const pointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD128x64.WriteFirmware(const data: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetStatusLEDConfig(const config: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD128x64.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLCD128x64.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLCD128x64.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD128x64.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLCD128x64.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLCD128x64.CallbackWrapperTouchPosition(const packet: TDynamicByteArray);
var
  pressure: word; x: word; y: word; age: longword;
begin
  pressure:= LEConvertUInt16From(8, packet);
  x:= LEConvertUInt16From(10, packet);
  y:= LEConvertUInt16From(12, packet);
  age:= LEConvertUInt32From(14, packet);

  if (Assigned(fTouchPositionCallback)) then begin
    fTouchPositionCallback(self, pressure, x, y, age);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperTouchGesture(const packet: TDynamicByteArray);
var
  gesture: byte; duration: longword; pressureMax: word; xStart: word; yStart: word; xEnd: word; yEnd: word; age: longword;
begin
  gesture:= LEConvertUInt8From(8, packet);
  duration:= LEConvertUInt32From(9, packet);
  pressureMax:= LEConvertUInt16From(13, packet);
  xStart:= LEConvertUInt16From(15, packet);
  yStart:= LEConvertUInt16From(17, packet);
  xEnd:= LEConvertUInt16From(19, packet);
  yEnd:= LEConvertUInt16From(21, packet);
  age:= LEConvertUInt32From(23, packet);

  if (Assigned(fTouchGestureCallback)) then begin
    fTouchGestureCallback(self, gesture, duration, pressureMax, xStart, yStart, xEnd, yEnd, age);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUIButtonPressed(const packet: TDynamicByteArray);
var
  index: byte; pressed: boolean;
begin
  index:= LEConvertUInt8From(8, packet);
  pressed:= LEConvertBooleanFrom(9, packet);

  if (Assigned(fGUIButtonPressedCallback)) then begin
    fGUIButtonPressedCallback(self, index, pressed);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUISliderValue(const packet: TDynamicByteArray);
var
  index: byte; value: byte;
begin
  index:= LEConvertUInt8From(8, packet);
  value:= LEConvertUInt8From(9, packet);

  if (Assigned(fGUISliderValueCallback)) then begin
    fGUISliderValueCallback(self, index, value);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUITabSelected(const packet: TDynamicByteArray);
var
  index: shortint;
begin
  index:= LEConvertInt8From(8, packet);

  if (Assigned(fGUITabSelectedCallback)) then begin
    fGUITabSelectedCallback(self, index);
  end;
end;

end.
