{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLaserRangeFinderV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLaserRangeFinderV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletLaserRangeFinderV2 = class;
  TBrickletLaserRangeFinderV2NotifyDistance = procedure(aSender: TBrickletLaserRangeFinderV2; const aDistance: smallint) of object;
  TBrickletLaserRangeFinderV2NotifyVelocity = procedure(aSender: TBrickletLaserRangeFinderV2; const aVelocity: smallint) of object;

  /// <summary>
  ///  Measures distance up to 40m with laser light
  /// </summary>
  TBrickletLaserRangeFinderV2 = class(TDevice)
  private
    fDistanceCallback: TBrickletLaserRangeFinderV2NotifyDistance;
    fVelocityCallback: TBrickletLaserRangeFinderV2NotifyVelocity;
    procedure CallbackWrapperDistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVelocity(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured distance.
    ///  
    ///  The laser has to be enabled, see <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetEnable"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnDistance"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetDistanceCallbackConfiguration"/>.
    /// </summary>
    function GetDistance: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnDistance"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnDistance"/> callback.
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
    procedure SetDistanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetDistanceCallbackConfiguration"/>.
    /// </summary>
    procedure GetDistanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Returns the measured velocity. The value has a range of -12800 to 12700
    ///  and is given in 1/100 m/s.
    ///  
    ///  The velocity measurement only produces stables results if a fixed
    ///  measurement rate (see <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetConfiguration"/>) is configured. Also the laser
    ///  has to be enabled, see <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetEnable"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnVelocity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetVelocityCallbackConfiguration"/>.
    /// </summary>
    function GetVelocity: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnVelocity"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.OnVelocity"/> callback.
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
    procedure SetVelocityCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetVelocityCallbackConfiguration"/>.
    /// </summary>
    procedure GetVelocityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Enables the laser of the LIDAR if set to *true*.
    ///  
    ///  We recommend that you wait 250ms after enabling the laser before
    ///  the first call of <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.GetDistance"/> to ensure stable measurements.
    /// </summary>
    procedure SetEnable(const aEnable: boolean); virtual;

    /// <summary>
    ///  Returns the value as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetEnable"/>.
    /// </summary>
    function GetEnable: boolean; virtual;

    /// <summary>
    ///  The **Acquisition Count** defines the number of times the Laser Range Finder Bricklet
    ///  will integrate acquisitions to find a correlation record peak. With a higher count,
    ///  the Bricklet can measure longer distances. With a lower count, the rate increases. The
    ///  allowed values are 1-255.
    ///  
    ///  If you set **Enable Quick Termination** to true, the distance measurement will be terminated
    ///  early if a high peak was already detected. This means that a higher measurement rate can be achieved
    ///  and long distances can be measured at the same time. However, the chance of false-positive
    ///  distance measurements increases.
    ///  
    ///  Normally the distance is calculated with a detection algorithm that uses peak value,
    ///  signal strength and noise. You can however also define a fixed **Threshold Value**.
    ///  Set this to a low value if you want to measure the distance to something that has
    ///  very little reflection (e.g. glass) and set it to a high value if you want to measure
    ///  the distance to something with a very high reflection (e.g. mirror). Set this to 0 to
    ///  use the default algorithm. The other allowed values are 1-255.
    ///  
    ///  Set the **Measurement Frequency** in Hz to force a fixed measurement rate. If set to 0,
    ///  the Laser Range Finder Bricklet will use the optimal frequency according to the other
    ///  configurations and the actual measured distance. Since the rate is not fixed in this case,
    ///  the velocity measurement is not stable. For a stable velocity measurement you should
    ///  set a fixed measurement frequency. The lower the frequency, the higher is the resolution
    ///  of the calculated velocity. The allowed values are 10Hz-500Hz (and 0 to turn the fixed
    ///  frequency off).
    ///  
    ///  The default values for Acquisition Count, Enable Quick Termination, Threshold Value and
    ///  Measurement Frequency are 128, false, 0 and 0.
    /// </summary>
    procedure SetConfiguration(const aAcquisitionCount: byte; const aEnableQuickTermination: boolean; const aThresholdValue: byte; const aMeasurementFrequency: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out aAcquisitionCount: byte; out aEnableQuickTermination: boolean; out aThresholdValue: byte; out aMeasurementFrequency: word); virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the distance and velocity.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const aDistanceAverageLength: byte; const aVelocityAverageLength: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetMovingAverage"/>.
    /// </summary>
    procedure GetMovingAverage(out aDistanceAverageLength: byte; out aVelocityAverageLength: byte); virtual;

    /// <summary>
    ///  The offset is added to the measured distance.
    ///  It is saved in non-volatile memory, you only have to set it once.
    ///  
    ///  The Bricklet comes with a per-sensor factory-calibrated offset value,
    ///  you should not have to call this function.
    ///  
    ///  If you want to re-calibrate the offset you first have to set it to 0.
    ///  Calculate the offset by measuring the distance to a known distance
    ///  and set it again.
    /// </summary>
    procedure SetOffsetCalibration(const aOffset: smallint); virtual;

    /// <summary>
    ///  Returns the offset value as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetOffsetCalibration"/>.
    /// </summary>
    function GetOffsetCalibration: smallint; virtual;

    /// <summary>
    ///  Configures the distance LED to be either turned off, turned on, blink in
    ///  heartbeat mode or show the distance (brighter = object is nearer).
    /// </summary>
    procedure SetDistanceLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the LED configuration as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetDistanceLEDConfig"/>
    /// </summary>
    function GetDistanceLEDConfig: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetDistanceCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.GetDistance"/>.
    /// </summary>
    property OnDistance: TBrickletLaserRangeFinderV2NotifyDistance read fDistanceCallback write fDistanceCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.SetVelocityCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletLaserRangeFinderV2.TBrickletLaserRangeFinderV2.GetVelocity"/>.
    /// </summary>
    property OnVelocity: TBrickletLaserRangeFinderV2NotifyVelocity read fVelocityCallback write fVelocityCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletLaserRangeFinderV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletLaserRangeFinderV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_DISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_VELOCITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_VELOCITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_ENABLE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_OFFSET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_OFFSET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_DISTANCE_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLaserRangeFinderV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_V2_CALLBACK_DISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_V2_CALLBACK_VELOCITY]:= {$ifdef FPC}@{$endif}CallbackWrapperVelocity;
end;

function TBrickletLaserRangeFinderV2.GetDistance: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetDistanceCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_DISTANCE_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt16To(aMin, 14, _request);
  LEConvertInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinderV2.GetDistanceCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt16From(14, _response);
  aMax:= LEConvertInt16From(16, _response);
end;

function TBrickletLaserRangeFinderV2.GetVelocity: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetVelocityCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: smallint; const aMax: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_VELOCITY_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt16To(aMin, 14, _request);
  LEConvertInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinderV2.GetVelocityCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: smallint; out aMax: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_VELOCITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt16From(14, _response);
  aMax:= LEConvertInt16From(16, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetEnable(const aEnable: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_ENABLE, 9);
  LEConvertBooleanTo(aEnable, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.GetEnable: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_ENABLE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetConfiguration(const aAcquisitionCount: byte; const aEnableQuickTermination: boolean; const aThresholdValue: byte; const aMeasurementFrequency: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_CONFIGURATION, 13);
  LEConvertUInt8To(aAcquisitionCount, 8, _request);
  LEConvertBooleanTo(aEnableQuickTermination, 9, _request);
  LEConvertUInt8To(aThresholdValue, 10, _request);
  LEConvertUInt16To(aMeasurementFrequency, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinderV2.GetConfiguration(out aAcquisitionCount: byte; out aEnableQuickTermination: boolean; out aThresholdValue: byte; out aMeasurementFrequency: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aAcquisitionCount:= LEConvertUInt8From(8, _response);
  aEnableQuickTermination:= LEConvertBooleanFrom(9, _response);
  aThresholdValue:= LEConvertUInt8From(10, _response);
  aMeasurementFrequency:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetMovingAverage(const aDistanceAverageLength: byte; const aVelocityAverageLength: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_MOVING_AVERAGE, 10);
  LEConvertUInt8To(aDistanceAverageLength, 8, _request);
  LEConvertUInt8To(aVelocityAverageLength, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinderV2.GetMovingAverage(out aDistanceAverageLength: byte; out aVelocityAverageLength: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  aDistanceAverageLength:= LEConvertUInt8From(8, _response);
  aVelocityAverageLength:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetOffsetCalibration(const aOffset: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_OFFSET_CALIBRATION, 10);
  LEConvertInt16To(aOffset, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.GetOffsetCalibration: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_OFFSET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetDistanceLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_DISTANCE_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.GetDistanceLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_DISTANCE_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletLaserRangeFinderV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLaserRangeFinderV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLaserRangeFinderV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinderV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinderV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLaserRangeFinderV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLaserRangeFinderV2.CallbackWrapperDistance(const aPacket: TDynamicByteArray);
var
  _distance: smallint;
begin
  _distance:= LEConvertInt16From(8, aPacket);

  if (Assigned(fDistanceCallback)) then begin
    fDistanceCallback(self, _distance);
  end;
end;

procedure TBrickletLaserRangeFinderV2.CallbackWrapperVelocity(const aPacket: TDynamicByteArray);
var
  _velocity: smallint;
begin
  _velocity:= LEConvertInt16From(8, aPacket);

  if (Assigned(fVelocityCallback)) then begin
    fVelocityCallback(self, _velocity);
  end;
end;

end.
