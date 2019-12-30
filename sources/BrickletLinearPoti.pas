{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLinearPoti;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLinearPoti.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLinearPoti = class;
  TBrickletLinearPotiNotifyPosition = procedure(aSender: TBrickletLinearPoti; const position: word) of object;
  TBrickletLinearPotiNotifyAnalogValue = procedure(aSender: TBrickletLinearPoti; const value: word) of object;
  TBrickletLinearPotiNotifyPositionReached = procedure(aSender: TBrickletLinearPoti; const position: word) of object;
  TBrickletLinearPotiNotifyAnalogValueReached = procedure(aSender: TBrickletLinearPoti; const value: word) of object;

  /// <summary>
  ///  59mm linear potentiometer
  /// </summary>
  TBrickletLinearPoti = class(TDevice)
  private
    fPositionCallback: TBrickletLinearPotiNotifyPosition;
    fAnalogValueCallback: TBrickletLinearPotiNotifyAnalogValue;
    fPositionReachedCallback: TBrickletLinearPotiNotifyPositionReached;
    fAnalogValueReachedCallback: TBrickletLinearPotiNotifyAnalogValueReached;
    procedure CallbackWrapperPosition(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the position of the linear potentiometer. The value is
    ///  between 0 (slider down) and 100 (slider up).
    ///  
    ///  If you want to get the position periodically, it is recommended to use the
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPosition"/> callback and set the period with
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPosition: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetPosition"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletLinearPoti.TBrickletLinearPoti.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPosition"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPosition"/> callback is only triggered if the position has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetPositionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>.
    /// </summary>
    function GetPositionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPositionReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the position is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the position is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the position is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the position is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetPositionCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/>.
    /// </summary>
    procedure GetPositionCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValueReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPositionReached"/>,
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/>,
    ///  * <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackPeriod"/>. The parameter is the position
    ///  of the linear potentiometer.
    ///  
    ///  The <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnPosition"/> callback is only triggered if the position has changed
    ///  since the last triggering.
    /// </summary>
    property OnPosition: TBrickletLinearPotiNotifyPosition read fPositionCallback write fPositionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  Linear Potentiometer.
    ///  
    ///  The <see cref="BrickletLinearPoti.TBrickletLinearPoti.OnAnalogValue"/> callback is only triggered if the position has changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletLinearPotiNotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetPositionCallbackThreshold"/> is reached.
    ///  The parameter is the position of the linear potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnPositionReached: TBrickletLinearPotiNotifyPositionReached read fPositionReachedCallback write fPositionReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the linear potentiometer.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLinearPoti.TBrickletLinearPoti.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletLinearPotiNotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;
  end;

implementation

procedure TBrickletLinearPoti.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletLinearPoti.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINEAR_POTI_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLinearPoti.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LINEAR_POTI_CALLBACK_POSITION]:= {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  aCallBacks[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_LINEAR_POTI_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  aCallBacks[BRICKLET_LINEAR_POTI_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletLinearPoti.GetPosition: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletLinearPoti.GetAnalogValue: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLinearPoti.SetPositionCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletLinearPoti.GetPositionCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLinearPoti.SetAnalogValueCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletLinearPoti.GetAnalogValueCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLinearPoti.SetPositionCallbackThreshold(const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLinearPoti.GetPositionCallbackThreshold(out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLinearPoti.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLinearPoti.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLinearPoti.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletLinearPoti.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLinearPoti.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINEAR_POTI_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLinearPoti.CallbackWrapperPosition(const aPacket: TDynamicByteArray);
var position: word;
begin
  position:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fPositionCallback)) then begin
    fPositionCallback(self, position);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var value: word;
begin
  value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, value);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var position: word;
begin
  position:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fPositionReachedCallback)) then begin
    fPositionReachedCallback(self, position);
  end;
end;

procedure TBrickletLinearPoti.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var value: word;
begin
  value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, value);
  end;
end;

end.
