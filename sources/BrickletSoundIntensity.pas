{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletSoundIntensity;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletSoundIntensity.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletSoundIntensity = class;
  TBrickletSoundIntensityNotifyIntensity = procedure(aSender: TBrickletSoundIntensity; const aIntensity: word) of object;
  TBrickletSoundIntensityNotifyIntensityReached = procedure(aSender: TBrickletSoundIntensity; const aIntensity: word) of object;

  /// <summary>
  ///  Measures sound intensity
  /// </summary>
  TBrickletSoundIntensity = class(TDevice)
  private
    fIntensityCallback: TBrickletSoundIntensityNotifyIntensity;
    fIntensityReachedCallback: TBrickletSoundIntensityNotifyIntensityReached;
    procedure CallbackWrapperIntensity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperIntensityReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current sound intensity. The value has a range of
    ///  0 to 4095.
    ///  
    ///  The value corresponds to the
    ///  `upper envelop &lt;https://en.wikipedia.org/wiki/Envelope_(waves)&gt;`__
    ///  of the signal of the microphone capsule.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensity"/> callback and set the period with
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>.
    /// </summary>
    function GetIntensity: word; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensity"/> callback is only triggered if the intensity has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetIntensityCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>.
    /// </summary>
    function GetIntensityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensityReached"/> callback.
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
    procedure SetIntensityCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/>.
    /// </summary>
    procedure GetIntensityCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callback
    ///  
    ///  * <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensityReached"/>
    ///  
    ///  is triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackPeriod"/>. The parameter is the intensity
    ///  of the sensor.
    ///  
    ///  The <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.OnIntensity"/> callback is only triggered if the intensity has changed
    ///  since the last triggering.
    /// </summary>
    property OnIntensity: TBrickletSoundIntensityNotifyIntensity read fIntensityCallback write fIntensityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetIntensityCallbackThreshold"/> is reached.
    ///  The parameter is the intensity of the encoder.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletSoundIntensity.TBrickletSoundIntensity.SetDebouncePeriod"/>.
    /// </summary>
    property OnIntensityReached: TBrickletSoundIntensityNotifyIntensityReached read fIntensityReachedCallback write fIntensityReachedCallback;
  end;

implementation

procedure TBrickletSoundIntensity.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletSoundIntensity.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_INTENSITY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletSoundIntensity.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY]:= {$ifdef FPC}@{$endif}CallbackWrapperIntensity;
  aCallBacks[BRICKLET_SOUND_INTENSITY_CALLBACK_INTENSITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperIntensityReached;
end;

function TBrickletSoundIntensity.GetIntensity: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletSoundIntensity.SetIntensityCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundIntensity.GetIntensityCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletSoundIntensity.SetIntensityCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_INTENSITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletSoundIntensity.GetIntensityCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_INTENSITY_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletSoundIntensity.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundIntensity.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletSoundIntensity.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_INTENSITY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletSoundIntensity.CallbackWrapperIntensity(const aPacket: TDynamicByteArray);
var
  _intensity: word;
begin
  _intensity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fIntensityCallback)) then begin
    fIntensityCallback(self, _intensity);
  end;
end;

procedure TBrickletSoundIntensity.CallbackWrapperIntensityReached(const aPacket: TDynamicByteArray);
var
  _intensity: word;
begin
  _intensity:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fIntensityReachedCallback)) then begin
    fIntensityReachedCallback(self, _intensity);
  end;
end;

end.
