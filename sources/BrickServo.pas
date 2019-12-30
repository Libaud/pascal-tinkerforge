{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickServo;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickServo.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickServo = class;
  TBrickServoNotifyUnderVoltage = procedure(aSender: TBrickServo; const voltage: word) of object;
  TBrickServoNotifyPositionReached = procedure(aSender: TBrickServo; const servoNum: byte; const position: smallint) of object;
  TBrickServoNotifyVelocityReached = procedure(aSender: TBrickServo; const servoNum: byte; const velocity: smallint) of object;

  /// <summary>
  ///  Drives up to 7 RC Servos with up to 3A
  /// </summary>
  TBrickServo = class(TDevice)
  private
    underVoltageCallback: TBrickServoNotifyUnderVoltage;
    positionReachedCallback: TBrickServoNotifyPositionReached;
    velocityReachedCallback: TBrickServoNotifyVelocityReached;
  protected
    procedure CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const apacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Enables a servo (0 to 6). If a servo is enabled, the configured position,
    ///  velocity, acceleration, etc. are applied immediately.
    /// </summary>
    procedure Enable(const aServoNum: byte); virtual;

    /// <summary>
    ///  Disables a servo (0 to 6). Disabled servos are not driven at all, i.e. a
    ///  disabled servo will not hold its position if a load is applied.
    /// </summary>
    procedure Disable(const aServoNum: byte); virtual;

    /// <summary>
    ///  Returns *true* if the specified servo is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled(const aServoNum: byte): boolean; virtual;

    /// <summary>
    ///  Sets the position in °/100 for the specified servo.
    ///  
    ///  The default range of the position is -9000 to 9000, but it can be specified
    ///  according to your servo with <see cref="BrickServo.TBrickServo.SetDegree"/>.
    ///  
    ///  If you want to control a linear servo or RC brushless motor controller or
    ///  similar with the Servo Brick, you can also define lengths or speeds with
    ///  <see cref="BrickServo.TBrickServo.SetDegree"/>.
    /// </summary>
    procedure SetPosition(const aServoNum: byte; const aPosition: smallint); virtual;

    /// <summary>
    ///  Returns the position of the specified servo as set by <see cref="BrickServo.TBrickServo.SetPosition"/>.
    /// </summary>
    function GetPosition(const aServoNum: byte): smallint; virtual;

    /// <summary>
    ///  Returns the *current* position of the specified servo. This may not be the
    ///  value of <see cref="BrickServo.TBrickServo.SetPosition"/> if the servo is currently approaching a
    ///  position goal.
    /// </summary>
    function GetCurrentPosition(const aServoNum: byte): smallint; virtual;

    /// <summary>
    ///  Sets the maximum velocity of the specified servo in °/100s. The velocity
    ///  is accelerated according to the value set by <see cref="BrickServo.TBrickServo.SetAcceleration"/>.
    ///  
    ///  The minimum velocity is 0 (no movement) and the maximum velocity is 65535.
    ///  With a value of 65535 the position will be set immediately (no velocity).
    ///  
    ///  The default value is 65535.
    /// </summary>
    procedure SetVelocity(const aServoNum: byte; const velocity: word); virtual;

    /// <summary>
    ///  Returns the velocity of the specified servo as set by <see cref="BrickServo.TBrickServo.SetVelocity"/>.
    /// </summary>
    function GetVelocity(const aServoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the specified servo. This may not be the
    ///  value of <see cref="BrickServo.TBrickServo.SetVelocity"/> if the servo is currently approaching a
    ///  velocity goal.
    /// </summary>
    function GetCurrentVelocity(const aServoNum: byte): word; virtual;

    /// <summary>
    ///  Sets the acceleration of the specified servo in °/100s².
    ///  
    ///  The minimum acceleration is 1 and the maximum acceleration is 65535.
    ///  With a value of 65535 the velocity will be set immediately (no acceleration).
    ///  
    ///  The default value is 65535.
    /// </summary>
    procedure SetAcceleration(const aServoNum: byte; const aAcceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration for the specified servo as set by
    ///  <see cref="BrickServo.TBrickServo.SetAcceleration"/>.
    /// </summary>
    function GetAcceleration(const aServoNum: byte): word; virtual;

    /// <summary>
    ///  Sets the output voltages with which the servos are driven in mV.
    ///  The minimum output voltage is 2000mV and the maximum output voltage is
    ///  9000mV.
    ///  
    ///  <note>
    ///   We recommend that you set this value to the maximum voltage that is
    ///   specified for your servo, most servos achieve their maximum force only
    ///   with high voltages.
    ///  </note>
    ///  
    ///  The default value is 5000.
    /// </summary>
    procedure SetOutputVoltage(const aVoltage: word); virtual;

    /// <summary>
    ///  Returns the output voltage as specified by <see cref="BrickServo.TBrickServo.SetOutputVoltage"/>.
    /// </summary>
    function GetOutputVoltage: word; virtual;

    /// <summary>
    ///  Sets the minimum and maximum pulse width of the specified servo in µs.
    ///  
    ///  Usually, servos are controlled with a
    ///  `PWM &lt;https://en.wikipedia.org/wiki/Pulse-width_modulation&gt;`__, whereby the
    ///  length of the pulse controls the position of the servo. Every servo has
    ///  different minimum and maximum pulse widths, these can be specified with
    ///  this function.
    ///  
    ///  If you have a datasheet for your servo that specifies the minimum and
    ///  maximum pulse width, you should set the values accordingly. If your servo
    ///  comes without any datasheet you have to find the values via trial and error.
    ///  
    ///  Both values have a range from 1 to 65535 (unsigned 16-bit integer). The
    ///  minimum must be smaller than the maximum.
    ///  
    ///  The default values are 1000µs (1ms) and 2000µs (2ms) for minimum and
    ///  maximum pulse width.
    /// </summary>
    procedure SetPulseWidth(const aServoNum: byte; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the minimum and maximum pulse width for the specified servo as set by
    ///  <see cref="BrickServo.TBrickServo.SetPulseWidth"/>.
    /// </summary>
    procedure GetPulseWidth(const aServoNum: byte; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Sets the minimum and maximum degree for the specified servo (by default
    ///  given as °/100).
    ///  
    ///  This only specifies the abstract values between which the minimum and maximum
    ///  pulse width is scaled. For example: If you specify a pulse width of 1000µs
    ///  to 2000µs and a degree range of -90° to 90°, a call of <see cref="BrickServo.TBrickServo.SetPosition"/>
    ///  with 0 will Result in a pulse width of 1500µs
    ///  (-90° = 1000µs, 90° = 2000µs, etc.).
    ///  
    ///  Possible usage:
    ///  
    ///  * The datasheet of your servo specifies a range of 200° with the middle position
    ///    at 110°. In this case you can set the minimum to -9000 and the maximum to 11000.
    ///  * You measure a range of 220° on your servo and you don't have or need a middle
    ///    position. In this case you can set the minimum to 0 and the maximum to 22000.
    ///  * You have a linear servo with a drive length of 20cm, In this case you could
    ///    set the minimum to 0 and the maximum to 20000. Now you can set the Position
    ///    with <see cref="BrickServo.TBrickServo.SetPosition"/> with a resolution of cm/100. Also the velocity will
    ///    have a resolution of cm/100s and the acceleration will have a resolution of
    ///    cm/100s².
    ///  * You don't care about units and just want the highest possible resolution. In
    ///    this case you should set the minimum to -32767 and the maximum to 32767.
    ///  * You have a brushless motor with a maximum speed of 10000 rpm and want to
    ///    control it with a RC brushless motor controller. In this case you can set the
    ///    minimum to 0 and the maximum to 10000. <see cref="BrickServo.TBrickServo.SetPosition"/> now controls the rpm.
    ///  
    ///  Both values have a possible range from -32767 to 32767
    ///  (signed 16-bit integer). The minimum must be smaller than the maximum.
    ///  
    ///  The default values are -9000 and 9000 for the minimum and maximum degree.
    /// </summary>
    procedure SetDegree(const aServoNum: byte; const aMin: smallint; const aMax: smallint); virtual;

    /// <summary>
    ///  Returns the minimum and maximum degree for the specified servo as set by
    ///  <see cref="BrickServo.TBrickServo.SetDegree"/>.
    /// </summary>
    procedure GetDegree(const aServoNum: byte; out aMin: smallint; out aMax: smallint); virtual;

    /// <summary>
    ///  Sets the period of the specified servo in µs.
    ///  
    ///  Usually, servos are controlled with a
    ///  `PWM &lt;https://en.wikipedia.org/wiki/Pulse-width_modulation&gt;`__. Different
    ///  servos expect PWMs with different periods. Most servos run well with a
    ///  period of about 20ms.
    ///  
    ///  If your servo comes with a datasheet that specifies a period, you should
    ///  set it accordingly. If you don't have a datasheet and you have no idea
    ///  what the correct period is, the default value (19.5ms) will most likely
    ///  work fine.
    ///  
    ///  The minimum possible period is 1µs and the maximum is 65535µs.
    ///  
    ///  The default value is 19.5ms (19500µs).
    /// </summary>
    procedure SetPeriod(const aServoNum: byte; const aPeriod: word); virtual;

    /// <summary>
    ///  Returns the period for the specified servo as set by <see cref="BrickServo.TBrickServo.SetPeriod"/>.
    /// </summary>
    function GetPeriod(const aServoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the current consumption of the specified servo in mA.
    /// </summary>
    function GetServoCurrent(const aServoNum: byte): word; virtual;

    /// <summary>
    ///  Returns the current consumption of all servos together in mA.
    /// </summary>
    function GetOverallCurrent: word; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the Servo Brick.
    ///  
    ///  If there is an external input voltage and a stack input voltage, the motors
    ///  will be driven by the external input voltage. If there is only a stack
    ///  voltage present, the motors will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motors will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickServo.TBrickServo.OnUnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the Servo Brick is 5V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the stepper motor. If you have a fixed power supply, you likely do
    ///  not need this functionality.
    ///  
    ///  The default value is 5V (5000mV).
    /// </summary>
    procedure SetMinimumVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickServo.TBrickServo.SetMinimumVoltage"/>
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickServo.TBrickServo.OnPositionReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure EnablePositionReachedCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickServo.TBrickServo.OnPositionReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure DisablePositionReachedCallback; virtual;

    /// <summary>
    ///  Returns *true* if <see cref="BrickServo.TBrickServo.OnPositionReached"/> callback is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    function IsPositionReachedCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickServo.TBrickServo.OnVelocityReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure EnableVelocityReachedCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickServo.TBrickServo.OnVelocityReached"/> callback.
    ///  
    ///  Default is disabled.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    procedure DisableVelocityReachedCallback; virtual;

    /// <summary>
    ///  Returns *true* if <see cref="BrickServo.TBrickServo.OnVelocityReached"/> callback is enabled, *false* otherwise.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Firmware)
    /// </summary>
    function IsVelocityReachedCallbackEnabled: boolean; virtual;

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
    ///  <see cref="BrickServo.TBrickServo.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickServo.TBrickServo.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.3.4$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickServo.TBrickServo.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.3.4$nbsp;(Firmware)
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
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    function GetSendTimeoutCount(const aCommunicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickServo.TBrickServo.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickServo.TBrickServo.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    ///  
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrate(const aBrickletPort: char; const baudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickServo.TBrickServo.SetSPITFPBaudrate"/>.
    ///  
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
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
    ///  .. versionadded:: 2.3.2$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered when the input voltage drops below the value set by
    ///  <see cref="BrickServo.TBrickServo.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickServoNotifyUnderVoltage read underVoltageCallback write underVoltageCallback;

    /// <summary>
    ///  This callback is triggered when a position set by <see cref="BrickServo.TBrickServo.SetPosition"/>
    ///  is reached. If the new position matches the current position then the
    ///  callback is not triggered, because the servo didn't move.
    ///  The parameters are the servo and the position that is reached.
    ///  
    ///  You can enable this callback with <see cref="BrickServo.TBrickServo.EnablePositionReachedCallback"/>.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the servo, this only works if the
    ///   velocity (see <see cref="BrickServo.TBrickServo.SetVelocity"/>) is set smaller or equal to the
    ///   maximum velocity of the servo. Otherwise the servo will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnPositionReached: TBrickServoNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered when a velocity set by <see cref="BrickServo.TBrickServo.SetVelocity"/>
    ///  is reached. The parameters are the servo and the velocity that is reached.
    ///  
    ///  You can enable this callback with <see cref="BrickServo.TBrickServo.EnableVelocityReachedCallback"/>.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the servo, this only works if the
    ///   acceleration (see <see cref="BrickServo.TBrickServo.SetAcceleration"/>) is set smaller or equal to the
    ///   maximum acceleration of the servo. Otherwise the servo will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnVelocityReached: TBrickServoNotifyVelocityReached read velocityReachedCallback write velocityReachedCallback;
  end;

implementation

procedure TBrickServo.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 4;
end;

procedure TBrickServo.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_SERVO_FUNCTION_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_DISABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_IS_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_CURRENT_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_CURRENT_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_OUTPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_OUTPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_PULSE_WIDTH]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_PULSE_WIDTH]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_DEGREE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_DEGREE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_PERIOD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_SERVO_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_OVERALL_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_STACK_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_ENABLE_POSITION_REACHED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_DISABLE_POSITION_REACHED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SERVO_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SERVO_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickServo.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_SERVO_CALLBACK_UNDER_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  aCallBacks[BRICK_SERVO_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  aCallBacks[BRICK_SERVO_CALLBACK_VELOCITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
end;

procedure TBrickServo.Enable(const aServoNum: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  SendRequest(_request);
end;

procedure TBrickServo.Disable(const aServoNum: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  SendRequest(_request);
end;

function TBrickServo.IsEnabled(const aServoNum: byte): boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_ENABLED, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickServo.SetPosition(const aServoNum: byte; const aPosition: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_POSITION, 11);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertInt16To(aPosition, 9, _request);
  SendRequest(_request);
end;

function TBrickServo.GetPosition(const aServoNum: byte): smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_POSITION, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

function TBrickServo.GetCurrentPosition(const aServoNum: byte): smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CURRENT_POSITION, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickServo.SetVelocity(const aServoNum: byte; const velocity: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_VELOCITY, 11);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertUInt16To(velocity, 9, _request);
  SendRequest(_request);
end;

function TBrickServo.GetVelocity(const aServoNum: byte): word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_VELOCITY, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickServo.GetCurrentVelocity(const aServoNum: byte): word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CURRENT_VELOCITY, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickServo.SetAcceleration(const aServoNum: byte; const aAcceleration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_ACCELERATION, 11);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertUInt16To(aAcceleration, 9, _request);
  SendRequest(_request);
end;

function TBrickServo.GetAcceleration(const aServoNum: byte): word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_ACCELERATION, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickServo.SetOutputVoltage(const aVoltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_OUTPUT_VOLTAGE, 10);
  LEConvertUInt16To(aVoltage, 8, _request);
  SendRequest(_request);
end;

function TBrickServo.GetOutputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_OUTPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickServo.SetPulseWidth(const aServoNum: byte; const aMin: word; const aMax: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_PULSE_WIDTH, 13);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertUInt16To(aMin, 9, _request);
  LEConvertUInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickServo.GetPulseWidth(const aServoNum: byte; out aMin: word; out aMax: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PULSE_WIDTH, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  aMin:= LEConvertUInt16From(8, _response);
  aMax:= LEConvertUInt16From(10, _response);
end;

procedure TBrickServo.SetDegree(const aServoNum: byte; const aMin: smallint; const aMax: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_DEGREE, 13);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertInt16To(aMin, 9, _request);
  LEConvertInt16To(aMax, 11, _request);
  SendRequest(_request);
end;

procedure TBrickServo.GetDegree(const aServoNum: byte; out aMin: smallint; out aMax: smallint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_DEGREE, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  aMin:= LEConvertInt16From(8, _response);
  aMax:= LEConvertInt16From(10, _response);
end;

procedure TBrickServo.SetPeriod(const aServoNum: byte; const aPeriod: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_PERIOD, 11);
  LEConvertUInt8To(aServoNum, 8, _request);
  LEConvertUInt16To(aPeriod, 9, _request);
  SendRequest(_request);
end;

function TBrickServo.GetPeriod(const aServoNum: byte): word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PERIOD, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickServo.GetServoCurrent(const aServoNum: byte): word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SERVO_CURRENT, 9);
  LEConvertUInt8To(aServoNum, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickServo.GetOverallCurrent: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_OVERALL_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickServo.GetStackInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickServo.GetExternalInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickServo.SetMinimumVoltage(const voltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, _request);
  SendRequest(_request);
end;

function TBrickServo.GetMinimumVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickServo.EnablePositionReachedCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE_POSITION_REACHED_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickServo.DisablePositionReachedCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE_POSITION_REACHED_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickServo.IsPositionReachedCallbackEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_POSITION_REACHED_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickServo.EnableVelocityReachedCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE_VELOCITY_REACHED_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickServo.DisableVelocityReachedCallback;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE_VELOCITY_REACHED_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickServo.IsVelocityReachedCallbackEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_VELOCITY_REACHED_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickServo.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickServo.GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  aEnableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  aMinimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickServo.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickServo.SetSPITFPBaudrate(const aBrickletPort: char; const baudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(baudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickServo.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickServo.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickServo.EnableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickServo.DisableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickServo.IsStatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickServo.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  name:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickServo.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickServo.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickServo.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SERVO_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickServo.CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray);
var
  _Voltage: word;
begin
  _Voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(underVoltageCallback)) then begin
    underVoltageCallback(self, _Voltage);
  end;
end;

procedure TBrickServo.CallbackWrapperPositionReached(const apacket: TDynamicByteArray);
var
  _servoNum: byte;
  _position: smallint;
begin
  _servoNum:= LEConvertUInt8From(8, apacket);
  _position:= LEConvertInt16From(9, apacket);

  if (Assigned(positionReachedCallback)) then begin
    positionReachedCallback(self, _servoNum, _position);
  end;
end;

procedure TBrickServo.CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray);
var
  _servoNum: byte;
  _velocity: smallint;
begin
  _servoNum:= LEConvertUInt8From(8, aPacket);
  _velocity:= LEConvertInt16From(9, aPacket);

  if (Assigned(velocityReachedCallback)) then begin
    velocityReachedCallback(self, _servoNum, _velocity);
  end;
end;

end.
