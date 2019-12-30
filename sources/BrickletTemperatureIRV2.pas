{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletTemperatureIRV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletTemperatureIRV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletTemperatureIRV2 = class;
  TBrickletTemperatureIRV2NotifyAmbientTemperature = procedure(sender: TBrickletTemperatureIRV2; const aTemperature: smallint) of object;
  TBrickletTemperatureIRV2NotifyObjectTemperature = procedure(sender: TBrickletTemperatureIRV2; const aTemperature: smallint) of object;

  /// <summary>
  ///  Measures contactless object temperature between -70°C and +380°C
  /// </summary>
  TBrickletTemperatureIRV2 = class(TDevice)
  private
    fAmbientTemperatureCallback: TBrickletTemperatureIRV2NotifyAmbientTemperature;
    fObjectTemperatureCallback: TBrickletTemperatureIRV2NotifyObjectTemperature;
    procedure CallbackWrapperAmbientTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperObjectTemperature(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the ambient temperature of the sensor.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnAmbientTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetAmbientTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetAmbientTemperature: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnAmbientTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnAmbientTemperature"/> callback.
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
    procedure SetAmbientTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean;
                                                         const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetAmbientTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetAmbientTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Returns the object temperature of the sensor, i.e. the temperature
    ///  of the surface of the object the sensor is aimed at.
    ///  
    ///  The temperature of different materials is dependent on their `emissivity
    ///  &lt;https://en.wikipedia.org/wiki/Emissivity&gt;`__. The emissivity of the material
    ///  can be set with <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetEmissivity"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnObjectTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetObjectTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetObjectTemperature: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnObjectTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.OnObjectTemperature"/> callback.
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
    procedure SetObjectTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean;
                                                        const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetObjectTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetObjectTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean;
                                                        out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Sets the `emissivity &lt;https://en.wikipedia.org/wiki/Emissivity&gt;`__ that is
    ///  used to calculate the surface temperature as returned by
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.GetObjectTemperature"/>.
    ///  
    ///  The emissivity is usually given as a value between 0.0 and 1.0. A list of
    ///  emissivities of different materials can be found
    ///  `here &lt;https://www.infrared-thermography.com/material.htm&gt;`__.
    ///  
    ///  The parameter of <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetEmissivity"/> has to be given with a factor of
    ///  65535 (16-bit). For example: An emissivity of 0.1 can be set with the
    ///  value 6553, an emissivity of 0.5 with the value 32767 and so on.
    ///  
    ///  <note>
    ///   If you need a precise measurement for the object temperature, it is
    ///   absolutely crucial that you also provide a precise emissivity.
    ///  </note>
    ///  
    ///  The emissivity is stored in non-volatile memory and will still be
    ///  used after a restart or power cycle of the Bricklet.
    /// </summary>
    procedure SetEmissivity(const aEmissivity: word); virtual;

    /// <summary>
    ///  Returns the emissivity as set by <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetEmissivity"/>.
    /// </summary>
    function GetEmissivity: word; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetAmbientTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.GetAmbientTemperature"/>.
    /// </summary>
    property OnAmbientTemperature: TBrickletTemperatureIRV2NotifyAmbientTemperature read fAmbientTemperatureCallback write fAmbientTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.SetObjectTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletTemperatureIRV2.TBrickletTemperatureIRV2.GetObjectTemperature"/>.
    /// </summary>
    property OnObjectTemperature: TBrickletTemperatureIRV2NotifyObjectTemperature read fObjectTemperatureCallback write fObjectTemperatureCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletTemperatureIRV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletTemperatureIRV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_AMBIENT_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_OBJECT_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_EMISSIVITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_EMISSIVITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletTemperatureIRV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_TEMPERATURE_IR_V2_CALLBACK_AMBIENT_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperAmbientTemperature;
  aCallBacks[BRICKLET_TEMPERATURE_IR_V2_CALLBACK_OBJECT_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperObjectTemperature;
end;

function TBrickletTemperatureIRV2.GetAmbientTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_AMBIENT_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletTemperatureIRV2.SetAmbientTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_AMBIENT_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt16To(aMin, 14, _request);
  LEConvertInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletTemperatureIRV2.GetAmbientTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_AMBIENT_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt16From(14, _response);
  aMax:= LEConvertInt16From(16, _response);
end;

function TBrickletTemperatureIRV2.GetObjectTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_OBJECT_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletTemperatureIRV2.SetObjectTemperatureCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_OBJECT_TEMPERATURE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt16To(aMin, 14, _request);
  LEConvertInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletTemperatureIRV2.GetObjectTemperatureCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_OBJECT_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt16From(14, _response);
  aMax:= LEConvertInt16From(16, _response);
end;

procedure TBrickletTemperatureIRV2.SetEmissivity(const aEmissivity: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_EMISSIVITY, 10);
  LEConvertUInt16To(aEmissivity, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIRV2.GetEmissivity: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_EMISSIVITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletTemperatureIRV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletTemperatureIRV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletTemperatureIRV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletTemperatureIRV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIRV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletTemperatureIRV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIRV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletTemperatureIRV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletTemperatureIRV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletTemperatureIRV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletTemperatureIRV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletTemperatureIRV2.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_TEMPERATURE_IR_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletTemperatureIRV2.CallbackWrapperAmbientTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: smallint;
begin
  _temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fAmbientTemperatureCallback)) then begin
    fAmbientTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickletTemperatureIRV2.CallbackWrapperObjectTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: smallint;
begin
  _temperature:= LEConvertInt16From(8, aPacket);

  if (Assigned(fObjectTemperatureCallback)) then begin
    fObjectTemperatureCallback(self, _temperature);
  end;
end;

end.
