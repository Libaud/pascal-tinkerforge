{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletColor;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletColor.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletColor = class;
  TBrickletColorNotifyColor = procedure(sender: TBrickletColor; const r: word; const g: word; const b: word; const c: word) of object;
  TBrickletColorNotifyColorReached = procedure(sender: TBrickletColor; const r: word; const g: word; const b: word; const c: word) of object;
  TBrickletColorNotifyIlluminance = procedure(sender: TBrickletColor; const illuminance: longword) of object;
  TBrickletColorNotifyColorTemperature = procedure(sender: TBrickletColor; const colorTemperature: word) of object;

  /// <summary>
  ///  Measures color (RGB value), illuminance and color temperature
  /// </summary>
  TBrickletColor = class(TDevice)
  private
    colorCallback: TBrickletColorNotifyColor;
    colorReachedCallback: TBrickletColorNotifyColorReached;
    illuminanceCallback: TBrickletColorNotifyIlluminance;
    colorTemperatureCallback: TBrickletColorNotifyColorTemperature;
  protected
    procedure CallbackWrapperColor(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperColorReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIlluminance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperColorTemperature(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured color of the sensor.
    ///  
    ///  The red (r), green (g), blue (b) and clear (c) colors are measured
    ///  with four different photodiodes that are responsive at different
    ///  wavelengths:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///     :scale: 100 %
    ///     :alt: Chart Responsivity / Wavelength
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_color_wavelength_chart_600.jpg
    ///  
    ///  If you want to get the color periodically, it is recommended
    ///  to use the <see cref="BrickletColor.TBrickletColor.OnColor"/> callback and set the period with
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>.
    /// </summary>
    procedure GetColor(out r: word; out g: word; out b: word; out c: word); virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletColor.TBrickletColor.OnColor"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnColor"/> callback is only triggered if the color has changed since the
    ///  last triggering.
    /// </summary>
    procedure SetColorCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>.
    /// </summary>
    function GetColorCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletColor.TBrickletColor.OnColorReached"/> callback.
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
    procedure SetColorCallbackThreshold(const option: char; const minR: word; const maxR: word; const minG: word; const maxG: word; const minB: word; const maxB: word; const minC: word; const maxC: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletColor.TBrickletColor.SetColorCallbackThreshold"/>.
    /// </summary>
    procedure GetColorCallbackThreshold(out option: char; out minR: word; out maxR: word; out minG: word; out maxG: word; out minB: word; out maxB: word; out minC: word; out maxC: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletColor.TBrickletColor.OnColorReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletColor.TBrickletColor.SetColorCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletColor.TBrickletColor.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Turns the LED on.
    /// </summary>
    procedure LightOn; virtual;

    /// <summary>
    ///  Turns the LED off.
    /// </summary>
    procedure LightOff; virtual;

    /// <summary>
    ///  Returns the state of the LED. Possible values are:
    ///  
    ///  * 0: On
    ///  * 1: Off
    /// </summary>
    function IsLightOn: byte; virtual;

    /// <summary>
    ///  Sets the configuration of the sensor. Gain and integration time
    ///  can be configured in this way.
    ///  
    ///  For configuring the gain:
    ///  
    ///  * 0: 1x Gain
    ///  * 1: 4x Gain
    ///  * 2: 16x Gain
    ///  * 3: 60x Gain
    ///  
    ///  For configuring the integration time:
    ///  
    ///  * 0: 2.4ms
    ///  * 1: 24ms
    ///  * 2: 101ms
    ///  * 3: 154ms
    ///  * 4: 700ms
    ///  
    ///  Increasing the gain enables the sensor to detect a
    ///  color from a higher distance.
    ///  
    ///  The integration time provides a trade-off between conversion time
    ///  and accuracy. With a longer integration time the values read will
    ///  be more accurate but it will take longer time to get the conversion
    ///  results.
    /// </summary>
    procedure SetConfig(const gain: byte; const integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    procedure GetConfig(out gain: byte; out integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the illuminance affected by the gain and integration time as
    ///  set by <see cref="BrickletColor.TBrickletColor.SetConfig"/>. To get the illuminance in Lux apply this formula::
    ///  
    ///   lux = illuminance * 700 / gain / integration_time
    ///  
    ///  To get a correct illuminance measurement make sure that the color
    ///  values themselves are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  Returns the color temperature.
    ///  
    ///  To get a correct color temperature measurement make sure that the color
    ///  values themselves are not saturated. The color value (R, G or B)
    ///  is saturated if it is equal to the maximum value of 65535.
    ///  In that case you have to reduce the gain, see <see cref="BrickletColor.TBrickletColor.SetConfig"/>.
    /// </summary>
    function GetColorTemperature: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletColor.TBrickletColor.OnIlluminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnIlluminance"/> callback is only triggered if the illuminance has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletColor.TBrickletColor.OnColorTemperature"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnColorTemperature"/> callback is only triggered if the color temperature
    ///  has changed since the last triggering.
    /// </summary>
    procedure SetColorTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletColor.TBrickletColor.SetColorTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetColorTemperatureCallbackPeriod: longword; virtual;

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
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackPeriod"/>. The parameter is the color
    ///  of the sensor as RGBC.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnColor"/> callback is only triggered if the color has changed since the
    ///  last triggering.
    /// </summary>
    property OnColor: TBrickletColorNotifyColor read colorCallback write colorCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletColor.TBrickletColor.SetColorCallbackThreshold"/> is reached.
    ///  The parameter is the color
    ///  of the sensor as RGBC.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletColor.TBrickletColor.SetDebouncePeriod"/>.
    /// </summary>
    property OnColorReached: TBrickletColorNotifyColorReached read colorReachedCallback write colorReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColor.TBrickletColor.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance.
    ///  See <see cref="BrickletColor.TBrickletColor.GetIlluminance"/> for how to interpret this value.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnIlluminance"/> callback is only triggered if the illuminance has changed
    ///  since the last triggering.
    /// </summary>
    property OnIlluminance: TBrickletColorNotifyIlluminance read illuminanceCallback write illuminanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletColor.TBrickletColor.SetColorTemperatureCallbackPeriod"/>. The parameter is the
    ///  color temperature.
    ///  
    ///  The <see cref="BrickletColor.TBrickletColor.OnColorTemperature"/> callback is only triggered if the color temperature
    ///  has changed since the last triggering.
    /// </summary>
    property OnColorTemperature: TBrickletColorNotifyColorTemperature read colorTemperatureCallback write colorTemperatureCallback;
  end;

implementation

procedure TBrickletColor.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletColor.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_LIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_LIGHT_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_IS_LIGHT_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COLOR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletColor.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_COLOR_CALLBACK_COLOR]:= {$ifdef FPC}@{$endif}CallbackWrapperColor;
  aCallBacks[BRICKLET_COLOR_CALLBACK_COLOR_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperColorReached;
  aCallBacks[BRICKLET_COLOR_CALLBACK_ILLUMINANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  aCallBacks[BRICKLET_COLOR_CALLBACK_COLOR_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperColorTemperature;
end;

procedure TBrickletColor.GetColor(out r: word; out g: word; out b: word; out c: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR, 8);
  _response:= SendRequest(_request);
  r:= LEConvertUInt16From(8, _response);
  g:= LEConvertUInt16From(10, _response);
  b:= LEConvertUInt16From(12, _response);
  c:= LEConvertUInt16From(14, _response);
end;

procedure TBrickletColor.SetColorCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletColor.GetColorCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColor.SetColorCallbackThreshold(const option: char; const minR: word; const maxR: word; const minG: word; const maxG: word; const minB: word; const maxB: word; const minC: word; const maxC: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_CALLBACK_THRESHOLD, 25);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt16To(minR, 9, _request);
  LEConvertUInt16To(maxR, 11, _request);
  LEConvertUInt16To(minG, 13, _request);
  LEConvertUInt16To(maxG, 15, _request);
  LEConvertUInt16To(minB, 17, _request);
  LEConvertUInt16To(maxB, 19, _request);
  LEConvertUInt16To(minC, 21, _request);
  LEConvertUInt16To(maxC, 23, _request);
  SendRequest(_request);
end;

procedure TBrickletColor.GetColorCallbackThreshold(out option: char; out minR: word; out maxR: word; out minG: word; out maxG: word; out minB: word; out maxB: word; out minC: word; out maxC: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  minR:= LEConvertUInt16From(9, _response);
  maxR:= LEConvertUInt16From(11, _response);
  minG:= LEConvertUInt16From(13, _response);
  maxG:= LEConvertUInt16From(15, _response);
  minB:= LEConvertUInt16From(17, _response);
  maxB:= LEConvertUInt16From(19, _response);
  minC:= LEConvertUInt16From(21, _response);
  maxC:= LEConvertUInt16From(23, _response);
end;

procedure TBrickletColor.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletColor.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColor.LightOn;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_LIGHT_ON, 8);
  SendRequest(_request);
end;

procedure TBrickletColor.LightOff;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_LIGHT_OFF, 8);
  SendRequest(_request);
end;

function TBrickletColor.IsLightOn: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_IS_LIGHT_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletColor.SetConfig(const gain: byte; const integrationTime: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_CONFIG, 10);
  LEConvertUInt8To(gain, 8, _request);
  LEConvertUInt8To(integrationTime, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletColor.GetConfig(out gain: byte; out integrationTime: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_CONFIG, 8);
  _response:= SendRequest(_request);
  gain:= LEConvertUInt8From(8, _response);
  integrationTime:= LEConvertUInt8From(9, _response);
end;

function TBrickletColor.GetIlluminance: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

function TBrickletColor.GetColorTemperature: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletColor.SetIlluminanceCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletColor.GetIlluminanceCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColor.SetColorTemperatureCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_SET_COLOR_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletColor.GetColorTemperatureCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_COLOR_TEMPERATURE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletColor.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COLOR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletColor.CallbackWrapperColor(const aPacket: TDynamicByteArray);
var r: word; g: word; b: word; c: word;
begin
  r:= LEConvertUInt16From(8, aPacket);
  g:= LEConvertUInt16From(10, aPacket);
  b:= LEConvertUInt16From(12, aPacket);
  c:= LEConvertUInt16From(14, aPacket);

  if (Assigned(colorCallback)) then begin
    colorCallback(self, r, g, b, c);
  end;
end;

procedure TBrickletColor.CallbackWrapperColorReached(const aPacket: TDynamicByteArray);
var r: word; g: word; b: word; c: word;
begin
  r:= LEConvertUInt16From(8, aPacket);
  g:= LEConvertUInt16From(10, aPacket);
  b:= LEConvertUInt16From(12, aPacket);
  c:= LEConvertUInt16From(14, aPacket);

  if (Assigned(colorReachedCallback)) then begin
    colorReachedCallback(self, r, g, b, c);
  end;
end;

procedure TBrickletColor.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var illuminance: longword;
begin
  illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(illuminanceCallback)) then begin
    illuminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletColor.CallbackWrapperColorTemperature(const aPacket: TDynamicByteArray);
var colorTemperature: word;
begin
  colorTemperature:= LEConvertUInt16From(8, aPacket);

  if (Assigned(colorTemperatureCallback)) then begin
    colorTemperatureCallback(self, colorTemperature);
  end;
end;

end.
