{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialAnalogOutV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialAnalogOutV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  /// <summary>
  ///  Generates configurable DC voltage and current, 0V to 10V and 4mA to 20mA
  /// </summary>
  TBrickletIndustrialAnalogOutV2 = class(TDevice)
  private
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Enables/disables the output of voltage and current.
    /// </summary>
    procedure SetEnabled(const aEnabled: boolean); virtual;

    /// <summary>
    ///  Returns *true* if output of voltage and current is enabled, *false* otherwise.
    /// </summary>
    function GetEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the output voltage.
    ///  
    ///  The output voltage and output current are linked. Changing the output voltage
    ///  also changes the output current.
    /// </summary>
    procedure SetVoltage(const aVoltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetVoltage"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Sets the output current.
    ///  
    ///  The output current and output voltage are linked. Changing the output current
    ///  also changes the output voltage.
    /// </summary>
    procedure SetCurrent(const aCurrent: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetCurrent"/>.
    /// </summary>
    function GetCurrent: word; virtual;

    /// <summary>
    ///  Configures the voltage and current range.
    ///  
    ///  Possible voltage ranges are:
    ///  
    ///  * 0V to 5V
    ///  * 0V to 10V
    ///  
    ///  Possible current ranges are:
    ///  
    ///  * 4mA to 20mA
    ///  * 0mA to 20mA
    ///  * 0mA to 24mA
    ///  
    ///  The resolution will always be 12 bit. This means, that the
    ///  precision is higher with a smaller range.
    /// </summary>
    procedure SetConfiguration(const aVoltageRange: byte; const aCurrentRange: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aVoltageRange: byte; out aCurrentRange: byte); virtual;

    /// <summary>
    ///  You can turn the Out LED off, on or show a
    ///  heartbeat. You can also set the LED to "Out Status". In this mode the
    ///  LED can either be turned on with a pre-defined threshold or the intensity
    ///  of the LED can change with the output value (voltage or current).
    ///  
    ///  You can configure the channel status behavior with <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetOutLEDStatusConfig"/>.
    /// </summary>
    procedure SetOutLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the Out LED configuration as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetOutLEDConfig"/>
    /// </summary>
    function GetOutLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the Out LED status config. This config is used if the Out LED is
    ///  configured as "Out Status", see <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetOutLEDConfig"/>.
    ///  
    ///  For each channel you can choose between threshold and intensity mode.
    ///  
    ///  In threshold mode you can define a positive or a negative threshold.
    ///  For a positive threshold set the "min" parameter to the threshold value in mV or
    ///  µA above which the LED should turn on and set the "max" parameter to 0. Example:
    ///  If you set a positive threshold of 5V, the LED will turn on as soon as the
    ///  output value exceeds 5V and turn off again if it goes below 5V.
    ///  For a negative threshold set the "max" parameter to the threshold value in mV or
    ///  µA below which the LED should turn on and set the "min" parameter to 0. Example:
    ///  If you set a negative threshold of 5V, the LED will turn on as soon as the
    ///  output value goes below 5V and the LED will turn off when the output value
    ///  exceeds 5V.
    ///  
    ///  In intensity mode you can define a range mV or µA that is used to scale the brightness
    ///  of the LED. Example with min=2V, max=8V: The LED is off at 2V and below, on at
    ///  8V and above and the brightness is linearly scaled between the values 2V and 8V.
    ///  If the min value is greater than the max value, the LED brightness is scaled the
    ///  other way around.
    /// </summary>
    procedure SetOutLEDStatusConfig(const aMin: word; const aMax: word; const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the Out LED status configuration as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetOutLEDStatusConfig"/>.
    /// </summary>
    procedure GetOutLEDStatusConfig(out aMin: word; out aMax: word; out aConfig: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIndustrialAnalogOutV2.TBrickletIndustrialAnalogOutV2.SetStatusLEDConfig"/>
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
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialAnalogOutV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialAnalogOutV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_ENABLED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_OUT_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_OUT_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_OUT_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_OUT_LED_STATUS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialAnalogOutV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  // do nothing
end;

procedure TBrickletIndustrialAnalogOutV2.SetEnabled(const aEnabled: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_ENABLED, 9);
  LEConvertBooleanTo(aEnabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.GetEnabled: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetVoltage(const aVoltage: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_VOLTAGE, 10);
  LEConvertUInt16To(aVoltage, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.GetVoltage: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetCurrent(const aCurrent: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_CURRENT, 10);
  LEConvertUInt16To(aCurrent, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.GetCurrent: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetConfiguration(const aVoltageRange: byte; const aCurrentRange: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(aVoltageRange, 8, _request);
  LEConvertUInt8To(aCurrentRange, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialAnalogOutV2.GetConfiguration(out aVoltageRange: byte; out aCurrentRange: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aVoltageRange:= LEConvertUInt8From(8, _response);
  aCurrentRange:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetOutLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_OUT_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.GetOutLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_OUT_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetOutLEDStatusConfig(const aMin: word; const aMax: word; const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_OUT_LED_STATUS_CONFIG, 13);
  LEConvertUInt16To(aMin, 8, _request);
  LEConvertUInt16To(aMax, 10, _request);
  LEConvertUInt8To(aConfig, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialAnalogOutV2.GetOutLEDStatusConfig(out aMin: word; out aMax: word; out aConfig: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_OUT_LED_STATUS_CONFIG, 8);
  _response:= SendRequest(_request);
  aMin:= LEConvertUInt16From(8, _response);
  aMax:= LEConvertUInt16From(10, _response);
  aConfig:= LEConvertUInt8From(12, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIndustrialAnalogOutV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialAnalogOutV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIndustrialAnalogOutV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIndustrialAnalogOutV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialAnalogOutV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialAnalogOutV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

end.
