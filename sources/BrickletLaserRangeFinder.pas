{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLaserRangeFinder;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletLaserRangeFinder.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLaserRangeFinder = class;
  TBrickletLaserRangeFinderNotifyDistance = procedure(aSender: TBrickletLaserRangeFinder; const aDistance: word) of object;
  TBrickletLaserRangeFinderNotifyVelocity = procedure(aSender: TBrickletLaserRangeFinder; const aVelocity: smallint) of object;
  TBrickletLaserRangeFinderNotifyDistanceReached = procedure(aSender: TBrickletLaserRangeFinder; const aDistance: word) of object;
  TBrickletLaserRangeFinderNotifyVelocityReached = procedure(aSender: TBrickletLaserRangeFinder; const aVelocity: smallint) of object;

  /// <summary>
  ///  Measures distance up to 40m with laser light
  /// </summary>
  TBrickletLaserRangeFinder = class(TDevice)
  private
    fDistanceCallback: TBrickletLaserRangeFinderNotifyDistance;
    fVelocityCallback: TBrickletLaserRangeFinderNotifyVelocity;
    fDistanceReachedCallback: TBrickletLaserRangeFinderNotifyDistanceReached;
    fVelocityReachedCallback: TBrickletLaserRangeFinderNotifyVelocityReached;
    procedure CallbackWrapperDistance(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVelocity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the measured distance.
    ///  
    ///  Sensor hardware version 1 (see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetSensorHardwareVersion"/>) cannot
    ///  measure distance and velocity at the same time. Therefore, the distance mode
    ///  has to be enabled using <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>.
    ///  Sensor hardware version 3 can measure distance and velocity at the same
    ///  time. Also the laser has to be enabled, see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.EnableLaser"/>.
    ///  
    ///  If you want to get the distance periodically, it is recommended to
    ///  use the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistance"/> callback and set the period with
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistance: word; virtual;

    /// <summary>
    ///  Returns the measured velocity.
    ///  
    ///  Sensor hardware version 1 (see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetSensorHardwareVersion"/>) cannot
    ///  measure distance and velocity at the same time. Therefore, the velocity mode
    ///  has to be enabled using <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>.
    ///  Sensor hardware version 3 can measure distance and velocity at the same
    ///  time, but the velocity measurement only produces stables results if a fixed
    ///  measurement rate (see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetConfiguration"/>) is configured. Also the laser
    ///  has to be enabled, see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.EnableLaser"/>.
    ///  
    ///  If you want to get the velocity periodically, it is recommended to
    ///  use the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocity"/> callback and set the period with
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>.
    /// </summary>
    function GetVelocity: smallint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistance"/> callback is only triggered if the distance value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocity"/> callback is only triggered if the velocity value has
    ///  changed since the last triggering.
    /// </summary>
    procedure SetVelocityCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>.
    /// </summary>
    function GetVelocityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistanceReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocityReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the velocity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the velocity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the velocity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the velocity is greater than the min value (max is ignored)"
    ///  </code>
    /// </summary>
    procedure SetVelocityCallbackThreshold(const aOption: char; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/>.
    /// </summary>
    procedure GetVelocityCallbackThreshold(out aOption: char; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Sets the period with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistanceReached"/>,
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocityReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/>,
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the distance and velocity.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    /// </summary>
    procedure SetMovingAverage(const aDistanceAverageLength: byte; const aVelocityAverageLength: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMovingAverage"/>.
    /// </summary>
    procedure GetMovingAverage(out aDistanceAverageLength: byte; out aVelocityAverageLength: byte); virtual;

    /// <summary>
    ///  <note>
    ///   This function is only available if you have a LIDAR-Lite sensor with hardware
    ///   version 1. Use <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetConfiguration"/> for hardware version 3. You can check
    ///   the sensor hardware version using <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetSensorHardwareVersion"/>.
    ///  </note>
    ///  
    ///  The LIDAR-Lite sensor (hardware version 1) has five different modes. One mode is
    ///  for distance measurements and four modes are for velocity measurements with
    ///  different ranges.
    ///  
    ///  The following modes are available:
    ///  
    ///  * 0: Distance is measured with resolution 1.0 cm and range 0-4000 cm
    ///  * 1: Velocity is measured with resolution 0.1 m/s and range is 0-12.7 m/s
    ///  * 2: Velocity is measured with resolution 0.25 m/s and range is 0-31.75 m/s
    ///  * 3: Velocity is measured with resolution 0.5 m/s and range is 0-63.5 m/s
    ///  * 4: Velocity is measured with resolution 1.0 m/s and range is 0-127 m/s
    /// </summary>
    procedure SetMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the mode as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>.
    /// </summary>
    function GetMode: byte; virtual;

    /// <summary>
    ///  Activates the laser of the LIDAR.
    ///  
    ///  We recommend that you wait 250ms after enabling the laser before
    ///  the first call of <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetDistance"/> to ensure stable measurements.
    /// </summary>
    procedure EnableLaser; virtual;

    /// <summary>
    ///  Deactivates the laser of the LIDAR.
    /// </summary>
    procedure DisableLaser; virtual;

    /// <summary>
    ///  Returns *true* if the laser is enabled, *false* otherwise.
    /// </summary>
    function IsLaserEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the LIDAR-Lite hardware version.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    function GetSensorHardwareVersion: byte; virtual;

    /// <summary>
    ///  <note>
    ///   This function is only available if you have a LIDAR-Lite sensor with hardware
    ///   version 3. Use <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/> for hardware version 1. You can check
    ///   the sensor hardware version using <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetSensorHardwareVersion"/>.
    ///  </note>
    ///  
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
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure SetConfiguration(const aAcquisitionCount: byte; const aEnableQuickTermination: boolean; const aThresholdValue: byte; const aMeasurementFrequency: word); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure GetConfiguration(out aAcquisitionCount: byte; out aEnableQuickTermination: boolean; out aThresholdValue: byte; out aMeasurementFrequency: word); virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>. The parameter is the distance
    ///  value of the sensor.
    ///  
    ///  The <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnDistance"/> callback is only triggered if the distance value has changed
    ///  since the last triggering.
    /// </summary>
    property OnDistance: TBrickletLaserRangeFinderNotifyDistance read fDistanceCallback write fDistanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>. The parameter is the velocity
    ///  value of the sensor.
    ///  
    ///  The <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.OnVelocity"/> callback is only triggered if the velocity has changed since
    ///  the last triggering.
    /// </summary>
    property OnVelocity: TBrickletLaserRangeFinderNotifyVelocity read fVelocityCallback write fVelocityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletLaserRangeFinderNotifyDistanceReached read fDistanceReachedCallback write fDistanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/> is reached.
    ///  The parameter is the velocity value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    property OnVelocityReached: TBrickletLaserRangeFinderNotifyVelocityReached read fVelocityReachedCallback write fVelocityReachedCallback;
  end;

implementation

procedure TBrickletLaserRangeFinder.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletLaserRangeFinder.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MOVING_AVERAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_ENABLE_LASER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_DISABLE_LASER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_IS_LASER_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_SENSOR_HARDWARE_VERSION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletLaserRangeFinder.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE]:= {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY]:= {$ifdef FPC}@{$endif}CallbackWrapperVelocity;
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
  aCallBacks[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
end;

function TBrickletLaserRangeFinder.GetDistance: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletLaserRangeFinder.GetVelocity: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLaserRangeFinder.SetDistanceCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinder.GetDistanceCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLaserRangeFinder.SetVelocityCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinder.GetVelocityCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLaserRangeFinder.SetDistanceCallbackThreshold(const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinder.GetDistanceCallbackThreshold(out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertUInt16From(9, _response);
  aMax:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLaserRangeFinder.SetVelocityCallbackThreshold(const aOption: char; const aMin: smallint; const aMax: smallint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(aOption, 8, _request);
  LEConvertInt16To(aMin, 9, _request);
  LEConvertInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinder.GetVelocityCallbackThreshold(out aOption: char; out aMin: smallint; out aMax: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD, 8);
  _response:= SendRequest(_request);
  aOption:= LEConvertCharFrom(8, _response);
  aMin:= LEConvertInt16From(9, _response);
  aMax:= LEConvertInt16From(11, _response);
end;

procedure TBrickletLaserRangeFinder.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinder.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLaserRangeFinder.SetMovingAverage(const aDistanceAverageLength: byte; const aVelocityAverageLength: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MOVING_AVERAGE, 10);
  LEConvertUInt8To(aDistanceAverageLength, 8, _request);
  LEConvertUInt8To(aVelocityAverageLength, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinder.GetMovingAverage(out aDistanceAverageLength: byte; out aVelocityAverageLength: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MOVING_AVERAGE, 8);
  _response:= SendRequest(_request);
  aDistanceAverageLength:= LEConvertUInt8From(8, _response);
  aVelocityAverageLength:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletLaserRangeFinder.SetMode(const aMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinder.GetMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLaserRangeFinder.EnableLaser;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_ENABLE_LASER, 8);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinder.DisableLaser;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_DISABLE_LASER, 8);
  SendRequest(_request);
end;

function TBrickletLaserRangeFinder.IsLaserEnabled: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_IS_LASER_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletLaserRangeFinder.GetSensorHardwareVersion: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_SENSOR_HARDWARE_VERSION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLaserRangeFinder.SetConfiguration(const aAcquisitionCount: byte; const aEnableQuickTermination: boolean; const aThresholdValue: byte; const aMeasurementFrequency: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_CONFIGURATION, 13);
  LEConvertUInt8To(aAcquisitionCount, 8, _request);
  LEConvertBooleanTo(aEnableQuickTermination, 9, _request);
  LEConvertUInt8To(aThresholdValue, 10, _request);
  LEConvertUInt16To(aMeasurementFrequency, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletLaserRangeFinder.GetConfiguration(out aAcquisitionCount: byte; out aEnableQuickTermination: boolean; out aThresholdValue: byte; out aMeasurementFrequency: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aAcquisitionCount:= LEConvertUInt8From(8, _response);
  aEnableQuickTermination:= LEConvertBooleanFrom(9, _response);
  aThresholdValue:= LEConvertUInt8From(10, _response);
  aMeasurementFrequency:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletLaserRangeFinder.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperDistance(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDistanceCallback)) then begin
    fDistanceCallback(self, _distance);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperVelocity(const aPacket: TDynamicByteArray);
var
  _velocity: smallint;
begin
  _velocity:= LEConvertInt16From(8, aPacket);

  if (Assigned(fVelocityCallback)) then begin
    fVelocityCallback(self, _velocity);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperDistanceReached(const aPacket: TDynamicByteArray);
var
  _distance: word;
begin
  _distance:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDistanceReachedCallback)) then begin
    fDistanceReachedCallback(self, _distance);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray);
var
  _velocity: smallint;
begin
  _velocity:= LEConvertInt16From(8, aPacket);

  if (Assigned(fVelocityReachedCallback)) then begin
    fVelocityReachedCallback(self, _velocity);
  end;
end;

end.
