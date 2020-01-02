{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletMultiTouchV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletMultiTouchV2.inc}

type
  TArray0To12OfBoolean = array [0..12] of boolean;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletMultiTouchV2 = class;
  TBrickletMultiTouchV2NotifyTouchState = procedure(aSender: TBrickletMultiTouchV2; const aState: TArray0To12OfBoolean) of object;

  /// <summary>
  ///  Capacitive touch sensor for 12 electrodes
  /// </summary>             TinkerforgeCommon,
  TBrickletMultiTouchV2 = class(TDevice)
  private
    fTouchStateCallback: TBrickletMultiTouchV2NotifyTouchState;
    procedure CallbackWrapperTouchState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the current touch state. The state is given as a array of
    ///  bools.
    ///  
    ///  Element 0 to 11 represent the 12 electrodes and element 12 represents
    ///  the proximity.
    ///  
    ///  If an electrode is touched, the corresponding element is *true*. If
    ///  a hand or similar is in proximity to the electrodes, element 12 is
    ///  *true*.
    ///  
    ///  The proximity is activated with a distance of 1-2cm. An electrode
    ///  is already counted as touched if a finger is nearly touching the
    ///  electrode. This means that you can put a piece of paper or foil
    ///  or similar on top of a electrode to build a touch panel with
    ///  a professional look.
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.OnTouchState"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetTouchStateCallbackConfiguration"/>.
    /// </summary>
    function GetTouchState: TArray0To12OfBoolean; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.OnTouchState"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetTouchStateCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetTouchStateCallbackConfiguration"/>.
    /// </summary>
    procedure GetTouchStateCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Recalibrates the electrodes. Call this function whenever you changed
    ///  or moved you electrodes.
    /// </summary>
    procedure Recalibrate; virtual;

    /// <summary>
    ///  Enables/disables electrodes with a bool array (see <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.GetTouchState"/>).
    ///  
    ///  *True* enables the electrode, *false* disables the electrode. A
    ///  disabled electrode will always return *false* as its state. If you
    ///  don't need all electrodes you can disable the electrodes that are
    ///  not needed.
    ///  
    ///  It is recommended that you disable the proximity electrode (element 12) if
    ///  the proximity feature is not needed. This will reduce the amount of
    ///  traffic that is produced by the <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.OnTouchState"/> callback.
    ///  
    ///  Disabling electrodes will also reduce power consumption.
    /// </summary>
    procedure SetElectrodeConfig(const aEnabledElectrodes: array of boolean); virtual;

    /// <summary>
    ///  Returns the electrode configuration, as set by <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetElectrodeConfig"/>.
    /// </summary>
    function GetElectrodeConfig: TArray0To12OfBoolean; virtual;

    /// <summary>
    ///  Sets the sensitivity of the electrodes. An electrode with a high sensitivity
    ///  will register a touch earlier then an electrode with a low sensitivity.
    ///  
    ///  If you build a big electrode you might need to decrease the sensitivity, since
    ///  the area that can be charged will get bigger. If you want to be able to
    ///  activate an electrode from further away you need to increase the sensitivity.
    ///  
    ///  After a new sensitivity is set, you likely want to call <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.Recalibrate"/>
    ///  to calibrate the electrodes with the newly defined sensitivity.
    /// </summary>
    procedure SetElectrodeSensitivity(const aSensitivity: byte); virtual;

    /// <summary>
    ///  Returns the current sensitivity, as set by <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetElectrodeSensitivity"/>.
    /// </summary>
    function GetElectrodeSensitivity: byte; virtual;

    /// <summary>
    ///  Configures the touch LED to be either turned off, turned on, blink in
    ///  heartbeat mode or show the touch state (electrode touched = LED on).
    /// </summary>
    procedure SetTouchLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the LED configuration as set by <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetTouchLEDConfig"/>
    /// </summary>
    function GetTouchLEDConfig: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetStatusLEDConfig"/>
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
    ///  Returns the current touch state, see <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.GetTouchState"/> for
    ///  information about the state.
    ///  
    ///  This callback is triggered every time the touch state changes with
    ///  a given period (see <see cref="BrickletMultiTouchV2.TBrickletMultiTouchV2.SetTouchStateCallbackConfiguration"/>)
    /// </summary>
    property OnTouchState: TBrickletMultiTouchV2NotifyTouchState read fTouchStateCallback write fTouchStateCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletMultiTouchV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletMultiTouchV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_TOUCH_STATE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_STATE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_RECALIBRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_ELECTRODE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_ELECTRODE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_ELECTRODE_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_ELECTRODE_SENSITIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_TOUCH_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletMultiTouchV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_MULTI_TOUCH_V2_CALLBACK_TOUCH_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperTouchState;
