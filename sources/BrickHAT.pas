{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickHAT;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Device, TinkerforgeCommon, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickHAT.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickHAT = class;
  TBrickHATNotifyVoltages = procedure(aSender: TBrickHAT; const aVoltageUSB: word; const aVoltageDC: word) of object;

  /// <summary>
  ///  HAT for Raspberry Pi with 8 Bricklets ports and real-time clock
  /// </summary>
  TBrickHAT = class(TDevice)
  private
    voltagesCallback: TBrickHATNotifyVoltages;
  protected
    procedure CallbackWrapperVoltages(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the sleep mode.
    ///  
    ///  <note>
    ///   Calling this function will cut the Raspberry Pi's power after Power Off Delay seconds.
    ///   You have to shut down the operating system yourself, e.g. by calling 'sudo shutdown -h now'.
    ///  </note>
    ///  
    ///  Parameters:
    ///  
    ///  * Power Off Delay: Time in seconds before the RPi/Bricklets are powered off.
    ///  * Power Off Duration: Duration in seconds that the RPi/Bricklets stay powered off.
    ///  * Raspberry Pi Off: RPi is powered off if set to true.
    ///  * Bricklets Off: Bricklets are powered off if set to true.
    ///  * Enable Sleep Indicator: If set to true, the status LED will blink in a 1s interval
    ///    during the whole power off duration. This will draw additional 0.3mA.
    ///  
    ///  Example: To turn RPi and Bricklets off in 5 seconds for 10 minutes with sleep
    ///  indicator enabled, call (5, 60*10, true, true, true).
    ///  
    ///  This function can also be used to implement a watchdog. To do this you can
    ///  write a program that calls this function once per second in a loop with
    ///  (10, 2, true, false, false). If the RPi crashes or gets stuck
    ///  the HAT will reset the RPi after 10 seconds.
    /// </summary>
    procedure SetSleepMode(const aPowerOffDelay: longword; const aPowerOffDuration: longword;
                           const aRaspberryPiOff: boolean; const aBrickletsOff: boolean;
                           const aEnableSleepIndicator: boolean); virtual;

    /// <summary>
    ///  Returns the sleep mode settings as set by <see cref="BrickHAT.TBrickHAT.SetSleepMode"/>.
    /// </summary>
    procedure GetSleepMode(out aPowerOffDelay: longword; out aPowerOffDuration: longword;
                           out aRaspberryPiOff: boolean; out aBrickletsOff: boolean;
                           out aEnableSleepIndicator: boolean); virtual;

    /// <summary>
    ///  Set to true/false to turn the power supply of the connected Bricklets on/off.
    ///  
    ///  By default the Bricklets are on.
    /// </summary>
    procedure SetBrickletPower(const aBrickletPower: boolean); virtual;

    /// <summary>
    ///  Returns the power status of the connected Bricklets as set by <see cref="BrickHAT.TBrickHAT.SetBrickletPower"/>.
    /// </summary>
    function GetBrickletPower: boolean; virtual;

    /// <summary>
    ///  Returns the USB supply voltage and the DC input supply voltage in mV.
    ///  
    ///  There are three possible combinations:
    ///  
    ///  * Only USB connected: The USB supply voltage will be fed back to the
    ///    DC input connector. You will read the USB voltage and a slightly lower
    ///    voltage on the DC input.
    ///  * Only DC input connected: The DC voltage will not be fed back to the
    ///    USB connector. You will read the DC input voltage and the USB voltage
    ///    will be 0.
    ///  * USB and DC input connected: You will read both voltages. In this case
    ///    the USB supply will be without load, but it will work as backup if you
    ///    disconnect the DC input (or if the DC input voltage falls below the
    ///    USB voltage).
    /// </summary>
    procedure GetVoltages(out aVoltageUSB: word; out aVoltageDC: word); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickHAT.TBrickHAT.OnVoltages"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure SetVoltagesCallbackConfiguration(const aPeriod: longword;
                                               const aValueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickHAT.TBrickHAT.SetVoltagesCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure GetVoltagesCallbackConfiguration(out aPeriod: longword;
                                               out aValueHasToChange: boolean); virtual;

    /// <summary>                                       (var aCallBacks: TTFCallbackWrappers)
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
    ///  Returns the current bootloader mode, see <see cref="BrickHAT.TBrickHAT.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickHAT.TBrickHAT.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickHAT.TBrickHAT.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickHAT.TBrickHAT.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickHAT.TBrickHAT.SetVoltagesCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickHAT.TBrickHAT.GetVoltages"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    property OnVoltages: TBrickHATNotifyVoltages read voltagesCallback write voltagesCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickHAT.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickHAT.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_HAT_FUNCTION_SET_SLEEP_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_SLEEP_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_SET_BRICKLET_POWER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_BRICKLET_POWER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_VOLTAGES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_SET_VOLTAGES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_VOLTAGES_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_HAT_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_HAT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickHAT.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallbacks[BRICK_HAT_CALLBACK_VOLTAGES]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltages;
end;

procedure TBrickHAT.SetSleepMode(const aPowerOffDelay: longword; const aPowerOffDuration: longword; const aRaspberryPiOff: boolean; const aBrickletsOff: boolean; const aEnableSleepIndicator: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_SLEEP_MODE, 19);
  LEConvertUInt32To(aPowerOffDelay, 8, _request);
  LEConvertUInt32To(aPowerOffDuration, 12, _request);
  LEConvertBooleanTo(aRaspberryPiOff, 16, _request);
  LEConvertBooleanTo(aBrickletsOff, 17, _request);
  LEConvertBooleanTo(aEnableSleepIndicator, 18, _request);
  SendRequest(_request);
end;

procedure TBrickHAT.GetSleepMode(out aPowerOffDelay: longword; out aPowerOffDuration: longword; out aRaspberryPiOff: boolean; out aBrickletsOff: boolean; out aEnableSleepIndicator: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_SLEEP_MODE, 8);
  _response:= SendRequest(_request);
  aPowerOffDelay:= LEConvertUInt32From(8, _response);
  aPowerOffDuration:= LEConvertUInt32From(12, _response);
  aRaspberryPiOff:= LEConvertBooleanFrom(16, _response);
  aBrickletsOff:= LEConvertBooleanFrom(17, _response);
  aEnableSleepIndicator:= LEConvertBooleanFrom(18, _response);
end;

procedure TBrickHAT.SetBrickletPower(const aBrickletPower: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_BRICKLET_POWER, 9);
  LEConvertBooleanTo(aBrickletPower, 8, _request);
  SendRequest(_request);
end;

function TBrickHAT.GetBrickletPower: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_BRICKLET_POWER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickHAT.GetVoltages(out aVoltageUSB: word; out aVoltageDC: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_VOLTAGES, 8);
  _response:= SendRequest(_request);
  aVoltageUSB:= LEConvertUInt16From(8, _response);
  aVoltageDC:= LEConvertUInt16From(10, _response);
end;

procedure TBrickHAT.SetVoltagesCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_VOLTAGES_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickHAT.GetVoltagesCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_VOLTAGES_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickHAT.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickHAT.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickHAT.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickHAT.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickHAT.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickHAT.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickHAT.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickHAT.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickHAT.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickHAT.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickHAT.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickHAT.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_HAT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickHAT.CallbackWrapperVoltages(const aPacket: TDynamicByteArray);
var
  voltageUSB: word;
  voltageDC: word;
begin
  voltageUSB:= LEConvertUInt16From(8, aPacket);
  voltageDC:= LEConvertUInt16From(10, aPacket);

  if (Assigned(voltagesCallback)) then begin
    voltagesCallback(self, voltageUSB, voltageDC);
  end;
end;

end.
