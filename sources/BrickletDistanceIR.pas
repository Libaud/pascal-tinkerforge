{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDistanceIR;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDistanceIR.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDistanceIR = class;
  TBrickletDistanceIRNotifyDistance = procedure(aSender: TBrickletDistanceIR; const aDistance: word) of object;
  TBrickletDistanceIRNotifyAnalogValue = procedure(aSender: TBrickletDistanceIR; const aValue: word) of object;
  TBrickletDistanceIRNotifyDistanceReached = procedure(aSender: TBrickletDistanceIR; const aDistance: word) of object;
  TBrickletDistanceIRNotifyAnalogValueReached = procedure(aSender: TBrickletDistanceIR; const aValue: word) of object;

  /// <summary>
  ///  Measures distance up to 150cm with infrared light
  /// </summary>
  TBrickletDistanceIR = class(TDevice)
  private
    distanceCallback: TBrickletDistanceIRNotifyDistance;
    analogValueCallback: TBrickletDistanceIRNotifyAnalogValue;
    distanceReachedCallback: TBrickletDistanceIRNotifyDistanceReached;
    analogValueReachedCallback: TBrickletDistanceIRNotifyAnalogValueReached;
  protected
    procedure CallbackWrapperDistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the distance measured by the sensor. Possible
    ///  distance ranges are 40 to 300, 100 to 800 and 200 to 1500, depending on the
    ///  selected IR sensor.
    ///  
    ///  If you want to get the distance periodically, it is recommended to use the
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistance"/> callback and set the period with
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistance: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetDistance"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletDistanceIR.TBrickletDistanceIR.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets a sampling point value to a specific position of the lookup table.
    ///  The lookup table comprises 128 equidistant analog values with
    ///  corresponding distances.
    ///  
    ///  If you measure a distance of 50cm at the analog value 2048, you
    ///  should call this function with (64, 5000). The utilized analog-to-digital
    ///  converter has a resolution of 12 bit. With 128 sampling points on the
    ///  whole range, this means that every sampling point has a size of 32
    ///  analog values. Thus the analog value 2048 has the corresponding sampling
    ///  point 64 = 2048/32.
    ///  
    ///  Sampling points are saved on the EEPROM of the Distance IR Bricklet and
    ///  loaded again on startup.
    ///  
    ///  <note>
    ///   An easy way to calibrate the sampling points of the Distance IR Bricklet is
    ///   implemented in the Brick Viewer. If you want to calibrate your Bricklet it is
    ///   highly recommended to use this implementation.
    ///  </note>
    /// </summary>
    procedure SetSamplingPoint(const aPosition: byte; const aDistance: word); virtual;

    /// <summary>
    ///  Returns the distance to a sampling point position as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetSamplingPoint"/>.
    /// </summary>
    function GetSamplingPoint(const aPosition: byte): word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistance"/> callback is only triggered if the distance has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistanceReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValueReached"/> callback.
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
    ///  Returns the threshold as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistanceReached"/>,
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/>,
    ///  * <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackPeriod"/>. The parameter is the distance of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnDistance"/> callback is only triggered if the distance has changed since the
    ///  last triggering.
    /// </summary>
    property OnDistance: TBrickletDistanceIRNotifyDistance read distanceCallback write distanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletDistanceIR.TBrickletDistanceIR.OnAnalogValue"/> callback is only triggered if the analog value has changed
    ///  since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletDistanceIRNotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletDistanceIRNotifyDistanceReached read distanceReachedCallback write distanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceIR.TBrickletDistanceIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletDistanceIRNotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

procedure TBrickletDistanceIR.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletDistanceIR.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_SAMPLING_POINT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_SAMPLING_POINT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDistanceIR.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  aCallBacks[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_DISTANCE_IR_CALLBACK_DISTANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
  aCallBacks[BRICKLET_DISTANCE_IR_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletDistanceIR.GetDistance: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletDistanceIR.GetAnalogValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDistanceIR.SetSamplingPoint(const aPosition: byte; const aDistance: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_SAMPLING_POINT, 11);
  LEConvertUInt8To(aPosition, 8, _request);
  LEConvertUInt16To(aDistance, 9, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIR.GetSamplingPoint(const aPosition: byte): word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_SAMPLING_POINT, 9);
  LEConvertUInt8To(aPosition, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDistanceIR.SetDistanceCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIR.GetDistanceCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceIR.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIR.GetAnalogValueCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceIR.SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletDistanceIR.GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletDistanceIR.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletDistanceIR.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletDistanceIR.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIR.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceIR.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDistanceIR.CallbackWrapperDistance(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(distanceCallback)) then begin
    distanceCallback(self, _distance);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(analogValueCallback)) then begin
    analogValueCallback(self, _value);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(distanceReachedCallback)) then begin
    distanceReachedCallback(self, _distance);
  end;
end;

procedure TBrickletDistanceIR.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(analogValueReachedCallback)) then begin
    analogValueReachedCallback(self, _value);
  end;
end;

end.
