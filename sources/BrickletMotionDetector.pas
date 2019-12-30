{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMotionDetector;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMotionDetector.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletMotionDetector = class;
  TBrickletMotionDetectorNotifyMotionDetected = procedure(aSender: TBrickletMotionDetector) of object;
  TBrickletMotionDetectorNotifyDetectionCycleEnded = procedure(aSender: TBrickletMotionDetector) of object;

  /// <summary>
  ///  Passive infrared (PIR) motion sensor with 7m range
  /// </summary>
  TBrickletMotionDetector = class(TDevice)
  private
    motionDetectedCallback: TBrickletMotionDetectorNotifyMotionDetected;
    detectionCycleEndedCallback: TBrickletMotionDetectorNotifyDetectionCycleEnded;
    procedure CallbackWrapperMotionDetected(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDetectionCycleEnded(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns 1 if a motion was detected. How long this returns 1 after a motion
    ///  was detected can be adjusted with one of the small potentiometers on the
    ///  Motion Detector Bricklet, see :ref:`here
    ///  &lt;motion_detector_bricklet_sensitivity_delay_block_time&gt;`.
    ///  
    ///  There is also a blue LED on the Bricklet that is on as long as the Bricklet is
    ///  in the "motion detected" state.
    /// </summary>
    function GetMotionDetected: byte; virtual;

    /// <summary>
    ///  Sets the status led configuration.
    ///  
    ///  By default the status LED turns on if a motion is detected and off is no motion
    ///  is detected.
    ///  
    ///  You can also turn the LED permanently on/off.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletMotionDetector.TBrickletMotionDetector.SetStatusLEDConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

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
    ///  This callback is called after a motion was detected.
    /// </summary>
    property OnMotionDetected: TBrickletMotionDetectorNotifyMotionDetected read motionDetectedCallback write motionDetectedCallback;

    /// <summary>
    ///  This callback is called when the detection cycle ended. When this
    ///  callback is called, a new motion can be detected again after approximately 2
    ///  seconds.
    /// </summary>
    property OnDetectionCycleEnded: TBrickletMotionDetectorNotifyDetectionCycleEnded read detectionCycleEndedCallback write detectionCycleEndedCallback;
  end;

implementation

procedure TBrickletMotionDetector.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletMotionDetector.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_GET_MOTION_DETECTED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMotionDetector.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MOTION_DETECTOR_CALLBACK_MOTION_DETECTED]:= {$ifdef FPC}@{$endif}CallbackWrapperMotionDetected;
  aCallBacks[BRICKLET_MOTION_DETECTOR_CALLBACK_DETECTION_CYCLE_ENDED]:= {$ifdef FPC}@{$endif}CallbackWrapperDetectionCycleEnded;
end;

function TBrickletMotionDetector.GetMotionDetected: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_GET_MOTION_DETECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetector.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotionDetector.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetector.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMotionDetector.CallbackWrapperMotionDetected(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(motionDetectedCallback)) then begin
    motionDetectedCallback(self);
  end;
end;

procedure TBrickletMotionDetector.CallbackWrapperDetectionCycleEnded(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(detectionCycleEndedCallback)) then begin
    detectionCycleEndedCallback(self);
  end;
end;

end.
