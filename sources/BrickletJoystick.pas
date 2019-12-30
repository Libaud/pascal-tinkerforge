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
  TBrickletJoystickNotifyPosition = procedure(aSender: TBrickletJoystick; const x: smallint; const y: smallint) of object;
  TBrickletJoystickNotifyAnalogValue = procedure(aSender: TBrickletJoystick; const x: word; const y: word) of object;
  TBrickletJoystickNotifyPositionReached = procedure(aSender: TBrickletJoystick; const x: smallint; const y: smallint) of object;
  TBrickletJoystickNotifyAnalogValueReached = procedure(aSender: TBrickletJoystick; const x: word; const y: word) of object;
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
    procedure GetPosition(out x: smallint; out y: smallint); virtual;

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
    procedure GetAnalogValue(out x: word; out y: word); virtual;

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
    procedure SetPositionCallbackPeriod(const period: longword); virtual;

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
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

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
    procedure SetPositionCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint); virtual;

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
    procedure SetAnalogValueCallbackThreshold(const option: char; const minX: word; const maxX: word; const minY: word; const maxY: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletJoystick.TBrickletJoystick.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out minX: word; out maxX: word; out minY: word; out maxY: word); virtual;

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
    procedure SetDebouncePeriod(const debounce: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

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

procedure TBrickletJoystick.GetPosition(out x: smallint; out y: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION, 8);
  _response:= SendRequest(_request);
  x:= LEConvertInt16From(8, _response);
  y:= LEConvertInt16From(10, _response);
end;

function TBrickletJoystick.IsPressed: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_IS_PRESSED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletJoystick.GetAnalogValue(out x: word; out y: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  x:= LEConvertUInt16From(8, _response);
  y:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletJoystick.Calibrate;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_CALIBRATE, 8);
  SendRequest(_request);
end;

procedure TBrickletJoystick.SetPositionCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
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

procedure TBrickletJoystick.SetAnalogValueCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
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

procedure TBrickletJoystick.SetPositionCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt16To(minX, 9, _request);
  LEConvertInt16To(maxX, 11, _request);
  LEConvertInt16To(minY, 13, _request);
  LEConvertInt16To(maxY, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletJoystick.GetPositionCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  minX:= LEConvertInt16From(9, _response);
  maxX:= LEConvertInt16From(11, _response);
  minY:= LEConvertInt16From(13, _response);
  maxY:= LEConvertInt16From(15, _response);
end;

procedure TBrickletJoystick.SetAnalogValueCallbackThreshold(const option: char; const minX: word; const maxX: word; const minY: word; const maxY: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(minX, 9, _request);
  LEConvertUInt16To(maxX, 11, _request);
  LEConvertUInt16To(minY, 13, _request);
  LEConvertUInt16To(maxY, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletJoystick.GetAnalogValueCallbackThreshold(out option: char; out minX: word; out maxX: word; out minY: word; out maxY: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  minX:= LEConvertUInt16From(9, _response);
  maxX:= LEConvertUInt16From(11, _response);
  minY:= LEConvertUInt16From(13, _response);
  maxY:= LEConvertUInt16From(15, _response);
end;

procedure TBrickletJoystick.SetDebouncePeriod(const debounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
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

procedure TBrickletJoystick.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_JOYSTICK_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletJoystick.CallbackWrapperPosition(const aPacket: TDynamicByteArray);
var
  x: smallint; y: smallint;
begin
  x:= LEConvertInt16From(8, aPacket);
  y:= LEConvertInt16From(10, aPacket);

  if (Assigned(fPositionCallback)) then begin
    fPositionCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  x: word; y: word;
begin
  x:= LEConvertUInt16From(8, aPacket);
  y:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var
  x: smallint; y: smallint;
begin
  x:= LEConvertInt16From(8, aPacket);
  y:= LEConvertInt16From(10, aPacket);

  if (Assigned(fPositionReachedCallback)) then begin
    fPositionReachedCallback(self, x, y);
  end;
end;

procedure TBrickletJoystick.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  x: word; y: word;
begin
  x:= LEConvertUInt16From(8, aPacket);
  y:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, x, y);
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
