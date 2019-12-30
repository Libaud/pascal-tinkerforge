{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAccelerometer;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAccelerometer.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAccelerometer = class;
  TBrickletAccelerometerNotifyAcceleration = procedure(aSender: TBrickletAccelerometer; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickletAccelerometerNotifyAccelerationReached = procedure(aSender: TBrickletAccelerometer; const aX: smallint; const aY: smallint; const aZ: smallint) of object;

  /// <summary>
  ///  Measures acceleration in three axis
  /// </summary>
  TBrickletAccelerometer = class(TDevice)
  private
    fAccelerationCallback: TBrickletAccelerometerNotifyAcceleration;
    fAccelerationReachedCallback: TBrickletAccelerometerNotifyAccelerationReached;
    procedure CallbackWrapperAcceleration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAccelerationReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the acceleration in x, y and z direction. The values
    ///  are given in gₙ/1000 (1gₙ = 9.80665m/s²).
    ///  
    ///  If you want to get the acceleration periodically, it is recommended
    ///  to use the <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAcceleration"/> callback and set the period with
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAcceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAcceleration"/> callback is only triggered if the acceleration has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAccelerationCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>.
    /// </summary>
    function GetAccelerationCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAccelerationReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the acceleration is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the acceleration is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the acceleration is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the acceleration is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAccelerationCallbackThreshold(const aOption: char; const aMinX: smallint; const aMaxX: smallint;
                                               const aMinY: smallint; const aMaxY: smallint; const aMinZ: smallint;
                                               const aMaxZ: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/>.
    /// </summary>
    procedure GetAccelerationCallbackThreshold(out aOption: char; out aMinX: smallint; out aMaxX: smallint; out aMinY: smallint;
                                               out aMaxY: smallint; out aMinZ: smallint; out aMaxZ: smallint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAccelerationReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns the temperature of the accelerometer.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  Configures the data rate, full scale range and filter bandwidth.
    ///  Possible values are:
    ///  
    ///  * Data rate of 0Hz to 1600Hz.
    ///  * Full scale range of ±2gₙ up to ±16gₙ.
    ///  * Filter bandwidth between 50Hz and 800Hz.
    ///  
    ///  Decreasing data rate or full scale range will also decrease the noise on
    ///  the data.
    /// </summary>
    procedure SetConfiguration(const aDataRate: byte; const aFullScale: byte; const filterBandwidth: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aDataRate: byte; out aFullScale: byte; out aFilterBandwidth: byte); virtual;

    /// <summary>
    ///  Enables the LED on the Bricklet.
    /// </summary>
    procedure LEDOn; virtual;

    /// <summary>
    ///  Disables the LED on the Bricklet.
    /// </summary>
    procedure LEDOff; virtual;

    /// <summary>
    ///  Returns *true* if the LED is enabled, *false* otherwise.
    /// </summary>
    function IsLEDOn: boolean; virtual;

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
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>. The parameters are the
    ///  X, Y and Z acceleration.
    ///  
    ///  The <see cref="BrickletAccelerometer.TBrickletAccelerometer.OnAcceleration"/> callback is only triggered if the acceleration has
    ///  changed since the last triggering.
    /// </summary>                                                                    constructor Create(aOwner: TComponent); override;

    property OnAcceleration: TBrickletAccelerometerNotifyAcceleration read fAccelerationCallback write fAccelerationCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/> is reached.
    ///  The parameters are the X, Y and Z acceleration.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAccelerationReached: TBrickletAccelerometerNotifyAccelerationReached read fAccelerationReachedCallback write fAccelerationReachedCallback;
  end;

implementation

procedure TBrickletAccelerometer.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAccelerometer.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_LED_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_LED_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_IS_LED_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAccelerometer.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION]:= {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  aCallBacks[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAccelerationReached;
end;

procedure TBrickletAccelerometer.GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickletAccelerometer.SetAccelerationCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometer.GetAccelerationCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAccelerometer.SetAccelerationCallbackThreshold(const aOption: char; const aMinX: smallint; const aMaxX: smallint; const aMinY: smallint; const aMaxY: smallint; const aMinZ: smallint; const aMaxZ: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD, 21);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt16To(aMinX, 9, _request);
  LEConvertInt16To(aMaxX, 11, _request);
  LEConvertInt16To(aMinY, 13, _request);
  LEConvertInt16To(aMaxY, 15, _request);
  LEConvertInt16To(aMinZ, 17, _request);
  LEConvertInt16To(aMaxZ, 19, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometer.GetAccelerationCallbackThreshold(out aOption: char; out aMinX: smallint; out aMaxX: smallint; out aMinY: smallint; out aMaxY: smallint; out aMinZ: smallint; out aMaxZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMinX:= LEConvertInt16From(9, _response);
  aMaxX:= LEConvertInt16From(11, _response);
  aMinY:= LEConvertInt16From(13, _response);
  aMaxY:= LEConvertInt16From(15, _response);
  aMinZ:= LEConvertInt16From(17, _response);
  aMaxZ:= LEConvertInt16From(19, _response);
end;

procedure TBrickletAccelerometer.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometer.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

function TBrickletAccelerometer.GetTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletAccelerometer.SetConfiguration(const aDataRate: byte; const aFullScale: byte; const filterBandwidth: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(aDataRate, 8, _request);
  LEConvertUInt8To(aFullScale, 9, _request);
  LEConvertUInt8To(filterBandwidth, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometer.GetConfiguration(out aDataRate: byte; out aFullScale: byte; out aFilterBandwidth: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aDataRate:= LEConvertUInt8From(8, _response);
  aFullScale:= LEConvertUInt8From(9, _response);
  aFilterBandwidth:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletAccelerometer.LEDOn;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_LED_ON, 8);
  SendRequest(_request);
end;

procedure TBrickletAccelerometer.LEDOff;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_LED_OFF, 8);
  SendRequest(_request);
end;

function TBrickletAccelerometer.IsLEDOn: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_IS_LED_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletAccelerometer.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAccelerometer.CallbackWrapperAcceleration(const aPacket: TDynamicByteArray);
var
  _x, _y, _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fAccelerationCallback)) then begin
    fAccelerationCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickletAccelerometer.CallbackWrapperAccelerationReached(const aPacket: TDynamicByteArray);
var
  _x, _y, _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fAccelerationReachedCallback)) then begin
    fAccelerationReachedCallback(self, _x, _y, _z);
  end;
end;

end.
