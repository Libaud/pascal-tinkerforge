{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDistanceUS;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDistanceUS.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDistanceUS = class;
  TBrickletDistanceUSNotifyDistance = procedure(aSender: TBrickletDistanceUS; const aDistance: word) of object;
  TBrickletDistanceUSNotifyDistanceReached = procedure(aSender: TBrickletDistanceUS; const aDistance: word) of object;

  /// <summary>
  ///  Measures distance between 2cm and 400cm with ultrasound
  /// </summary>
  TBrickletDistanceUS = class(TDevice)
  private
    fDistanceCallback: TBrickletDistanceUSNotifyDistance;
    fDistanceReachedCallback: TBrickletDistanceUSNotifyDistanceReached;
    procedure CallbackWrapperDistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current distance value measured by the sensor.
    ///  A small value corresponds to a small distance, a big
    ///  value corresponds to a big distance. The relation between the measured distance
    ///  value and the actual distance is affected by the 5V supply voltage (deviations
    ///  in the supply voltage Result in deviations in the distance values) and is
    ///  non-linear (resolution is bigger at close range).
    ///  
    ///  If you want to get the distance value periodically, it is recommended to
    ///  use the <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistance"/> callback and set the period with
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  Der <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistance"/> callback is only triggered if the distance value has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistanceReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistanceReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the distance value.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const aAverage: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

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
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackPeriod"/>. The parameter is the distance value
    ///  of the sensor.
    ///  
    ///  The <see cref="BrickletDistanceUS.TBrickletDistanceUS.OnDistance"/> callback is only triggered if the distance value has changed
    ///  since the last triggering.
    /// </summary>
    property OnDistance: TBrickletDistanceUSNotifyDistance read fDistanceCallback write fDistanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDistanceUS.TBrickletDistanceUS.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletDistanceUSNotifyDistanceReached read fDistanceReachedCallback write fDistanceReachedCallback;
  end;

implementation

procedure TBrickletDistanceUS.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletDistanceUS.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_US_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDistanceUS.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  aCallBacks[BRICKLET_DISTANCE_US_CALLBACK_DISTANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
end;

function TBrickletDistanceUS.GetDistanceValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDistanceUS.SetDistanceCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceUS.GetDistanceCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceUS.SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletDistanceUS.GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletDistanceUS.SetDebouncePeriod(const aDebounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceUS.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceUS.SetMovingAverage(const aAverage: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(aAverage, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceUS.GetMovingAverage: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDistanceUS.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_US_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDistanceUS.CallbackWrapperDistance(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDistanceCallback)) then begin
    fDistanceCallback(self, _distance);
  end;
end;

procedure TBrickletDistanceUS.CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDistanceReachedCallback)) then begin
    fDistanceReachedCallback(self, _distance);
  end;
end;

end.
