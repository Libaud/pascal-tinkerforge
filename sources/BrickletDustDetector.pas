{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDustDetector;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDustDetector.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDustDetector = class;
  TBrickletDustDetectorNotifyDustDensity = procedure(aSender: TBrickletDustDetector; const dustDensity: word) of object;
  TBrickletDustDetectorNotifyDustDensityReached = procedure(aSender: TBrickletDustDetector; const dustDensity: word) of object;

  /// <summary>
  ///  Measures dust density
  /// </summary>
  TBrickletDustDetector = class(TDevice)
  private
    fDustDensityCallback: TBrickletDustDetectorNotifyDustDensity;
    fDustDensityReachedCallback: TBrickletDustDetectorNotifyDustDensityReached;
    procedure CallbackWrapperDustDensity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDustDensityReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the dust density.
    ///  
    ///  If you want to get the dust density periodically, it is recommended
    ///  to use the <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensity"/> callback and set the period with
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>.
    /// </summary>
    function GetDustDensity: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensity"/> callback is only triggered if the dust density has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetDustDensityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>.
    /// </summary>
    function GetDustDensityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensityReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the dust density value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the dust density value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the dust density value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the dust density value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetDustDensityCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/>.
    /// </summary>
    procedure GetDustDensityCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensityReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the dust density.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetMovingAverage"/>.
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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>. The parameter is the
    ///  dust density of the sensor.
    ///  
    ///  Der <see cref="BrickletDustDetector.TBrickletDustDetector.OnDustDensity"/> callback is only triggered if the dust density value has
    ///  changed since the last triggering.
    /// </summary>
    property OnDustDensity: TBrickletDustDetectorNotifyDustDensity read fDustDensityCallback write fDustDensityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/> is reached.
    ///  The parameter is the dust density of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDebouncePeriod"/>.
    /// </summary>
    property OnDustDensityReached: TBrickletDustDetectorNotifyDustDensityReached read fDustDensityReachedCallback write fDustDensityReachedCallback;
  end;

implementation

procedure TBrickletDustDetector.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletDustDetector.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDustDetector.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY]:= {$ifdef FPC}@{$endif}CallbackWrapperDustDensity;
  aCallBacks[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperDustDensityReached;
end;

function TBrickletDustDetector.GetDustDensity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDustDetector.SetDustDensityCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletDustDetector.GetDustDensityCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDustDetector.SetDustDensityCallbackThreshold(const option: char; const min: word; const max: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletDustDetector.GetDustDensityCallbackThreshold(out option: char; out min: word; out max: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletDustDetector.SetDebouncePeriod(const debounce: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletDustDetector.GetDebouncePeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDustDetector.SetMovingAverage(const average: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, _request);
  SendRequest(_request);
end;

function TBrickletDustDetector.GetMovingAverage: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDustDetector.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDustDetector.CallbackWrapperDustDensity(const aPacket: TDynamicByteArray);
var
  _dustDensity: word;
begin
  _dustDensity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDustDensityCallback)) then begin
    fDustDensityCallback(self, _dustDensity);
  end;
end;

procedure TBrickletDustDetector.CallbackWrapperDustDensityReached(const aPacket: TDynamicByteArray);
var
  _dustDensity: word;
begin
  _dustDensity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDustDensityReachedCallback)) then begin
    fDustDensityReachedCallback(self, _dustDensity);
  end;
end;

end.
