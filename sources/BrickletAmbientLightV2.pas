{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAmbientLightV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAmbientLightV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAmbientLightV2 = class;
  TBrickletAmbientLightV2NotifyIlluminance = procedure(aSender: TBrickletAmbientLightV2; const illuminance: longword) of object;
  TBrickletAmbientLightV2NotifyIlluminanceReached = procedure(aSender: TBrickletAmbientLightV2; const illuminance: longword) of object;

  /// <summary>
  ///  Measures ambient light up to 64000lux
  /// </summary>
  TBrickletAmbientLightV2 = class(TDevice)
  private
    fIlluminanceCallback: TBrickletAmbientLightV2NotifyIlluminance;
    fIlluminanceReachedCallback: TBrickletAmbientLightV2NotifyIlluminanceReached;
    procedure CallbackWrapperIlluminance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIlluminanceReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the illuminance of the ambient light sensor. The measurement range goes
    ///  up to about 100000lux, but above 64000lux the precision starts to drop.
    ///  The illuminance is given in lux/100, i.e. a value of 450000 means that an
    ///  illuminance of 4500lux is measured.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    An illuminance of 0lux indicates that the sensor is saturated and the
    ///    configuration should be modified, see <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetConfiguration"/>.
    ///  
    ///  If you want to get the illuminance periodically, it is recommended to use the
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback and set the period with
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback is only triggered if the illuminance has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminanceReached"/> callback.
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
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetIlluminanceCallbackThreshold(const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/>.
    /// </summary>
    procedure GetIlluminanceCallbackThreshold(out option: char; out min: longword; out max: longword); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminanceReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the configuration. It is possible to configure an illuminance range
    ///  between 0-600lux and 0-64000lux and an integration time between 50ms and 400ms.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    ///    The unlimited illuminance range allows to measure up to about 100000lux, but
    ///    above 64000lux the precision starts to drop.
    ///  
    ///  A smaller illuminance range increases the resolution of the data. A longer
    ///  integration time will Result in less noise on the data.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    If the actual measure illuminance is out-of-range then the current illuminance
    ///    range maximum +0.01lux is reported by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.GetIlluminance"/> and the
    ///    <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback. For example, 800001 for the 0-8000lux range.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    With a long integration time the sensor might be saturated before the measured
    ///    value reaches the maximum of the selected illuminance range. In this case 0lux
    ///    is reported by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.GetIlluminance"/> and the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback.
    ///  
    ///  If the measurement is out-of-range or the sensor is saturated then you should
    ///  configure the next higher illuminance range. If the highest range is already
    ///  in use, then start to reduce the integration time.
    ///  
    ///  The default values are 0-8000lux illuminance range and 200ms integration time.
    /// </summary>
    procedure SetConfiguration(const illuminanceRange: byte; const integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out illuminanceRange: byte; out integrationTime: byte); virtual;

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
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance of the
    ///  ambient light sensor.
    ///  
    ///  The <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.OnIlluminance"/> callback is only triggered if the illuminance has changed since the
    ///  last triggering.
    /// </summary>
    property OnIlluminance: TBrickletAmbientLightV2NotifyIlluminance read fIlluminanceCallback write fIlluminanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/> is reached.
    ///  The parameter is the illuminance of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnIlluminanceReached: TBrickletAmbientLightV2NotifyIlluminanceReached read fIlluminanceReachedCallback write fIlluminanceReachedCallback;
  end;

implementation

procedure TBrickletAmbientLightV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAmbientLightV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAmbientLightV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  aCallBacks[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminanceReached;
end;

function TBrickletAmbientLightV2.GetIlluminance: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLightV2.GetIlluminanceCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold(const option: char; const min: longword; const max: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, _request);
  LEConvertUInt32To(min, 9, _request);
  LEConvertUInt32To(max, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLightV2.GetIlluminanceCallbackThreshold(out option: char; out min: longword; out max: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  option:= LEConvertCharFrom(8, _response);
  min:= LEConvertUInt32From(9, _response);
  max:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletAmbientLightV2.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLightV2.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLightV2.SetConfiguration(const illuminanceRange: byte; const integrationTime: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(illuminanceRange, 8, _request);
  LEConvertUInt8To(integrationTime, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLightV2.GetConfiguration(out illuminanceRange: byte; out integrationTime: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  illuminanceRange:= LEConvertUInt8From(8, _response);
  integrationTime:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletAmbientLightV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAmbientLightV2.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var illuminance: longword;
begin
  illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fIlluminanceCallback)) then begin
    fIlluminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletAmbientLightV2.CallbackWrapperIlluminanceReached(const aPacket: TDynamicByteArray);
var illuminance: longword;
begin
  illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fIlluminanceReachedCallback)) then begin
    fIlluminanceReachedCallback(self, illuminance);
  end;
end;

end.
