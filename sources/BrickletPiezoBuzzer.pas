{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletPiezoBuzzer;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletPiezoBuzzer.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletPiezoBuzzer = class;
  TBrickletPiezoBuzzerNotifyBeepFinished = procedure(aSender: TBrickletPiezoBuzzer) of object;
  TBrickletPiezoBuzzerNotifyMorseCodeFinished = procedure(aSender: TBrickletPiezoBuzzer) of object;

  /// <summary>     const
  ///  Creates 1kHz beep
  /// </summary>
  TBrickletPiezoBuzzer = class(TDevice)
  private
    fBeepFinishedCallback: TBrickletPiezoBuzzerNotifyBeepFinished;
    fMorseCodeFinishedCallback: TBrickletPiezoBuzzerNotifyMorseCodeFinished;
    procedure CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMorseCodeFinished(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Beeps for the given duration.
    /// </summary>
    procedure Beep(const duration: longword); virtual;

    /// <summary>
    ///  Sets morse code that will be played by the piezo buzzer. The morse code
    ///  is given as a string consisting of "." (dot), "-" (minus) and " " (space)
    ///  for *dits*, *dahs* and *pauses*. Every other character is ignored.
    ///  
    ///  For example: If you set the string "...---...", the piezo buzzer will beep
    ///  nine times with the durations "short short short long long long short
    ///  short short".
    /// </summary>
    procedure MorseCode(const morse: string); virtual;

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
    ///  This callback is triggered if a beep set by <see cref="BrickletPiezoBuzzer.TBrickletPiezoBuzzer.Beep"/> is finished
    /// </summary>
    property OnBeepFinished: TBrickletPiezoBuzzerNotifyBeepFinished read fBeepFinishedCallback write fBeepFinishedCallback;

    /// <summary>
    ///  This callback is triggered if the playback of the morse code set by
    ///  <see cref="BrickletPiezoBuzzer.TBrickletPiezoBuzzer.MorseCode"/> is finished.
    /// </summary>
    property OnMorseCodeFinished: TBrickletPiezoBuzzerNotifyMorseCodeFinished read fMorseCodeFinishedCallback write fMorseCodeFinishedCallback;
  end;

implementation

procedure TBrickletPiezoBuzzer.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletPiezoBuzzer.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_BEEP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_MORSE_CODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_BUZZER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletPiezoBuzzer.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PIEZO_BUZZER_CALLBACK_BEEP_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperBeepFinished;
  aCallBacks[BRICKLET_PIEZO_BUZZER_CALLBACK_MORSE_CODE_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperMorseCodeFinished;
end;

procedure TBrickletPiezoBuzzer.Beep(const duration: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_BEEP, 12);
  LEConvertUInt32To(duration, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoBuzzer.MorseCode(const morse: string);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_MORSE_CODE, 68);
  LEConvertStringTo(morse, 8, 60, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoBuzzer.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_BUZZER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletPiezoBuzzer.CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fBeepFinishedCallback)) then begin
    fBeepFinishedCallback(self);
  end;
end;

procedure TBrickletPiezoBuzzer.CallbackWrapperMorseCodeFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fMorseCodeFinishedCallback)) then begin
    fMorseCodeFinishedCallback(self);
  end;
end;

end.
