{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletTemperatureIR;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletTemperatureIR.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletTemperatureIR = class;
  TBrickletTemperatureIRNotifyAmbientTemperature = procedure(aSender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyObjectTemperature = procedure(aSender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyAmbientTemperatureReached = procedure(aSender: TBrickletTemperatureIR; const temperature: smallint) of object;
  TBrickletTemperatureIRNotifyObjectTemperatureReached = procedure(aSender: TBrickletTemperatureIR; const temperature: smallint) of object;

  /// <summary>
  ///  Measures contactless object temperature between -70°C and +380°C
  /// </summary>
  TBrickletTemperatureIR = class(TDevice)
  private
    fAmbientTemperatureCallback: TBrickletTemperatureIRNotifyAmbientTemperature;
    fObjectTemperatureCallback: TBrickletTemperatureIRNotifyObjectTemperature;
    fAmbientTemperatureReachedCallback: TBrickletTemperatureIRNotifyAmbientTemperatureReached;
    fObjectTemperatureReachedCallback: TBrickletTemperatureIRNotifyObjectTemperatureReached;
    procedure CallbackWrapperAmbientTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperObjectTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAmbientTemperatureReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperObjectTemperatureReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the ambient temperature of the sensor.
    ///  
    ///  If you want to get the ambient temperature periodically, it is recommended
    ///  to use the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperature"/> callback and set the period with
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetAmbientTemperature: smallint; virtual;

    /// <summary>
    ///  Returns the object temperature of the sensor, i.e. the temperature
    ///  of the surface of the object the sensor is aimed at.
    ///  
    ///  The temperature of different materials is dependent on their `emissivity
    ///  &lt;https://en.wikipedia.org/wiki/Emissivity&gt;`__. The emissivity of the material
    ///  can be set with <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/>.
    ///  
    ///  If you want to get the object temperature periodically, it is recommended
    ///  to use the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperature"/> callback and set the period with
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetObjectTemperature: smallint; virtual;

    /// <summary>
    ///  Sets the `emissivity &lt;https://en.wikipedia.org/wiki/Emissivity&gt;`__ that is
    ///  used to calculate the surface temperature as returned by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.GetObjectTemperature"/>.
    ///  
    ///  The emissivity is usually given as a value between 0.0 and 1.0. A list of
    ///  emissivities of different materials can be found
    ///  `here &lt;https://www.infrared-thermography.com/material.htm&gt;`__.
    ///  
    ///  The parameter of <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/> has to be given with a factor of
    ///  65535 (16-bit). For example: An emissivity of 0.1 can be set with the
    ///  value 6553, an emissivity of 0.5 with the value 32767 and so on.
    ///  
    ///  <note>
    ///   If you need a precise measurement for the object temperature, it is
    ///   absolutely crucial that you also provide a precise emissivity.
    ///  </note>
    ///  
    ///  The emissivity is stored in non-volatile memory and will still be used after a restart or power cycle of the Bricklet.
    /// </summary>
    procedure SetEmissivity(const emissivity: word); virtual;

    /// <summary>
    ///  Returns the emissivity as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetEmissivity"/>.
    /// </summary>
    function GetEmissivity: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperature"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperature"/> callback is only triggered if the temperature has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetAmbientTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetAmbientTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperature"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperature"/> callback is only triggered if the temperature
    ///  has changed since the last triggering.
    /// </summary>
    procedure SetObjectTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetObjectTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperatureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the ambient temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the ambient temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the ambient temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the ambient temperature is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetAmbientTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetAmbientTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperatureReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the object temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the object temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the object temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the object temperature is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetObjectTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetObjectTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperatureReached"/>,
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperatureReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/>,
    ///  * <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/>
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod"/>. The parameter is the
    ///  ambient temperature of the sensor.
    ///  
    ///  The <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnAmbientTemperature"/> callback is only triggered if the ambient
    ///  temperature has changed since the last triggering.
    /// </summary>
    property OnAmbientTemperature: TBrickletTemperatureIRNotifyAmbientTemperature read fAmbientTemperatureCallback write fAmbientTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod"/>. The parameter is the
    ///  object temperature of the sensor.
    ///  
    ///  The <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.OnObjectTemperature"/> callback is only triggered if the object
    ///  temperature has changed since the last triggering.
    /// </summary>
    property OnObjectTemperature: TBrickletTemperatureIRNotifyObjectTemperature read fObjectTemperatureCallback write fObjectTemperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the ambient temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnAmbientTemperatureReached: TBrickletTemperatureIRNotifyAmbientTemperatureReached read fAmbientTemperatureReachedCallback write fAmbientTemperatureReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the object temperature of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletTemperatureIR.TBrickletTemperatureIR.SetDebouncePeriod"/>.
    /// </summary>
    property OnObjectTemperatureReached: TBrickletTemperatureIRNotifyObjectTemperatureReached read fObjectTemperatureReachedCallback write fObjectTemperatureReachedCallback;
  end;

implementation

procedure TBrickletTemperatureIR.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletTemperatureIR.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_EMISSIVITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_EMISSIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletTemperatureIR.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperAmbientTemperature;
  aCallBacks[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperObjectTemperature;
  aCallBacks[BRICKLET_TEMPERATURE_IR_CALLBACK_AMBIENT_TEMPERATURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAmbientTemperatureReached;
  aCallBacks[BRICKLET_TEMPERATURE_IR_CALLBACK_OBJECT_TEMPERATURE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperObjectTemperatureReached;
end;

function TBrickletTemperatureIR.GetAmbientTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

function TBrickletTemperatureIR.GetObjectTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletTemperatureIR.SetEmissivity(const emissivity: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_EMISSIVITY, 10);
  LEConvertUInt16To(emissivity, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIR.GetEmissivity: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_EMISSIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletTemperatureIR.SetAmbientTemperatureCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIR.GetAmbientTemperatureCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperatureIR.SetObjectTemperatureCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIR.GetObjectTemperatureCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperatureIR.SetAmbientTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt16To(min, 9, _request);
  LEConvertInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletTemperatureIR.GetAmbientTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt16From(9, _response);
  max:= LEConvertInt16From(11, _response);
end;

procedure TBrickletTemperatureIR.SetObjectTemperatureCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, _request);
  LEConvertInt16To(min, 9, _request);
  LEConvertInt16To(max, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletTemperatureIR.GetObjectTemperatureCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertInt16From(9, _response);
  max:= LEConvertInt16From(11, _response);
end;

procedure TBrickletTemperatureIR.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIR.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperatureIR.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletTemperatureIR.CallbackWrapperAmbientTemperature(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fAmbientTemperatureCallback)) then begin
    fAmbientTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperObjectTemperature(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fObjectTemperatureCallback)) then begin
    fObjectTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperAmbientTemperatureReached(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fAmbientTemperatureReachedCallback)) then begin
    fAmbientTemperatureReachedCallback(self, temperature);
  end;
end;

procedure TBrickletTemperatureIR.CallbackWrapperObjectTemperatureReached(const aPacket: TDynamicByteArray);
var temperature: smallint;
begin
  temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fObjectTemperatureReachedCallback)) then begin
    fObjectTemperatureReachedCallback(self, temperature);
  end;
end;

end.
