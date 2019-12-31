{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCO2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCO2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletCO2 = class;
  TBrickletCO2NotifyCO2Concentration = procedure(sender: TBrickletCO2; const aCO2Concentration: word) of object;
  TBrickletCO2NotifyCO2ConcentrationReached = procedure(sender: TBrickletCO2; const aCO2Concentration: word) of object;

  /// <summary>
  ///  Measures CO2 concentration in ppm
  /// </summary>
  TBrickletCO2 = class(TDevice)
  private
    fCO2ConcentrationCallback: TBrickletCO2NotifyCO2Concentration;
    fCO2ConcentrationReachedCallback: TBrickletCO2NotifyCO2ConcentrationReached;
    procedure CallbackWrapperCO2Concentration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCO2ConcentrationReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured CO2 concentration.
    ///  
    ///  If you want to get the CO2 concentration periodically, it is recommended to use
    ///  the <see cref="BrickletCO2.TBrickletCO2.OnCO2Concentration"/> callback and set the period with
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>.
    /// </summary>
    function GetCO2Concentration: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletCO2.TBrickletCO2.OnCO2Concentration"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletCO2.TBrickletCO2.OnCO2Concentration"/> callback is only triggered if the CO2 concentration
    ///  has changed since the last triggering.
    /// </summary>
    procedure SetCO2ConcentrationCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>.
    /// </summary>
    function GetCO2ConcentrationCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCO2.TBrickletCO2.OnCO2ConcentrationReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the CO2 concentration is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the CO2 concentration is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the CO2 concentration is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the CO2 concentration is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetCO2ConcentrationCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/>.
    /// </summary>
    procedure GetCO2ConcentrationCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletCO2.TBrickletCO2.OnCO2ConcentrationReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletCO2.TBrickletCO2.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>. The parameter is the CO2
    ///  concentration of the sensor.
    ///  
    ///  The <see cref="BrickletCO2.TBrickletCO2.OnCO2Concentration"/> callback is only triggered if the CO2 concentration
    ///  has changed since the last triggering.
    /// </summary>
    property OnCO2Concentration: TBrickletCO2NotifyCO2Concentration read fCO2ConcentrationCallback write fCO2ConcentrationCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/> is reached.
    ///  The parameter is the CO2 concentration.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCO2.TBrickletCO2.SetDebouncePeriod"/>.
    /// </summary>
    property OnCO2ConcentrationReached: TBrickletCO2NotifyCO2ConcentrationReached read fCO2ConcentrationReachedCallback write fCO2ConcentrationReachedCallback;
  end;

implementation

procedure TBrickletCO2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCO2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CO2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCO2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION]:= {$ifdef FPC}@{$endif}CallbackWrapperCO2Concentration;
  aCallBacks[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCO2ConcentrationReached;
end;

function TBrickletCO2.GetCO2Concentration: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletCO2.SetCO2ConcentrationCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2.GetCO2ConcentrationCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCO2.SetCO2ConcentrationCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletCO2.GetCO2ConcentrationCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletCO2.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletCO2.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCO2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCO2.CallbackWrapperCO2Concentration(const aPacket: TDynamicByteArray);
var
  _co2Concentration: word;
begin
  _co2Concentration:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fCO2ConcentrationCallback)) then begin
    fCO2ConcentrationCallback(self, _co2Concentration);
  end;
end;

procedure TBrickletCO2.CallbackWrapperCO2ConcentrationReached(const aPacket: TDynamicByteArray);
var
  _co2Concentration: word;
begin
  _co2Concentration:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fCO2ConcentrationReachedCallback)) then begin
    fCO2ConcentrationReachedCallback(self, _co2Concentration);
  end;
end;

end.
