{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletJoystick;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletJoystick.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletJoystick = class;
  TBrickletJoystickNotifyPosition = procedure(aSender: TBrickletJoystick; const aX: smallint; const aY: smallint) of object;
  TBrickletJoystickNotifyAnalogValue = procedure(aSender: TBrickletJoystick; const aX: word; const aY: word) of object;
  TBrickletJoystickNotifyPositionReached = procedure(aSender: TBrickletJoystick; const aX: smallint; const aY: smallint) of object;
  TBrickletJoystickNotifyAnalogValueReached = procedure(aSender: TBrickletJoystick; const aX: word; const aY: word) of object;
  TBrickletJoystickNotifyPressed = procedure(aSender: TBrickletJoystick) of object;
  TBrickletJoystickNotifyReleased = procedure(aSender: TBrickletJoystick) of object;

  /// <summary>
  ///  2-axis joystick with push-button
  /// </summary>
  TBrickletJoystick = class(TDevice)
  private
    fPositionCallback: TBrickletJoystickNotifyPosition;
    fAnalogValueCallback: TBrickletJoystickNotifyAnalogValue;
    fPositionReachedCallback: TBrickletJoystickNotifyPositionReached;
    fAnalogValueReachedCallback: TBrickletJoystickNotifyAnalogValueReached;
    fPressedCallback: TBrickletJoystickNotifyPressed;
    fReleasedCallback: TBrickletJoystickNotifyReleased;
    procedure CallbackWrapperPosition(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPressed(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperReleased(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the position of the joystick. The middle position of the joystick is x=0, y=0.
    ///  The returned values are averaged and calibrated (see <see cref="BrickletJoystick.TBrickletJoystick.Calibrate"/>).
    ///  
    ///  If you want to get the position periodically, it is recommended to use the
    ///  <see cref="BrickletJoystick.TBrickletJoystick.OnPosition"/> callback and set the period with
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>.
    /// </summary>
    procedure GetPosition(out aX: smallint; out aY: smallint); virtual;

    /// <summary>
    ///  Returns *true* if the button is pressed and *false* otherwise.
    ///  
    ///  It is recommended to use the <see cref="BrickletJoystick.TBrickletJoystick.OnPressed"/> and <see cref="BrickletJoystick.TBrickletJoystick.OnReleased"/> callbacks
    ///  to handle the button.
    /// </summary>
    function IsPressed: boolean; virtual;

    /// <summary>
    ///  Returns the values as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The values returned by <see cref="BrickletJoystick.TBrickletJoystick.GetPosition"/> are averaged over several samples
    ///   to yield less noise, while <see cref="BrickletJoystick.TBrickletJoystick.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletJoystick.TBrickletJoystick.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog values periodically, it is recommended to use the
    ///  <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    procedure GetAnalogValue(out aX: word; out aY: word); virtual;

    /// <summary>
    ///  Calibrates the middle position of the joystick. If your Joystick Bricklet
    ///  does not return x=0 and y=0 in the middle position, call this function
    ///  while the joystick is standing still in the middle position.
    ///  
    ///  The resulting calibration will be saved on the EEPROM of the Joystick
    ///  Bricklet, thus you only have to calibrate it once.
    /// </summary>
    procedure Calibrate; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletJoystick.TBrickletJoystick.OnPosition"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletJoystick.TBrickletJoystick.OnPosition"/> callback is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetPositionCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPositionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValue"/> callback is only triggered if the analog values have
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletJoystick.TBrickletJoystick.OnPositionReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the position is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the position is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the position is smaller than the min values (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the position is greater than the min values (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetPositionCallbackThreshold(const aOption: char; const aMinX: smallint; const aMaxX: smallint; const aMinY: smallint; const aMaxY: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out aOption: char; out aMinX: smallint; out aMaxX: smallint; out aMinY: smallint; out aMaxY: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValueReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog values are *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog values are *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog values are smaller than the min values (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog values are greater than the min values (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const aOption: char; const aMinX: word; const aMaxX: word; const aMinY: word; const aMaxY: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMinX: word; out aMaxX: word; out aMinY: word; out aMaxY: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.OnPositionReached"/>,
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/>,
    ///  * <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

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
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackPeriod"/>. The parameter is the position of the
    ///  joystick.
    ///  
    ///  The <see cref="BrickletJoystick.TBrickletJoystick.OnPosition"/> callback is only triggered if the position has changed since the
    ///  last triggering.
    /// </summary>
    property OnPosition: TBrickletJoystickNotifyPosition read fPositionCallback write fPositionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackPeriod"/>. The parameters are the
    ///  analog values of the joystick.
    ///  
    ///  The <see cref="BrickletJoystick.TBrickletJoystick.OnAnalogValue"/> callback is only triggered if the values have changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletJoystickNotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/> is reached.
    ///  The parameters are the position of the joystick.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
    /// </summary>
    property OnPositionReached: TBrickletJoystickNotifyPositionReached read fPositionReachedCallback write fPositionReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameters are the analog values of the joystick.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletJoystick.TBrickletJoystick.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletJoystickNotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;

    /// <summary>
    ///  This callback is triggered when the button is pressed.
    /// </summary>
    property OnPressed: TBrickletJoystickNotifyPressed read fPressedCallback write fPressedCallback;

    /// <summary>
    ///  This callback is triggered when the button is released.
    /// </summary>
    property OnReleased: TBrickletJoystickNotifyReleased read fReleasedCallback write fReleasedCallback;
  end;

implementation

procedure TBrickletJoystick.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletJoystick.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletJoystick.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_POSITION]:= {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_PRESSED]:= {$ifdef FPC}@{$endif}CallbackWrapperPressed;
  aCallBacks[BRICKLET_JOYSTICK_CALLBACK_RELEASED]:= {$ifdef FPC}@{$endif}CallbackWrapperReleased;
end;

procedure TBrickletJoystick.GetPosition(out aX: smallint; out aY: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
end;

function TBrickletJoystick.IsPressed: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletJoystick.GetAnalogValue(out aX: word; out aY: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertUInt16From(8, _response);
  aY:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletJoystick.Calibrate;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_CALIBRATE, 8);
  SendRequest(_request);
end;

procedure TBrickletJoystick.SetPositionCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletJoystick.GetPositionCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletJoystick.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletJoystick.GetAnalogValueCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletJoystick.SetPositionCallbackThreshold(const aOption: char; const aMinX: smallint; const aMaxX: smallint; const aMinY: smallint; const aMaxY: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt16To(aMinX, 9, _request);
  LEConvertInt16To(aMaxX, 11, _request);
  LEConvertInt16To(aMinY, 13, _request);
  LEConvertInt16To(aMaxY, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletJoystick.GetPositionCallbackThreshold(out aOption: char; out aMinX: smallint; out aMaxX: smallint; out aMinY: smallint; out aMaxY: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMinX:= LEConvertInt16From(9, _response);
  aMaxX:= LEConvertInt16From(11, _response);
  aMinY:= LEConvertInt16From(13, _response);
  aMaxY:= LEConvertInt16From(15, _response);
end;

procedure TBrickletJoystick.SetAnalogValueCallbackThreshold(const aOption: char; const aMinX: word; const aMaxX: word; const aMinY: word; const aMaxY: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMinX, 9, _request);
  LEConvertUInt16To(aMaxX, 11, _request);
  LEConvertUInt16To(aMinY, 13, _request);
  LEConvertUInt16To(aMaxY, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletJoystick.GetAnalogValueCallbackThreshold(out aOption: char; out aMinX: word; out aMaxX: word; out aMinY: word; out aMaxY: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMinX:= LEConvertUInt16From(9, _response);
  aMaxX:= LEConvertUInt16From(11, _response);
  aMinY:= LEConvertUInt16From(13, _response);
  aMaxY:= LEConvertUInt16From(15, _response);
end;

procedure TBrickletJoystick.SetDebouncePeriod(const aDebounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletJoystick.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletJoystick.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletJoystick.CallbackWrapperPosition(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);

  if (Assigned(fPositionCallback)) then begin
    fPositionCallback(self, _x, _y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _x: word; _y: word;
begin
  _x:= LEConvertUInt16From(8, aPacket);
  _y:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _x, _y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);

  if (Assigned(fPositionReachedCallback)) then begin
    fPositionReachedCallback(self, _x, _y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _x: word; _y: word;
begin
  _x:= LEConvertUInt16From(8, aPacket);
  _y:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _x, _y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperPressed(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fPressedCallback)) then begin
    fPressedCallback(self);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperReleased(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fReleasedCallback)) then begin
    fReleasedCallback(self);
  end;
end;

end.
