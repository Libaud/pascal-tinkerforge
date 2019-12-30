{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDistanceIRV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDistanceIRV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletDistanceIRV2 = class;
  TBrickletDistanceIRV2NotifyDistance = procedure(aSender: TBrickletDistanceIRV2; const distance: word) of object;
  TBrickletDistanceIRV2NotifyAnalogValue = procedure(aSender: TBrickletDistanceIRV2; const analogValue: longword) of object;

  /// <summary>
  ///  Measures distance up to 150cm with infrared light
  /// </summary>
  TBrickletDistanceIRV2 = class(TDevice)
  private
    fDistanceCallback: TBrickletDistanceIRV2NotifyDistance;
    fAnalogValueCallback: TBrickletDistanceIRV2NotifyAnalogValue;
    procedure CallbackWrapperDistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the distance measured by the sensor. Possible
    ///  distance ranges are 40 to 300, 100 to 800 and 200 to 1500, depending on the
    ///  selected IR sensor.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnDistance"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetDistanceCallbackConfiguration"/>.
    /// </summary>
    function GetDistance: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnDistance"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnDistance"/> callback.
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
    procedure SetDistanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetDistanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetDistanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Returns the analog value as read by a analog-to-digital converter.
    ///  
    ///  This is unfiltered raw data. We made sure that the integration time
    ///  of the ADC is shorter then the measurement interval of the sensor
    ///  (10ms vs 16.5ms). So there is no information lost.
    ///  
    ///  If you want to do your own calibration or create your own lookup table
    ///  you can use this value.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnAnalogValue"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetAnalogValueCallbackConfiguration"/>.
    /// </summary>
    function GetAnalogValue: longword; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnAnalogValue"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.OnAnalogValue"/> callback.
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
    procedure SetAnalogValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetAnalogValueCallbackConfiguration"/>.
    /// </summary>
    procedure GetAnalogValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword); virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the distance.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less averaging, there
    ///  is more noise on the data.
    ///  
    ///  New data is gathered every ~10ms. With a moving average of length 1000 the
    ///  resulting averaging window has a length of approximately 10s. If you want to do
    ///  long term measurements the longest moving average will give the cleanest results.
    /// </summary>
    procedure SetMovingAverageConfiguration(const movingAverageLength: word); virtual;

    /// <summary>
    ///  Returns the moving average configuration as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetMovingAverageConfiguration"/>.
    /// </summary>
    function GetMovingAverageConfiguration: word; virtual;

    /// <summary>
    ///  Configures the distance LED to be either turned off, turned on, blink in
    ///  heartbeat mode or show the distance (brighter = object is nearer).
    /// </summary>
    procedure SetDistanceLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the LED configuration as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetDistanceLEDConfig"/>
    /// </summary>
    function GetDistanceLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the sensor type.
    ///  
    ///  The Bricklet comes configured with the correct sensor type
    ///  and the type is saved in flash (i.e. the Bricklet retains the information if
    ///  power is lost).
    ///  
    ///  If you want to change the sensor you can set the type in Brick Viewer,
    ///  you will likely never need to call this function from your program.
    /// </summary>
    procedure SetSensorType(const sensor: byte); virtual;

    /// <summary>
    ///  Returns the sensor type as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetSensorType"/>.
    /// </summary>
    function GetSensorType: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetDistanceCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.GetDistance"/>.
    /// </summary>
    property OnDistance: TBrickletDistanceIRV2NotifyDistance read fDistanceCallback write fDistanceCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.SetAnalogValueCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletDistanceIRV2.TBrickletDistanceIRV2.GetAnalogValue"/>.
    /// </summary>
    property OnAnalogValue: TBrickletDistanceIRV2NotifyAnalogValue read fAnalogValueCallback write fAnalogValueCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletDistanceIRV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletDistanceIRV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_DISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_ANALOG_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_DISTANCE_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_SENSOR_TYPE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_SENSOR_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDistanceIRV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DISTANCE_IR_V2_CALLBACK_DISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  aCallBacks[BRICKLET_DISTANCE_IR_V2_CALLBACK_ANALOG_VALUE]:= {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
end;

function TBrickletDistanceIRV2.GetDistance: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetDistanceCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: word; const max: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_DISTANCE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt16To(min, 14, _request);
  LEConvertUInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletDistanceIRV2.GetDistanceCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: word; out max: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt16From(14, _response);
  max:= LEConvertUInt16From(16, _response);
end;

function TBrickletDistanceIRV2.GetAnalogValue: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_ANALOG_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetAnalogValueCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longword; const max: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertUInt32To(min, 14, _request);
  LEConvertUInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletDistanceIRV2.GetAnalogValueCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longword; out max: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertUInt32From(14, _response);
  max:= LEConvertUInt32From(18, _response);
end;

procedure TBrickletDistanceIRV2.SetMovingAverageConfiguration(const movingAverageLength: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_MOVING_AVERAGE_CONFIGURATION, 10);
  LEConvertUInt16To(movingAverageLength, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.GetMovingAverageConfiguration: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_MOVING_AVERAGE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetDistanceLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_DISTANCE_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.GetDistanceLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_DISTANCE_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetSensorType(const sensor: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_SENSOR_TYPE, 9);
  LEConvertUInt8To(sensor, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.GetSensorType: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_SENSOR_TYPE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDistanceIRV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletDistanceIRV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDistanceIRV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDistanceIRV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDistanceIRV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletDistanceIRV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletDistanceIRV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletDistanceIRV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDistanceIRV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DISTANCE_IR_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDistanceIRV2.CallbackWrapperDistance(const aPacket: TDynamicByteArray);
var distance: word;
begin
  distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDistanceCallback)) then begin
    fDistanceCallback(self, distance);
  end;
end;

procedure TBrickletDistanceIRV2.CallbackWrapperAnalogValue(const aPacket: TDynamicByteArray);
var analogValue: longword;
begin
  analogValue:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fAnalogValueCallback)) then begin
    fAnalogValueCallback(self, analogValue);
  end;
end;

end.
