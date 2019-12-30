{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMoisture;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMoisture.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMoisture = class;
  TBrickletMoistureNotifyMoisture = procedure(aSender: TBrickletMoisture; const aMoisture: word) of object;
  TBrickletMoistureNotifyMoistureReached = procedure(aSender: TBrickletMoisture; const aMoisture: word) of object;

  /// <summary>
  ///  Measures soil moisture
  /// </summary>
  TBrickletMoisture = class(TDevice)
  private
    fMoistureCallback: TBrickletMoistureNotifyMoisture;
    fMoistureReachedCallback: TBrickletMoistureNotifyMoistureReached;
    procedure CallbackWrapperMoisture(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMoistureReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the current moisture value.
    ///  A small value corresponds to little moisture, a big
    ///  value corresponds to much moisture.
    ///  
    ///  If you want to get the moisture value periodically, it is recommended
    ///  to use the <see cref="BrickletMoisture.TBrickletMoisture.OnMoisture"/> callback and set the period with
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>.
    /// </summary>
    function GetMoistureValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletMoisture.TBrickletMoisture.OnMoisture"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletMoisture.TBrickletMoisture.OnMoisture"/> callback is only triggered if the moisture value has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetMoistureCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>.
    /// </summary>
    function GetMoistureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletMoisture.TBrickletMoisture.OnMoistureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the moisture value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the moisture value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the moisture value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the moisture value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetMoistureCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/>.
    /// </summary>
    procedure GetMoistureCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletMoisture.TBrickletMoisture.OnMoistureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the moisture value.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const aAverage: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletMoisture.TBrickletMoisture.SetMovingAverage"/>.
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackPeriod"/>. The parameter is the
    ///  moisture value of the sensor.
    ///  
    ///  The <see cref="BrickletMoisture.TBrickletMoisture.OnMoisture"/> callback is only triggered if the moisture value has changed
    ///  since the last triggering.
    /// </summary>
    property OnMoisture: TBrickletMoistureNotifyMoisture read fMoistureCallback write fMoistureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletMoisture.TBrickletMoisture.SetMoistureCallbackThreshold"/> is reached.
    ///  The parameter is the moisture value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletMoisture.TBrickletMoisture.SetDebouncePeriod"/>.
    /// </summary>
    property OnMoistureReached: TBrickletMoistureNotifyMoistureReached read fMoistureReachedCallback write fMoistureReachedCallback;
  end;

implementation

procedure TBrickletMoisture.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletMoisture.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOISTURE_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMoisture.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MOISTURE_CALLBACK_MOISTURE]:= {$ifdef FPC}@{$endif}CallbackWrapperMoisture;
  aCallBacks[BRICKLET_MOISTURE_CALLBACK_MOISTURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperMoistureReached;
end;

function TBrickletMoisture.GetMoistureValue: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletMoisture.SetMoistureCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletMoisture.GetMoistureCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletMoisture.SetMoistureCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOISTURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletMoisture.GetMoistureCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOISTURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletMoisture.SetDebouncePeriod(const aDebounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletMoisture.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletMoisture.SetMovingAverage(const aAverage: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(aAverage, 8, _request);
  SendRequest(_request);
end;

function TBrickletMoisture.GetMovingAverage: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMoisture.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOISTURE_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMoisture.CallbackWrapperMoisture(const aPacket: TDynamicByteArray);
var
  _moisture: word;
begin
  _moisture:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fMoistureCallback)) then begin
    fMoistureCallback(self, _moisture);
  end;
end;

procedure TBrickletMoisture.CallbackWrapperMoistureReached(const aPacket: TDynamicByteArray);
var
  _moisture: word;
begin
  _moisture:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fMoistureReachedCallback)) then begin
    fMoistureReachedCallback(self, _moisture);
  end;
end;

end.
