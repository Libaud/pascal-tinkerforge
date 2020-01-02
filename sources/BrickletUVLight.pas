{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletUVLight;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletUVLight.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletUVLight = class;
  TBrickletUVLightNotifyUVLight = procedure(aSender: TBrickletUVLight; const aUVLight: longword) of object;
  TBrickletUVLightNotifyUVLightReached = procedure(aSender: TBrickletUVLight; const aUVLight: longword) of object;

  /// <summary>
  ///  Measures UV light
  /// </summary>
  TBrickletUVLight = class(TDevice)
  private
    fUVLightCallback: TBrickletUVLightNotifyUVLight;
    fUVLightReachedCallback: TBrickletUVLightNotifyUVLightReached;
  protected
    procedure CallbackWrapperUVLight(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperUVLightReached(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the UV light intensity of the sensor, the intensity is given
    ///  in 1/10 mW/m². The sensor has already weighted the intensity with the erythemal
    ///  action spectrum to get the skin-affecting irradiation.
    ///  
    ///  To get UV index you just have to divide the value by 250. For example, a UV
    ///  light intensity of 500 is equivalent to an UV index of 2.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  <see cref="BrickletUVLight.TBrickletUVLight.OnUVLight"/> callback and set the period with
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>.
    /// </summary>
    function GetUVLight: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletUVLight.TBrickletUVLight.OnUVLight"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletUVLight.TBrickletUVLight.OnUVLight"/> callback is only triggered if the intensity has changed since
    ///  the last triggering.
    /// </summary>
    procedure SetUVLightCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>.
    /// </summary>
    function GetUVLightCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletUVLight.TBrickletUVLight.OnUVLightReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the intensity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the intensity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the intensity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the intensity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetUVLightCallbackThreshold(const aOption: char; const aMin: longword; const aMax: longword); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/>.
    /// </summary>
    procedure GetUVLightCallbackThreshold(out aOption: char; out aMin: longword; out aMax: longword); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletUVLight.TBrickletUVLight.OnUVLightReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>. The parameter is the UV Light
    ///  intensity of the sensor.
    ///  
    ///  The <see cref="BrickletUVLight.TBrickletUVLight.OnUVLight"/> callback is only triggered if the intensity has changed
    ///  since the last triggering.
    /// </summary>
    property OnUVLight: TBrickletUVLightNotifyUVLight read fUVLightCallback write fUVLightCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/> is reached.
    ///  The parameter is the UV Light intensity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnUVLightReached: TBrickletUVLightNotifyUVLightReached read fUVLightReachedCallback write fUVLightReachedCallback;
  end;

implementation

procedure TBrickletUVLight.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletUVLight.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletUVLight.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT]:= {$ifdef FPC}@{$endif}CallbackWrapperUVLight;
  aCallBacks[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperUVLightReached;
end;

function TBrickletUVLight.GetUVLight: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletUVLight.SetUVLightCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLight.GetUVLightCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletUVLight.SetUVLightCallbackThreshold(const aOption: char; const aMin: longword; const aMax: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt32To(aMin, 9, _request);
  LEConvertUInt32To(aMax, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletUVLight.GetUVLightCallbackThreshold(out aOption: char; out aMin: longword; out aMax: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt32From(9, _response);
  aMax:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletUVLight.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLight.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletUVLight.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletUVLight.CallbackWrapperUVLight(const aPacket: TDynamicByteArray);
var
  _uvLight: longword;
begin
  _uvLight:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fUVLightCallback)) then begin
    fUVLightCallback(self, _uvLight);
  end;
end;

procedure TBrickletUVLight.CallbackWrapperUVLightReached(const aPacket: TDynamicByteArray);
var
  _uvLight: longword;
begin
  _uvLight:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fUVLightReachedCallback)) then begin
    fUVLightReachedCallback(self, _uvLight);
  end;
end;

end.
