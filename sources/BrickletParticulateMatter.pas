{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletParticulateMatter;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletParticulateMatter.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletParticulateMatter = class;
  TBrickletParticulateMatterNotifyPMConcentration = procedure(aSender: TBrickletParticulateMatter; const pm10: word; const pm25: word; const pm100: word) of object;
  TBrickletParticulateMatterNotifyPMCount = procedure(aSender: TBrickletParticulateMatter; const greater03um: word; const greater05um: word; const greater10um: word; const greater25um: word; const greater50um: word; const greater100um: word) of object;

  /// <summary>
  ///  Measures Particulate Matter concentration (PM1.0, PM2.5 and PM10)
  /// </summary>
  TBrickletParticulateMatter = class(TDevice)
  private
    pmConcentrationCallback: TBrickletParticulateMatterNotifyPMConcentration;
    pmCountCallback: TBrickletParticulateMatterNotifyPMCount;
  protected
    procedure CallbackWrapperPMConcentration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPMCount(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the particulate matter concentration, broken down as:
    ///  
    ///  * PM\ :sub:`1.0`\ ,
    ///  * PM\ :sub:`2.5`\  and
    ///  * PM\ :sub:`10.0`\ .
    ///  
    ///  If the sensor is disabled (see <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetEnable"/>) then the last known good
    ///  values from the sensor are returned.
    ///  
    ///  If you want to get the values periodically, it is recommended to use the
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.OnPMConcentration"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMConcentrationCallbackConfiguration"/>.
    /// </summary>
    procedure GetPMConcentration(out pm10: word; out pm25: word; out pm100: word); virtual;

    /// <summary>
    ///  Returns the number of particulates in 100 ml of air, broken down by their
    ///  diameter:
    ///  
    ///  * greater 0.3µm,
    ///  * greater 0.5µm,
    ///  * greater 1.0µm,
    ///  * greater 2.5µm,
    ///  * greater 5.0µm and
    ///  * greater 10.0µm.
    ///  
    ///  If the sensor is disabled (see <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetEnable"/>) then the last known good
    ///  value from the sensor is returned.
    ///  
    ///  If you want to get the values periodically, it is recommended to use the
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.OnPMCount"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMCountCallbackConfiguration"/>.
    /// </summary>
    procedure GetPMCount(out greater03um: word; out greater05um: word; out greater10um: word; out greater25um: word; out greater50um: word; out greater100um: word); virtual;

    /// <summary>
    ///  Enables/Disables the fan and the laser diode of the sensors. The sensor is
    ///  enabled by default.
    ///  
    ///  The sensor takes about 30 seconds after it is enabled to settle and produce stable
    ///  values.
    ///  
    ///  The laser diode has a lifetime of about 8000 hours. If you want to measure in
    ///  an interval with a long idle time (e.g. hourly) you should turn the
    ///  laser diode off between the measurements.
    /// </summary>
    procedure SetEnable(const enable: boolean); virtual;

    /// <summary>
    ///  Returns the state of the sensor as set by <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetEnable"/>.
    /// </summary>
    function GetEnable: boolean; virtual;

    /// <summary>
    ///  Returns information about the sensor:
    ///  
    ///  * the sensor version number,
    ///  * the last error code reported by the sensor (0 means no error) and
    ///  * the number of framing and checksum errors that occurred in the communication
    ///    with the sensor.
    /// </summary>
    procedure GetSensorInfo(out sensorVersion: byte; out lastErrorCode: byte; out framingErrorCount: byte; out checksumErrorCount: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.OnPMConcentration"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetPMConcentrationCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMConcentrationCallbackConfiguration"/>.
    /// </summary>
    procedure GetPMConcentrationCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.OnPMCount"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetPMCountCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMCountCallbackConfiguration"/>.
    /// </summary>
    procedure GetPMCountCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMConcentrationCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.GetPMConcentration"/>.
    /// </summary>
    property OnPMConcentration: TBrickletParticulateMatterNotifyPMConcentration read pmConcentrationCallback write pmConcentrationCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.SetPMCountCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletParticulateMatter.TBrickletParticulateMatter.GetPMCount"/>.
    /// </summary>
    property OnPMCount: TBrickletParticulateMatterNotifyPMCount read pmCountCallback write pmCountCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletParticulateMatter.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletParticulateMatter.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_CONCENTRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_ENABLE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_SENSOR_INFO]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_PM_CONCENTRATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_CONCENTRATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_PM_COUNT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_COUNT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletParticulateMatter.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PARTICULATE_MATTER_CALLBACK_PM_CONCENTRATION]:= {$ifdef FPC}@{$endif}CallbackWrapperPMConcentration;
  aCallBacks[BRICKLET_PARTICULATE_MATTER_CALLBACK_PM_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperPMCount;
end;

procedure TBrickletParticulateMatter.GetPMConcentration(out pm10: word; out pm25: word; out pm100: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_CONCENTRATION, 8);
  _response:= SendRequest(_request);
  pm10:= LEConvertUInt16From(8, _response);
  pm25:= LEConvertUInt16From(10, _response);
  pm100:= LEConvertUInt16From(12, _response);
end;

procedure TBrickletParticulateMatter.GetPMCount(out greater03um: word; out greater05um: word; out greater10um: word; out greater25um: word; out greater50um: word; out greater100um: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_COUNT, 8);
  _response:= SendRequest(_request);
  greater03um:= LEConvertUInt16From(8, _response);
  greater05um:= LEConvertUInt16From(10, _response);
  greater10um:= LEConvertUInt16From(12, _response);
  greater25um:= LEConvertUInt16From(14, _response);
  greater50um:= LEConvertUInt16From(16, _response);
  greater100um:= LEConvertUInt16From(18, _response);
end;

procedure TBrickletParticulateMatter.SetEnable(const enable: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_ENABLE, 9);
  LEConvertBooleanTo(enable, 8, _request);
  SendRequest(_request);
end;

function TBrickletParticulateMatter.GetEnable: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_ENABLE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletParticulateMatter.GetSensorInfo(out sensorVersion: byte; out lastErrorCode: byte; out framingErrorCount: byte; out checksumErrorCount: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_SENSOR_INFO, 8);
  _response:= SendRequest(_request);
  sensorVersion:= LEConvertUInt8From(8, _response);
  lastErrorCode:= LEConvertUInt8From(9, _response);
  framingErrorCount:= LEConvertUInt8From(10, _response);
  checksumErrorCount:= LEConvertUInt8From(11, _response);
end;

procedure TBrickletParticulateMatter.SetPMConcentrationCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_PM_CONCENTRATION_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletParticulateMatter.GetPMConcentrationCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_CONCENTRATION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletParticulateMatter.SetPMCountCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_PM_COUNT_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletParticulateMatter.GetPMCountCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_PM_COUNT_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletParticulateMatter.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletParticulateMatter.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletParticulateMatter.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletParticulateMatter.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletParticulateMatter.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletParticulateMatter.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletParticulateMatter.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletParticulateMatter.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletParticulateMatter.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletParticulateMatter.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletParticulateMatter.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletParticulateMatter.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PARTICULATE_MATTER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletParticulateMatter.CallbackWrapperPMConcentration(const aPacket: TDynamicByteArray);
var pm10: word; pm25: word; pm100: word;
begin
  pm10:= LEConvertUInt16From(8, aPacket);
  pm25:= LEConvertUInt16From(10, aPacket);
  pm100:= LEConvertUInt16From(12, aPacket);

  if (Assigned(pmConcentrationCallback)) then begin
    pmConcentrationCallback(self, pm10, pm25, pm100);
  end;
end;

procedure TBrickletParticulateMatter.CallbackWrapperPMCount(const aPacket: TDynamicByteArray);
var greater03um: word; greater05um: word; greater10um: word; greater25um: word; greater50um: word; greater100um: word;
begin
  greater03um:= LEConvertUInt16From(8, aPacket);
  greater05um:= LEConvertUInt16From(10, aPacket);
  greater10um:= LEConvertUInt16From(12, aPacket);
  greater25um:= LEConvertUInt16From(14, aPacket);
  greater50um:= LEConvertUInt16From(16, aPacket);
  greater100um:= LEConvertUInt16From(18, aPacket);

  if (Assigned(pmCountCallback)) then begin
    pmCountCallback(self, greater03um, greater05um, greater10um, greater25um, greater50um, greater100um);
  end;
end;

end.
