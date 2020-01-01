{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDual020mA;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDual020mA.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletIndustrialDual020mA = class;
  TBrickletIndustrialDual020mANotifyCurrent = procedure(aSender: TBrickletIndustrialDual020mA; const aSensor: byte; const aCurrent: longint) of object;
  TBrickletIndustrialDual020mANotifyCurrentReached = procedure(aSender: TBrickletIndustrialDual020mA; const aSensor: byte; const aCurrent: longint) of object;

  /// <summary>
  ///  Measures two DC currents between 0mA and 20mA (IEC 60381-1)
  /// </summary>
  TBrickletIndustrialDual020mA = class(TDevice)
  private
    fCurrentCallback: TBrickletIndustrialDual020mANotifyCurrent;
    fCurrentReachedCallback: TBrickletIndustrialDual020mANotifyCurrentReached;
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current of the specified sensor.
    ///  
    ///  It is possible to detect if an IEC 60381-1 compatible sensor is connected
    ///  and if it works properly.
    ///  
    ///  If the returned current is below 4mA, there is likely no sensor connected
    ///  or the sensor may be defect. If the returned current is over 20mA, there might
    ///  be a short circuit or the sensor may be defect.
    ///  
    ///  If you want to get the current periodically, it is recommended to use the
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrent"/> callback and set the period with
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrent(const aSensor: byte): longint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrent"/> callback is triggered
    ///  periodically for the given sensor. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrent"/> callback is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetCurrentCallbackPeriod(const aSensor: byte; const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>.
    /// </summary>
    function GetCurrentCallbackPeriod(const aSensor: byte): longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrentReached"/> callback for the given
    ///  sensor.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the current is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the current is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the current is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the current is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetCurrentCallbackThreshold(const aSensor: byte; const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/>.
    /// </summary>
    procedure GetCurrentCallbackThreshold(const aSensor: byte; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrentReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the sample rate to either 240, 60, 15 or 4 samples per second.
    ///  The resolution for the rates is 12, 14, 16 and 18 bit respectively.
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0",    "240 samples per second, 12 bit resolution"
    ///   "1",    "60 samples per second, 14 bit resolution"
    ///   "2",    "15 samples per second, 16 bit resolution"
    ///   "3",    "4 samples per second, 18 bit resolution"
    ///  </code>
    /// </summary>
    procedure SetSampleRate(const aRate: byte); virtual;

    /// <summary>
    ///  Returns the sample rate as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

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
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod"/>. The parameter is the current of the
    ///  sensor.
    ///  
    ///  The <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.OnCurrent"/> callback is only triggered if the current has changed since the
    ///  last triggering.
    /// </summary>
    property OnCurrent: TBrickletIndustrialDual020mANotifyCurrent read fCurrentCallback write fCurrentCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold"/> is reached.
    ///  The parameter is the current of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletIndustrialDual020mA.TBrickletIndustrialDual020mA.SetDebouncePeriod"/>.
    /// </summary>
    property OnCurrentReached: TBrickletIndustrialDual020mANotifyCurrentReached read fCurrentReachedCallback write fCurrentReachedCallback;
  end;

implementation

procedure TBrickletIndustrialDual020mA.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialDual020mA.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_SAMPLE_RATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDual020mA.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  aCallBacks[BRICKLET_INDUSTRIAL_DUAL_0_20MA_CALLBACK_CURRENT_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrentReached;
end;

function TBrickletIndustrialDual020mA.GetCurrent(const aSensor: byte): longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT, 9);
  LEConvertUInt8To(aSensor, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletIndustrialDual020mA.SetCurrentCallbackPeriod(const aSensor: byte; const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_PERIOD, 13);
  LEConvertUInt8To(aSensor, 8, _request);
  LEConvertUInt32To(aPeriod, 9, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mA.GetCurrentCallbackPeriod(const aSensor: byte): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_PERIOD, 9);
  LEConvertUInt8To(aSensor, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDual020mA.SetCurrentCallbackThreshold(const aSensor: byte; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_CURRENT_CALLBACK_THRESHOLD, 18);
  LEConvertUInt8To(aSensor, 8, _request);
  LEConvertCharTo(aOption, 9, _request);
  LEConvertInt32To(aMin, 10, _request);
  LEConvertInt32To(aMax, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDual020mA.GetCurrentCallbackThreshold(const aSensor: byte; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_CURRENT_CALLBACK_THRESHOLD, 9);
  LEConvertUInt8To(aSensor, 8, _request);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt32From(9, _response);
  aMax:= LEConvertInt32From(13, _response);
end;

procedure TBrickletIndustrialDual020mA.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mA.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDual020mA.SetSampleRate(const aRate: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(aRate, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDual020mA.GetSampleRate: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_SAMPLE_RATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDual020mA.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_0_20MA_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDual020mA.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var
  _sensor: byte;
  _current: longint;
begin
  _sensor:= LEConvertUInt8From(8, aPacket);
  _current:= LEConvertInt32From(9, aPacket);

  if (Assigned(fCurrentCallback)) then begin
    fCurrentCallback(self, _sensor, _current);
  end;
end;

procedure TBrickletIndustrialDual020mA.CallbackWrapperCurrentReached(const aPacket: TDynamicByteArray);
var
  _sensor: byte;
  _current: longint;
begin
  _sensor:= LEConvertUInt8From(8, aPacket);
  _current:= LEConvertInt32From(9, aPacket);

  if (Assigned(fCurrentReachedCallback)) then begin
    fCurrentReachedCallback(self, _sensor, _current);
  end;
end;

end.
