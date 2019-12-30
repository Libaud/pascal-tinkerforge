{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletAccelerometerV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletAccelerometerV2.inc}

type
  TArray0To29OfInt16 = array [0..29] of smallint;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfInt8 = array [0..59] of shortint;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletAccelerometerV2 = class;
  TBrickletAccelerometerV2NotifyAcceleration = procedure(aSender: TBrickletAccelerometerV2; const x: longint; const y: longint; const z: longint) of object;
  TBrickletAccelerometerV2NotifyContinuousAcceleration16Bit = procedure(aSender: TBrickletAccelerometerV2; const acceleration: TArray0To29OfInt16) of object;
  TBrickletAccelerometerV2NotifyContinuousAcceleration8Bit = procedure(aSender: TBrickletAccelerometerV2; const acceleration: TArray0To59OfInt8) of object;

  /// <summary>
  ///  Measures acceleration in three axis
  /// </summary>
  TBrickletAccelerometerV2 = class(TDevice)
  private
    fAccelerationCallback: TBrickletAccelerometerV2NotifyAcceleration;
    fContinuousAcceleration16BitCallback: TBrickletAccelerometerV2NotifyContinuousAcceleration16Bit;
    fContinuousAcceleration8BitCallback: TBrickletAccelerometerV2NotifyContinuousAcceleration8Bit;
    procedure CallbackWrapperAcceleration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperContinuousAcceleration16Bit(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperContinuousAcceleration8Bit(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the acceleration in x, y and z direction. The values
    ///  are given in gₙ/10000 (1gₙ = 9.80665m/s²).
    ///  
    ///  If you want to get the acceleration periodically, it is recommended
    ///  to use the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnAcceleration"/> callback and set the period with
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetAccelerationCallbackConfiguration"/>.
    /// </summary>
    procedure GetAcceleration(out x: longint; out y: longint; out z: longint); virtual;

    /// <summary>
    ///  Configures the data rate and full scale range.
    ///  Possible values are:
    ///  
    ///  * Data rate of 0.781Hz to 25600Hz.
    ///  * Full scale range of ±2g up to ±8g.
    ///  
    ///  Decreasing data rate or full scale range will also decrease the noise on
    ///  the data.
    /// </summary>
    procedure SetConfiguration(const dataRate: byte; const fullScale: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out dataRate: byte; out fullScale: byte); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnAcceleration"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  If this callback is enabled, the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration16Bit"/> callback
    ///  and <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration8Bit"/> callback will automatically be disabled.
    /// </summary>
    procedure SetAccelerationCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetAccelerationCallbackConfiguration"/>.
    /// </summary>
    procedure GetAccelerationCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Configures the info LED (marked as "Force" on the Bricklet) to be either turned off,
    ///  turned on, or blink in heartbeat mode.
    /// </summary>
    procedure SetInfoLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the LED configuration as set by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetInfoLEDConfig"/>
    /// </summary>
    function GetInfoLEDConfig: byte; virtual;

    /// <summary>
    ///  For high throughput of acceleration data (&gt; 1000Hz) you have to use the
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration16Bit"/> or <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration8Bit"/>
    ///  callbacks.
    ///  
    ///  You can enable the callback for each axis (x, y, z) individually and choose a
    ///  resolution of 8 bit or 16 bit.
    ///  
    ///  If at least one of the axis is enabled and the resolution is set to 8 bit,
    ///  the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration8Bit"/> callback is activated. If at least
    ///  one of the axis is enabled and the resolution is set to 16 bit,
    ///  the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnContinuousAcceleration16Bit"/> callback is activated.
    ///  
    ///  The returned values are raw ADC data. If you want to put this data into
    ///  a FFT to determine the occurrences of specific frequencies we recommend
    ///  that you use the data as is. It has all of the ADC noise in it. This noise
    ///  looks like pure noise at first glance, but it might still have some frequnecy
    ///  information in it that can be utilized by the FFT.
    ///  
    ///  Otherwise you have to use the following formulas that depend on the configured
    ///  resolution (8/16 bit) and the full scale range (see <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/>) to calculate
    ///  the data in g/10000 (same unit that is returned by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.GetAcceleration"/>):
    ///  
    ///  * 16 bit, full scale 2g: acceleration = value*625/1024
    ///  * 16 bit, full scale 4g: acceleration = value*1250/1024
    ///  * 16 bit, full scale 8g: acceleration = value*2500/1024
    ///  
    ///  If a resolution of 8 bit is used, only the 8 most significant bits will be
    ///  transferred, so you can use the following formulas:
    ///  
    ///  * 8 bit, full scale 2g: acceleration = value*256*625/1024
    ///  * 8 bit, full scale 4g: acceleration = value*256*1250/1024
    ///  * 8 bit, full scale 8g: acceleration = value*256*2500/1024
    ///  
    ///  If no axis is enabled, both callbacks are disabled. If one of the continuous
    ///  callbacks is enabled, the <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.OnAcceleration"/> callback is disabled.
    ///  
    ///  The maximum throughput depends on the exact configuration:
    ///  
    ///  <code>
    ///   "Number of axis enabled", "Throughput 8 bit", "Throughout 16 bit"
    ///  
    ///   "1", "25600Hz", "25600Hz"
    ///   "2", "25600Hz", "15000Hz"
    ///   "3", "20000Hz", "10000Hz"
    ///  </code>
    /// </summary>
    procedure SetContinuousAccelerationConfiguration(const enableX: boolean; const enableY: boolean; const enableZ: boolean; const resolution: byte); virtual;

    /// <summary>
    ///  Returns the continuous acceleration configuration as set by
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetContinuousAccelerationConfiguration"/>.
    /// </summary>
    procedure GetContinuousAccelerationConfiguration(out enableX: boolean; out enableY: boolean; out enableZ: boolean; out resolution: byte); virtual;

    /// <summary>
    ///  Configures IIR Bypass filter mode and low pass filter roll off corner frequency.
    ///  
    ///  The filter can be applied or bypassed and the corner frequency can be
    ///  half or a ninth of the output data rate.
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_accelerometer_v2_filter.png
    ///     :scale: 100 %
    ///     :alt: Accelerometer filter
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_accelerometer_v2_filter.png
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetFilterConfiguration(const iirBypass: byte; const lowPassFilter: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetFilterConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetFilterConfiguration(out iirBypass: byte; out lowPassFilter: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetAccelerationCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.GetAcceleration"/>.
    /// </summary>
    property OnAcceleration: TBrickletAccelerometerV2NotifyAcceleration read fAccelerationCallback write fAccelerationCallback;

    /// <summary>
    ///  Returns 30 acceleration values with 16 bit resolution. The data rate can
    ///  be configured with <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/> and this callback can be
    ///  enabled with <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetContinuousAccelerationConfiguration"/>.
    ///  
    ///  The returned values are raw ADC data. If you want to put this data into
    ///  a FFT to determine the occurrences of specific frequencies we recommend
    ///  that you use the data as is. It has all of the ADC noise in it. This noise
    ///  looks like pure noise at first glance, but it might still have some frequnecy
    ///  information in it that can be utilized by the FFT.
    ///  
    ///  Otherwise you have to use the following formulas that depend on the
    ///  full scale range (see <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/>) to calculate
    ///  the data in g/10000 (same unit that is returned by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.GetAcceleration"/>):
    ///  
    ///  * Full scale 2g: acceleration = value*625/1024
    ///  * Full scale 4g: acceleration = value*1250/1024
    ///  * Full scale 8g: acceleration = value*2500/1024
    ///  
    ///  The data is formated in the sequence "x, y, z, x, y, z, ..." depending on
    ///  the enabled axis. Examples:
    ///  
    ///  * x, y, z enabled: "x, y, z, ... 10x ..., x, y, z"
    ///  * x, z enabled: "x, z, ... 15x ..., x, z"
    ///  * y enabled: "y, ... 30x ..., y"
    /// </summary>
    property OnContinuousAcceleration16Bit: TBrickletAccelerometerV2NotifyContinuousAcceleration16Bit read fContinuousAcceleration16BitCallback write fContinuousAcceleration16BitCallback;

    /// <summary>
    ///  Returns 60 acceleration values with 8 bit resolution. The data rate can
    ///  be configured with <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/> and this callback can be
    ///  enabled with <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetContinuousAccelerationConfiguration"/>.
    ///  
    ///  The returned values are raw ADC data. If you want to put this data into
    ///  a FFT to determine the occurrences of specific frequencies we recommend
    ///  that you use the data as is. It has all of the ADC noise in it. This noise
    ///  looks like pure noise at first glance, but it might still have some frequnecy
    ///  information in it that can be utilized by the FFT.
    ///  
    ///  Otherwise you have to use the following formulas that depend on the
    ///  full scale range (see <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.SetConfiguration"/>) to calculate
    ///  the data in g/10000 (same unit that is returned by <see cref="BrickletAccelerometerV2.TBrickletAccelerometerV2.GetAcceleration"/>):
    ///  
    ///  * Full scale 2g: acceleration = value*256*625/1024
    ///  * Full scale 4g: acceleration = value*256*1250/1024
    ///  * Full scale 8g: acceleration = value*256*2500/1024
    ///  
    ///  The data is formated in the sequence "x, y, z, x, y, z, ..." depending on
    ///  the enabled axis. Examples:
    ///  
    ///  * x, y, z enabled: "x, y, z, ... 20x ..., x, y, z"
    ///  * x, z enabled: "x, z, ... 30x ..., x, z"
    ///  * y enabled: "y, ... 60x ..., y"
    /// </summary>
    property OnContinuousAcceleration8Bit: TBrickletAccelerometerV2NotifyContinuousAcceleration8Bit read fContinuousAcceleration8BitCallback write fContinuousAcceleration8BitCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletAccelerometerV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletAccelerometerV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_ACCELERATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_ACCELERATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_INFO_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_INFO_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_CONTINUOUS_ACCELERATION_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CONTINUOUS_ACCELERATION_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_FILTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_FILTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletAccelerometerV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ACCELEROMETER_V2_CALLBACK_ACCELERATION]:= {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  aCallBacks[BRICKLET_ACCELEROMETER_V2_CALLBACK_CONTINUOUS_ACCELERATION_16_BIT]:= {$ifdef FPC}@{$endif}CallbackWrapperContinuousAcceleration16Bit;
  aCallBacks[BRICKLET_ACCELEROMETER_V2_CALLBACK_CONTINUOUS_ACCELERATION_8_BIT]:= {$ifdef FPC}@{$endif}CallbackWrapperContinuousAcceleration8Bit;
end;

procedure TBrickletAccelerometerV2.GetAcceleration(out x: longint; out y: longint; out z: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_ACCELERATION, 8);
  _response:= SendRequest(_request);
  x:= LEConvertInt32From(8, _response);
  y:= LEConvertInt32From(12, _response);
  z:= LEConvertInt32From(16, _response);
end;

procedure TBrickletAccelerometerV2.SetConfiguration(const dataRate: byte; const fullScale: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(dataRate, 8, _request);
  LEConvertUInt8To(fullScale, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometerV2.GetConfiguration(out dataRate: byte; out fullScale: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  dataRate:= LEConvertUInt8From(8, _response);
  fullScale:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletAccelerometerV2.SetAccelerationCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_ACCELERATION_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometerV2.GetAccelerationCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_ACCELERATION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletAccelerometerV2.SetInfoLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_INFO_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometerV2.GetInfoLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_INFO_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAccelerometerV2.SetContinuousAccelerationConfiguration(const enableX: boolean; const enableY: boolean; const enableZ: boolean; const resolution: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_CONTINUOUS_ACCELERATION_CONFIGURATION, 12);
  LEConvertBooleanTo(enableX, 8, _request);
  LEConvertBooleanTo(enableY, 9, _request);
  LEConvertBooleanTo(enableZ, 10, _request);
  LEConvertUInt8To(resolution, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometerV2.GetContinuousAccelerationConfiguration(out enableX: boolean; out enableY: boolean; out enableZ: boolean; out resolution: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CONTINUOUS_ACCELERATION_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  enableX:= LEConvertBooleanFrom(8, _response);
  enableY:= LEConvertBooleanFrom(9, _response);
  enableZ:= LEConvertBooleanFrom(10, _response);
  resolution:= LEConvertUInt8From(11, _response);
end;

procedure TBrickletAccelerometerV2.SetFilterConfiguration(const iirBypass: byte; const lowPassFilter: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_FILTER_CONFIGURATION, 10);
  LEConvertUInt8To(iirBypass, 8, _request);
  LEConvertUInt8To(lowPassFilter, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletAccelerometerV2.GetFilterConfiguration(out iirBypass: byte; out lowPassFilter: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_FILTER_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  iirBypass:= LEConvertUInt8From(8, _response);
  lowPassFilter:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletAccelerometerV2.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletAccelerometerV2.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAccelerometerV2.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAccelerometerV2.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometerV2.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletAccelerometerV2.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometerV2.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletAccelerometerV2.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletAccelerometerV2.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletAccelerometerV2.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletAccelerometerV2.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletAccelerometerV2.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ACCELEROMETER_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletAccelerometerV2.CallbackWrapperAcceleration(const aPacket: TDynamicByteArray);
var x: longint; y: longint; z: longint;
begin
  x:= LEConvertInt32From(8, aPacket);
  y:= LEConvertInt32From(12, aPacket);
  z:= LEConvertInt32From(16, aPacket);

  if (Assigned(fAccelerationCallback)) then begin
    fAccelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickletAccelerometerV2.CallbackWrapperContinuousAcceleration16Bit(const aPacket: TDynamicByteArray);
var acceleration: TArray0To29OfInt16; _i: longint;
begin
  for _i:= 0 to 29 do acceleration[_i]:= LEConvertInt16From(8 + (_i * 2), aPacket);

  if (Assigned(fContinuousAcceleration16BitCallback)) then begin
    fContinuousAcceleration16BitCallback(self, acceleration);
  end;
end;

procedure TBrickletAccelerometerV2.CallbackWrapperContinuousAcceleration8Bit(const aPacket: TDynamicByteArray);
var acceleration: TArray0To59OfInt8; _i: longint;
begin
  for _i:= 0 to 59 do acceleration[_i]:= LEConvertInt8From(8 + (_i * 1), aPacket);

  if (Assigned(fContinuousAcceleration8BitCallback)) then begin
    fContinuousAcceleration8BitCallback(self, acceleration);
  end;
end;

end.
