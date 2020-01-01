{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCurrent25;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCurrent25.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletCurrent25 = class;
  TBrickletCurrent25NotifyCurrent = procedure(aSender: TBrickletCurrent25; const aCurrent: smallint) of object;
  TBrickletCurrent25NotifyAnalogValue = procedure(aSender: TBrickletCurrent25; const aValue: word) of object;
  TBrickletCurrent25NotifyCurrentReached = procedure(aSender: TBrickletCurrent25; const aCurrent: smallint) of object;
  TBrickletCurrent25NotifyAnalogValueReached = procedure(aSender: TBrickletCurrent25; const aValue: word) of object;
  TBrickletCurrent25NotifyOverCurrent = procedure(aSender: TBrickletCurrent25) of object;

  /// <summary>
  ///  Measures AC/DC current between -25A and +25A
  /// </summary>
  TBrickletCurrent25 = class(TDevice)
  private
    fCurrentCallback: TBrickletCurrent25NotifyCurrent;
    fAnalogValueCallback: TBrickletCurrent25NotifyAnalogValue;
    fCurrentReachedCallback: TBrickletCurrent25NotifyCurrentReached;
    fAnalogValueReachedCallback: TBrickletCurrent25NotifyAnalogValueReached;
    fOverCurrentCallback: TBrickletCurrent25NotifyOverCurrent;
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperOverCurrent(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current of the sensor.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrent"/> callback and set the period with
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>.
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
    ///  Returns *true* if more than 25A were measured.
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
    ///   The value returned by <see cref="BrickletCurrent25.TBrickletCurrent25.GetCurrent"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletCurrent25.TBrickletCurrent25.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletCurrent25.TBrickletCurrent25.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrent"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrent"/> callback is only triggered if the current has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrentReached"/> callback.
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
    procedure SetCurrentCallbackThreshold(const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValueReached"/> callback.
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
    procedure SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrentReached"/>,
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/>,
    ///  * <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletCurrent25.TBrickletCurrent25.OnCurrent"/> callback is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnCurrent: TBrickletCurrent25NotifyCurrent read fCurrentCallback write fCurrentCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletCurrent25.TBrickletCurrent25.OnAnalogValue"/> callback is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletCurrent25NotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletCurrent25NotifyCurrentReached read fCurrentReachedCallback write fCurrentReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCurrent25.TBrickletCurrent25.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCurrent25.TBrickletCurrent25.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletCurrent25NotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;

    /// <summary>
    ///  This callback is triggered when an over current is measured
    ///  (see <see cref="BrickletCurrent25.TBrickletCurrent25.IsOverCurrent"/>).
    /// </summary>
    property OnOverCurrent: TBrickletCurrent25NotifyOverCurrent read fOverCurrentCallback write fOverCurrentCallback;
  end;

implementation

procedure TBrickletCurrent25.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCurrent25.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_IS_OVER_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CURRENT25_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCurrent25.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CURRENT25_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  aCallBacks[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_CURRENT25_CALLBACK_CURRENT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
  aCallBacks[BRICKLET_CURRENT25_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
  aCallBacks[BRICKLET_CURRENT25_CALLBACK_OVER_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperOverCurrent;
end;

function TBrickletCurrent25.GetCurrent: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCurrent25.Calibrate;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_CALIBRATE, 8);
  SendRequest(_request);
end;

function TBrickletCurrent25.IsOverCurrent: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_IS_OVER_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletCurrent25.GetAnalogValue: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCurrent25.SetCurrentCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent25.GetCurrentCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent25.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent25.GetAnalogValueCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent25.SetCurrentCallbackThreshold(const aOption: char; const aMin: smallint; const aMax: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt16To(aMin, 9, _request);
  LEConvertInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletCurrent25.GetCurrentCallbackThreshold(out aOption: char; out aMin: smallint; out aMax: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt16From(9, _response);
  aMax:= LEConvertInt16From(11, _response);
end;

procedure TBrickletCurrent25.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletCurrent25.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletCurrent25.SetDebouncePeriod(const aDebounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletCurrent25.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCurrent25.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CURRENT25_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCurrent25.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var
  _current: smallint;
begin
  _current:= LEConvertInt16From(8, aPacket);

  if (Assigned(fCurrentCallback)) then begin
    fCurrentCallback(self, _current);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _value);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray);
var
  _current: smallint;
begin
  _current:= LEConvertInt16From(8, aPacket);

  if (Assigned(fCurrentReachedCallback)) then begin
    fCurrentReachedCallback(self, _current);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _value);
  end;
end;

procedure TBrickletCurrent25.CallbackWrapperOverCurrent(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fOverCurrentCallback)) then begin
    fOverCurrentCallback(self);
  end;
end;

end.
