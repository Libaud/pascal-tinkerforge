{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletTemperature;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletTemperature.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTemperature = class;
  TBrickletTemperatureNotifyTemperature = procedure(sender: TBrickletTemperature; const temperature: smallint) of object;
  TBrickletTemperatureNotifyTemperatureReached = procedure(sender: TBrickletTemperature; const temperature: smallint) of object;

  /// <summary>
  ///  Measures ambient temperature with 0.5°C accuracy
  /// </summary>
  TBrickletTemperature = class(TDevice)
  private
    fTemperatureCallback: TBrickletTemperatureNotifyTemperature;
    fTemperatureReachedCallback: TBrickletTemperatureNotifyTemperatureReached;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the temperature of the sensor.
    ///  
    ///  If you want to get the temperature periodically, it is recommended
    ///  to use the <see cref="BrickletTemperature.TBrickletTemperature.OnTemperature"/> callback and set the period with
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletTemperature.TBrickletTemperature.OnTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletTemperature.TBrickletTemperature.OnTemperature"/> callback is only triggered if the temperature has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperature.TBrickletTemperature.OnTemperatureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletTemperature.TBrickletTemperature.OnTemperatureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the I2C mode. Possible modes are:
    ///  
    ///  * 0: Fast (400kHz)
    ///  * 1: Slow (100kHz)
    ///  
    ///  If you have problems with obvious outliers in the
    ///  Temperature Bricklet measurements, they may be caused by EMI issues.
    ///  In this case it may be helpful to lower the I2C speed.
    ///  
    ///  It is however not recommended to lower the I2C speed in applications where
    ///  a high throughput needs to be achieved.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetI2CMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the I2C mode as set by <see cref="BrickletTemperature.TBrickletTemperature.SetI2CMode"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetI2CMode: byte; virtual;

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
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackPeriod"/>. The parameter is the
    ///  temperature of the sensor.
    ///  
    ///  The <see cref="BrickletTemperature.TBrickletTemperature.OnTemperature"/> callback is only triggered if the temperature has changed
    ///  since the last triggering.
    /// </summary>
    property OnTemperature: TBrickletTemperatureNotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperature.TBrickletTemperature.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperature.TBrickletTemperature.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletTemperatureNotifyTemperatureReached read fTemperatureReachedCallback write fTemperatureReachedCallback;
  end;

implementation

procedure TBrickletTemperature.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletTemperature.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_SET_I2C_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_I2C_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletTemperature.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_TEMPERATURE_CALLBACK_TEMPERATURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
end;

function TBrickletTemperature.GetTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletTemperature.SetTemperatureCallbackPeriod(const period: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperature.GetTemperatureCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperature.SetTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt16To(min, 9, _request);
  LEConvertInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletTemperature.GetTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt16From(9, _response);
  max:= LEConvertInt16From(11, _response);
end;

procedure TBrickletTemperature.SetDebouncePeriod(const debounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperature.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperature.SetI2CMode(const aMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_SET_I2C_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperature.GetI2CMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_I2C_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletTemperature.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletTemperature.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: smallint;
begin
  _temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickletTemperature.CallbackWrapperTemperatureReached(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fTemperatureReachedCallback)) then begin
    fTemperatureReachedCallback(self, temperature);
  end;
end;

end.
