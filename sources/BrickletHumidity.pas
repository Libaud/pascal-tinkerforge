{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletHumidity;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletHumidity.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletHumidity = class;
  TBrickletHumidityNotifyHumidity = procedure(aSender: TBrickletHumidity; const aHumidity: word) of object;
  TBrickletHumidityNotifyAnalogValue = procedure(aSender: TBrickletHumidity; const aValue: word) of object;
  TBrickletHumidityNotifyHumidityReached = procedure(aSender: TBrickletHumidity; const aHumidity: word) of object;
  TBrickletHumidityNotifyAnalogValueReached = procedure(aSender: TBrickletHumidity; const aValue: word) of object;

  /// <summary>
  ///  Measures relative humidity
  /// </summary>
  TBrickletHumidity = class(TDevice)
  private
    fHumidityCallback: TBrickletHumidityNotifyHumidity;
    fAnalogValueCallback: TBrickletHumidityNotifyAnalogValue;
    fHumidityReachedCallback: TBrickletHumidityNotifyHumidityReached;
    fAnalogValueReachedCallback: TBrickletHumidityNotifyAnalogValueReached;
    procedure CallbackWrapperHumidity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperHumidityReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the humidity of the sensor.
    ///  
    ///  If you want to get the humidity periodically, it is recommended to use the
    ///  <see cref="BrickletHumidity.TBrickletHumidity.OnHumidity"/> callback and set the period with
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>.
    /// </summary>
    function GetHumidity: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletHumidity.TBrickletHumidity.GetHumidity"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletHumidity.TBrickletHumidity.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The returned humidity value is calibrated for
    ///   room temperatures, if you use the sensor in extreme cold or extreme
    ///   warm environments, you might want to calculate the humidity from
    ///   the analog value yourself. See the `HIH 5030 datasheet
    ///   &lt;https://github.com/Tinkerforge/humidity-bricklet/raw/master/datasheets/hih-5030.pdf&gt;`__.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletHumidity.TBrickletHumidity.OnHumidity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletHumidity.TBrickletHumidity.OnHumidity"/> callback is only triggered if the humidity has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetHumidityCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>.
    /// </summary>
    function GetHumidityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletHumidity.TBrickletHumidity.OnHumidityReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the humidity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the humidity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the humidity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the humidity is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetHumidityCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/>.
    /// </summary>
    procedure GetHumidityCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValueReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.OnHumidityReached"/>,
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/>,
    ///  * <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackPeriod"/>. The parameter is the humidity of
    ///  the sensor.
    ///  
    ///  The <see cref="BrickletHumidity.TBrickletHumidity.OnHumidity"/> callback is only triggered if the humidity has changed since
    ///  the last triggering.
    /// </summary>
    property OnHumidity: TBrickletHumidityNotifyHumidity read fHumidityCallback write fHumidityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackPeriod"/>. The parameter is the analog
    ///  value of the sensor.
    ///  
    ///  The <see cref="BrickletHumidity.TBrickletHumidity.OnAnalogValue"/> callback is only triggered if the humidity has changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletHumidityNotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetHumidityCallbackThreshold"/> is reached.
    ///  The parameter is the humidity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
    /// </summary>
    property OnHumidityReached: TBrickletHumidityNotifyHumidityReached read fHumidityReachedCallback write fHumidityReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletHumidity.TBrickletHumidity.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletHumidity.TBrickletHumidity.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletHumidityNotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;
  end;

implementation

procedure TBrickletHumidity.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletHumidity.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HUMIDITY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletHumidity.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY]:= {$ifdef FPC}@{$endif}CallbackWrapperHumidity;
  aCallBacks[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_HUMIDITY_CALLBACK_HUMIDITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperHumidityReached;
  aCallBacks[BRICKLET_HUMIDITY_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletHumidity.GetHumidity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletHumidity.GetAnalogValue: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletHumidity.SetHumidityCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidity.GetHumidityCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHumidity.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidity.GetAnalogValueCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHumidity.SetHumidityCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_HUMIDITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletHumidity.GetHumidityCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_HUMIDITY_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletHumidity.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletHumidity.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletHumidity.SetDebouncePeriod(const aDebounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletHumidity.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHumidity.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HUMIDITY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletHumidity.CallbackWrapperHumidity(const aPacket: TDynamicByteArray);
var
  _Humidity: word;
begin
  _Humidity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fHumidityCallback)) then begin
    fHumidityCallback(self, _Humidity);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _Value: word;
begin
  _Value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _Value);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperHumidityReached(const aPacket: TDynamicByteArray);
var
  _Humidity: word;
begin
  _Humidity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fHumidityReachedCallback)) then begin
    fHumidityReachedCallback(self, _Humidity);
  end;
end;

procedure TBrickletHumidity.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _Value: word;
begin
  _Value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _Value);
  end;
end;

end.
