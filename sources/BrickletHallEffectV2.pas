{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletHallEffectV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletHallEffectV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletHallEffectV2 = class;
  TBrickletHallEffectV2NotifyMagneticFluxDensity = procedure(aSender: TBrickletHallEffectV2; const magneticFluxDensity: smallint) of object;
  TBrickletHallEffectV2NotifyCounter = procedure(aSender: TBrickletHallEffectV2; const count: longword) of object;

  /// <summary>
  ///  Measures magnetic flux density between -7mT and +7mT
  /// </summary>
  TBrickletHallEffectV2 = class(TDevice)
  private
    magneticFluxDensityCallback: TBrickletHallEffectV2NotifyMagneticFluxDensity;
    counterCallback: TBrickletHallEffectV2NotifyCounter;
    procedure CallbackWrapperMagneticFluxDensity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCounter(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the `magnetic flux density (magnetic induction) &lt;https://en.wikipedia.org/wiki/Magnetic_flux&gt;`__.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.OnMagneticFluxDensity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetMagneticFluxDensityCallbackConfiguration"/>.
    /// </summary>
    function GetMagneticFluxDensity: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.OnMagneticFluxDensity"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.OnMagneticFluxDensity"/> callback.
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
    procedure SetMagneticFluxDensityCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetMagneticFluxDensityCallbackConfiguration"/>.
    /// </summary>
    procedure GetMagneticFluxDensityCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Returns the current value of the counter.
    ///  
    ///  You can configure the low/high thresholds and the debounce time
    ///  with <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetCounterConfig"/>.
    ///  
    ///  If you set reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    ///  
    ///  If you want to get the count periodically, it is recommended to use the
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.OnCounter"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetCounterCallbackConfiguration"/>.
    /// </summary>
    function GetCounter(const resetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Sets a high and a low threshold as well as a debounce time.
    ///  
    ///  If the measured magnetic flux density goes above the high threshold or
    ///  below the low threshold, the count of the counter is increased by 1.
    ///  
    ///  The debounce time is the minimum time between two count increments.
    /// </summary>
    procedure SetCounterConfig(const highThreshold: smallint; const lowThreshold: smallint; const debounce: longword); virtual;

    /// <summary>
    ///  Returns the counter config as set by <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetCounterConfig"/>.
    /// </summary>
    procedure GetCounterConfig(out highThreshold: smallint; out lowThreshold: smallint; out debounce: longword); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.OnCounter"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after at least one of the values has changed. If the values didn't
    ///  change within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetCounterCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetCounterCallbackConfiguration"/>.
    /// </summary>
    procedure GetCounterCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetMagneticFluxDensityCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.GetMagneticFluxDensity"/>.
    /// </summary>
    property OnMagneticFluxDensity: TBrickletHallEffectV2NotifyMagneticFluxDensity read magneticFluxDensityCallback write magneticFluxDensityCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.SetCounterCallbackConfiguration"/>.
    ///  
    ///  The count is the same as you would get with <see cref="BrickletHallEffectV2.TBrickletHallEffectV2.GetCounter"/>.
    /// </summary>
    property OnCounter: TBrickletHallEffectV2NotifyCounter read counterCallback write counterCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletHallEffectV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletHallEffectV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_MAGNETIC_FLUX_DENSITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_COUNTER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_COUNTER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletHallEffectV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_HALL_EFFECT_V2_CALLBACK_MAGNETIC_FLUX_DENSITY]:= {$ifdef FPC}@{$endif}CallbackWrapperMagneticFluxDensity;
  aCallBacks[BRICKLET_HALL_EFFECT_V2_CALLBACK_COUNTER]:= {$ifdef FPC}@{$endif}CallbackWrapperCounter;
end;

function TBrickletHallEffectV2.GetMagneticFluxDensity: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_MAGNETIC_FLUX_DENSITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletHallEffectV2.SetMagneticFluxDensityCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt16To(min, 14, _request);
  LEConvertInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletHallEffectV2.GetMagneticFluxDensityCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt16From(14, _response);
  max:= LEConvertInt16From(16, _response);
end;

function TBrickletHallEffectV2.GetCounter(const resetCounter: boolean): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER, 9);
  LEConvertBooleanTo(resetCounter, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHallEffectV2.SetCounterConfig(const highThreshold: smallint; const lowThreshold: smallint; const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_COUNTER_CONFIG, 16);
  LEConvertInt16To(highThreshold, 8, _request);
  LEConvertInt16To(lowThreshold, 10, _request);
  LEConvertUInt32To(debounce, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletHallEffectV2.GetCounterConfig(out highThreshold: smallint; out lowThreshold: smallint; out debounce: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER_CONFIG, 8);
  _response:= SendRequest(_request);
  highThreshold:= LEConvertInt16From(8, _response);
  lowThreshold:= LEConvertInt16From(10, _response);
  debounce:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletHallEffectV2.SetCounterCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_COUNTER_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletHallEffectV2.GetCounterCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_COUNTER_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletHallEffectV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletHallEffectV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletHallEffectV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHallEffectV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletHallEffectV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletHallEffectV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletHallEffectV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletHallEffectV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletHallEffectV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletHallEffectV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletHallEffectV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHallEffectV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletHallEffectV2.CallbackWrapperMagneticFluxDensity(const aPacket: TDynamicByteArray);
var magneticFluxDensity: smallint;
begin
  magneticFluxDensity:= LEConvertInt16From(8, aPacket);

  if (Assigned(magneticFluxDensityCallback)) then begin
    magneticFluxDensityCallback(self, magneticFluxDensity);
  end;
end;

procedure TBrickletHallEffectV2.CallbackWrapperCounter(const aPacket: TDynamicByteArray);
var count: longword;
begin
  count:= LEConvertUInt32From(8, aPacket);

  if (Assigned(counterCallback)) then begin
    counterCallback(self, count);
  end;
end;

end.
