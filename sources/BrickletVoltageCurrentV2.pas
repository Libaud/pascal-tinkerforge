{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletVoltageCurrentV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletVoltageCurrentV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletVoltageCurrentV2 = class;
  TBrickletVoltageCurrentV2NotifyCurrent = procedure(aSender: TBrickletVoltageCurrentV2; const aCurrent: longint) of object;
  TBrickletVoltageCurrentV2NotifyVoltage = procedure(aSender: TBrickletVoltageCurrentV2; const aVoltage: longint) of object;
  TBrickletVoltageCurrentV2NotifyPower = procedure(aSender: TBrickletVoltageCurrentV2; const aPower: longint) of object;

  /// <summary>
  ///  Measures power, DC voltage and DC current up to 720W/36V/20A
  /// </summary>
  TBrickletVoltageCurrentV2 = class(TDevice)
  private
    fCurrentCallback: TBrickletVoltageCurrentV2NotifyCurrent;
    fVoltageCallback: TBrickletVoltageCurrentV2NotifyVoltage;
    fPowerCallback: TBrickletVoltageCurrentV2NotifyPower;
    procedure CallbackWrapperCurrent(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPower(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the current. The value is in mA
    ///  and between -20000mA and 20000mA.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnCurrent"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetCurrentCallbackConfiguration"/>.
    /// </summary>
    function GetCurrent: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnCurrent"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnCurrent"/> callback.
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
    procedure SetCurrentCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                              const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetCurrentCallbackConfiguration"/>.
    /// </summary>
    procedure GetCurrentCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char;
                                              out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the voltage. The value is in mV
    ///  and between 0mV and 36000mV.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnVoltage"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    function GetVoltage: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnVoltage"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnVoltage"/> callback.
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
    procedure SetVoltageCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                              const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetVoltageCallbackConfiguration"/>.
    /// </summary>
    procedure GetVoltageCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean;
                                              out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the power. The value is in mW
    ///  and between 0mV and 720000mW.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnPower"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetPowerCallbackConfiguration"/>.
    /// </summary>
    function GetPower: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnPower"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.OnPower"/> callback.
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
    procedure SetPowerCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char;
                                            const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetPowerCallbackConfiguration"/>.
    /// </summary>
    procedure GetPowerCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean;
                                            out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the configuration of the Voltage/Current Bricklet 2.0. It is
    ///  possible to configure number of averages as well as
    ///  voltage and current conversion time.
    ///  
    ///  Averaging:
    ///  
    ///  <code>
    ///   "Value", "Number of Averages"
    ///  
    ///   "0",    "1"
    ///   "1",    "4"
    ///   "2",    "16"
    ///   "3",    "64"
    ///   "4",    "128"
    ///   "5",    "256"
    ///   "6",    "512"
    ///   "&gt;=7",  "1024"
    ///  </code>
    ///  
    ///  Voltage/Current conversion:
    ///  
    ///  <code>
    ///   "Value", "Conversion time"
    ///  
    ///   "0",    "140µs"
    ///   "1",    "204µs"
    ///   "2",    "332µs"
    ///   "3",    "588µs"
    ///   "4",    "1.1ms"
    ///   "5",    "2.116ms"
    ///   "6",    "4.156ms"
    ///   "&gt;=7",  "8.244ms"
    ///  </code>
    ///  
    ///  The default values are 3, 4 and 4 (64, 1.1ms, 1.1ms) for averaging, voltage
    ///  conversion and current conversion.
    /// </summary>
    procedure SetConfiguration(const aAveraging: byte; const aVoltageConversionTime: byte; const aCurrentConversionTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aAveraging: byte; out aVoltageConversionTime: byte; out aCurrentConversionTime: byte); virtual;

    /// <summary>
    ///  Since the ADC and the shunt resistor used for the measurements
    ///  are not perfect they need to be calibrated by a multiplier and
    ///  a divisor if a very precise reading is needed.
    ///  
    ///  For example, if you are expecting a current of 1000mA and you
    ///  are measuring 1023mA, you can calibrate the Voltage/Current Bricklet
    ///  by setting the current multiplier to 1000 and the divisor to 1023.
    ///  The same applies for the voltage.
    ///  
    ///  The calibration will be saved on the EEPROM of the Voltage/Current
    ///  Bricklet and only needs to be done once.
    /// </summary>
    procedure SetCalibration(const aVoltageMultiplier: word; const aVoltageDivisor: word; const aCurrentMultiplier: word; const aCurrentDivisor: word); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out aVoltageMultiplier: word; out aVoltageDivisor: word; out aCurrentMultiplier: word; out aCurrentDivisor: word); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetCurrentCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.GetCurrent"/>.
    /// </summary>
    property OnCurrent: TBrickletVoltageCurrentV2NotifyCurrent read fCurrentCallback write fCurrentCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetVoltageCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.GetVoltage"/>.
    /// </summary>
    property OnVoltage: TBrickletVoltageCurrentV2NotifyVoltage read fVoltageCallback write fVoltageCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.SetPowerCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletVoltageCurrentV2.TBrickletVoltageCurrentV2.GetPower"/>.
    /// </summary>
    property OnPower: TBrickletVoltageCurrentV2NotifyPower read fPowerCallback write fPowerCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletVoltageCurrentV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletVoltageCurrentV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CURRENT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CURRENT_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_POWER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_POWER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_POWER_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletVoltageCurrentV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_V2_CALLBACK_CURRENT]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrent;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_V2_CALLBACK_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  aCallBacks[BRICKLET_VOLTAGE_CURRENT_V2_CALLBACK_POWER]:= {$ifdef FPC}@{$endif}CallbackWrapperPower;
end;

function TBrickletVoltageCurrentV2.GetCurrent: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.SetCurrentCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CURRENT_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.GetCurrentCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CURRENT_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletVoltageCurrentV2.GetVoltage: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.SetVoltageCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_VOLTAGE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.GetVoltageCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_VOLTAGE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletVoltageCurrentV2.GetPower: longint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_POWER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.SetPowerCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_POWER_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.GetPowerCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_POWER_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

procedure TBrickletVoltageCurrentV2.SetConfiguration(const aAveraging: byte; const aVoltageConversionTime: byte; const aCurrentConversionTime: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(aAveraging, 8, _request);
  LEConvertUInt8To(aVoltageConversionTime, 9, _request);
  LEConvertUInt8To(aCurrentConversionTime, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.GetConfiguration(out aAveraging: byte; out aVoltageConversionTime: byte; out aCurrentConversionTime: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aAveraging:= LEConvertUInt8From(8, _response);
  aVoltageConversionTime:= LEConvertUInt8From(9, _response);
  aCurrentConversionTime:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletVoltageCurrentV2.SetCalibration(const aVoltageMultiplier: word; const aVoltageDivisor: word; const aCurrentMultiplier: word; const aCurrentDivisor: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_CALIBRATION, 16);
  LEConvertUInt16To(aVoltageMultiplier, 8, _request);
  LEConvertUInt16To(aVoltageDivisor, 10, _request);
  LEConvertUInt16To(aCurrentMultiplier, 12, _request);
  LEConvertUInt16To(aCurrentDivisor, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.GetCalibration(out aVoltageMultiplier: word; out aVoltageDivisor: word; out aCurrentMultiplier: word; out aCurrentDivisor: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  aVoltageMultiplier:= LEConvertUInt16From(8, _response);
  aVoltageDivisor:= LEConvertUInt16From(10, _response);
  aCurrentMultiplier:= LEConvertUInt16From(12, _response);
  aCurrentDivisor:= LEConvertUInt16From(14, _response);
end;

procedure TBrickletVoltageCurrentV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletVoltageCurrentV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletVoltageCurrentV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrentV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrentV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletVoltageCurrentV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletVoltageCurrentV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletVoltageCurrentV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletVoltageCurrentV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_VOLTAGE_CURRENT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletVoltageCurrentV2.CallbackWrapperCurrent(const aPacket: TDynamicByteArray);
var
  _current: longint;
begin
  _current:= LEConvertInt32From(8, aPacket);

  if (Assigned(fCurrentCallback)) then begin
    fCurrentCallback(self, _current);
  end;
end;

procedure TBrickletVoltageCurrentV2.CallbackWrapperVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: longint;
begin
  _voltage:= LEConvertInt32From(8, aPacket);

  if (Assigned(fVoltageCallback)) then begin
    fVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickletVoltageCurrentV2.CallbackWrapperPower(const aPacket: TDynamicByteArray);
var
  _power: longint;
begin
  _power:= LEConvertInt32From(8, aPacket);

  if (Assigned(fPowerCallback)) then begin
    fPowerCallback(self, _power);
  end;
end;

end.
