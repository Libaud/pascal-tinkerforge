{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLoadCell;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLoadCell.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLoadCell = class;
  TBrickletLoadCellNotifyWeight = procedure(sender: TBrickletLoadCell; const weight: longint) of object;
  TBrickletLoadCellNotifyWeightReached = procedure(sender: TBrickletLoadCell; const weight: longint) of object;

  /// <summary>
  ///  Measures weight with a load cell
  /// </summary>
  TBrickletLoadCell = class(TDevice)
  private
    weightCallback: TBrickletLoadCellNotifyWeight;
    weightReachedCallback: TBrickletLoadCellNotifyWeightReached;
    procedure CallbackWrapperWeight(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperWeightReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the currently measured weight.
    ///  
    ///  If you want to get the weight periodically, it is recommended
    ///  to use the <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeight"/> callback and set the period with
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>.
    /// </summary>
    function GetWeight: longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeight"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeight"/> callback is only triggered if the weight has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetWeightCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>.
    /// </summary>
    function GetWeightCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeightReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the weight is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the weight is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the weight is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the weight is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetWeightCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/>.
    /// </summary>
    procedure GetWeightCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeightReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the weight value.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

    /// <summary>
    ///  Turns the LED on.
    /// </summary>
    procedure LEDOn; virtual;

    /// <summary>
    ///  Turns the LED off.
    /// </summary>
    procedure LEDOff; virtual;

    /// <summary>
    ///  Returns *true* if the led is on, *false* otherwise.
    /// </summary>
    function IsLEDOn: boolean; virtual;

    /// <summary>
    ///  To calibrate your Load Cell Bricklet you have to
    ///  
    ///  * empty the scale and call this function with 0 and
    ///  * add a known weight to the scale and call this function with the weight.
    ///  
    ///  The calibration is saved in the EEPROM of the Bricklet and only
    ///  needs to be done once.
    ///  
    ///  We recommend to use the Brick Viewer for calibration, you don't need
    ///  to call this function in your source code.
    /// </summary>
    procedure Calibrate(const weight: longword); virtual;

    /// <summary>
    ///  Sets the currently measured weight as tare weight.
    /// </summary>
    procedure Tare; virtual;

    /// <summary>
    ///  The measurement rate and gain are configurable.
    ///  
    ///  The rate can be either 10Hz or 80Hz. A faster rate will produce more noise.
    ///  It is additionally possible to add a moving average
    ///  (see <see cref="BrickletLoadCell.TBrickletLoadCell.SetMovingAverage"/>) to the measurements.
    ///  
    ///  The gain can be 128x, 64x or 32x. It represents a measurement range of
    ///  ±20mV, ±40mV and ±80mV respectively. The Load Cell Bricklet uses an
    ///  excitation voltage of 5V and most load cells use an output of 2mV/V. That
    ///  means the voltage range is ±15mV for most load cells (i.e. gain of 128x
    ///  is best). If you don't know what all of this means you should keep it at
    ///  128x, it will most likely be correct.
    ///  
    ///  The configuration is saved in the EEPROM of the Bricklet and only
    ///  needs to be done once.
    ///  
    ///  We recommend to use the Brick Viewer for configuration, you don't need
    ///  to call this function in your source code.
    /// </summary>
    procedure SetConfiguration(const rate: byte; const gain: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out rate: byte; out gain: byte); virtual;

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
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>. The parameter is the weight
    ///  as measured by the load cell.
    ///  
    ///  The <see cref="BrickletLoadCell.TBrickletLoadCell.OnWeight"/> callback is only triggered if the weight has changed since the
    ///  last triggering.
    /// </summary>
    property OnWeight: TBrickletLoadCellNotifyWeight read weightCallback write weightCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/> is reached.
    ///  The parameter is the weight as measured by the load cell.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetDebouncePeriod"/>.
    /// </summary>
    property OnWeightReached: TBrickletLoadCellNotifyWeightReached read weightReachedCallback write weightReachedCallback;
  end;

implementation

procedure TBrickletLoadCell.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletLoadCell.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_LED_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_LED_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_IS_LED_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_TARE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLoadCell.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT]:= {$ifdef FPC}@{$endif}CallbackWrapperWeight;
  aCallBacks[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperWeightReached;
end;

function TBrickletLoadCell.GetWeight: longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletLoadCell.SetWeightCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletLoadCell.GetWeightCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLoadCell.SetWeightCallbackThreshold(const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt32To(min, 9, _request);
  LEConvertInt32To(max, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletLoadCell.GetWeightCallbackThreshold(out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt32From(9, _response);
  max:= LEConvertInt32From(13, _response);
end;

procedure TBrickletLoadCell.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletLoadCell.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLoadCell.SetMovingAverage(const average: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, _request);
  SendRequest(_request);
end;

function TBrickletLoadCell.GetMovingAverage: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLoadCell.LEDOn;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_LED_ON, 8);
  SendRequest(_request);
end;

procedure TBrickletLoadCell.LEDOff;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_LED_OFF, 8);
  SendRequest(_request);
end;

function TBrickletLoadCell.IsLEDOn: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_IS_LED_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLoadCell.Calibrate(const weight: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_CALIBRATE, 12);
  LEConvertUInt32To(weight, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletLoadCell.Tare;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_TARE, 8);
  SendRequest(_request);
end;

procedure TBrickletLoadCell.SetConfiguration(const rate: byte; const gain: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(rate, 8, _request);
  LEConvertUInt8To(gain, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLoadCell.GetConfiguration(out rate: byte; out gain: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  rate:= LEConvertUInt8From(8, _response);
  gain:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletLoadCell.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLoadCell.CallbackWrapperWeight(const aPacket: TDynamicByteArray);
var weight: longint;
begin
  weight:= LEConvertInt32From(8, aPacket);

  if (Assigned(weightCallback)) then begin
    weightCallback(self, weight);
  end;
end;

procedure TBrickletLoadCell.CallbackWrapperWeightReached(const aPacket: TDynamicByteArray);
var weight: longint;
begin
  weight:= LEConvertInt32From(8, aPacket);

  if (Assigned(weightReachedCallback)) then begin
    weightReachedCallback(self, weight);
  end;
end;

end.
