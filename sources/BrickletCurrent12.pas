{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCurrent12;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCurrent12.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletCurrent12 = class;
  TBrickletCurrent12NotifyCurrent = procedure(aSender: TBrickletCurrent12; const current: smallint) of object;
  TBrickletCurrent12NotifyAnalogValue = procedure(aSender: TBrickletCurrent12; const value: word) of object;
  TBrickletCurrent12NotifyCurrentReached = procedure(aSender: TBrickletCurrent12; const current: smallint) of object;
  TBrickletCurrent12NotifyAnalogValueReached = procedure(aSender: TBrickletCurrent12; const value: word) of object;
  TBrickletCurrent12NotifyOverCurrent = procedure(aSender: TBrickletCurrent12) of object;

  /// <summary>
  ///  Measures AC/DC current between -12.5A and +12.5A
  /// </summary>
  TBrickletCurrent12 = class(TDevice)
  private
    currentCallback: TBrickletCurrent12NotifyCurrent;
    analogValueCallback: TBrickletCurrent12NotifyAnalogValue;
    currentReachedCallback: TBrickletCurrent12NotifyCurrentReached;
    analogValueReachedCallback: TBrickletCurrent12NotifyAnalogValueReached;
    overCurrentCallback: TBrickletCurrent12NotifyOverCurrent;
  protected
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperOverCurrent(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current of the sensor.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrent"/> callback and set the period with
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent: smallint; virtual;

    /// <summary>
    ///  Calibrates the 0 value of the sensor. You have to call this function
    ///  when there is no current present.
    ///  
    ///  The zero point of the current sensor
    ///  is depending on the exact properties of the analog-to-digital converter,
    ///  the length of the Bricklet cable and the temperature. Thus, if you change
    ///  the Brick or the environment in which the Bricklet is used, you might
    ///  have to recalibrate.
    ///  
    ///  The resulting calibration will be saved on the EEPROM of the Current
    ///  Bricklet.
    /// </summary>
    procedure Calibrate; virtual;

    /// <summary>
    ///  Returns *true* if more than 12.5A were measured.
    ///  
    ///  <note>
    ///   To reset this value you have to power cycle the Bricklet.
    ///  </note>
    /// </summary>
    function IsOverCurrent: boolean; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletCurrent12.TBrickletCurrent12.GetCurrent"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletCurrent12.TBrickletCurrent12.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletCurrent12.TBrickletCurrent12.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrent"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrent"/> callback is only triggered if the current has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrentReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetCurrentCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValueReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrentReached"/>,
    ///  * <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletCurrent12.TBrickletCurrent12.OnCurrent"/> callback is only triggered if the current has changed since
    ///  the last triggering.
    /// </summary>
    property OnCurrent: TBrickletCurrent12NotifyCurrent read currentCallback write currentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value
    ///  of the sensor.
    ///  
    ///  The <see cref="BrickletCurrent12.TBrickletCurrent12.OnAnalogValue"/> callback is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletCurrent12NotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletCurrent12NotifyCurrentReached read currentReachedCallback write currentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent12.TBrickletCurrent12.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent12.TBrickletCurrent12.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletCurrent12NotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;

    /// <summary>
    ///  This callback is triggered when an over current is measured
    ///  (see <see cref="BrickletCurrent12.TBrickletCurrent12.IsOverCurrent"/>).
    /// </summary>
    property OnOverCurrent: TBrickletCurrent12NotifyOverCurrent read overCurrentCallback write overCurrentCallback;
  end;

implementation

procedure TBrickletCurrent12.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCurrent12.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_IS_OVER_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_SET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT12_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCurrent12.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CURRENT12_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  aCallBacks[BRICKLET_CURRENT12_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_CURRENT12_CALLBACK_CURRENT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
  aCallBacks[BRICKLET_CURRENT12_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
  aCallBacks[BRICKLET_CURRENT12_CALLBACK_OVER_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperOverCurrent;
end;

function TBrickletCurrent12.GetCurrent: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCurrent12.Calibrate;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_CALIBRATE, 8);
  SendRequest(_request);
end;

function TBrickletCurrent12.IsOverCurrent: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_IS_OVER_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletCurrent12.GetAnalogValue: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCurrent12.SetCurrentCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent12.GetCurrentCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent12.SetAnalogValueCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent12.GetAnalogValueCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent12.SetCurrentCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt16To(min, 9, _request);
  LEConvertInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletCurrent12.GetCurrentCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt16From(9, _response);
  max:= LEConvertInt16From(11, _response);
end;

procedure TBrickletCurrent12.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletCurrent12.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletCurrent12.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent12.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent12.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT12_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCurrent12.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var current: smallint;
begin
  current:= LEConvertInt16From(8, aPacket);

  if (Assigned(currentCallback)) then begin
    currentCallback(self, current);
  end;
end;

procedure TBrickletCurrent12.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var value: word;
begin
  value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(analogValueCallback)) then begin
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletCurrent12.CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray);
var current: smallint;
begin
  current:= LEConvertInt16From(8, aPacket);

  if (Assigned(currentReachedCallback)) then begin
    currentReachedCallback(self, current);
  end;
end;

procedure TBrickletCurrent12.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var value: word;
begin
  value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(analogValueReachedCallback)) then begin
    analogValueReachedCallback(self, value);
  end;
end;

procedure TBrickletCurrent12.CallbackWrapperOverCurrent(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(overCurrentCallback)) then begin
    overCurrentCallback(self);
  end;
end;

end.
