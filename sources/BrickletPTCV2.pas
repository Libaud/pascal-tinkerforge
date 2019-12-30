{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletPTCV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletPTCV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletPTCV2 = class;
  TBrickletPTCV2NotifyTemperature = procedure(sender: TBrickletPTCV2; const temperature: longint) of object;
  TBrickletPTCV2NotifyResistance = procedure(sender: TBrickletPTCV2; const resistance: longint) of object;
  TBrickletPTCV2NotifySensorConnected = procedure(sender: TBrickletPTCV2; const connected: boolean) of object;

  /// <summary>
  ///  Reads temperatures from Pt100 und Pt1000 sensors
  /// </summary>
  TBrickletPTCV2 = class(TDevice)
  private
    fTemperatureCallback: TBrickletPTCV2NotifyTemperature;
    fResistanceCallback: TBrickletPTCV2NotifyResistance;
    fSensorConnectedCallback: TBrickletPTCV2NotifySensorConnected;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperResistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperSensorConnected(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the temperature of the connected sensor. The value
    ///  has a range of -246 to 849 °C and is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.OnTemperature"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletPTCV2.TBrickletPTCV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletPTCV2.TBrickletPTCV2.OnTemperature"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletPTCV2.TBrickletPTCV2.OnTemperature"/> callback.
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
    ///  Returns the callback configuration as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetTemperatureCallbackConfiguration"/>.
    /// </summary>
    procedure GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Returns the value as measured by the MAX31865 precision delta-sigma ADC.
    ///  
    ///  The value can be converted with the following formulas:
    ///  
    ///  * Pt100:  resistance = (value * 390) / 32768
    ///  * Pt1000: resistance = (value * 3900) / 32768
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.OnResistance"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletPTCV2.TBrickletPTCV2.SetResistanceCallbackConfiguration"/>.
    /// </summary>
    function GetResistance: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletPTCV2.TBrickletPTCV2.OnResistance"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletPTCV2.TBrickletPTCV2.OnResistance"/> callback.
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
    procedure SetResistanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetResistanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetResistanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the noise rejection filter to either 50Hz (0) or 60Hz (1).
    ///  Noise from 50Hz or 60Hz power sources (including
    ///  harmonics of the AC power's fundamental frequency) is
    ///  attenuated by 82dB.
    ///  
    ///  Default value is 0 = 50Hz.
    /// </summary>
    procedure SetNoiseRejectionFilter(const filter: byte); virtual;

    /// <summary>
    ///  Returns the noise rejection filter option as set by
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.SetNoiseRejectionFilter"/>
    /// </summary>
    function GetNoiseRejectionFilter: byte; virtual;

    /// <summary>
    ///  Returns *true* if the sensor is connected correctly.
    ///  
    ///  If this function
    ///  returns *false*, there is either no Pt100 or Pt1000 sensor connected,
    ///  the sensor is connected incorrectly or the sensor itself is faulty.
    ///  
    ///  If you want to get the status automatically, it is recommended to use the
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.OnSensorConnected"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletPTCV2.TBrickletPTCV2.SetSensorConnectedCallbackConfiguration"/>.
    /// </summary>
    function IsSensorConnected: boolean; virtual;

    /// <summary>
    ///  Sets the wire mode of the sensor. Possible values are 2, 3 and 4 which
    ///  correspond to 2-, 3- and 4-wire sensors. The value has to match the jumper
    ///  configuration on the Bricklet.
    ///  
    ///  The default value is 2 = 2-wire.
    /// </summary>
    procedure SetWireMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the wire mode as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetWireMode"/>
    /// </summary>
    function GetWireMode: byte; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the resistance and temperature.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 1-1000.
    ///  
    ///  New data is gathered every 20ms. With a moving average of length 1000 the resulting
    ///  averaging window has a length of 20s. If you want to do long term measurements the longest
    ///  moving average will give the cleanest results.
    ///  
    ///  The default value is 1 for resistance and 40 for temperature. The default values match
    ///  the non-changeable averaging settings of the old PTC Bricklet 1.0
    /// </summary>
    procedure SetMovingAverageConfiguration(const movingAverageLengthResistance: word; const movingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  Returns the moving average configuration as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetMovingAverageConfiguration"/>.
    /// </summary>
    procedure GetMovingAverageConfiguration(out movingAverageLengthResistance: word; out movingAverageLengthTemperature: word); virtual;

    /// <summary>
    ///  If you enable this callback, the <see cref="BrickletPTCV2.TBrickletPTCV2.OnSensorConnected"/> callback is triggered
    ///  every time a Pt sensor is connected/disconnected.
    ///  
    ///  By default this callback is disabled.
    /// </summary>
    procedure SetSensorConnectedCallbackConfiguration(const enabled: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetSensorConnectedCallbackConfiguration"/>.
    /// </summary>
    function GetSensorConnectedCallbackConfiguration: boolean; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletPTCV2.TBrickletPTCV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletPTCV2.TBrickletPTCV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletPTCV2.TBrickletPTCV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.SetTemperatureCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletPTCV2.TBrickletPTCV2.GetTemperature"/>.
    /// </summary>
    property OnTemperature: TBrickletPTCV2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.SetResistanceCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletPTCV2.TBrickletPTCV2.GetResistance"/>.
    /// </summary>
    property OnResistance: TBrickletPTCV2NotifyResistance read fResistanceCallback write fResistanceCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletPTCV2.TBrickletPTCV2.SetSensorConnectedCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletPTCV2.TBrickletPTCV2.IsSensorConnected"/>.
    /// </summary>
    property OnSensorConnected: TBrickletPTCV2NotifySensorConnected read fSensorConnectedCallback write fSensorConnectedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletPTCV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletPTCV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_RESISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_RESISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_RESISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_NOISE_REJECTION_FILTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_NOISE_REJECTION_FILTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_IS_SENSOR_CONNECTED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_WIRE_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_WIRE_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_PTC_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletPTCV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_PTC_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICKLET_PTC_V2_CALLBACK_RESISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperResistance;
  aCallBacks[BRICKLET_PTC_V2_CALLBACK_SENSOR_CONNECTED]:= {$ifdef FPC}@{$endif}CallbackWrapperSensorConnected;
end;

function TBrickletPTCV2.GetTemperature: longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletPTCV2.SetTemperatureCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_TEMPERATURE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt32To(min, 14, _request);
  LEConvertInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletPTCV2.GetTemperatureCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_TEMPERATURE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt32From(14, _response);
  max:= LEConvertInt32From(18, _response);
end;

function TBrickletPTCV2.GetResistance: longint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_RESISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletPTCV2.SetResistanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_RESISTANCE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt32To(min, 14, _request);
  LEConvertInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletPTCV2.GetResistanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_RESISTANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt32From(14, _response);
  max:= LEConvertInt32From(18, _response);
end;

procedure TBrickletPTCV2.SetNoiseRejectionFilter(const filter: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_NOISE_REJECTION_FILTER, 9);
  LEConvertUInt8To(filter, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.GetNoiseRejectionFilter: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_NOISE_REJECTION_FILTER, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPTCV2.IsSensorConnected: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_IS_SENSOR_CONNECTED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletPTCV2.SetWireMode(const aMode: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_WIRE_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.GetWireMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_WIRE_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPTCV2.SetMovingAverageConfiguration(const movingAverageLengthResistance: word; const movingAverageLengthTemperature: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION, 12);
  LEConvertUInt16To(movingAverageLengthResistance, 8, _request);
  LEConvertUInt16To(movingAverageLengthTemperature, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletPTCV2.GetMovingAverageConfiguration(out movingAverageLengthResistance: word; out movingAverageLengthTemperature: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  movingAverageLengthResistance:= LEConvertUInt16From(8, _response);
  movingAverageLengthTemperature:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletPTCV2.SetSensorConnectedCallbackConfiguration(const enabled: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(enabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.GetSensorConnectedCallbackConfiguration: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_SENSOR_CONNECTED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletPTCV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletPTCV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPTCV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPTCV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletPTCV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletPTCV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletPTCV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletPTCV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletPTCV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletPTCV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_PTC_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletPTCV2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var temperature: longint;
begin
  temperature:= LEConvertInt32From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, temperature);
  end;
end;

procedure TBrickletPTCV2.CallbackWrapperResistance(const aPacket: TDynamicByteArray);
var resistance: longint;
begin
  resistance:= LEConvertInt32From(8, aPacket);

  if (Assigned(fResistanceCallback)) then begin
    fResistanceCallback(self, resistance);
  end;
end;

procedure TBrickletPTCV2.CallbackWrapperSensorConnected(const aPacket: TDynamicByteArray);
var connected: boolean;
begin
  connected:= LEConvertBooleanFrom(8, aPacket);

  if (Assigned(fSensorConnectedCallback)) then begin
    fSensorConnectedCallback(self, connected);
  end;
end;

end.
