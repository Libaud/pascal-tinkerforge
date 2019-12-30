{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLine;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLine.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLine = class;
  TBrickletLineNotifyReflectivity = procedure(aSender: TBrickletLine; const reflectivity: word) of object;
  TBrickletLineNotifyReflectivityReached = procedure(aSender: TBrickletLine; const reflectivity: word) of object;

  /// <summary>
  ///  Measures reflectivity of a surface
  /// </summary>
  TBrickletLine = class(TDevice)
  private
    fReflectivityCallback: TBrickletLineNotifyReflectivity;
    fReflectivityReachedCallback: TBrickletLineNotifyReflectivityReached;
    procedure CallbackWrapperReflectivity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperReflectivityReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the currently measured reflectivity. The reflectivity is
    ///  a value between 0 (not reflective) and 4095 (very reflective).
    ///  
    ///  Usually black has a low reflectivity while white has a high
    ///  reflectivity.
    ///  
    ///  If you want to get the reflectivity periodically, it is recommended
    ///  to use the <see cref="BrickletLine.TBrickletLine.OnReflectivity"/> callback and set the period with
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>.
    /// </summary>
    function GetReflectivity: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLine.TBrickletLine.OnReflectivity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLine.TBrickletLine.OnReflectivity"/> callback is only triggered if the reflectivity has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetReflectivityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>.
    /// </summary>
    function GetReflectivityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLine.TBrickletLine.OnReflectivityReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the reflectivity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the reflectivity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the reflectivity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the reflectivity is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetReflectivityCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/>.
    /// </summary>
    procedure GetReflectivityCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletLine.TBrickletLine.OnReflectivityReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLine.TBrickletLine.SetDebouncePeriod"/>.
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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackPeriod"/>. The parameter is the
    ///  reflectivity of the sensor.
    ///  
    ///  The <see cref="BrickletLine.TBrickletLine.OnReflectivity"/> callback is only triggered if the reflectivity has
    ///  changed since the last triggering.
    /// </summary>
    property OnReflectivity: TBrickletLineNotifyReflectivity read fReflectivityCallback write fReflectivityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLine.TBrickletLine.SetReflectivityCallbackThreshold"/> is reached.
    ///  The parameter is the reflectivity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLine.TBrickletLine.SetDebouncePeriod"/>.
    /// </summary>
    property OnReflectivityReached: TBrickletLineNotifyReflectivityReached read fReflectivityReachedCallback write fReflectivityReachedCallback;
  end;

implementation

procedure TBrickletLine.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletLine.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LINE_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLine.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LINE_CALLBACK_REFLECTIVITY]:= {$ifdef FPC}@{$endif}CallbackWrapperReflectivity;
  aCallBacks[BRICKLET_LINE_CALLBACK_REFLECTIVITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperReflectivityReached;
end;

function TBrickletLine.GetReflectivity: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLine.SetReflectivityCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletLine.GetReflectivityCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLine.SetReflectivityCallbackThreshold(const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_REFLECTIVITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(min, 9, _request);
  LEConvertUInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLine.GetReflectivityCallbackThreshold(out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_REFLECTIVITY_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt16From(9, _response);
  max:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLine.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletLine.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLine.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LINE_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLine.CallbackWrapperReflectivity(const aPacket: TDynamicByteArray);
var reflectivity: word;
begin
  reflectivity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fReflectivityCallback)) then begin
    fReflectivityCallback(self, reflectivity);
  end;
end;

procedure TBrickletLine.CallbackWrapperReflectivityReached(const aPacket: TDynamicByteArray);
var reflectivity: word;
begin
  reflectivity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fReflectivityReachedCallback)) then begin
    fReflectivityReachedCallback(self, reflectivity);
  end;
end;

end.
