{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAmbientLight;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAmbientLight.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAmbientLight = class;
  TBrickletAmbientLightNotifyIlluminance = procedure(sender: TBrickletAmbientLight; const aIlluminance: word) of object;
  TBrickletAmbientLightNotifyAnalogValue = procedure(sender: TBrickletAmbientLight; const aValue: word) of object;
  TBrickletAmbientLightNotifyIlluminanceReached = procedure(sender: TBrickletAmbientLight; const aIlluminance: word) of object;
  TBrickletAmbientLightNotifyAnalogValueReached = procedure(sender: TBrickletAmbientLight; const aValue: word) of object;

  /// <summary>
  ///  Measures ambient light up to 900lux
  /// </summary>
  TBrickletAmbientLight = class(TDevice)
  private
    fIlluminanceCallback: TBrickletAmbientLightNotifyIlluminance;
    fAnalogValueCallback: TBrickletAmbientLightNotifyAnalogValue;
    fIlluminanceReachedCallback: TBrickletAmbientLightNotifyIlluminanceReached;
    fAnalogValueReachedCallback: TBrickletAmbientLightNotifyAnalogValueReached;
    procedure CallbackWrapperIlluminance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIlluminanceReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the illuminance of the ambient light sensor.
    ///  
    ///  If you want to get the illuminance periodically, it is recommended to use the
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminance"/> callback and set the period with
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminance: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  
    ///  <note>
    ///   The value returned by <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetIlluminance"/> is averaged over several samples
    ///   to yield less noise, while <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetAnalogValue"/> gives back raw
    ///   unfiltered analog values. The only reason to use <see cref="BrickletAmbientLight.TBrickletAmbientLight.GetAnalogValue"/> is,
    ///   if you need the full resolution of the analog-to-digital converter.
    ///  </note>
    ///  
    ///   Also, the analog-to-digital converter covers three different ranges that are
    ///   set dynamically depending on the light intensity. It is impossible to
    ///   distinguish between these ranges with the analog value.
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValue"/> callback and set the period with
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminance"/> callback is only triggered if the illuminance has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminanceReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the illuminance is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the illuminance is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the illuminance is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the illuminance is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetIlluminanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/>.
    /// </summary>
    procedure GetIlluminanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValueReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminanceReached"/>,
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/>,
    ///  * <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance of the
    ///  ambient light sensor.
    ///  
    ///  The <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnIlluminance"/> callback is only triggered if the illuminance has changed
    ///  since the last triggering.
    /// </summary>
    property OnIlluminance: TBrickletAmbientLightNotifyIlluminance read fIlluminanceCallback write fIlluminanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  ambient light sensor.
    ///  
    ///  The <see cref="BrickletAmbientLight.TBrickletAmbientLight.OnAnalogValue"/> callback is only triggered if the analog value has
    ///  changed since the last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletAmbientLightNotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetIlluminanceCallbackThreshold"/> is reached.
    ///  The parameter is the illuminance of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnIlluminanceReached: TBrickletAmbientLightNotifyIlluminanceReached read fIlluminanceReachedCallback write fIlluminanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLight.TBrickletAmbientLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletAmbientLightNotifyAnalogValueReached read fAnalogValueReachedCallback write fAnalogValueReachedCallback;
  end;

implementation

procedure TBrickletAmbientLight.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAmbientLight.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAmbientLight.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  aCallBacks[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  aCallBacks[BRICKLET_AMBIENT_LIGHT_CALLBACK_ILLUMINANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminanceReached;
  aCallBacks[BRICKLET_AMBIENT_LIGHT_CALLBACK_ANALOG_VALUE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletAmbientLight.GetIlluminance: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletAmbientLight.GetAnalogValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletAmbientLight.SetIlluminanceCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLight.GetIlluminanceCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLight.SetAnalogValueCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLight.GetAnalogValueCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLight.SetIlluminanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLight.GetIlluminanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAmbientLight.SetAnalogValueCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLight.GetAnalogValueCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletAmbientLight.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLight.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLight.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAmbientLight.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var
  _illuminance: word;
begin
  _illuminance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fIlluminanceCallback)) then begin
    fIlluminanceCallback(self, _illuminance);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, _value);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperIlluminanceReached(const aPacket: TDynamicByteArray);
var
  _illuminance: word;
begin
  _illuminance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fIlluminanceReachedCallback)) then begin
    fIlluminanceReachedCallback(self, _illuminance);
  end;
end;

procedure TBrickletAmbientLight.CallbackWrapperAnalogValueReached(const aPacket: TDynamicByteArray);
var
  _value: word;
begin
  _value:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fAnalogValueReachedCallback)) then begin
    fAnalogValueReachedCallback(self, _value);
  end;
end;

end.
