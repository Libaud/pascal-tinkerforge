{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickIMU;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickIMU.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To9OfInt16 = array [0..9] of smallint;

  TBrickIMU = class;
  TBrickIMUNotifyAcceleration = procedure(aSender: TBrickIMU; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUNotifyMagneticField = procedure(aSender: TBrickIMU; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUNotifyAngularVelocity = procedure(aSender: TBrickIMU; const aX: smallint; const aY: smallint; const aZ: smallint) of object;
  TBrickIMUNotifyAllData = procedure(aSender: TBrickIMU; const aAccX: smallint; const aAccY: smallint; const aAccZ: smallint;
                                     const magX: smallint; const magY: smallint; const magZ: smallint; const angX: smallint;
                                     const angY: smallint; const angZ: smallint; const temperature: smallint) of object;
  TBrickIMUNotifyOrientation = procedure(aSender: TBrickIMU; const aRoll: smallint; const aPitch: smallint; const aYaw: smallint) of object;
  TBrickIMUNotifyQuaternion = procedure(aSender: TBrickIMU; const aX: single; const aY: single; const aZ: single; const aW: single) of object;

  /// <summary>
  ///  Full fledged AHRS with 9 degrees of freedom
  /// </summary>
  TBrickIMU = class(TDevice)
  private
    accelerationCallback: TBrickIMUNotifyAcceleration;
    magneticFieldCallback: TBrickIMUNotifyMagneticField;
    angularVelocityCallback: TBrickIMUNotifyAngularVelocity;
    allDataCallback: TBrickIMUNotifyAllData;
    orientationCallback: TBrickIMUNotifyOrientation;
    quaternionCallback: TBrickIMUNotifyQuaternion;
  protected
    procedure CallbackWrapperAcceleration(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMagneticField(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAngularVelocity(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllData(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperOrientation(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperQuaternion(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns the calibrated acceleration from the accelerometer for the
    ///  x, y and z axis in g/1000 (1g = 9.80665m/s²).
    ///  
    ///  If you want to get the acceleration periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnAcceleration"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated magnetic field from the magnetometer for the
    ///  x, y and z axis in mG (Milligauss or Nanotesla).
    ///  
    ///  If you want to get the magnetic field periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnMagneticField"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>.
    /// </summary>
    procedure GetMagneticField(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated angular velocity from the gyroscope for the
    ///  x, y and z axis in °/14.375s (you have to divide by 14.375 to
    ///  get the value in °/s).
    ///  
    ///  If you want to get the angular velocity periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnAngularVelocity"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>.
    /// </summary>
    procedure GetAngularVelocity(out aX: smallint; out aY: smallint; out aZ: smallint); virtual;

    /// <summary>
    ///  Returns the data from <see cref="BrickIMU.TBrickIMU.GetAcceleration"/>, <see cref="BrickIMU.TBrickIMU.GetMagneticField"/>
    ///  and <see cref="BrickIMU.TBrickIMU.GetAngularVelocity"/> as well as the temperature of the IMU Brick.
    ///  
    ///  The temperature is given in °C/100.
    ///  
    ///  If you want to get the data periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnAllData"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>.
    /// </summary>
    procedure GetAllData(out aAccX: smallint; out aAccY: smallint; out aAccZ: smallint;
                         out aMagX: smallint; out aMagY: smallint; out aMagZ: smallint;
                         out aAngX: smallint; out aAngY: smallint; out aAngZ: smallint;
                         out aTemperature: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (roll, pitch, yaw) of the IMU Brick as Euler
    ///  angles in one-hundredth degree. Note that Euler angles always experience a
    ///  `gimbal lock &lt;https://en.wikipedia.org/wiki/Gimbal_lock&gt;`__.
    ///  
    ///  We recommend that you use quaternions instead.
    ///  
    ///  The order to sequence in which the orientation values should be applied is
    ///  roll, yaw, pitch.
    ///  
    ///  If you want to get the orientation periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnOrientation"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>.
    /// </summary>
    procedure GetOrientation(out aRoll: smallint; out aPitch: smallint; out aYaw: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (x, y, z, w) of the IMU as
    ///  `quaternions &lt;https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation&gt;`__.
    ///  
    ///  You can go from quaternions to Euler angles with the following formula::
    ///  
    ///   xAngle = atan2(2*y*w - 2*x*z, 1 - 2*y*y - 2*z*z)
    ///   yAngle = atan2(2*x*w - 2*y*z, 1 - 2*x*x - 2*z*z)
    ///   zAngle =  asin(2*x*y + 2*z*w)
    ///  
    ///  This process is not reversible, because of the
    ///  `gimbal lock &lt;https://en.wikipedia.org/wiki/Gimbal_lock&gt;`__.
    ///  
    ///  It is also possible to calculate independent angles. You can calculate
    ///  yaw, pitch and roll in a right-handed vehicle coordinate system according to
    ///  DIN70000 with::
    ///  
    ///   yaw   =  atan2(2*x*y + 2*w*z, w*w + x*x - y*y - z*z)
    ///   pitch = -asin(2*w*y - 2*x*z)
    ///   roll  = -atan2(2*y*z + 2*w*x, -w*w + x*x + y*y - z*z))
    ///  
    ///  Converting the quaternions to an OpenGL transformation matrix is
    ///  possible with the following formula::
    ///  
    ///   matrix = [[1 - 2*(y*y + z*z),     2*(x*y - w*z),     2*(x*z + w*y), 0],
    ///             [    2*(x*y + w*z), 1 - 2*(x*x + z*z),     2*(y*z - w*x), 0],
    ///             [    2*(x*z - w*y),     2*(y*z + w*x), 1 - 2*(x*x + y*y), 0],
    ///             [                0,                 0,                 0, 1]]
    ///  
    ///  If you want to get the quaternions periodically, it is recommended
    ///  to use the <see cref="BrickIMU.TBrickIMU.OnQuaternion"/> callback and set the period with
    ///  <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>.
    /// </summary>
    procedure GetQuaternion(out aX: single; out aY: single; out aZ: single; out aW: single); virtual;

    /// <summary>
    ///  Returns the temperature of the IMU Brick. The temperature is given in
    ///  °C/100.
    /// </summary>
    function GetIMUTemperature: smallint; virtual;

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
    ///  Not implemented yet.
    /// </summary>
    procedure SetAccelerationRange(const range: byte); virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    function GetAccelerationRange: byte; virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    procedure SetMagnetometerRange(const aRange: byte); virtual;

    /// <summary>
    ///  Not implemented yet.
    /// </summary>
    function GetMagnetometerRange: byte; virtual;

    /// <summary>
    ///  Sets the convergence speed of the IMU Brick in °/s. The convergence speed
    ///  determines how the different sensor measurements are fused.
    ///  
    ///  If the orientation of the IMU Brick is off by 10° and the convergence speed is
    ///  set to 20°/s, it will take 0.5s until the orientation is corrected. However,
    ///  if the correct orientation is reached and the convergence speed is too high,
    ///  the orientation will fluctuate with the fluctuations of the accelerometer and
    ///  the magnetometer.
    ///  
    ///  If you set the convergence speed to 0, practically only the gyroscope is used
    ///  to calculate the orientation. This gives very smooth movements, but errors of the
    ///  gyroscope will not be corrected. If you set the convergence speed to something
    ///  above 500, practically only the magnetometer and the accelerometer are used to
    ///  calculate the orientation. In this case the movements are abrupt and the values
    ///  will fluctuate, but there won't be any errors that accumulate over time.
    ///  
    ///  In an application with high angular velocities, we recommend a high convergence
    ///  speed, so the errors of the gyroscope can be corrected fast. In applications with
    ///  only slow movements we recommend a low convergence speed. You can change the
    ///  convergence speed on the fly. So it is possible (and recommended) to increase
    ///  the convergence speed before an abrupt movement and decrease it afterwards
    ///  again.
    ///  
    ///  You might want to play around with the convergence speed in the Brick Viewer to
    ///  get a feeling for a good value for your application.
    ///  
    ///  The default value is 30.
    /// </summary>
    procedure SetConvergenceSpeed(const aSpeed: word); virtual;

    /// <summary>
    ///  Returns the convergence speed as set by <see cref="BrickIMU.TBrickIMU.SetConvergenceSpeed"/>.
    /// </summary>
    function GetConvergenceSpeed: word; virtual;

    /// <summary>
    ///  There are several different types that can be calibrated:
    ///  
    ///  <code>
    ///   "Type", "Description", "Values"
    ///  
    ///   "0",    "Accelerometer Gain", "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "1",    "Accelerometer Bias", "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
    ///   "2",    "Magnetometer Gain",  "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "3",    "Magnetometer Bias",  "``[bias x, bias y, bias z, 0, 0, 0, 0, 0, 0, 0]``"
    ///   "4",    "Gyroscope Gain",     "``[mul x, mul y, mul z, div x, div y, div z, 0, 0, 0, 0]``"
    ///   "5",    "Gyroscope Bias",     "``[bias xl, bias yl, bias zl, temp l, bias xh, bias yh, bias zh, temp h, 0, 0]``"
    ///  </code>
    ///  
    ///  The calibration via gain and bias is done with the following formula::
    ///  
    ///   new_value = (bias + orig_value) * gain_mul / gain_div
    ///  
    ///  If you really want to write your own calibration software, please keep
    ///  in mind that you first have to undo the old calibration (set bias to 0 and
    ///  gain to 1/1) and that you have to average over several thousand values
    ///  to obtain a usable Result in the end.
    ///  
    ///  The gyroscope bias is highly dependent on the temperature, so you have to
    ///  calibrate the bias two times with different temperatures. The values ``xl``,
    ///  ``yl``, ``zl`` and ``temp l`` are the bias for ``x``, ``y``, ``z`` and the
    ///  corresponding temperature for a low temperature. The values ``xh``, ``yh``,
    ///  ``zh`` and ``temp h`` are the same for a high temperatures. The temperature
    ///  difference should be at least 5°C. If you have a temperature where the
    ///  IMU Brick is mostly used, you should use this temperature for one of the
    ///  sampling points.
    ///  
    ///  <note>
    ///   We highly recommend that you use the Brick Viewer to calibrate your
    ///   IMU Brick.
    ///  </note>
    /// </summary>
    procedure SetCalibration(const aTyp: byte; const aData: array of smallint); virtual;

    /// <summary>
    ///  Returns the calibration for a given type as set by <see cref="BrickIMU.TBrickIMU.SetCalibration"/>.
    /// </summary>
    function GetCalibration(const aTyp: byte): TArray0To9OfInt16; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnAcceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAccelerationPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>.
    /// </summary>
    function GetAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnMagneticField"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetMagneticFieldPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>.
    /// </summary>
    function GetMagneticFieldPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnAngularVelocity"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAngularVelocityPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>.
    /// </summary>
    function GetAngularVelocityPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnAllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnOrientation"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetOrientationPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>.
    /// </summary>
    function GetOrientationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickIMU.TBrickIMU.OnQuaternion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetQuaternionPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>.
    /// </summary>
    function GetQuaternionPeriod: longword; virtual;

    /// <summary>
    ///  Turns the orientation calculation of the IMU Brick on.
    ///  
    ///  As default the calculation is on.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Firmware)
    /// </summary>
    procedure OrientationCalculationOn; virtual;

    /// <summary>
    ///  Turns the orientation calculation of the IMU Brick off.
    ///  
    ///  If the calculation is off, <see cref="BrickIMU.TBrickIMU.GetOrientation"/> will return
    ///  the last calculated value until the calculation is turned on again.
    ///  
    ///  The trigonometric functions that are needed to calculate the orientation
    ///  are very expensive. We recommend to turn the orientation calculation
    ///  off if the orientation is not needed, to free calculation time for the
    ///  sensor fusion algorithm.
    ///  
    ///  As default the calculation is on.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Firmware)
    /// </summary>
    procedure OrientationCalculationOff; virtual;

    /// <summary>
    ///  Returns *true* if the orientation calculation of the IMU Brick
    ///  is on, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Firmware)
    /// </summary>
    function IsOrientationCalculationOn: boolean; virtual;

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
    ///  <see cref="BrickIMU.TBrickIMU.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickIMU.TBrickIMU.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.3.5$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickIMU.TBrickIMU.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.3.5$nbsp;(Firmware)
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
    ///  .. versionadded:: 2.3.3$nbsp;(Firmware)
    /// </summary>
    function GetSendTimeoutCount(const aCommunicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickIMU.TBrickIMU.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickIMU.TBrickIMU.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    ///  
    ///  .. versionadded:: 2.3.3$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrate(const aBrickletPort: char; const baudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickIMU.TBrickIMU.SetSPITFPBaudrate"/>.
    ///  
    ///  .. versionadded:: 2.3.3$nbsp;(Firmware)
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
    ///  .. versionadded:: 2.3.3$nbsp;(Firmware)
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
    ///  
    ///  .. versionadded:: 2.3.1$nbsp;(Firmware)
    /// </summary>
    procedure EnableStatusLED; virtual;

    /// <summary>
    ///  Disables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    ///  
    ///  .. versionadded:: 2.3.1$nbsp;(Firmware)
    /// </summary>
    procedure DisableStatusLED; virtual;

    /// <summary>
    ///  Returns *true* if the status LED is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.3.1$nbsp;(Firmware)
    /// </summary>
    function IsStatusLEDEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the firmware and protocol version and the name of the Bricklet for a
    ///  given port.
    ///  
    ///  This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
    ///  plugins.
    /// </summary>
    procedure GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte;
                                       out aFirmwareVersion: TArray0To2OfUInt8; out aName: string); virtual;

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
    ///  <see cref="BrickIMU.TBrickIMU.SetAccelerationPeriod"/>. The parameters are the acceleration
    ///  for the x, y and z axis.
    /// </summary>
    property OnAcceleration: TBrickIMUNotifyAcceleration read accelerationCallback write accelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetMagneticFieldPeriod"/>. The parameters are the magnetic
    ///  field for the x, y and z axis.
    /// </summary>
    property OnMagneticField: TBrickIMUNotifyMagneticField read magneticFieldCallback write magneticFieldCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetAngularVelocityPeriod"/>. The parameters are the angular
    ///  velocity for the x, y and z axis.
    /// </summary>
    property OnAngularVelocity: TBrickIMUNotifyAngularVelocity read angularVelocityCallback write angularVelocityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetAllDataPeriod"/>. The parameters are the acceleration,
    ///  the magnetic field and the angular velocity for the x, y and z axis as
    ///  well as the temperature of the IMU Brick.
    /// </summary>
    property OnAllData: TBrickIMUNotifyAllData read allDataCallback write allDataCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetOrientationPeriod"/>. The parameters are the orientation
    ///  (roll, pitch and yaw) of the IMU Brick in Euler angles. See
    ///  <see cref="BrickIMU.TBrickIMU.GetOrientation"/> for details.
    /// </summary>
    property OnOrientation: TBrickIMUNotifyOrientation read orientationCallback write orientationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMU.TBrickIMU.SetQuaternionPeriod"/>. The parameters are the orientation
    ///  (x, y, z, w) of the IMU Brick in quaternions. See <see cref="BrickIMU.TBrickIMU.GetQuaternion"/>
    ///  for details.
    /// </summary>
    property OnQuaternion: TBrickIMUNotifyQuaternion read quaternionCallback write quaternionCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickIMU.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 4;
end;

procedure TBrickIMU.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ALL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ORIENTATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_QUATERNION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_IMU_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_LEDS_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_LEDS_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_ARE_LEDS_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_ACCELERATION_RANGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION_RANGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_MAGNETOMETER_RANGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_MAGNETOMETER_RANGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_CONVERGENCE_SPEED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_CONVERGENCE_SPEED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ACCELERATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_MAGNETIC_FIELD_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_ORIENTATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_ORIENTATION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_QUATERNION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_QUATERNION_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_ON]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_OFF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_IS_ORIENTATION_CALCULATION_ON]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_IMU_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_IMU_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickIMU.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_IMU_CALLBACK_ACCELERATION]:= {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  aCallBacks[BRICK_IMU_CALLBACK_MAGNETIC_FIELD]:= {$ifdef FPC}@{$endif}CallbackWrapperMagneticField;
  aCallBacks[BRICK_IMU_CALLBACK_ANGULAR_VELOCITY]:= {$ifdef FPC}@{$endif}CallbackWrapperAngularVelocity;
  aCallBacks[BRICK_IMU_CALLBACK_ALL_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperAllData;
  aCallBacks[BRICK_IMU_CALLBACK_ORIENTATION]:= {$ifdef FPC}@{$endif}CallbackWrapperOrientation;
  aCallBacks[BRICK_IMU_CALLBACK_QUATERNION]:= {$ifdef FPC}@{$endif}CallbackWrapperQuaternion;
end;

procedure TBrickIMU.GetAcceleration(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMU.GetMagneticField(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMU.GetAngularVelocity(out aX: smallint; out aY: smallint; out aZ: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertInt16From(8, _response);
  aY:= LEConvertInt16From(10, _response);
  aZ:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMU.GetAllData(out aAccX: smallint; out aAccY: smallint; out aAccZ: smallint; out aMagX: smallint; out aMagY: smallint; out aMagZ: smallint; out aAngX: smallint; out aAngY: smallint; out aAngZ: smallint; out aTemperature: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ALL_DATA, 8);
  _response:= SendRequest(_request);
  aAccX:= LEConvertInt16From(8, _response);
  aAccY:= LEConvertInt16From(10, _response);
  aAccZ:= LEConvertInt16From(12, _response);
  aMagX:= LEConvertInt16From(14, _response);
  aMagY:= LEConvertInt16From(16, _response);
  aMagZ:= LEConvertInt16From(18, _response);
  aAngX:= LEConvertInt16From(20, _response);
  aAngY:= LEConvertInt16From(22, _response);
  aAngZ:= LEConvertInt16From(24, _response);
  aTemperature:= LEConvertInt16From(26, _response);
end;

procedure TBrickIMU.GetOrientation(out aRoll: smallint; out aPitch: smallint; out aYaw: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ORIENTATION, 8);
  _response:= SendRequest(_request);
  aRoll:= LEConvertInt16From(8, _response);
  aPitch:= LEConvertInt16From(10, _response);
  aYaw:= LEConvertInt16From(12, _response);
end;

procedure TBrickIMU.GetQuaternion(out aX: single; out aY: single; out aZ: single; out aW: single);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_QUATERNION, 8);
  _response:= SendRequest(_request);
  aX:= LEConvertFloatFrom(8, _response);
  aY:= LEConvertFloatFrom(12, _response);
  aZ:= LEConvertFloatFrom(16, _response);
  aW:= LEConvertFloatFrom(20, _response);
end;

function TBrickIMU.GetIMUTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_IMU_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickIMU.LedsOn;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_LEDS_ON, 8);
  SendRequest(_request);
end;

procedure TBrickIMU.LedsOff;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_LEDS_OFF, 8);
  SendRequest(_request);
end;

function TBrickIMU.AreLedsOn: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_ARE_LEDS_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickIMU.SetAccelerationRange(const range: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ACCELERATION_RANGE, 9);
  LEConvertUInt8To(range, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetAccelerationRange: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION_RANGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickIMU.SetMagnetometerRange(const aRange: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_MAGNETOMETER_RANGE, 9);
  LEConvertUInt8To(aRange, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetMagnetometerRange: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETOMETER_RANGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickIMU.SetConvergenceSpeed(const aSpeed: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_CONVERGENCE_SPEED, 10);
  LEConvertUInt16To(aSpeed, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetConvergenceSpeed: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CONVERGENCE_SPEED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickIMU.SetCalibration(const aTyp: byte; const aData: array of smallint);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_CALIBRATION, 29);
  LEConvertUInt8To(aTyp, 8, _request);
  if (Length(aData) <> 10) then raise EInvalidParameterException.Create('Data has to be exactly 10 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertInt16To(aData[_i], 9 + (_i * 2), _request);
  SendRequest(_request);
end;

function TBrickIMU.GetCalibration(const aTyp: byte): TArray0To9OfInt16;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CALIBRATION, 9);
  LEConvertUInt8To(aTyp, 8, _request);
  _response:= SendRequest(_request);
  for _i:= 0 to 9 do Result[_i]:= LEConvertInt16From(8 + (_i * 2), _response);
end;

procedure TBrickIMU.SetAccelerationPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetAccelerationPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ACCELERATION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetMagneticFieldPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_MAGNETIC_FIELD_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetMagneticFieldPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_MAGNETIC_FIELD_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetAngularVelocityPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetAngularVelocityPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetAllDataPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetAllDataPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetOrientationPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_ORIENTATION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetOrientationPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_ORIENTATION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetQuaternionPeriod(const aPeriod: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_QUATERNION_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetQuaternionPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_QUATERNION_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.OrientationCalculationOn;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_ON, 8);
  SendRequest(_request);
end;

procedure TBrickIMU.OrientationCalculationOff;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_ORIENTATION_CALCULATION_OFF, 8);
  SendRequest(_request);
end;

function TBrickIMU.IsOrientationCalculationOn: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_IS_ORIENTATION_CALCULATION_ON, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickIMU.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickIMU.GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  aEnableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  aMinimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickIMU.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.SetSPITFPBaudrate(const aBrickletPort: char; const baudrate: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(baudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickIMU.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickIMU.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickIMU.EnableStatusLED;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickIMU.DisableStatusLED;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickIMU.IsStatusLEDEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickIMU.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  aName:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickIMU.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickIMU.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickIMU.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_IMU_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickIMU.CallbackWrapperAcceleration(const aPacket: TDynamicByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  x:= LEConvertInt16From(8, aPacket);
  y:= LEConvertInt16From(10, aPacket);
  z:= LEConvertInt16From(12, aPacket);

  if (Assigned(accelerationCallback)) then begin
    accelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperMagneticField(const aPacket: TDynamicByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  x:= LEConvertInt16From(8, aPacket);
  y:= LEConvertInt16From(10, aPacket);
  z:= LEConvertInt16From(12, aPacket);

  if (Assigned(magneticFieldCallback)) then begin
    magneticFieldCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperAngularVelocity(const aPacket: TDynamicByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  x:= LEConvertInt16From(8, aPacket);
  y:= LEConvertInt16From(10, aPacket);
  z:= LEConvertInt16From(12, aPacket);

  if (Assigned(angularVelocityCallback)) then begin
    angularVelocityCallback(self, x, y, z);
  end;
end;

procedure TBrickIMU.CallbackWrapperAllData(const aPacket: TDynamicByteArray);
var accX: smallint; accY: smallint; accZ: smallint; magX: smallint; magY: smallint; magZ: smallint; angX: smallint; angY: smallint; angZ: smallint; temperature: smallint;
begin
  accX:= LEConvertInt16From(8, aPacket);
  accY:= LEConvertInt16From(10, aPacket);
  accZ:= LEConvertInt16From(12, aPacket);
  magX:= LEConvertInt16From(14, aPacket);
  magY:= LEConvertInt16From(16, aPacket);
  magZ:= LEConvertInt16From(18, aPacket);
  angX:= LEConvertInt16From(20, aPacket);
  angY:= LEConvertInt16From(22, aPacket);
  angZ:= LEConvertInt16From(24, aPacket);
  temperature:= LEConvertInt16From(26, aPacket);

  if (Assigned(allDataCallback)) then begin
    allDataCallback(self, accX, accY, accZ, magX, magY, magZ, angX, angY, angZ, temperature);
  end;
end;

procedure TBrickIMU.CallbackWrapperOrientation(const aPacket: TDynamicByteArray);
var roll: smallint; pitch: smallint; yaw: smallint;
begin
  roll:= LEConvertInt16From(8, aPacket);
  pitch:= LEConvertInt16From(10, aPacket);
  yaw:= LEConvertInt16From(12, aPacket);

  if (Assigned(orientationCallback)) then begin
    orientationCallback(self, roll, pitch, yaw);
  end;
end;

procedure TBrickIMU.CallbackWrapperQuaternion(const aPacket: TDynamicByteArray);
var x: single; y: single; z: single; w: single;
begin
  x:= LEConvertFloatFrom(8, aPacket);
  y:= LEConvertFloatFrom(12, aPacket);
  z:= LEConvertFloatFrom(16, aPacket);
  w:= LEConvertFloatFrom(20, aPacket);

  if (Assigned(quaternionCallback)) then begin
    quaternionCallback(self, x, y, z, w);
  end;
end;

end.