end;

function TBrickletMultiTouchV2.GetTouchState: TArray0To12OfBoolean;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _stateBits: array [0..1] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_STATE, 8);
  _response:= SendRequest(_request);
  FillChar(_stateBits[0], Length(_stateBits) * SizeOf(_stateBits[0]), 0);
  for _i:= 0 to 1 do _stateBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 12 do Result[_i]:= ((_stateBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletMultiTouchV2.SetTouchStateCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_TOUCH_STATE_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletMultiTouchV2.GetTouchStateCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_STATE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletMultiTouchV2.Recalibrate;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_RECALIBRATE, 8);
  SendRequest(_request);
end;

procedure TBrickletMultiTouchV2.SetElectrodeConfig(const aEnabledElectrodes: array of boolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _enabledElectrodesBits: array [0..1] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_ELECTRODE_CONFIG, 10);
  if (Length(aEnabledElectrodes) <> 13) then raise EInvalidParameterException.Create('Enabled Electrodes has to be exactly 13 items long');
  FillChar(_enabledElectrodesBits[0], Length(_enabledElectrodesBits) * SizeOf(_enabledElectrodesBits[0]), 0);
  for _i:= 0 to 12 do if aEnabledElectrodes[_i] then _enabledElectrodesBits[Floor(_i / 8)]:= _enabledElectrodesBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 1 do LEConvertUInt8To(_enabledElectrodesBits[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.GetElectrodeConfig: TArray0To12OfBoolean;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _enabledElectrodesBits: array [0..1] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_ELECTRODE_CONFIG, 8);
  _response:= SendRequest(_request);
  FillChar(_enabledElectrodesBits[0], Length(_enabledElectrodesBits) * SizeOf(_enabledElectrodesBits[0]), 0);
  for _i:= 0 to 1 do _enabledElectrodesBits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 12 do Result[_i]:= ((_enabledElectrodesBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletMultiTouchV2.SetElectrodeSensitivity(const aSensitivity: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_ELECTRODE_SENSITIVITY, 9);
  LEConvertUInt8To(aSensitivity, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.GetElectrodeSensitivity: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_ELECTRODE_SENSITIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMultiTouchV2.SetTouchLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_TOUCH_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.GetTouchLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_TOUCH_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMultiTouchV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletMultiTouchV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMultiTouchV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMultiTouchV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletMultiTouchV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletMultiTouchV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletMultiTouchV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletMultiTouchV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletMultiTouchV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletMultiTouchV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_MULTI_TOUCH_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletMultiTouchV2.CallbackWrapperTouchState(const aPacket: TDynamicByteArray);
var
  _state: TArray0To12OfBoolean;
  _i: longint;
  _stateBits: array [0..1] of byte;
begin
  FillChar(_stateBits[0], Length(_stateBits) * SizeOf(_stateBits[0]), 0);
  for _i:= 0 to 1 do _stateBits[_i]:= LEConvertUInt8From(8 + (_i * 1), aPacket);
  for _i:= 0 to 12 do _state[_i]:= ((_stateBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  if (Assigned(fTouchStateCallback)) then begin
    fTouchStateCallback(self, _state);
  end;
end;

end.
