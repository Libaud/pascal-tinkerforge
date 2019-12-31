{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAnalogInV3;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAnalogInV3.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletAnalogInV3 = class;
  TBrickletAnalogInV3NotifyVoltage = procedure(aSender: TBrickletAnalogInV3; const aVoltage: word) of object;

  /// <summary>
  ///  Measures DC voltage between 0V and 42V
  /// </summary>
  TBrickletAnalogInV3 = class(TDevice)
  private
    fVoltageCallback: TBrickletAnalogInV3NotifyVoltage;
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured voltage. The resolution is approximately 10mV to 1mV
    ///  depending on the oversampling configuration (<see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetOversampling"/>).
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.OnVoltage"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.OnVoltage"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.OnVoltage"/> callback.
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
    procedure SetVoltageCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean;
                                              const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    procedure GetVoltageCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                              out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the oversampling between 32x and 16384x. The Bricklet
    ///  takes one 12bit sample every 17.5µs. Thus an oversampling
    ///  of 32x is equivalent to an integration time of 0.56ms and
    ///  a oversampling of 16384x is equivalent to an integration
    ///  time of 286ms.
    ///  
    ///  The oversampling uses the moving average principle. A
    ///  new value is always calculated once per millisecond.
    ///  
    ///  With increased oversampling the noise decreases. With decreased
    ///  oversampling the reaction time increases (changes in voltage will be
    ///  measured faster).
    /// </summary>
    procedure SetOversampling(const aOversampling: byte); virtual;

    /// <summary>
    ///  Returns the oversampling value as set by <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetOversampling"/>.
    /// </summary>
    function GetOversampling: byte; virtual;

    /// <summary>
    ///  Sets a calibration for the measured voltage value.
    ///  The formula for the calibration is as follows::
    ///  
    ///   Calibrated Value = (Value + Offset) * Multiplier / Divisor
    ///  
    ///  We recommend that you use the Brick Viewer to calibrate
    ///  the Bricklet. The calibration will be saved internally and only
    ///  has to be done once.
    /// </summary>
    procedure SetCalibration(const aOffset: smallint; const aMultiplier: word; const aDivisor: word); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out aOffset: smallint; out aMultiplier: word; out aDivisor: word); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.SetVoltageCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletAnalogInV3.TBrickletAnalogInV3.GetVoltage"/>.
    /// </summary>
    property OnVoltage: TBrickletAnalogInV3NotifyVoltage read fVoltageCallback write fVoltageCallback;
  end;

implementation

uses
  TInkerforgeExceptions;

procedure TBrickletAnalogInV3.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletAnalogInV3.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_OVERSAMPLING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_OVERSAMPLING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ANALOG_IN_V3_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAnalogInV3.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ANALOG_IN_V3_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
end;

function TBrickletAnalogInV3.GetVoltage: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletAnalogInV3.SetVoltageCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt16To(aMin, 14, _request);
  LEConvertUInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogInV3.GetVoltageCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt16From(14, _response);
  aMax:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletAnalogInV3.SetOversampling(const aOversampling: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_OVERSAMPLING, 9);
  LEConvertUInt8To(aOversampling, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV3.GetOversampling: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_OVERSAMPLING, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogInV3.SetCalibration(const aOffset: smallint; const aMultiplier: word; const aDivisor: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_CALIBRATION, 14);
  LEConvertInt16To(aOffset, 8, _request);
  LEConvertUInt16To(aMultiplier, 10, _request);
  LEConvertUInt16To(aDivisor, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletAnalogInV3.GetCalibration(out aOffset: smallint; out aMultiplier: word; out aDivisor: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  aOffset:= LEConvertInt16From(8, _response);
  aMultiplier:= LEConvertUInt16From(10, _response);
  aDivisor:= LEConvertUInt16From(12, _response);
end;

procedure TBrickletAnalogInV3.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletAnalogInV3.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAnalogInV3.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogInV3.SetWriteFirmwarePointer(const pointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV3.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAnalogInV3.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV3.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAnalogInV3.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletAnalogInV3.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletAnalogInV3.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletAnalogInV3.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAnalogInV3.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ANALOG_IN_V3_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAnalogInV3.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, _voltage);
  end;
end;

end.
