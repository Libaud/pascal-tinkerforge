{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletPiezoSpeaker;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletPiezoSpeaker.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPiezoSpeaker = class;
  TBrickletPiezoSpeakerNotifyBeepFinished = procedure(aSender: TBrickletPiezoSpeaker) of object;
  TBrickletPiezoSpeakerNotifyMorseCodeFinished = procedure(aSender: TBrickletPiezoSpeaker) of object;

  /// <summary>
  ///  Creates beep with configurable frequency
  /// </summary>
  TBrickletPiezoSpeaker = class(TDevice)
  private
    fBeepFinishedCallback: TBrickletPiezoSpeakerNotifyBeepFinished;
    fMorseCodeFinishedCallback: TBrickletPiezoSpeakerNotifyMorseCodeFinished;
    procedure CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMorseCodeFinished(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Beeps with the given frequency for the given duration.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///     A duration of 0 stops the current beep if any, the frequency parameter is
    ///     ignored. A duration of 4294967295 results in an infinite beep.
    ///  
    ///  The Piezo Speaker Bricklet can only approximate the frequency, it will play
    ///  the best possible match by applying the calibration (see <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.Calibrate"/>).
    /// </summary>
    procedure Beep(const aDuration: longword; const aFrequency: word); virtual;

    /// <summary>
    ///  Sets morse code that will be played by the piezo buzzer. The morse code
    ///  is given as a string consisting of "." (dot), "-" (minus) and " " (space)
    ///  for *dits*, *dahs* and *pauses*. Every other character is ignored.
    ///  
    ///  For example: If you set the string "...---...", the piezo buzzer will beep
    ///  nine times with the durations "short short short long long long short
    ///  short short".
    /// </summary>
    procedure MorseCode(const aMorse: string; const aFrequency: word); virtual;

    /// <summary>
    ///  The Piezo Speaker Bricklet can play 512 different tones. This function
    ///  plays each tone and measures the exact frequency back. The Result is a
    ///  mapping between setting value and frequency. This mapping is stored
    ///  in the EEPROM and loaded on startup.
    ///  
    ///  The Bricklet should come calibrated, you only need to call this
    ///  function (once) every time you reflash the Bricklet plugin.
    ///  
    ///  Returns *true* after the calibration finishes.
    /// </summary>
    function Calibrate: boolean; virtual;

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
    ///  This callback is triggered if a beep set by <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.Beep"/> is finished
    /// </summary>
    property OnBeepFinished: TBrickletPiezoSpeakerNotifyBeepFinished read fBeepFinishedCallback write fBeepFinishedCallback;

    /// <summary>
    ///  This callback is triggered if the playback of the morse code set by
    ///  <see cref="BrickletPiezoSpeaker.TBrickletPiezoSpeaker.MorseCode"/> is finished.
    /// </summary>
    property OnMorseCodeFinished: TBrickletPiezoSpeakerNotifyMorseCodeFinished read fMorseCodeFinishedCallback write fMorseCodeFinishedCallback;
  end;

implementation

procedure TBrickletPiezoSpeaker.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletPiezoSpeaker.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_BEEP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_MORSE_CODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletPiezoSpeaker.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PIEZO_SPEAKER_CALLBACK_BEEP_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperBeepFinished;
  aCallBacks[BRICKLET_PIEZO_SPEAKER_CALLBACK_MORSE_CODE_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperMorseCodeFinished;
end;

procedure TBrickletPiezoSpeaker.Beep(const aDuration: longword; const aFrequency: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_BEEP, 14);
  LEConvertUInt32To(aDuration, 8, _request);
  LEConvertUInt16To(aFrequency, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeaker.MorseCode(const aMorse: string; const aFrequency: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_MORSE_CODE, 70);
  LEConvertStringTo(aMorse, 8, 60, _request);
  LEConvertUInt16To(aFrequency, 68, _request);
  SendRequest(_request);
end;

function TBrickletPiezoSpeaker.Calibrate: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_CALIBRATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletPiezoSpeaker.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletPiezoSpeaker.CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fBeepFinishedCallback)) then begin
    fBeepFinishedCallback(self);
  end;
end;

procedure TBrickletPiezoSpeaker.CallbackWrapperMorseCodeFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fMorseCodeFinishedCallback)) then begin
    fMorseCodeFinishedCallback(self);
  end;
end;

end.
