{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDualButtonV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDualButtonV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletDualButtonV2 = class;
  TBrickletDualButtonV2NotifyStateChanged = procedure(sender: TBrickletDualButtonV2; const buttonL: byte; const buttonR: byte; const ledL: byte; const ledR: byte) of object;

  /// <summary>
  ///  Two tactile buttons with built-in blue LEDs
  /// </summary>
  TBrickletDualButtonV2 = class(TDevice)
  private
    fStateChangedCallback: TBrickletDualButtonV2NotifyStateChanged;
    procedure CallbackWrapperStateChanged(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the state of the LEDs. Possible states are:
    ///  
    ///  * 0 = AutoToggleOn: Enables auto toggle with initially enabled LED.
    ///  * 1 = AutoToggleOff: Activates auto toggle with initially disabled LED.
    ///  * 2 = On: Enables LED (auto toggle is disabled).
    ///  * 3 = Off: Disables LED (auto toggle is disabled).
    ///  
    ///  In auto toggle mode the LED is toggled automatically at each press of a button.
    ///  
    ///  If you just want to set one of the LEDs and don't know the current state
    ///  of the other LED, you can get the state with <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.GetLEDState"/> or you
    ///  can use <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetSelectedLEDState"/>.
    /// </summary>
    procedure SetLEDState(const ledL: byte; const ledR: byte); virtual;

    /// <summary>
    ///  Returns the current state of the LEDs, as set by <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetLEDState"/>.
    /// </summary>
    procedure GetLEDState(out ledL: byte; out ledR: byte); virtual;

    /// <summary>
    ///  Returns the current state for both buttons. Possible states are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    /// </summary>
    procedure GetButtonState(out buttonL: byte; out buttonR: byte); virtual;

    /// <summary>
    ///  Sets the state of the selected LED.
    ///  
    ///  The other LED remains untouched.
    /// </summary>
    procedure SetSelectedLEDState(const led: byte; const state: byte); virtual;

    /// <summary>
    ///  If you enable this callback, the <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.OnStateChanged"/> callback is triggered
    ///  every time a button is pressed/released
    /// </summary>
    procedure SetStateChangedCallbackConfiguration(const enabled: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetStateChangedCallbackConfiguration"/>.
    /// </summary>
    function GetStateChangedCallbackConfiguration: boolean; virtual;

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
    procedure GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const data: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is called whenever a button is pressed.
    ///  
    ///  Possible states for buttons are:
    ///  
    ///  * 0 = pressed
    ///  * 1 = released
    ///  
    ///  Possible states for LEDs are:
    ///  
    ///  * 0 = AutoToggleOn: Auto toggle enabled and LED on.
    ///  * 1 = AutoToggleOff: Auto toggle enabled and LED off.
    ///  * 2 = On: LED on (auto toggle is disabled).
    ///  * 3 = Off: LED off (auto toggle is disabled).
    ///  
    ///  This callback can be enabled with <see cref="BrickletDualButtonV2.TBrickletDualButtonV2.SetStateChangedCallbackConfiguration"/>.
    /// </summary>
    property OnStateChanged: TBrickletDualButtonV2NotifyStateChanged read fStateChangedCallback write fStateChangedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletDualButtonV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletDualButtonV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_BUTTON_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_SELECTED_LED_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_STATE_CHANGED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_STATE_CHANGED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDualButtonV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DUAL_BUTTON_V2_CALLBACK_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperStateChanged;
end;

procedure TBrickletDualButtonV2.SetLEDState(const ledL: byte; const ledR: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_LED_STATE, 10);
  LEConvertUInt8To(ledL, 8, _request);
  LEConvertUInt8To(ledR, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualButtonV2.GetLEDState(out ledL: byte; out ledR: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_LED_STATE, 8);
  _response:= SendRequest(_request);
  ledL:= LEConvertUInt8From(8, _response);
  ledR:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletDualButtonV2.GetButtonState(out buttonL: byte; out buttonR: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_BUTTON_STATE, 8);
  _response:= SendRequest(_request);
  buttonL:= LEConvertUInt8From(8, _response);
  buttonR:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletDualButtonV2.SetSelectedLEDState(const led: byte; const state: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_SELECTED_LED_STATE, 10);
  LEConvertUInt8To(led, 8, _request);
  LEConvertUInt8To(state, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualButtonV2.SetStateChangedCallbackConfiguration(const enabled: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_STATE_CHANGED_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(enabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletDualButtonV2.GetStateChangedCallbackConfiguration: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_STATE_CHANGED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletDualButtonV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletDualButtonV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDualButtonV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDualButtonV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletDualButtonV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDualButtonV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletDualButtonV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDualButtonV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletDualButtonV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletDualButtonV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletDualButtonV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDualButtonV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_BUTTON_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDualButtonV2.CallbackWrapperStateChanged(const aPacket: TDynamicByteArray);
var buttonL: byte; buttonR: byte; ledL: byte; ledR: byte;
begin
  buttonL:= LEConvertUInt8From(8, aPacket);
  buttonR:= LEConvertUInt8From(9, aPacket);
  ledL:= LEConvertUInt8From(10, aPacket);
  ledR:= LEConvertUInt8From(11, aPacket);

  if (Assigned(fStateChangedCallback)) then begin
    fStateChangedCallback(self, buttonL, buttonR, ledL, ledR);
  end;
end;

end.
