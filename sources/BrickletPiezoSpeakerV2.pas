{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletPiezoSpeakerV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletPiezoSpeakerV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletPiezoSpeakerV2 = class;
  TBrickletPiezoSpeakerV2NotifyBeepFinished = procedure(aSender: TBrickletPiezoSpeakerV2) of object;
  TBrickletPiezoSpeakerV2NotifyAlarmFinished = procedure(aSender: TBrickletPiezoSpeakerV2) of object;

  /// <summary>
  ///  Creates beep and alarm with configurable volume and frequency
  /// </summary>
  TBrickletPiezoSpeakerV2 = class(TDevice)
  private
    fBeepFinishedCallback: TBrickletPiezoSpeakerV2NotifyBeepFinished;
    fAlarmFinishedCallback: TBrickletPiezoSpeakerV2NotifyAlarmFinished;
    procedure CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAlarmFinished(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Beeps with the given frequency and volume for the duration.
    ///  
    ///  A duration of 0 stops the current beep if any is ongoing.
    ///  A duration of 4294967295 results in an infinite beep.
    /// </summary>
    procedure SetBeep(const aFrequency: word; const aVolume: byte; const aDuration: longword); virtual;

    /// <summary>
    ///  Returns the last beep settings as set by <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetBeep"/>. If a beep is currently
    ///  running it also returns the remaining duration of the beep.
    ///  
    ///  If the frequency or volume is updated during a beep (with <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.UpdateFrequency"/>
    ///  or <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.UpdateVolume"/>) this function returns the updated value.
    /// </summary>
    procedure GetBeep(out aFrequency: word; out aVolume: byte; out aDuration: longword; out aDurationRemaining: longword); virtual;

    /// <summary>
    ///  Creates an alarm (a tone that goes back and force between two specified frequencies).
    ///  
    ///  The following parameters can be set:
    ///  
    ///  * Start Frequency: Start frequency of the alarm in Hz.
    ///  * End Frequency: End frequency of the alarm in Hz.
    ///  * Step Size: Size of one step of the sweep between the start/end frequencies in Hz.
    ///  * Step Delay: Delay between two steps (duration of time that one tone is used in a sweep) in ms.
    ///  * Duration: Duration of the alarm in ms.
    ///  
    ///  A duration of 0 stops the current alarm if any is ongoing.
    ///  A duration of 4294967295 results in an infinite alarm.
    ///  
    ///  Below you can find two sets of example settings that you can try out. You can use
    ///  these as a starting point to find an alarm signal that suits your application.
    ///  
    ///  Example 1: 10 seconds of loud annoying fast alarm
    ///  
    ///  * Start Frequency = 800
    ///  * End Frequency = 2000
    ///  * Step Size = 10
    ///  * Step Delay = 1
    ///  * Volume = 10
    ///  * Duration = 10000
    ///  
    ///  Example 2: 10 seconds of soft siren sound with slow build-up
    ///  
    ///  * Start Frequency = 250
    ///  * End Frequency = 750
    ///  * Step Size = 1
    ///  * Step Delay = 5
    ///  * Volume = 0
    ///  * Duration = 10000
    ///  
    ///  The ranges are:
    ///  
    ///  * Start Frequency: 50Hz - 14999Hz (has to be smaller than end frequency)
    ///  * End Frequency: 51Hz - 15000Hz (has to be bigger than start frequency)
    ///  * Step Size: 1Hz - 65535Hz (has to be small enough to fit into the frequency range)
    ///  * Step Delay: 1ms - 65535ms (has to be small enough to fit into the duration)
    ///  * Volume: 0 - 10
    ///  * Duration: 0ms - 4294967295ms
    /// </summary>
    procedure SetAlarm(const aStartFrequency: word; const aEndFrequency: word; const aStepSize: word;
                       const aStepDelay: word; const aVolume: byte; const aDuration: longword); virtual;

    /// <summary>
    ///  Returns the last alarm settings as set by <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetAlarm"/>. If an alarm is currently
    ///  running it also returns the remaining duration of the alarm in ms as well as the
    ///  current frequency of the alarm in Hz.
    ///  
    ///  If the volume is updated during a beep (with <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.UpdateVolume"/>)
    ///  this function returns the updated value.
    /// </summary>
    procedure GetAlarm(out aStartFrequency: word; out aEndFrequency: word; out aStepSize: word; out aStepDelay: word;
                       out aVolume: byte; out aDuration: longword; out aDurationRemaining: longword; out aCurrentFrequency: word); virtual;

    /// <summary>
    ///  Updates the volume of an ongoing beep or alarm. The range of the volume is 0 to 10.
    /// </summary>
    procedure UpdateVolume(const aVolume: byte); virtual;

    /// <summary>
    ///  Updates the frequency of an ongoing beep. The range of the frequency is 50Hz to 15000Hz.
    /// </summary>
    procedure UpdateFrequency(const aFrequency: word); virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.
    /// </summary>
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

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
    ///  This callback is triggered if a beep set by <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetBeep"/> is finished
    /// </summary>
    property OnBeepFinished: TBrickletPiezoSpeakerV2NotifyBeepFinished read fBeepFinishedCallback write fBeepFinishedCallback;

    /// <summary>
    ///  This callback is triggered if a alarm set by <see cref="BrickletPiezoSpeakerV2.TBrickletPiezoSpeakerV2.SetAlarm"/> is finished
    /// </summary>
    property OnAlarmFinished: TBrickletPiezoSpeakerV2NotifyAlarmFinished read fAlarmFinishedCallback write fAlarmFinishedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletPiezoSpeakerV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletPiezoSpeakerV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_BEEP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_BEEP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_ALARM]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_ALARM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_UPDATE_VOLUME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_UPDATE_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletPiezoSpeakerV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PIEZO_SPEAKER_V2_CALLBACK_BEEP_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperBeepFinished;
  aCallBacks[BRICKLET_PIEZO_SPEAKER_V2_CALLBACK_ALARM_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperAlarmFinished;
end;

procedure TBrickletPiezoSpeakerV2.SetBeep(const aFrequency: word; const aVolume: byte; const aDuration: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_BEEP, 15);
  LEConvertUInt16To(aFrequency, 8, _request);
  LEConvertUInt8To(aVolume, 10, _request);
  LEConvertUInt32To(aDuration, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeakerV2.GetBeep(out aFrequency: word; out aVolume: byte; out aDuration: longword; out aDurationRemaining: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_BEEP, 8);
  _response:= SendRequest(_request);
  aFrequency:= LEConvertUInt16From(8, _response);
  aVolume:= LEConvertUInt8From(10, _response);
  aDuration:= LEConvertUInt32From(11, _response);
  aDurationRemaining:= LEConvertUInt32From(15, _response);
end;

procedure TBrickletPiezoSpeakerV2.SetAlarm(const aStartFrequency: word; const aEndFrequency: word; const aStepSize: word; const aStepDelay: word; const aVolume: byte; const aDuration: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_ALARM, 21);
  LEConvertUInt16To(aStartFrequency, 8, _request);
  LEConvertUInt16To(aEndFrequency, 10, _request);
  LEConvertUInt16To(aStepSize, 12, _request);
  LEConvertUInt16To(aStepDelay, 14, _request);
  LEConvertUInt8To(aVolume, 16, _request);
  LEConvertUInt32To(aDuration, 17, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeakerV2.GetAlarm(out aStartFrequency: word; out aEndFrequency: word; out aStepSize: word; out aStepDelay: word; out aVolume: byte; out aDuration: longword; out aDurationRemaining: longword; out aCurrentFrequency: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_ALARM, 8);
  _response:= SendRequest(_request);
  aStartFrequency:= LEConvertUInt16From(8, _response);
  aEndFrequency:= LEConvertUInt16From(10, _response);
  aStepSize:= LEConvertUInt16From(12, _response);
  aStepDelay:= LEConvertUInt16From(14, _response);
  aVolume:= LEConvertUInt8From(16, _response);
  aDuration:= LEConvertUInt32From(17, _response);
  aDurationRemaining:= LEConvertUInt32From(21, _response);
  aCurrentFrequency:= LEConvertUInt16From(25, _response);
end;

procedure TBrickletPiezoSpeakerV2.UpdateVolume(const aVolume: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_UPDATE_VOLUME, 9);
  LEConvertUInt8To(aVolume, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeakerV2.UpdateFrequency(const aFrequency: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_UPDATE_FREQUENCY, 10);
  LEConvertUInt16To(aFrequency, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeakerV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletPiezoSpeakerV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPiezoSpeakerV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPiezoSpeakerV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletPiezoSpeakerV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPiezoSpeakerV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletPiezoSpeakerV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPiezoSpeakerV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletPiezoSpeakerV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletPiezoSpeakerV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletPiezoSpeakerV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletPiezoSpeakerV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PIEZO_SPEAKER_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletPiezoSpeakerV2.CallbackWrapperBeepFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fBeepFinishedCallback)) then begin
    fBeepFinishedCallback(self);
  end;
end;

procedure TBrickletPiezoSpeakerV2.CallbackWrapperAlarmFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fAlarmFinishedCallback)) then begin
    fAlarmFinishedCallback(self);
  end;
end;

end.
