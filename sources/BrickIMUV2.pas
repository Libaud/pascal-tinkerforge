{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickIMUV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickIMUV2.inc}

type
  TArray0To2OfInt16 = array [0..2] of smallint;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfInt16 = array [0..3] of smallint;

  TBrickIMUV2 = class;
  TBrickIMUV2NotifyAcceleration = procedure(aSender: TBrickIMUV2; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyMagneticField = procedure(aSender: TBrickIMUV2; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyAngularVelocity = procedure(aSender: TBrickIMUV2; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyTemperature = procedure(aSender: TBrickIMUV2; const aTemperature: shortint) of object;
  TBrickIMUV2NotifyLinearAcceleration = procedure(aSender: TBrickIMUV2; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyGravityVector = procedure(aSender: TBrickIMUV2; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyOrientation = procedure(aSender: TBrickIMUV2; const aHeading: smallint; const aRoll: smallint; const aPitch: smallint) of object;
  TBrickIMUV2NotifyQuaternion = procedure(aSender: TBrickIMUV2; const aW: smallint; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUV2NotifyAllData = procedure(aSender: TBrickIMUV2; const aAcceleration: TArray0To2OfInt16; const aMagneticField: TArray0To2OfInt16;
                                       const aAngularVelocity: TArray0To2OfInt16; const aEulerAngle: TArray0To2OfInt16; const aQuaternion: TArray0To3OfInt16;
                                       const aLinearAcceleration: TArray0To2OfInt16; const aGravityVector: TArray0To2OfInt16; const aTemperature: shortint;
                                       const aCalibrationStatus: byte) of object;

  /// <summary>
  ///  Full fledged AHRS with 9 degrees of freedom
  /// </summary>
  TBrickIMUV2 = class(TDevice)
  private
    fAccelerationCallback: TBrickIMUV2NotifyAcceleration;
    fMagneticFieldCallback: TBrickIMUV2NotifyMagneticField;
    fAngularVelocityCallback: TBrickIMUV2NotifyAngularVelocity;
    fTemperatureCallback: TBrickIMUV2NotifyTemperature;
    fLinearAccelerationCallback: TBrickIMUV2NotifyLinearAcceleration;
    fGravityVectorCallback: TBrickIMUV2NotifyGravityVector;
    fOrientationCallback: TBrickIMUV2NotifyOrientation;
    fQuaternionCallback: TBrickIMUV2NotifyQuaternion;
    fAllDataCallback: TBrickIMUV2NotifyAllData;
    procedure CallbackWrapperAcceleration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMagneticField(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAngularVelocity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperature(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperLinearAcceleration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperGravityVector(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperOrientation(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperQuaternion(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllData(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the calibrated acceleration from the accelerometer for the
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  If you want to get the acceleration periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnAcceleration"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated magnetic field from the magnetometer for the
    ///  x, y and z axis in 1/16 µT (Microtesla).
    ///  
    ///  If you want to get the magnetic field periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnMagneticField"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>.
    /// </summary>
    procedure GetMagneticField(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated angular velocity from the gyroscope for the
    ///  x, y and z axis in 1/16 °/s.
    ///  
    ///  If you want to get the angular velocity periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnAngularVelocity"/> acallback nd set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>.
    /// </summary>
    procedure GetAngularVelocity(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the temperature of the IMU Brick. The temperature is given in
    ///  °C. The temperature is measured in the core of the BNO055 IC, it is not the
    ///  ambient temperature
    /// </summary>
    function GetTemperature: shortint; virtual;

    /// <summary>
    ///  Returns the current orientation (heading, roll, pitch) of the IMU Brick as
    ///  independent Euler angles in 1/16 degree. Note that Euler angles always
    ///  experience a `gimbal lock &lt;https://en.wikipedia.org/wiki/Gimbal_lock&gt;`__.
    ///  We recommend that you use quaternions instead, if you need the absolute
    ///  orientation.
    ///  
    ///  The rotation angle has the following ranges:
    ///  
    ///  * heading: 0° to 360°
    ///  * roll: -90° to +90°
    ///  * pitch: -180° to +180°
    ///  
    ///  If you want to get the orientation periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnOrientation"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>.
    /// </summary>
    procedure GetOrientation(out aHeading: smallint; out aRoll: smallint; out aPitch: smallint); virtual;

    /// <summary>
    ///  Returns the linear acceleration of the IMU Brick for the
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  The linear acceleration is the acceleration in each of the three
    ///  axis of the IMU Brick with the influences of gravity removed.
    ///  
    ///  It is also possible to get the gravity vector with the influence of linear
    ///  acceleration removed, see <see cref="BrickIMUV2.TBrickIMUV2.GetGravityVector"/>.
    ///  
    ///  If you want to get the linear acceleration periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnLinearAcceleration"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>.
    /// </summary>
    procedure GetLinearAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the current gravity vector of the IMU Brick for the
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  The gravity vector is the acceleration that occurs due to gravity.
    ///  Influences of additional linear acceleration are removed.
    ///  
    ///  It is also possible to get the linear acceleration with the influence
    ///  of gravity removed, see <see cref="BrickIMUV2.TBrickIMUV2.GetLinearAcceleration"/>.
    ///  
    ///  If you want to get the gravity vector periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnGravityVector"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>.
    /// </summary>
    procedure GetGravityVector(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (w, x, y, z) of the IMU Brick as
    ///  `quaternions &lt;https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation&gt;`__.
    ///  
    ///  You have to divide the return values by 16383 (14 bit) to get
    ///  the usual range of -1.0 to +1.0 for quaternions.
    ///  
    ///  If you want to get the quaternions periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnQuaternion"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>.
    /// </summary>
    procedure GetQuaternion(out aW: smallint; out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Return all of the available data of the IMU Brick.
    ///  
    ///  * acceleration in 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetAcceleration"/>)
    ///  * magnetic field in 1/16 µT (see <see cref="BrickIMUV2.TBrickIMUV2.GetMagneticField"/>)
    ///  * angular velocity in 1/16 °/s (see <see cref="BrickIMUV2.TBrickIMUV2.GetAngularVelocity"/>)
    ///  * Euler angles in 1/16 ° (see <see cref="BrickIMUV2.TBrickIMUV2.GetOrientation"/>)
    ///  * quaternion 1/16383 (see <see cref="BrickIMUV2.TBrickIMUV2.GetQuaternion"/>)
    ///  * linear acceleration 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetLinearAcceleration"/>)
    ///  * gravity vector 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetGravityVector"/>)
    ///  * temperature in 1 °C (see <see cref="BrickIMUV2.TBrickIMUV2.GetTemperature"/>)
    ///  * calibration status (see below)
    ///  
    ///  The calibration status consists of four pairs of two bits. Each pair
    ///  of bits represents the status of the current calibration.
    ///  
    ///  * bit 0-1: Magnetometer
    ///  * bit 2-3: Accelerometer
    ///  * bit 4-5: Gyroscope
    ///  * bit 6-7: System
    ///  
    ///  A value of 0 means for "not calibrated" and a value of 3 means
    ///  "fully calibrated". In your program you should always be able to
    ///  ignore the calibration status, it is used by the calibration
    ///  window of the Brick Viewer and it can be ignored after the first
    ///  calibration. See the documentation in the calibration window for
    ///  more information regarding the calibration of the IMU Brick.
    ///  
    ///  If you want to get the data periodically, it is recommended
    ///  to use the <see cref="BrickIMUV2.TBrickIMUV2.OnAllData"/> callback and set the period with
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>.
    /// </summary>
    procedure GetAllData(out aAcceleration: TArray0To2OfInt16; out aMagneticField: TArray0To2OfInt16;
                         out aAngularVelocity: TArray0To2OfInt16; out aEulerAngle: TArray0To2OfInt16;
                         out aQuaternion: TArray0To3OfInt16; out aLinearAcceleration: TArray0To2OfInt16;
                         out aGravityVector: TArray0To2OfInt16; out aTemperature: shortint;
                         out aCalibrationStatus: byte); virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick on.
    /// </summary>
    procedure LedsOn; virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick off.
    /// </summary>
    procedure LedsOff; virtual;

    /// <summary>
    ///  Returns *true* if the orientation and direction LEDs of the IMU Brick
    ///  are on, *false* otherwise.
    /// </summary>
    function AreLedsOn: boolean; virtual;

    /// <summary>
    ///  A call of this function saves the current calibration to be used
    ///  as a starting point for the next restart of continuous calibration
    ///  of the IMU Brick.
    ///  
    ///  A return value of *true* means that the calibration could be used and
    ///  *false* means that it could not be used (this happens if the calibration
    ///  status is not "fully calibrated").
    ///  
    ///  This function is used by the calibration window of the Brick Viewer, you
    ///  should not need to call it in your program.
    /// </summary>
    function SaveCalibration: boolean; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnAcceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAccelerationPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>.
    /// </summary>
    function GetAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnMagneticField"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetMagneticFieldPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>.
    /// </summary>
    function GetMagneticFieldPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnAngularVelocity"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAngularVelocityPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>.
    /// </summary>
    function GetAngularVelocityPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnTemperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetTemperaturePeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetTemperaturePeriod"/>.
    /// </summary>
    function GetTemperaturePeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnOrientation"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetOrientationPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>.
    /// </summary>
    function GetOrientationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnLinearAcceleration"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetLinearAccelerationPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>.
    /// </summary>
    function GetLinearAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnGravityVector"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetGravityVectorPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>.
    /// </summary>
    function GetGravityVectorPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnQuaternion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetQuaternionPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>.
    /// </summary>
    function GetQuaternionPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMUV2.TBrickIMUV2.OnAllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

    /// <summary>
    ///  Sets the available sensor configuration for the Magnetometer, Gyroscope and
    ///  Accelerometer. The Accelerometer Range is user selectable in all fusion modes,
    ///  all other configurations are auto-controlled in fusion mode.
    ///  
    ///  The default values are:
    ///  
    ///  * Magnetometer Rate 20Hz
    ///  * Gyroscope Range 2000°/s
    ///  * Gyroscope Bandwidth 32Hz
    ///  * Accelerometer Range +/-4G
    ///  * Accelerometer Bandwidth 62.5Hz
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetSensorConfiguration(const aMagnetometerRate: byte; const aGyroscopeRange: byte;
                                     const aGyroscopeBandwidth: byte; const aAccelerometerRange: byte;
                                     const aAccelerometerBandwidth: byte); virtual;

    /// <summary>
    ///  Returns the sensor configuration as set by <see cref="BrickIMUV2.TBrickIMUV2.SetSensorConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure GetSensorConfiguration(out aMagnetometerRate: byte; out aGyroscopeRange: byte; out aGyroscopeBandwidth: byte;
                                     out aAccelerometerRange: byte; out aAccelerometerBandwidth: byte); virtual;

    /// <summary>
    ///  If the fusion mode is turned off, the functions <see cref="BrickIMUV2.TBrickIMUV2.GetAcceleration"/>,
    ///  <see cref="BrickIMUV2.TBrickIMUV2.GetMagneticField"/> and <see cref="BrickIMUV2.TBrickIMUV2.GetAngularVelocity"/> return uncalibrated
    ///  and uncompensated sensor data. All other sensor data getters return no data.
    ///  
    ///  Since firmware version 2.0.6 you can also use a fusion mode without magnetometer.
    ///  In this mode the calculated orientation is relative (with magnetometer it is
    ///  absolute with respect to the earth). However, the calculation can't be influenced
    ///  by spurious magnetic fields.
    ///  
    ///  Since firmware version 2.0.13 you can also use a fusion mode without fast
    ///  magnetometer calibration. This mode is the same as the normal fusion mode,
    ///  but the fast magnetometer calibration is turned off. So to find the orientation
    ///  the first time will likely take longer, but small magnetic influences might
    ///  not affect the automatic calibration as much.
    ///  
    ///  By default sensor fusion is on.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetSensorFusionMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the sensor fusion mode as set by <see cref="BrickIMUV2.TBrickIMUV2.SetSensorFusionMode"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetSensorFusionMode: byte; virtual;

    /// <summary>
    ///  The SPITF protocol can be used with a dynamic baudrate. If the dynamic baudrate is
    ///  enabled, the Brick will try to adapt the baudrate for the communication
    ///  between Bricks and Bricklets according to the amount of data that is transferred.
    ///  
    ///  The baudrate will be increased exponentially if lots of data is send/received and
    ///  decreased linearly if little data is send/received.
    ///  
    ///  This lowers the baudrate in applications where little data is transferred (e.g.
    ///  a weather station) and increases the robustness. If there is lots of data to transfer
    ///  (e.g. Thermal Imaging Bricklet) it automatically increases the baudrate as needed.
    ///  
    ///  In cases where some data has to transferred as fast as possible every few seconds
    ///  (e.g. RS485 Bricklet with a high baudrate but small payload) you may want to turn
    ///  the dynamic baudrate off to get the highest possible performance.
    ///  
    ///  The maximum value of the baudrate can be set per port with the function
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickIMUV2.TBrickIMUV2.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.0.10$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickIMUV2.TBrickIMUV2.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.10$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the timeout count for the different communication methods.
    ///  
    ///  The methods 0-2 are available for all Bricks, 3-7 only for Master Bricks.
    ///  
    ///  This function is mostly used for debugging during development, in normal operation
    ///  the counters should nearly always stay at 0.
    ///  
    ///  .. versionadded:: 2.0.7$nbsp;(Firmware)
    /// </summary>
    function GetSendTimeoutCount(const aCommunicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickIMUV2.TBrickIMUV2.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickIMUV2.TBrickIMUV2.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickIMUV2.TBrickIMUV2.SetSPITFPBaudrate"/>.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    function GetSPITFPBaudrate(const aBrickletPort: char): longword; virtual;

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
    ///  The errors counts are for errors that occur on the Brick side. All
    ///  Bricklets have a similar function that returns the errors on the Bricklet side.
    ///  
    ///  .. versionadded:: 2.0.5$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword;
                                  out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword;
                                  out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Enables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    /// </summary>
    procedure EnableStatusLED; virtual;

    /// <summary>
    ///  Disables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    /// </summary>
    procedure DisableStatusLED; virtual;

    /// <summary>
    ///  Returns *true* if the status LED is enabled, *false* otherwise.
    /// </summary>
    function IsStatusLEDEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the firmware and protocol version and the name of the Bricklet for a
    ///  given port.
    ///  
    ///  This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
    ///  plugins.
    /// </summary>
    procedure GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string); virtual;

    /// <summary>
    ///  Returns the temperature in °C/10 as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has an
    ///  accuracy of ±15%. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Brick. Calling this function
    ///  on a Brick inside of a stack will reset the whole stack.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Brick is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be '0'-'8' (stack position).
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>. The parameters are the acceleration
    ///  for the x, y and z axis.
    /// </summary>
    property OnAcceleration: TBrickIMUV2NotifyAcceleration read fAccelerationCallback write fAccelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>. The parameters are the magnetic
    ///  field for the x, y and z axis.
    /// </summary>
    property OnMagneticField: TBrickIMUV2NotifyMagneticField read fMagneticFieldCallback write fMagneticFieldCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>. The parameters are the angular
    ///  velocity for the x, y and z axis.
    /// </summary>
    property OnAngularVelocity: TBrickIMUV2NotifyAngularVelocity read fAngularVelocityCallback write fAngularVelocityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetTemperaturePeriod"/>. The parameter is the temperature.
    /// </summary>
    property OnTemperature: TBrickIMUV2NotifyTemperature read fTemperatureCallback write fTemperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>. The parameters are the
    ///  linear acceleration for the x, y and z axis.
    /// </summary>
    property OnLinearAcceleration: TBrickIMUV2NotifyLinearAcceleration read fLinearAccelerationCallback write fLinearAccelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>. The parameters gravity vector
    ///  for the x, y and z axis.
    /// </summary>
    property OnGravityVector: TBrickIMUV2NotifyGravityVector read fGravityVectorCallback write fGravityVectorCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>. The parameters are the orientation
    ///  (heading (yaw), roll, pitch) of the IMU Brick in Euler angles. See
    ///  <see cref="BrickIMUV2.TBrickIMUV2.GetOrientation"/> for details.
    /// </summary>
    property OnOrientation: TBrickIMUV2NotifyOrientation read fOrientationCallback write fOrientationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>. The parameters are the orientation
    ///  (x, y, z, w) of the IMU Brick in quaternions. See <see cref="BrickIMUV2.TBrickIMUV2.GetQuaternion"/>
    ///  for details.
    /// </summary>
    property OnQuaternion: TBrickIMUV2NotifyQuaternion read fQuaternionCallback write fQuaternionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>. The parameters are as for
    ///  <see cref="BrickIMUV2.TBrickIMUV2.GetAllData"/>.
    /// </summary>
    property OnAllData: TBrickIMUV2NotifyAllData read fAllDataCallback write fAllDataCallback;
  end;

implementation

procedure TBrickIMUV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 3;
end;

procedure TBrickIMUV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ORIENTATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_QUATERNION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ALL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_LEDS_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_LEDS_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_ARE_LEDS_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SAVE_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_MAGNETIC_FIELD_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_TEMPERATURE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_ORIENTATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ORIENTATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_LINEAR_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_GRAVITY_VECTOR_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_QUATERNION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_QUATERNION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_SENSOR_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SENSOR_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_SENSOR_FUSION_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SENSOR_FUSION_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickIMUV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_IMU_V2_CALLBACK_ACCELERATION]:= {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  aCallBacks[BRICK_IMU_V2_CALLBACK_MAGNETIC_FIELD]:= {$ifdef FPC}@{$endif}CallbackWrapperMagneticField;
  aCallBacks[BRICK_IMU_V2_CALLBACK_ANGULAR_VELOCITY]:= {$ifdef FPC}@{$endif}CallbackWrapperAngularVelocity;
  aCallBacks[BRICK_IMU_V2_CALLBACK_TEMPERATURE]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  aCallBacks[BRICK_IMU_V2_CALLBACK_LINEAR_ACCELERATION]:= {$ifdef FPC}@{$endif}CallbackWrapperLinearAcceleration;
  aCallBacks[BRICK_IMU_V2_CALLBACK_GRAVITY_VECTOR]:= {$ifdef FPC}@{$endif}CallbackWrapperGravityVector;
  aCallBacks[BRICK_IMU_V2_CALLBACK_ORIENTATION]:= {$ifdef FPC}@{$endif}CallbackWrapperOrientation;
  aCallBacks[BRICK_IMU_V2_CALLBACK_QUATERNION]:= {$ifdef FPC}@{$endif}CallbackWrapperQuaternion;
  aCallBacks[BRICK_IMU_V2_CALLBACK_ALL_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperAllData;
end;

procedure TBrickIMUV2.GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ACCELERATION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aX:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMUV2.GetMagneticField(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMUV2.GetAngularVelocity(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

function TBrickIMUV2.GetTemperature: shortint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickIMUV2.GetOrientation(out aHeading: smallint; out aRoll: smallint; out aPitch: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ORIENTATION, 8);
  _response:= SendRequest(_request);
  aHeading:= LEConvertInt16From(8, _response);
  aRoll:= LEConvertInt16From(10, _response);
  aPitch:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMUV2.GetLinearAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMUV2.GetGravityVector(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMUV2.GetQuaternion(out aW: smallint; out aX: smallint; out aY: smallint; out aZ: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_QUATERNION, 8);
  _response:= SendRequest(_request);
  aW:= LEConvertInt16From(8, _response);
  aX:= LEConvertInt16From(10, _response);
  aY:= LEConvertInt16From(12, _response);
  aZ:= LEConvertInt16From(14, _response);
end;

procedure TBrickIMUV2.GetAllData(out aAcceleration: TArray0To2OfInt16; out aMagneticField: TArray0To2OfInt16; out aAngularVelocity: TArray0To2OfInt16; out aEulerAngle: TArray0To2OfInt16; out aQuaternion: TArray0To3OfInt16; out aLinearAcceleration: TArray0To2OfInt16; out aGravityVector: TArray0To2OfInt16; out aTemperature: shortint; out aCalibrationStatus: byte);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ALL_DATA, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 2 do aAcceleration[_i]:= LEConvertInt16From(8 + (_i * 2), _response);
  for _i:= 0 to 2 do aMagneticField[_i]:= LEConvertInt16From(14 + (_i * 2), _response);
  for _i:= 0 to 2 do aAngularVelocity[_i]:= LEConvertInt16From(20 + (_i * 2), _response);
  for _i:= 0 to 2 do aEulerAngle[_i]:= LEConvertInt16From(26 + (_i * 2), _response);
  for _i:= 0 to 3 do aQuaternion[_i]:= LEConvertInt16From(32 + (_i * 2), _response);
  for _i:= 0 to 2 do aLinearAcceleration[_i]:= LEConvertInt16From(40 + (_i * 2), _response);
  for _i:= 0 to 2 do aGravityVector[_i]:= LEConvertInt16From(46 + (_i * 2), _response);
  aTemperature:= LEConvertInt8From(52, _response);
  aCalibrationStatus:= LEConvertUInt8From(53, _response);
end;

procedure TBrickIMUV2.LedsOn;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_LEDS_ON, 8);
  SendRequest(_request);
end;

procedure TBrickIMUV2.LedsOff;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_LEDS_OFF, 8);
  SendRequest(_request);
end;

function TBrickIMUV2.AreLedsOn: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_ARE_LEDS_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickIMUV2.SaveCalibration: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SAVE_CALIBRATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickIMUV2.SetAccelerationPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetAccelerationPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ACCELERATION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetMagneticFieldPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_MAGNETIC_FIELD_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetMagneticFieldPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetAngularVelocityPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetAngularVelocityPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetTemperaturePeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_TEMPERATURE_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetTemperaturePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetOrientationPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ORIENTATION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetOrientationPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ORIENTATION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetLinearAccelerationPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_LINEAR_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetLinearAccelerationPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetGravityVectorPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_GRAVITY_VECTOR_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetGravityVectorPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetQuaternionPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_QUATERNION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetQuaternionPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_QUATERNION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetAllDataPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetAllDataPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetSensorConfiguration(const aMagnetometerRate: byte; const aGyroscopeRange: byte; const aGyroscopeBandwidth: byte; const aAccelerometerRange: byte; const aAccelerometerBandwidth: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_SENSOR_CONFIGURATION, 13);
  LEConvertUInt8To(aMagnetometerRate, 8, _request);
  LEConvertUInt8To(aGyroscopeRange, 9, _request);
  LEConvertUInt8To(aGyroscopeBandwidth, 10, _request);
  LEConvertUInt8To(aAccelerometerRange, 11, _request);
  LEConvertUInt8To(aAccelerometerBandwidth, 12, _request);
  SendRequest(_request);
end;

procedure TBrickIMUV2.GetSensorConfiguration(out aMagnetometerRate: byte; out aGyroscopeRange: byte; out aGyroscopeBandwidth: byte; out aAccelerometerRange: byte; out aAccelerometerBandwidth: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SENSOR_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aMagnetometerRate:= LEConvertUInt8From(8, _response);
  aGyroscopeRange:= LEConvertUInt8From(9, _response);
  aGyroscopeBandwidth:= LEConvertUInt8From(10, _response);
  aAccelerometerRange:= LEConvertUInt8From(11, _response);
  aAccelerometerBandwidth:= LEConvertUInt8From(12, _response);
end;

procedure TBrickIMUV2.SetSensorFusionMode(const aMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_SENSOR_FUSION_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetSensorFusionMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SENSOR_FUSION_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickIMUV2.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickIMUV2.GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  aEnableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  aMinimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickIMUV2.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(aBaudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickIMUV2.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMUV2.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickIMUV2.EnableStatusLED;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickIMUV2.DisableStatusLED;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickIMUV2.IsStatusLEDEnabled: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickIMUV2.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  aName:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickIMUV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickIMUV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickIMUV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickIMUV2.CallbackWrapperAcceleration(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint; _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fAccelerationCallback)) then begin
    fAccelerationCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperMagneticField(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint; _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fMagneticFieldCallback)) then begin
    fMagneticFieldCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperAngularVelocity(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint; _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fAngularVelocityCallback)) then begin
    fAngularVelocityCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperTemperature(const aPacket: TDynamicByteArray);
var
  _temperature: shortint;
begin
  _temperature:= LEConvertInt8From(8, aPacket);

  if (Assigned(fTemperatureCallback)) then begin
    fTemperatureCallback(self, _temperature);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperLinearAcceleration(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint; _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fLinearAccelerationCallback)) then begin
    fLinearAccelerationCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperGravityVector(const aPacket: TDynamicByteArray);
var
  _x: smallint; _y: smallint; _z: smallint;
begin
  _x:= LEConvertInt16From(8, aPacket);
  _y:= LEConvertInt16From(10, aPacket);
  _z:= LEConvertInt16From(12, aPacket);

  if (Assigned(fGravityVectorCallback)) then begin
    fGravityVectorCallback(self, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperOrientation(const aPacket: TDynamicByteArray);
var
  _heading: smallint; _roll: smallint; _pitch: smallint;
begin
  _heading:= LEConvertInt16From(8, aPacket);
  _roll:= LEConvertInt16From(10, aPacket);
  _pitch:= LEConvertInt16From(12, aPacket);

  if (Assigned(fOrientationCallback)) then begin
    fOrientationCallback(self, _heading, _roll, _pitch);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperQuaternion(const aPacket: TDynamicByteArray);
var
  _w: smallint; _x: smallint; _y: smallint; _z: smallint;
begin
  _w:= LEConvertInt16From(8, aPacket);
  _x:= LEConvertInt16From(10, aPacket);
  _y:= LEConvertInt16From(12, aPacket);
  _z:= LEConvertInt16From(14, aPacket);

  if (Assigned(fQuaternionCallback)) then begin
    fQuaternionCallback(self, _w, _x, _y, _z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperAllData(const aPacket: TDynamicByteArray);
var
  _acceleration: TArray0To2OfInt16;
  _magneticField: TArray0To2OfInt16;
  _angularVelocity: TArray0To2OfInt16;
  _eulerAngle: TArray0To2OfInt16;
  _quaternion: TArray0To3OfInt16;
  _linearAcceleration: TArray0To2OfInt16;
  _gravityVector: TArray0To2OfInt16;
  _temperature: shortint;
  _calibrationStatus: byte;
  _i: longint;
begin
  for _i:= 0 to 2 do _acceleration[_i]:= LEConvertInt16From(8 + (_i * 2), aPacket);
  for _i:= 0 to 2 do _magneticField[_i]:= LEConvertInt16From(14 + (_i * 2), aPacket);
  for _i:= 0 to 2 do _angularVelocity[_i]:= LEConvertInt16From(20 + (_i * 2), aPacket);
  for _i:= 0 to 2 do _eulerAngle[_i]:= LEConvertInt16From(26 + (_i * 2), aPacket);
  for _i:= 0 to 3 do _quaternion[_i]:= LEConvertInt16From(32 + (_i * 2), aPacket);
  for _i:= 0 to 2 do _linearAcceleration[_i]:= LEConvertInt16From(40 + (_i * 2), aPacket);
  for _i:= 0 to 2 do _gravityVector[_i]:= LEConvertInt16From(46 + (_i * 2), aPacket);
  _temperature:= LEConvertInt8From(52, aPacket);
  _calibrationStatus:= LEConvertUInt8From(53, aPacket);

  if (Assigned(fAllDataCallback)) then begin
    fAllDataCallback(self, _acceleration, _magneticField, _angularVelocity, _eulerAngle, _quaternion, _linearAcceleration, _gravityVector, _temperature, _calibrationStatus);
  end;
end;

end.
