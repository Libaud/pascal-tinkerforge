{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRotaryEncoder;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRotaryEncoder.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRotaryEncoder = class;
  TBrickletRotaryEncoderNotifyCount = procedure(aSender: TBrickletRotaryEncoder; const count: longint) of object;
  TBrickletRotaryEncoderNotifyCountReached = procedure(aSender: TBrickletRotaryEncoder; const count: longint) of object;
  TBrickletRotaryEncoderNotifyPressed = procedure(aSender: TBrickletRotaryEncoder) of object;
  TBrickletRotaryEncoderNotifyReleased = procedure(aSender: TBrickletRotaryEncoder) of object;

  /// <summary>
  ///  360° rotary encoder with push-button
  /// </summary>
  TBrickletRotaryEncoder = class(TDevice)
  private
    countCallback: TBrickletRotaryEncoderNotifyCount;
    countReachedCallback: TBrickletRotaryEncoderNotifyCountReached;
    pressedCallback: TBrickletRotaryEncoderNotifyPressed;
    releasedCallback: TBrickletRotaryEncoderNotifyReleased;
    procedure CallbackWrapperCount(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCountReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPressed(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperReleased(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current count of the encoder. If you set reset
    ///  to true, the count is set back to 0 directly after the
    ///  current count is read.
    ///  
    ///  The encoder has 24 steps per rotation
    ///  
    ///  Turning the encoder to the left decrements the counter,
    ///  so a negative count is possible.
    /// </summary>
    function GetCount(const reset: boolean): longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnCount"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnCount"/> callback is only triggered if the count has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetCountCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackPeriod"/>.
    /// </summary>
    function GetCountCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnCountReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the count is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the count is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the count is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the count is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCountCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/>.
    /// </summary>
    procedure GetCountCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnCountReached"/>
    ///  
    ///  is triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns *true* if the button is pressed and *false* otherwise.
    ///  
    ///  It is recommended to use the <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnPressed"/> and <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnReleased"/> callbacks
    ///  to handle the button.
    /// </summary>
    function IsPressed: boolean; virtual;

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
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackPeriod"/>. The parameter is the count of
    ///  the encoder.
    ///  
    ///  The <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.OnCount"/> callback is only triggered if the count has changed since the
    ///  last triggering.
    /// </summary>
    property OnCount: TBrickletRotaryEncoderNotifyCount read countCallback write countCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetCountCallbackThreshold"/> is reached.
    ///  The parameter is the count of the encoder.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletRotaryEncoder.TBrickletRotaryEncoder.SetDebouncePeriod"/>.
    /// </summary>
    property OnCountReached: TBrickletRotaryEncoderNotifyCountReached read countReachedCallback write countReachedCallback;

    /// <summary>
    ///  This callback is triggered when the button is pressed.
    /// </summary>
    property OnPressed: TBrickletRotaryEncoderNotifyPressed read pressedCallback write pressedCallback;

    /// <summary>
    ///  This callback is triggered when the button is released.
    /// </summary>
    property OnReleased: TBrickletRotaryEncoderNotifyReleased read releasedCallback write releasedCallback;
  end;

implementation

procedure TBrickletRotaryEncoder.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRotaryEncoder.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_IS_PRESSED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ROTARY_ENCODER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRotaryEncoder.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperCount;
  aCallBacks[BRICKLET_ROTARY_ENCODER_CALLBACK_COUNT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCountReached;
  aCallBacks[BRICKLET_ROTARY_ENCODER_CALLBACK_PRESSED]:= {$ifdef FPC}@{$endif}CallbackWrapperPressed;
  aCallBacks[BRICKLET_ROTARY_ENCODER_CALLBACK_RELEASED]:= {$ifdef FPC}@{$endif}CallbackWrapperReleased;
end;

function TBrickletRotaryEncoder.GetCount(const reset: boolean): longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT, 9);
  LEConvertBooleanTo(reset, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletRotaryEncoder.SetCountCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletRotaryEncoder.GetCountCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRotaryEncoder.SetCountCallbackThreshold(const aOption: char; const aMin: longint; const aMax: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_COUNT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt32To(aMin, 9, _request);
  LEConvertInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRotaryEncoder.GetCountCallbackThreshold(out aOption: char; out aMin: longint; out aMax: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_COUNT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletRotaryEncoder.SetDebouncePeriod(const aDebounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletRotaryEncoder.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

function TBrickletRotaryEncoder.IsPressed: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_IS_PRESSED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletRotaryEncoder.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ROTARY_ENCODER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRotaryEncoder.CallbackWrapperCount(const aPacket: TDynamicByteArray);
var count: longint;
begin
  count:= LEConvertInt32From(8, aPacket);

  if (Assigned(countCallback)) then begin
    countCallback(self, count);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperCountReached(const aPacket: TDynamicByteArray);
var count: longint;
begin
  count:= LEConvertInt32From(8, aPacket);

  if (Assigned(countReachedCallback)) then begin
    countReachedCallback(self, count);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperPressed(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(pressedCallback)) then begin
    pressedCallback(self);
  end;
end;

procedure TBrickletRotaryEncoder.CallbackWrapperReleased(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(releasedCallback)) then begin
    releasedCallback(self);
  end;
end;

end.
