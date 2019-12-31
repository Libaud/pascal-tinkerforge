{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAmbientLightV3;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAmbientLightV3.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletAmbientLightV3 = class;
  TBrickletAmbientLightV3NotifyIlluminance = procedure(aSender: TBrickletAmbientLightV3; const illuminance: longword) of object;

  /// <summary>
  ///  Measures ambient light up to 64000lux
  /// </summary>
  TBrickletAmbientLightV3 = class(TDevice)
  private
    fIlluminanceCallback: TBrickletAmbientLightV3NotifyIlluminance;
    procedure CallbackWrapperIlluminance(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the illuminance of the ambient light sensor. The measurement range goes
    ///  up to about 100000lux, but above 64000lux the precision starts to drop.
    ///  The illuminance is given in lux/100, i.e. a value of 450000 means that an
    ///  illuminance of 4500lux is measured.
    ///  
    ///  An illuminance of 0lux indicates that the sensor is saturated and the
    ///  configuration should be modified, see <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.OnIlluminance"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.OnIlluminance"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.OnIlluminance"/> callback.
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
    procedure SetIlluminanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                                  const aMin: longword; const aMax: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetIlluminanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetIlluminanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                                  out aMin: longword; out aMax: longword); virtual;

    /// <summary>
    ///  Sets the configuration. It is possible to configure an illuminance range
    ///  between 0-600lux and 0-64000lux and an integration time between 50ms and 400ms.
    ///  
    ///  The unlimited illuminance range allows to measure up to about 100000lux, but
    ///  above 64000lux the precision starts to drop.
    ///  
    ///  A smaller illuminance range increases the resolution of the data. A longer
    ///  integration time will Result in less noise on the data.
    ///  
    ///  If the actual measure illuminance is out-of-range then the current illuminance
    ///  range maximum +0.01lux is reported by <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.GetIlluminance"/> and the
    ///  <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.OnIlluminance"/> callback. For example, 800001 for the 0-8000lux range.
    ///  
    ///  With a long integration time the sensor might be saturated before the measured
    ///  value reaches the maximum of the selected illuminance range. In this case 0lux
    ///  is reported by <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.GetIlluminance"/> and the <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.OnIlluminance"/> callback.
    ///  
    ///  If the measurement is out-of-range or the sensor is saturated then you should
    ///  configure the next higher illuminance range. If the highest range is already
    ///  in use, then start to reduce the integration time.
    ///  
    ///  The default values are 0-8000lux illuminance range and 150ms integration time.
    /// </summary>
    procedure SetConfiguration(const aIlluminanceRange: byte; const aIntegrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aIlluminanceRange: byte; out aIntegrationTime: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.SetIlluminanceCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletAmbientLightV3.TBrickletAmbientLightV3.GetIlluminance"/>.
    /// </summary>
    property OnIlluminance: TBrickletAmbientLightV3NotifyIlluminance read fIlluminanceCallback write fIlluminanceCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletAmbientLightV3.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletAmbientLightV3.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_ILLUMINANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_ILLUMINANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_ILLUMINANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAmbientLightV3.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_AMBIENT_LIGHT_V3_CALLBACK_ILLUMINANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
end;

function TBrickletAmbientLightV3.GetIlluminance: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_ILLUMINANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLightV3.SetIlluminanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longword; const aMax: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_ILLUMINANCE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt32To(aMin, 14, _request);
  LEConvertUInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLightV3.GetIlluminanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longword; out aMax: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_ILLUMINANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt32From(14, _response);
  aMax:= LEConvertUInt32From(18, _response);
end;

procedure TBrickletAmbientLightV3.SetConfiguration(const aIlluminanceRange: byte; const aIntegrationTime: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(aIlluminanceRange, 8, _request);
  LEConvertUInt8To(aIntegrationTime, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletAmbientLightV3.GetConfiguration(out aIlluminanceRange: byte; out aIntegrationTime: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aIlluminanceRange:= LEConvertUInt8From(8, _response);
  aIntegrationTime:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletAmbientLightV3.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletAmbientLightV3.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAmbientLightV3.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAmbientLightV3.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLightV3.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAmbientLightV3.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLightV3.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAmbientLightV3.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletAmbientLightV3.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletAmbientLightV3.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletAmbientLightV3.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAmbientLightV3.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V3_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAmbientLightV3.CallbackWrapperIlluminance(const aPacket: TDynamicByteArray);
var
  _illuminance: longword;
begin
  _illuminance:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fIlluminanceCallback)) then begin
    fIlluminanceCallback(self, _illuminance);
  end;
end;

end.
