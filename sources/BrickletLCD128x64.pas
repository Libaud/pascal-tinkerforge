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
  TBrickletLCD128x64NotifyTouchPosition = procedure(aSender: TBrickletLCD128x64; const aPressure: word; const aX: word;
                                                    const aY: word; const aAge: longword) of object;
  TBrickletLCD128x64NotifyTouchGesture = procedure(aSender: TBrickletLCD128x64; const aGesture: byte; const aDuration: longword;
                                                   const aPressureMax: word; const aXStart: word; const aYStart: word; const aXEnd: word;
                                                   const aYEnd: word; const aAge: longword) of object;
  TBrickletLCD128x64NotifyGUIButtonPressed = procedure(aSender: TBrickletLCD128x64; const aIndex: byte; const aPressed: boolean) of object;
  TBrickletLCD128x64NotifyGUISliderValue = procedure(aSender: TBrickletLCD128x64; const aIndex: byte; const aValue: byte) of object;
  TBrickletLCD128x64NotifyGUITabSelected = procedure(aSender: TBrickletLCD128x64; const aIndex: shortint) of object;

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
    procedure WritePixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte;
                                  const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To447OfBoolean); virtual;

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
    procedure WritePixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; const aPixels: array of boolean); virtual;

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
    procedure ReadPixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; out aPixelsLength: word;
                                 out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To479OfBoolean); virtual;

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
    function ReadPixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte): TArrayOfBoolean; virtual;

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
    procedure SetDisplayConfiguration(const aContrast: byte; const aBacklight: byte; const aInvert: boolean; const aAutomaticDraw: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out aContrast: byte; out aBacklight: byte; out aInvert: boolean; out aAutomaticDraw: boolean); virtual;

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
    procedure WriteLine(const aLine: byte; const aPosition: byte; const aText: string); virtual;

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
    procedure DrawBufferedFrame(const aForceCompleteRedraw: boolean); virtual;

    /// <summary>
    ///  Returns the last valid touch position:
    ///  
    ///  * Pressure: Amount of pressure applied by the user
    ///  * X: Touch position on x-axis
    ///  * Y: Touch position on y-axis
    ///  * Age: Age of touch press in ms (how long ago it was)
    /// </summary>
    procedure GetTouchPosition(out aPressure: word; out aX: word; out aY: word; out aAge: longword); virtual;

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
    procedure SetTouchPositionCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchPositionCallbackConfiguration"/>.
    /// </summary>
    procedure GetTouchPositionCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

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
    procedure GetTouchGesture(out aGesture: byte; out aDuration: longword; out aPressureMax: word; out aXStart: word;
                              out aYStart: word; out aXEnd: word; out aYEnd: word; out aAge: longword); virtual;

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
    procedure SetTouchGestureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetTouchGestureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTouchGestureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Draws a white or black line from (x, y)-start to (x, y)-end.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawLine(const aPositionXStart: byte; const aPositionYStart: byte; const aPositionXEnd: byte;
                       const aPositionYEnd: byte; const aColor: boolean); virtual;

    /// <summary>
    ///  Draws a white or black box from (x, y)-start to (x, y)-end.
    ///  
    ///  If you set fill to true, the box will be filled with the
    ///  color. Otherwise only the outline will be drawn.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawBox(const aPositionXStart: byte; const aPositionYStart: byte; const aPositionXEnd: byte;
                      const aPositionYEnd: byte; const aFill: boolean; const aColor: boolean); virtual;

    /// <summary>
    ///  Draws a text at the pixel position (x, y).
    ///  
    ///  You can use one of 9 different font sizes and draw the text in white or black.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure DrawText(const aPositionX: byte; const aPositionY: byte; const aFont: byte;
                       const aColor: boolean; const aText: string); virtual;

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
    procedure SetGUIButton(const aIndex: byte; const aPositionX: byte; const aPositionY: byte;
                           const aWidth: byte; const aHeight: byte; const text: string); virtual;

    /// <summary>
    ///  Returns the button properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButton"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a button is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIButton(const aIndex: byte; out aActive: boolean; out aPositionX: byte;
                           out aPositionY: byte; out aWidth: byte; out aHeight: byte; out aText: string); virtual;

    /// <summary>
    ///  Removes the button with the given index.
    ///  
    ///  You can use index 255 to remove all buttons.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUIButton(const aIndex: byte); virtual;

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
    procedure SetGUIButtonPressedCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIButtonPressedCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the state of the button for the given index.
    ///  
    ///  The state can either be pressed (true) or released (false).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUIButtonPressed(const aIndex: byte): boolean; virtual;

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
    procedure SetGUISlider(const aIndex: byte; const aPositionX: byte; const aPositionY: byte;
                           const aLength: byte; const aDirection: byte; const aValue: byte); virtual;

    /// <summary>
    ///  Returns the slider properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISlider"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a button is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUISlider(const aIndex: byte; out aActive: boolean; out aPositionX: byte;
                           out aPositionY: byte; out aLength: byte; out aDirection: byte; out aValue: byte); virtual;

    /// <summary>
    ///  Removes the slider with the given index.
    ///  
    ///  You can use index 255 to remove all slider.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUISlider(const aIndex: byte); virtual;

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
    procedure SetGUISliderValueCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUISliderValueCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the current slider value for the given index.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUISliderValue(const aIndex: byte): byte; virtual;

    /// <summary>
    ///  Sets the general configuration for tabs. You can configure the tabs to only
    ///  accept clicks or only swipes (gesture left/right and right/left) or both.
    ///  
    ///  Additionally, if you set `Clear GUI` to true, all of the GUI elements (buttons,
    ///  slider, graphs) will automatically be removed on every tab change.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabConfiguration(const aChangeTabConfig: byte; const aClearGUI: boolean); virtual;

    /// <summary>
    ///  Returns the tab configuration as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabConfiguration(out aChangeTabConfig: byte; out aClearGUI: boolean); virtual;

    /// <summary>
    ///  Adds a text-tab with the given index.
    ///  
    ///  You can use up to 10 tabs.
    ///  
    ///  A text-tab with the same index as a icon-tab will overwrite the icon-tab.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabText(const aIndex: byte; const aText: string); virtual;

    /// <summary>
    ///  Returns the text for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabText"/>.
    ///  
    ///  Additionally the `Active` parameter shows if the tab is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabText(const aIndex: byte; out aActive: boolean; out aText: string); virtual;

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
    procedure SetGUITabIcon(const aIndex: byte; const aIcon: array of boolean); virtual;

    /// <summary>
    ///  Returns the icon for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabIcon"/>.
    ///  
    ///  Additionally the `Active` parameter shows if the tab is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabIcon(const aIndex: byte; out aActive: boolean; out aIcon: TArray0To167OfBoolean); virtual;

    /// <summary>
    ///  Removes the tab with the given index.
    ///  
    ///  You can use index 255 to remove all tabs.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUITab(const aIndex: byte); virtual;

    /// <summary>
    ///  Sets the tab with the given index as selected (drawn as selected on the display).
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetGUITabSelected(const aIndex: byte); virtual;

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
    procedure SetGUITabSelectedCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUITabSelectedCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUITabSelectedCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

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
    procedure SetGUIGraphConfiguration(const aIndex: byte; const aGraphType: byte; const aPositionX: byte; const aPositionY: byte;
                                       const aWidth: byte; const aHeight: byte; const aTextX: string; const aTextY: string); virtual;

    /// <summary>
    ///  Returns the graph properties for a given `Index` as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphConfiguration"/>.
    ///  
    ///  Additionally the `Active` parameter shows if a graph is currently active/visible
    ///  or not.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIGraphConfiguration(const aIndex: byte; out aActive: boolean; out aGraphType: byte; out aPositionX: byte;
                                       out aPositionY: byte; out aWidth: byte; out aHeight: byte; out aTextX: string; out aTextY: string); virtual;

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
    procedure SetGUIGraphDataLowLevel(const aIndex: byte; const aDataLength: word; const aDataChunkOffset: word; const aDataChunkData: TArray0To58OfUInt8); virtual;

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
    procedure SetGUIGraphData(const aIndex: byte; const aData: array of byte); virtual;

    /// <summary>
    ///  Returns the graph data for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphData"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetGUIGraphDataLowLevel(const aIndex: byte; out aDataLength: word; out aDataChunkOffset: word; out aDataChunkData: TArray0To58OfUInt8); virtual;

    /// <summary>
    ///  Returns the graph data for a given index as set by <see cref="BrickletLCD128x64.TBrickletLCD128x64.SetGUIGraphData"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetGUIGraphData(const aIndex: byte): TArrayOfUInt8; virtual;

    /// <summary>
    ///  Removes the graph with the given index.
    ///  
    ///  You can use index 255 to remove all graphs.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure RemoveGUIGraph(const aIndex: byte); virtual;

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
    procedure SetTouchLEDConfig(const aConfig: byte); virtual;

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
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

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

