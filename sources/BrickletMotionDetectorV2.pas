{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMotionDetectorV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMotionDetectorV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletMotionDetectorV2 = class;
  TBrickletMotionDetectorV2NotifyMotionDetected = procedure(aSender: TBrickletMotionDetectorV2) of object;
  TBrickletMotionDetectorV2NotifyDetectionCycleEnded = procedure(aSender: TBrickletMotionDetectorV2) of object;

  /// <summary>
  ///  Passive infrared (PIR) motion sensor with 12m range and dimmable backlight
  /// </summary>
  TBrickletMotionDetectorV2 = class(TDevice)
  private
    fMotionDetectedCallback: TBrickletMotionDetectorV2NotifyMotionDetected;
    fDetectionCycleEndedCallback: TBrickletMotionDetectorV2NotifyDetectionCycleEnded;
    procedure CallbackWrapperMotionDetected(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDetectionCycleEnded(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns 1 if a motion was detected. It returns 1 approx. for 1.8 seconds
    ///  until the sensor checks for a new movement.
    ///  
    ///  There is also a blue LED on the Bricklet that is on as long as the Bricklet is
    ///  in the "motion detected" state.
    /// </summary>
    function GetMotionDetected: byte; virtual;

    /// <summary>
    ///  Sets the sensitivity of the PIR sensor. At full
    ///  sensitivity (100), the Bricklet can detect motion in a range of approximately 12m.
    ///  
    ///  The actual range depends on many things in the environment (e.g. reflections) and the
    ///  size of the object to be detected. While a big person might be detected in a range
    ///  of 10m a cat may only be detected at 2m distance with the same setting.
    ///  
    ///  So you will have to find a good sensitivity for your application by trial and error.
    /// </summary>
    procedure SetSensitivity(const aSensitivity: byte); virtual;

    /// <summary>
    ///  Returns the sensitivity as set by <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.SetSensitivity"/>.
    /// </summary>
    function GetSensitivity: byte; virtual;

    /// <summary>
    ///  Sets the blue backlight of the fresnel lens. The backlight consists of
    ///  three LEDs. The brightness of each LED can be controlled with a 8-bit value
    ///  (0-255). A value of 0 turns the LED off and a value of 255 turns the LED
    ///  to full brightness.
    /// </summary>
    procedure SetIndicator(const aTopLeft: byte; const aTopRight: byte; const aBottom: byte); virtual;

    /// <summary>
    ///  Returns the indicator configuration as set by <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.SetIndicator"/>.
    /// </summary>
    procedure GetIndicator(out aTopLeft: byte; out aTopRight: byte; out aBottom: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletMotionDetectorV2.TBrickletMotionDetectorV2.SetStatusLEDConfig"/>
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
                          out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is called after a motion was detected.
    /// </summary>
    property OnMotionDetected: TBrickletMotionDetectorV2NotifyMotionDetected read fMotionDetectedCallback write fMotionDetectedCallback;

    /// <summary>
    ///  This callback is called when the detection cycle ended. When this
    ///  callback is called, a new motion can be detected again after approximately 2
    ///  seconds.
    /// </summary>
    property OnDetectionCycleEnded: TBrickletMotionDetectorV2NotifyDetectionCycleEnded read fDetectionCycleEndedCallback write fDetectionCycleEndedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletMotionDetectorV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletMotionDetectorV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_MOTION_DETECTED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_INDICATOR]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_INDICATOR]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMotionDetectorV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MOTION_DETECTOR_V2_CALLBACK_MOTION_DETECTED]:= {$ifdef FPC}@{$endif}CallbackWrapperMotionDetected;
  aCallBacks[BRICKLET_MOTION_DETECTOR_V2_CALLBACK_DETECTION_CYCLE_ENDED]:= {$ifdef FPC}@{$endif}CallbackWrapperDetectionCycleEnded;
end;

function TBrickletMotionDetectorV2.GetMotionDetected: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_MOTION_DETECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetectorV2.SetSensitivity(const aSensitivity: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_SENSITIVITY, 9);
  LEConvertUInt8To(aSensitivity, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotionDetectorV2.GetSensitivity: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_SENSITIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetectorV2.SetIndicator(const aTopLeft: byte; const aTopRight: byte; const aBottom: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_INDICATOR, 11);
  LEConvertUInt8To(aTopLeft, 8, _request);
  LEConvertUInt8To(aTopRight, 9, _request);
  LEConvertUInt8To(aBottom, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletMotionDetectorV2.GetIndicator(out aTopLeft: byte; out aTopRight: byte; out aBottom: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_INDICATOR, 8);
  _response:= SendRequest(_request);
  aTopLeft:= LEConvertUInt8From(8, _response);
  aTopRight:= LEConvertUInt8From(9, _response);
  aBottom:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletMotionDetectorV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletMotionDetectorV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMotionDetectorV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetectorV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotionDetectorV2.WriteFirmware(const aData: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotionDetectorV2.SetStatusLEDConfig(const aConfig: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotionDetectorV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMotionDetectorV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletMotionDetectorV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletMotionDetectorV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotionDetectorV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletMotionDetectorV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTION_DETECTOR_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMotionDetectorV2.CallbackWrapperMotionDetected(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fMotionDetectedCallback)) then begin
    fMotionDetectedCallback(self);
  end;
end;

procedure TBrickletMotionDetectorV2.CallbackWrapperDetectionCycleEnded(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fDetectionCycleEndedCallback)) then begin
    fDetectionCycleEndedCallback(self);
  end;
end;

end.
