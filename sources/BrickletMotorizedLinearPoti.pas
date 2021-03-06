{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMotorizedLinearPoti;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMotorizedLinearPoti.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletMotorizedLinearPoti = class;
  TBrickletMotorizedLinearPotiNotifyPosition = procedure(aSender: TBrickletMotorizedLinearPoti; const aPosition: word) of object;
  TBrickletMotorizedLinearPotiNotifyPositionReached = procedure(aSender: TBrickletMotorizedLinearPoti; const aPosition: word) of object;

  /// <summary>
  ///  Motorized Linear Potentiometer
  /// </summary>
  TBrickletMotorizedLinearPoti = class(TDevice)
  private
    fPositionCallback: TBrickletMotorizedLinearPotiNotifyPosition;
    fPositionReachedCallback: TBrickletMotorizedLinearPotiNotifyPositionReached;
    procedure CallbackWrapperPosition(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the position of the linear potentiometer. The value is
    ///  between 0 (slider down) and 100 (slider up).
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.OnPosition"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetPositionCallbackConfiguration"/>.
    /// </summary>
    function GetPosition: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.OnPosition"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change
    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.OnPosition"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Threshold is turned off"
    ///   "'o'",    "Threshold is triggered when the value is *outside* the min and max values"
    ///   "'i'",    "Threshold is triggered when the value is *inside* or equal to the min and max values"
    ///   "'&lt;'",    "Threshold is triggered when the value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Threshold is triggered when the value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetPositionCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetPositionCallbackConfiguration"/>.
    /// </summary>
    procedure GetPositionCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the position of the potentiometer. The motorized potentiometer will
    ///  immediately start to approach the position. Depending on the chosen drive mode,
    ///  the position will either be reached as fast as possible or in a slow but smooth
    ///  motion.
    ///  
    ///  The position has to be between 0 (slider down) and 100 (slider up).
    ///  
    ///  If you set the hold position parameter to true, the position will automatically
    ///  be retained. If a user changes the position of the potentiometer, it will
    ///  automatically drive back to the original set point.
    ///  
    ///  If the hold position parameter is set to false, the potentiometer can be changed
    ///  again by the user as soon as the set point was reached once.
    /// </summary>
    procedure SetMotorPosition(const aPosition: word; const aDriveMode: byte; const aHoldPosition: boolean); virtual;

    /// <summary>
    ///  Returns the last motor position as set by <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetMotorPosition"/>. This is not
    ///  the current position (use <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.GetPosition"/> to get the current position). This
    ///  is the last used set point and configuration.
    ///  
    ///  The position reached parameter is true if the position has been reached at one point.
    ///  The position may have been changed again in the meantime by the user.
    /// </summary>
    procedure GetMotorPosition(out aPosition: word; out aDriveMode: byte; out aHoldPosition: boolean; out aPositionReached: boolean); virtual;

    /// <summary>
    ///  Starts a calibration procedure. The potentiometer will be driven to the extreme
    ///  points to calibrate the potentiometer.
    ///  
    ///  The calibration is saved in flash, it does not have to be called on every start up.
    ///  
    ///  The Motorized Linear Poti Bricklet is already factory-calibrated during
    ///  testing at Tinkerforge.
    /// </summary>
    procedure Calibrate; virtual;

    /// <summary>
    ///  Enables/Disables <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.OnPositionReached"/> callback.
    /// </summary>
    procedure SetPositionReachedCallbackConfiguration(const aEnabled: boolean); virtual;

    /// <summary>
    ///  Returns the <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.OnPositionReached"/> callback configuration
    ///  as set by <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetPositionReachedCallbackConfiguration"/>.
    /// </summary>
    function GetPositionReachedCallbackConfiguration: boolean; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetPositionCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.GetPosition"/>.
    /// </summary>
    property OnPosition: TBrickletMotorizedLinearPotiNotifyPosition read fPositionCallback write fPositionCallback;

    /// <summary>
    ///  This callback is triggered if a new position as set by
    ///  <see cref="BrickletMotorizedLinearPoti.TBrickletMotorizedLinearPoti.SetMotorPosition"/> is reached.
    ///  
    ///  The parameter is the current position.
    /// </summary>
    property OnPositionReached: TBrickletMotorizedLinearPotiNotifyPositionReached read fPositionReachedCallback write fPositionReachedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletMotorizedLinearPoti.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletMotorizedLinearPoti.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_MOTOR_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_MOTOR_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_CALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_POSITION_REACHED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION_REACHED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMotorizedLinearPoti.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MOTORIZED_LINEAR_POTI_CALLBACK_POSITION]:= {$ifdef FPC}@{$endif}CallbackWrapperPosition;
  aCallBacks[BRICKLET_MOTORIZED_LINEAR_POTI_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
end;

function TBrickletMotorizedLinearPoti.GetPosition: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.SetPositionCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_POSITION_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt16To(aMin, 14, _request);
  LEConvertUInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletMotorizedLinearPoti.GetPositionCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt16From(14, _response);
  aMax:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletMotorizedLinearPoti.SetMotorPosition(const aPosition: word; const aDriveMode: byte; const aHoldPosition: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_MOTOR_POSITION, 12);
  LEConvertUInt16To(aPosition, 8, _request);
  LEConvertUInt8To(aDriveMode, 10, _request);
  LEConvertBooleanTo(aHoldPosition, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletMotorizedLinearPoti.GetMotorPosition(out aPosition: word; out aDriveMode: byte; out aHoldPosition: boolean; out aPositionReached: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_MOTOR_POSITION, 8);
  _response:= SendRequest(_request);
  aPosition:= LEConvertUInt16From(8, _response);
  aDriveMode:= LEConvertUInt8From(10, _response);
  aHoldPosition:= LEConvertBooleanFrom(11, _response);
  aPositionReached:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletMotorizedLinearPoti.Calibrate;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_CALIBRATE, 8);
  SendRequest(_request);
end;

procedure TBrickletMotorizedLinearPoti.SetPositionReachedCallbackConfiguration(const aEnabled: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_POSITION_REACHED_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotorizedLinearPoti.GetPositionReachedCallbackConfiguration: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_POSITION_REACHED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletMotorizedLinearPoti.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMotorizedLinearPoti.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotorizedLinearPoti.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotorizedLinearPoti.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMotorizedLinearPoti.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletMotorizedLinearPoti.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletMotorizedLinearPoti.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletMotorizedLinearPoti.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MOTORIZED_LINEAR_POTI_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMotorizedLinearPoti.CallbackWrapperPosition(const aPacket: TDynamicByteArray);
var
  _position: word;
begin
  _position:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fPositionCallback)) then begin
    fPositionCallback(self, _position);
  end;
end;

procedure TBrickletMotorizedLinearPoti.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var
  _position: word;
begin
  _position:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fPositionReachedCallback)) then begin
    fPositionReachedCallback(self, _position);
  end;
end;

end.