procedure TBrickletLCD128x64.WritePixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; const aPixelsLength: word; const aPixelsChunkOffset: word; const aPixelsChunkData: TArray0To447OfBoolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..55] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_PIXELS_LOW_LEVEL, 72);
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

procedure TBrickletLCD128x64.WritePixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; const aPixels: array of boolean);
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

procedure TBrickletLCD128x64.ReadPixelsLowLevel(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte; out aPixelsLength: word; out aPixelsChunkOffset: word; out aPixelsChunkData: TArray0To479OfBoolean);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  _pixelsChunkDataBits: array [0..59] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_READ_PIXELS_LOW_LEVEL, 12);
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

function TBrickletLCD128x64.ReadPixels(const aXStart: byte; const aYStart: byte; const aXEnd: byte; const aYEnd: byte): TArrayOfBoolean;
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

procedure TBrickletLCD128x64.ClearDisplay;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetDisplayConfiguration(const aContrast: byte; const aBacklight: byte; const aInvert: boolean; const aAutomaticDraw: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_DISPLAY_CONFIGURATION, 12);
  LEConvertUInt8To(aContrast, 8, _request);
  LEConvertUInt8To(aBacklight, 9, _request);
  LEConvertBooleanTo(aInvert, 10, _request);
  LEConvertBooleanTo(aAutomaticDraw, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetDisplayConfiguration(out aContrast: byte; out aBacklight: byte; out aInvert: boolean; out aAutomaticDraw: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aContrast:= LEConvertUInt8From(8, _response);
  aBacklight:= LEConvertUInt8From(9, _response);
  aInvert:= LEConvertBooleanFrom(10, _response);
  aAutomaticDraw:= LEConvertBooleanFrom(11, _response);
end;

procedure TBrickletLCD128x64.WriteLine(const aLine: byte; const aPosition: byte; const aText: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_LINE, 32);
  LEConvertUInt8To(aLine, 8, _request);
  LEConvertUInt8To(aPosition, 9, _request);
  LEConvertStringTo(aText, 10, 22, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawBufferedFrame(const aForceCompleteRedraw: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_BUFFERED_FRAME, 9);
  LEConvertBooleanTo(aForceCompleteRedraw, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchPosition(out aPressure: word; out aX: word; out aY: word; out aAge: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION, 8);
  _response:= SendRequest(_request);
  aPressure:= LEConvertUInt16From(8, _response);
  aX:= LEConvertUInt16From(10, _response);
  aY:= LEConvertUInt16From(12, _response);
  aAge:= LEConvertUInt32From(14, _response);
end;

procedure TBrickletLCD128x64.SetTouchPositionCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_POSITION_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchPositionCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_POSITION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletLCD128x64.GetTouchGesture(out aGesture: byte; out aDuration: longword; out aPressureMax: word; out aXStart: word; out aYStart: word; out aXEnd: word; out aYEnd: word; out aAge: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE, 8);
  _response:= SendRequest(_request);
  aGesture:= LEConvertUInt8From(8, _response);
  aDuration:= LEConvertUInt32From(9, _response);
  aPressureMax:= LEConvertUInt16From(13, _response);
  aXStart:= LEConvertUInt16From(15, _response);
  aYStart:= LEConvertUInt16From(17, _response);
  aXEnd:= LEConvertUInt16From(19, _response);
  aYEnd:= LEConvertUInt16From(21, _response);
  aAge:= LEConvertUInt32From(23, _response);
end;

procedure TBrickletLCD128x64.SetTouchGestureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_GESTURE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetTouchGestureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_TOUCH_GESTURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletLCD128x64.DrawLine(const aPositionXStart: byte; const aPositionYStart: byte; const aPositionXEnd: byte; const aPositionYEnd: byte; const aColor: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_LINE, 13);
  LEConvertUInt8To(aPositionXStart, 8, _request);
  LEConvertUInt8To(aPositionYStart, 9, _request);
  LEConvertUInt8To(aPositionXEnd, 10, _request);
  LEConvertUInt8To(aPositionYEnd, 11, _request);
  LEConvertBooleanTo(aColor, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawBox(const aPositionXStart: byte; const aPositionYStart: byte; const aPositionXEnd: byte; const aPositionYEnd: byte; const aFill: boolean; const aColor: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_BOX, 14);
  LEConvertUInt8To(aPositionXStart, 8, _request);
  LEConvertUInt8To(aPositionYStart, 9, _request);
  LEConvertUInt8To(aPositionXEnd, 10, _request);
  LEConvertUInt8To(aPositionYEnd, 11, _request);
  LEConvertBooleanTo(aFill, 12, _request);
  LEConvertBooleanTo(aColor, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.DrawText(const aPositionX: byte; const aPositionY: byte; const aFont: byte; const aColor: boolean; const aText: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_DRAW_TEXT, 34);
  LEConvertUInt8To(aPositionX, 8, _request);
  LEConvertUInt8To(aPositionY, 9, _request);
  LEConvertUInt8To(aFont, 10, _request);
  LEConvertBooleanTo(aColor, 11, _request);
  LEConvertStringTo(aText, 12, 22, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIButton(const aIndex: byte; const aPositionX: byte; const aPositionY: byte; const aWidth: byte; const aHeight: byte; const text: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON, 29);
  LEConvertUInt8To(aIndex, 8, _request);
  LEConvertUInt8To(aPositionX, 9, _request);
  LEConvertUInt8To(aPositionY, 10, _request);
  LEConvertUInt8To(aWidth, 11, _request);
  LEConvertUInt8To(aHeight, 12, _request);
  LEConvertStringTo(text, 13, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIButton(const aIndex: byte; out aActive: boolean; out aPositionX: byte; out aPositionY: byte; out aWidth: byte; out aHeight: byte; out aText: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aActive:= LEConvertBooleanFrom(8, _response);
  aPositionX:= LEConvertUInt8From(9, _response);
  aPositionY:= LEConvertUInt8From(10, _response);
  aWidth:= LEConvertUInt8From(11, _response);
  aHeight:= LEConvertUInt8From(12, _response);
  aText:= LEConvertStringFrom(13, 16, _response);
end;

procedure TBrickletLCD128x64.RemoveGUIButton(const aIndex: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_BUTTON, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIButtonPressedCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIButtonPressedCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUIButtonPressed(const aIndex: byte): boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_BUTTON_PRESSED, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLCD128x64.SetGUISlider(const aIndex: byte; const aPositionX: byte; const aPositionY: byte; const aLength: byte; const aDirection: byte; const aValue: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER, 14);
  LEConvertUInt8To(aIndex, 8, _request);
  LEConvertUInt8To(aPositionX, 9, _request);
  LEConvertUInt8To(aPositionY, 10, _request);
  LEConvertUInt8To(aLength, 11, _request);
  LEConvertUInt8To(aDirection, 12, _request);
  LEConvertUInt8To(aValue, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUISlider(const aIndex: byte; out aActive: boolean; out aPositionX: byte; out aPositionY: byte; out aLength: byte; out aDirection: byte; out aValue: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aActive:= LEConvertBooleanFrom(8, _response);
  aPositionX:= LEConvertUInt8From(9, _response);
  aPositionY:= LEConvertUInt8From(10, _response);
  aLength:= LEConvertUInt8From(11, _response);
  aDirection:= LEConvertUInt8From(12, _response);
  aValue:= LEConvertUInt8From(13, _response);
end;

procedure TBrickletLCD128x64.RemoveGUISlider(const aIndex: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_SLIDER, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUISliderValueCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUISliderValueCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUISliderValue(const aIndex: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_SLIDER_VALUE, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetGUITabConfiguration(const aChangeTabConfig: byte; const aClearGUI: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_CONFIGURATION, 10);
  LEConvertUInt8To(aChangeTabConfig, 8, _request);
  LEConvertBooleanTo(aClearGUI, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabConfiguration(out aChangeTabConfig: byte; out aClearGUI: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aChangeTabConfig:= LEConvertUInt8From(8, _response);
  aClearGUI:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletLCD128x64.SetGUITabText(const aIndex: byte; const aText: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_TEXT, 14);
  LEConvertUInt8To(aIndex, 8, _request);
  LEConvertStringTo(aText, 9, 5, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabText(const aIndex: byte; out aActive: boolean; out aText: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_TEXT, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aActive:= LEConvertBooleanFrom(8, _response);
  aText:= LEConvertStringFrom(9, 5, _response);
end;

procedure TBrickletLCD128x64.SetGUITabIcon(const aIndex: byte; const aIcon: array of boolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  _iconBits: array [0..20] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_ICON, 30);
  LEConvertUInt8To(aIndex, 8, _request);
  if (Length(aIcon) <> 168) then raise EInvalidParameterException.Create('Icon has to be exactly 168 items long');
  FillChar(_iconBits[0], Length(_iconBits) * SizeOf(_iconBits[0]), 0);
  for _i:= 0 to 167 do if aIcon[_i] then _iconBits[Floor(_i / 8)]:= _iconBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 20 do LEConvertUInt8To(_iconBits[_i], 9 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabIcon(const aIndex: byte; out aActive: boolean; out aIcon: TArray0To167OfBoolean);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  _iconBits: array [0..20] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_ICON, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aActive:= LEConvertBooleanFrom(8, _response);
  FillChar(_iconBits[0], Length(_iconBits) * SizeOf(_iconBits[0]), 0);
  for _i:= 0 to 20 do _iconBits[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  for _i:= 0 to 167 do aIcon[_i]:= ((_iconBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletLCD128x64.RemoveGUITab(const aIndex: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_TAB, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUITabSelected(const aIndex: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUITabSelectedCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUITabSelectedCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

function TBrickletLCD128x64.GetGUITabSelected: shortint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_TAB_SELECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetGUIGraphConfiguration(const aIndex: byte; const aGraphType: byte; const aPositionX: byte; const aPositionY: byte; const aWidth: byte; const aHeight: byte; const aTextX: string; const aTextY: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_CONFIGURATION, 22);
  LEConvertUInt8To(aIndex, 8, _request);
  LEConvertUInt8To(aGraphType, 9, _request);
  LEConvertUInt8To(aPositionX, 10, _request);
  LEConvertUInt8To(aPositionY, 11, _request);
  LEConvertUInt8To(aWidth, 12, _request);
  LEConvertUInt8To(aHeight, 13, _request);
  LEConvertStringTo(aTextX, 14, 4, _request);
  LEConvertStringTo(aTextY, 18, 4, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.GetGUIGraphConfiguration(const aIndex: byte; out aActive: boolean; out aGraphType: byte; out aPositionX: byte; out aPositionY: byte; out aWidth: byte; out aHeight: byte; out aTextX: string; out aTextY: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_CONFIGURATION, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aActive:= LEConvertBooleanFrom(8, _response);
  aGraphType:= LEConvertUInt8From(9, _response);
  aPositionX:= LEConvertUInt8From(10, _response);
  aPositionY:= LEConvertUInt8From(11, _response);
  aWidth:= LEConvertUInt8From(12, _response);
  aHeight:= LEConvertUInt8From(13, _response);
  aTextX:= LEConvertStringFrom(14, 4, _response);
  aTextY:= LEConvertStringFrom(18, 4, _response);
end;

procedure TBrickletLCD128x64.SetGUIGraphDataLowLevel(const aIndex: byte; const aDataLength: word; const aDataChunkOffset: word; const aDataChunkData: TArray0To58OfUInt8);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_GUI_GRAPH_DATA_LOW_LEVEL, 72);
  LEConvertUInt8To(aIndex, 8, _request);
  LEConvertUInt16To(aDataLength, 9, _request);
  LEConvertUInt16To(aDataChunkOffset, 11, _request);
  for _i:= 0 to Length(aDataChunkData) - 1 do LEConvertUInt8To(aDataChunkData[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetGUIGraphData(const aIndex: byte; const aData: array of byte);
var
  _dataChunkOffset: word;
  _dataChunkData: TArray0To58OfUInt8;
  _dataChunkLength: word;
  _dataLength: word;
begin
  if (Length(aData) > 65535) then begin
    raise EInvalidParameterException.Create('Data can be at most 65535 items long');
  end;

  _dataLength:= Length(aData);
  _dataChunkOffset:= 0;

  if (_dataLength = 0) then begin
    FillChar(_dataChunkData[0], SizeOf(byte) * 59, 0);
    SetGUIGraphDataLowLevel(aIndex, _dataLength, _dataChunkOffset, _dataChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_dataChunkOffset < _dataLength) do begin
        _dataChunkLength:= _dataLength - _dataChunkOffset;

        if (_dataChunkLength > 59) then _dataChunkLength:= 59;

        FillChar(_dataChunkData[0], SizeOf(byte) * 59, 0);
        Move(aData[_dataChunkOffset], _dataChunkData[0], SizeOf(byte) * _dataChunkLength);

        SetGUIGraphDataLowLevel(aIndex, _dataLength, _dataChunkOffset, _dataChunkData);
        Inc(_dataChunkOffset, 59);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletLCD128x64.GetGUIGraphDataLowLevel(const aIndex: byte; out aDataLength: word; out aDataChunkOffset: word; out aDataChunkData: TArray0To58OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_GUI_GRAPH_DATA_LOW_LEVEL, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  _response:= SendRequest(_request);
  aDataLength:= LEConvertUInt16From(8, _response);
  aDataChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 58 do aDataChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletLCD128x64.GetGUIGraphData(const aIndex: byte): TArrayOfUInt8;
var
  _data: TArrayOfUInt8;
  _dataCurrentLength: word;
  _dataLength: word;
  _dataChunkOffset: word;
  _dataChunkData: TArray0To58OfUInt8;
  _dataOutOfSync: boolean;
  _dataChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_data, 0);
  StreamMutex.Acquire;
  try
    _dataLength:= 0;
    GetGUIGraphDataLowLevel(aIndex, _dataLength, _dataChunkOffset, _dataChunkData);
    SetLength(_data, _dataLength);
    _dataOutOfSync:= (_dataChunkOffset <> 0);

    if ((not _dataOutOfSync) and (_dataLength > 0)) then begin
      _dataChunkLength:= _dataLength - _dataChunkOffset;
      if (_dataChunkLength > 59) then _dataChunkLength:= 59;
      Move(_dataChunkData, _data[0], SizeOf(byte) * _dataChunkLength);
      _dataCurrentLength:= _dataChunkLength;

      while ((not _dataOutOfSync) and (_dataCurrentLength < _dataLength)) do begin
        GetGUIGraphDataLowLevel(aIndex, _dataLength, _dataChunkOffset, _dataChunkData);
        _dataOutOfSync:= _dataChunkOffset <> _dataCurrentLength;
        _dataChunkLength:= _dataLength - _dataChunkOffset;
        if (_dataChunkLength > 59) then _dataChunkLength:= 59;
        Move(_dataChunkData, _data[_dataCurrentLength], SizeOf(byte) * _dataChunkLength);
        Inc(_dataCurrentLength, _dataChunkLength);
      end;
    end;

    if (_dataOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_dataChunkOffset + 59 < _dataLength) do begin
        GetGUIGraphDataLowLevel(aIndex, _dataLength, _dataChunkOffset, _dataChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Data stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _data;
end;

procedure TBrickletLCD128x64.RemoveGUIGraph(const aIndex: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_GUI_GRAPH, 9);
  LEConvertUInt8To(aIndex, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.RemoveAllGUI;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_REMOVE_ALL_GUI, 8);
  SendRequest(_request);
end;

procedure TBrickletLCD128x64.SetTouchLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_TOUCH_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletLCD128x64.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
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

procedure TBrickletLCD128x64.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletLCD128x64.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLCD128x64.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletLCD128x64.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LCD_128X64_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLCD128x64.CallbackWrapperTouchPosition(const packet: TDynamicByteArray);
var
  _pressure: word;
  _x: word;
  _y: word;
  _age: longword;
begin
  _pressure:= LEConvertUInt16From(8, packet);
  _x:= LEConvertUInt16From(10, packet);
  _y:= LEConvertUInt16From(12, packet);
  _age:= LEConvertUInt32From(14, packet);

  if (Assigned(fTouchPositionCallback)) then begin
    fTouchPositionCallback(self, _pressure, _x, _y, _age);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperTouchGesture(const packet: TDynamicByteArray);
var
  _gesture: byte;
  _duration: longword;
  _pressureMax: word;
  _xStart: word;
  _yStart: word;
  _xEnd: word;
  _yEnd: word;
  _age: longword;
begin
  _gesture:= LEConvertUInt8From(8, packet);
  _duration:= LEConvertUInt32From(9, packet);
  _pressureMax:= LEConvertUInt16From(13, packet);
  _xStart:= LEConvertUInt16From(15, packet);
  _yStart:= LEConvertUInt16From(17, packet);
  _xEnd:= LEConvertUInt16From(19, packet);
  _yEnd:= LEConvertUInt16From(21, packet);
  _age:= LEConvertUInt32From(23, packet);

  if (Assigned(fTouchGestureCallback)) then begin
    fTouchGestureCallback(self, _gesture, _duration, _pressureMax, _xStart, _yStart, _xEnd, _yEnd, _age);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUIButtonPressed(const packet: TDynamicByteArray);
var
  _index: byte;
  _pressed: boolean;
begin
  _index:= LEConvertUInt8From(8, packet);
  _pressed:= LEConvertBooleanFrom(9, packet);

  if (Assigned(fGUIButtonPressedCallback)) then begin
    fGUIButtonPressedCallback(self, _index, _pressed);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUISliderValue(const packet: TDynamicByteArray);
var
  _index: byte;
  _value: byte;
begin
  _index:= LEConvertUInt8From(8, packet);
  _value:= LEConvertUInt8From(9, packet);

  if (Assigned(fGUISliderValueCallback)) then begin
    fGUISliderValueCallback(self, _index, _value);
  end;
end;

procedure TBrickletLCD128x64.CallbackWrapperGUITabSelected(const packet: TDynamicByteArray);
var
  _index: shortint;
begin
  _index:= LEConvertInt8From(8, packet);

  if (Assigned(fGUITabSelectedCallback)) then begin
    fGUITabSelectedCallback(self, _index);
  end;
end;

end.
