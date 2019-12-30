{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletThermocoupleV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletThermocoupleV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletThermocoupleV2 = class;
  TBrickletThermocoupleV2NotifyTemperature = procedure(aSender: TBrickletThermocoupleV2; const temperature: longint) of object;
  TBrickletThermocoupleV2NotifyErrorState = procedure(aSender: TBrickletThermocoupleV2; const overUnder: boolean; const openCircuit: boolean) of object;

  /// <summary>
  ///  Measures temperature with thermocouples
  /// </summary>
  TBrickletThermocoupleV2 = class(TDevice)
  private
    fTemperatureCallback: TBrickletThermocoupleV2NotifyTemperature;
    fErrorStateCallback: TBrickletThermocoupleV2NotifyErrorState;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperErrorState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the temperature of the thermocouple. The value is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended
    ///  to use the <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.OnTemperature"/> callback and set the period with
    ///  <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.OnTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.OnTemperature"/> callback.
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
    procedure SetTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  You can configure averaging size, thermocouple type and frequency
    ///  filtering.
    ///  
    ///  Available averaging sizes are 1, 2, 4, 8 and 16 samples.
    ///  
    ///  As thermocouple type you can use B, E, J, K, N, R, S and T. If you have a
    ///  different thermocouple or a custom thermocouple you can also use
    ///  G8 and G32. With these types the returned value will not be in °C/100,
    ///  it will be calculated by the following formulas:
    ///  
    ///  * G8: ``value = 8 * 1.6 * 2^17 * Vin``
    ///  * G32: ``value = 32 * 1.6 * 2^17 * Vin``
    ///  
    ///  where Vin is the thermocouple input voltage.
    ///  
    ///  The frequency filter can be either configured to 50Hz or to 60Hz. You should
    ///  configure it according to your utility frequency.
    ///  
    ///  The conversion time depends on the averaging and filter configuration, it can
    ///  be calculated as follows:
    ///  
    ///  * 60Hz: ``time = 82 + (samples - 1) * 16.67``
    ///  * 50Hz: ``time = 98 + (samples - 1) * 20``
    ///  
    ///  The default configuration is 16 samples, K type and 50Hz.
    /// </summary>
    procedure SetConfiguration(const averaging: byte; const thermocoupleType: byte; const filter: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out averaging: byte; out thermocoupleType: byte; out filter: byte); virtual;

    /// <summary>
    ///  Returns the current error state. There are two possible errors:
    ///  
    ///  * Over/Under Voltage and
    ///  * Open Circuit.
    ///  
    ///  Over/Under Voltage happens for voltages below 0V or above 3.3V. In this case
    ///  it is very likely that your thermocouple is defective. An Open Circuit error
    ///  indicates that there is no thermocouple connected.
    ///  
    ///  You can use the <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.OnErrorState"/> callback to automatically get triggered
    ///  when the error state changes.
    /// </summary>
    procedure GetErrorState(out overUnder: boolean; out openCircuit: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletThermocoupleV2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This Callback is triggered every time the error state changes
    ///  (see <see cref="BrickletThermocoupleV2.TBrickletThermocoupleV2.GetErrorState"/>).
    /// </summary>
    property OnErrorState: TBrickletThermocoupleV2NotifyErrorState read fErrorStateCallback write fErrorStateCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletThermocoupleV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletThermocoupleV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_ERROR_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletThermocoupleV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_THERMOCOUPLE_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_THERMOCOUPLE_V2_CALLBACK_ERROR_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperErrorState;
end;

function TBrickletThermocoupleV2.GetTemperature: longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletThermocoupleV2.SetTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt32To(min, 14, _request);
  LEConvertInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletThermocoupleV2.GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt32From(14, _response);
  max:= LEConvertInt32From(18, _response);
end;

procedure TBrickletThermocoupleV2.SetConfiguration(const averaging: byte; const thermocoupleType: byte; const filter: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(averaging, 8, _request);
  LEConvertUInt8To(thermocoupleType, 9, _request);
  LEConvertUInt8To(filter, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletThermocoupleV2.GetConfiguration(out averaging: byte; out thermocoupleType: byte; out filter: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  averaging:= LEConvertUInt8From(8, _response);
  thermocoupleType:= LEConvertUInt8From(9, _response);
  filter:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletThermocoupleV2.GetErrorState(out overUnder: boolean; out openCircuit: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_ERROR_STATE, 8);
  _response:= SendRequest(_request);
  overUnder:= LEConvertBooleanFrom(8, _response);
  openCircuit:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletThermocoupleV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletThermocoupleV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletThermocoupleV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermocoupleV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermocoupleV2.WriteFirmware(const data: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermocoupleV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermocoupleV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletThermocoupleV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletThermocoupleV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletThermocoupleV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermocoupleV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletThermocoupleV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletThermocoupleV2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var temperature: longint;
begin
  temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletThermocoupleV2.CallbackWrapperErrorState(const aPacket: TDynamicByteArray);
var overUnder: boolean; openCircuit: boolean;
begin
  overUnder:= LEConvertBooleanFrom(8, aPacket);
  openCircuit:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fErrorStateCallback)) then begin
    fErrorStateCallback(self, overUnder, openCircuit);
  end;
end;

end.
