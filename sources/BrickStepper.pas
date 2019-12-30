{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickStepper;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickStepper.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickStepper = class;
  TBrickStepperNotifyUnderVoltage = procedure(aSender: TBrickStepper; const aVoltage: word) of object;
  TBrickStepperNotifyPositionReached = procedure(aSender: TBrickStepper; const aPosition: longint) of object;
  TBrickStepperNotifyAllData = procedure(aSender: TBrickStepper; const aCurrentVelocity: word; const aCurrentPosition: longint; const aRemainingSteps: longint; const aStackVoltage: word; const aExternalVoltage: word; const aCurrentConsumption: word) of object;
  TBrickStepperNotifyNewState = procedure(aSender: TBrickStepper; const aStateNew: byte; const aStatePrevious: byte) of object;

  /// <summary>
  ///  Drives one bipolar stepper motor with up to 38V and 2.5A per phase
  /// </summary>
  TBrickStepper = class(TDevice)
  private
    fUnderVoltageCallback: TBrickStepperNotifyUnderVoltage;
    fPositionReachedCallback: TBrickStepperNotifyPositionReached;
    fAllDataCallback: TBrickStepperNotifyAllData;
    fNewStateCallback: TBrickStepperNotifyNewState;
    procedure CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllData(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperNewState(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the maximum velocity of the stepper motor in steps per second.
    ///  This function does *not* start the motor, it merely sets the maximum
    ///  velocity the stepper motor is accelerated to. To get the motor running use
    ///  either <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>, <see cref="BrickStepper.TBrickStepper.SetSteps"/>, <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.DriveBackward"/>.
    /// </summary>
    procedure SetMaxVelocity(const aVelocity: word); virtual;

    /// <summary>
    ///  Returns the velocity as set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/>.
    /// </summary>
    function GetMaxVelocity: word; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the stepper motor in steps per second.
    /// </summary>
    function GetCurrentVelocity: word; virtual;

    /// <summary>
    ///  Sets the acceleration and deacceleration of the stepper motor. The values
    ///  are given in *steps/s²*. An acceleration of 1000 means, that
    ///  every second the velocity is increased by 1000 *steps/s*.
    ///  
    ///  For example: If the current velocity is 0 and you want to accelerate to a
    ///  velocity of 8000 *steps/s* in 10 seconds, you should set an acceleration
    ///  of 800 *steps/s²*.
    ///  
    ///  An acceleration/deacceleration of 0 means instantaneous
    ///  acceleration/deacceleration (not recommended)
    ///  
    ///  The default value is 1000 for both
    /// </summary>
    procedure SetSpeedRamping(const aAcceleration: word; const aDeacceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration and deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    /// </summary>
    procedure GetSpeedRamping(out aAcceleration: word; out aDeacceleration: word); virtual;

    /// <summary>
    ///  Executes an active full brake.
    ///  
    ///  <note type="caution">
    ///   This function is for emergency purposes,
    ///   where an immediate brake is necessary. Depending on the current velocity and
    ///   the strength of the motor, a full brake can be quite violent.
    ///  </note>
    ///  
    ///  Call <see cref="BrickStepper.TBrickStepper.Stop"/> if you just want to stop the motor.
    /// </summary>
    procedure FullBrake; virtual;

    /// <summary>
    ///  Sets the current steps of the internal step counter. This can be used to
    ///  set the current position to 0 when some kind of starting position
    ///  is reached (e.g. when a CNC machine reaches a corner).
    /// </summary>
    procedure SetCurrentPosition(const aPosition: longint); virtual;

    /// <summary>
    ///  Returns the current position of the stepper motor in steps. On startup
    ///  the position is 0. The steps are counted with all possible driving

    ///  functions (<see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>, <see cref="BrickStepper.TBrickStepper.SetSteps"/>, <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.DriveBackward"/>). It also is possible to reset the steps to 0 or
    ///  set them to any other desired value with <see cref="BrickStepper.TBrickStepper.SetCurrentPosition"/>.
    /// </summary>
    function GetCurrentPosition: longint; virtual;

    /// <summary>
    ///  Sets the target position of the stepper motor in steps. For example,
    ///  if the current position of the motor is 500 and <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> is
    ///  called with 1000, the stepper motor will drive 500 steps forward. It will
    ///  use the velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    ///  
    ///  A call of <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> with the parameter *x* is equivalent to
    ///  a call of <see cref="BrickStepper.TBrickStepper.SetSteps"/> with the parameter
    ///  (*x* - <see cref="BrickStepper.TBrickStepper.GetCurrentPosition"/>).
    /// </summary>
    procedure SetTargetPosition(const aPosition: longint); virtual;

    /// <summary>
    ///  Returns the last target position as set by <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/>.
    /// </summary>
    function GetTargetPosition: longint; virtual;

    /// <summary>
    ///  Sets the number of steps the stepper motor should run. Positive values
    ///  will drive the motor forward and negative values backward.
    ///  The velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure SetSteps(const aSteps: longint); virtual;

    /// <summary>
    ///  Returns the last steps as set by <see cref="BrickStepper.TBrickStepper.SetSteps"/>.
    /// </summary>
    function GetSteps: longint; virtual;

    /// <summary>
    ///  Returns the remaining steps of the last call of <see cref="BrickStepper.TBrickStepper.SetSteps"/>.
    ///  For example, if <see cref="BrickStepper.TBrickStepper.SetSteps"/> is called with 2000 and
    ///  <see cref="BrickStepper.TBrickStepper.GetRemainingSteps"/> is called after the motor has run for 500 steps,
    ///  it will return 1500.
    /// </summary>
    function GetRemainingSteps: longint; virtual;

    /// <summary>
    ///  Sets the step mode of the stepper motor. Possible values are:
    ///  
    ///  * Full Step = 1
    ///  * Half Step = 2
    ///  * Quarter Step = 4
    ///  * Eighth Step = 8
    ///  
    ///  A higher value will increase the resolution and
    ///  decrease the torque of the stepper motor.
    ///  
    ///  The default value is 8 (Eighth Step).
    /// </summary>
    procedure SetStepMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the step mode as set by <see cref="BrickStepper.TBrickStepper.SetStepMode"/>.
    /// </summary>
    function GetStepMode: byte; virtual;

    /// <summary>
    ///  Drives the stepper motor forward until <see cref="BrickStepper.TBrickStepper.DriveBackward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.Stop"/> is called. The velocity, acceleration and deacceleration as
    ///  set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure DriveForward; virtual;

    /// <summary>
    ///  Drives the stepper motor backward until <see cref="BrickStepper.TBrickStepper.DriveForward"/> or
    ///  <see cref="BrickStepper.TBrickStepper.Stop"/> is triggered. The velocity, acceleration and deacceleration as
    ///  set by <see cref="BrickStepper.TBrickStepper.SetMaxVelocity"/> and <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/> will be used.
    /// </summary>         position
    procedure DriveBackward; virtual;

    /// <summary>
    ///  Stops the stepper motor with the deacceleration as set by
    ///  <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>.
    /// </summary>
    procedure Stop; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the Stepper Brick.
    ///  
    ///  If there is an external input voltage and a stack input voltage, the motor
    ///  will be driven by the external input voltage. If there is only a stack
    ///  voltage present, the motor will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motor will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the current consumption of the motor in mA.
    /// </summary>
    function GetCurrentConsumption: word; virtual;

    /// <summary>
    ///  Sets the current in mA with which the motor will be driven.
    ///  The minimum value is 100mA, the maximum value 2291mA and the
    ///  default value is 800mA.
    ///  
    ///  <note type="caution">
    ///   Do not set this value above the specifications of your stepper motor.
    ///   Otherwise it may damage your motor.
    ///  </note>
    /// </summary>
    procedure SetMotorCurrent(const aCurrent: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickStepper.TBrickStepper.SetMotorCurrent"/>.
    /// </summary>
    function GetMotorCurrent: word; virtual;

    /// <summary>
    ///  Enables the driver chip. The driver parameters can be configured (maximum velocity,
    ///  acceleration, etc) before it is enabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the driver chip. The configurations are kept (maximum velocity,
    ///  acceleration, etc) but the motor is not driven until it is enabled again.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if the driver chip is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the decay mode of the stepper motor. The possible value range is
    ///  between 0 and 65535. A value of 0 sets the fast decay mode, a value of
    ///  65535 sets the slow decay mode and a value in between sets the mixed
    ///  decay mode.
    ///  
    ///  Changing the decay mode is only possible if synchronous rectification
    ///  is enabled (see <see cref="BrickStepper.TBrickStepper.SetSyncRect"/>).
    ///  
    ///  For a good explanation of the different decay modes see
    ///  `this &lt;https://ebldc.com/?p=86/&gt;`__ blog post by Avayan.
    ///  
    ///  A good decay mode is unfortunately different for every motor. The best
    ///  way to work out a good decay mode for your stepper motor, if you can't
    ///  measure the current with an oscilloscope, is to listen to the sound of
    ///  the motor. If the value is too low, you often hear a high pitched
    ///  sound and if it is too high you can often hear a humming sound.
    ///  
    ///  Generally, fast decay mode (small value) will be noisier but also
    ///  allow higher motor speeds.
    ///  
    ///  The default value is 10000.
    ///  
    ///  <note>
    ///   There is unfortunately no formula to calculate a perfect decay
    ///   mode for a given stepper motor. If you have problems with loud noises
    ///   or the maximum motor speed is too slow, you should try to tinker with
    ///   the decay value
    ///  </note>
    /// </summary>
    procedure SetDecay(const aDecay: word); virtual;

    /// <summary>
    ///  Returns the decay mode as set by <see cref="BrickStepper.TBrickStepper.SetDecay"/>.
    /// </summary>
    function GetDecay: word; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickStepper.TBrickStepper.OnUnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the Stepper Brick is 8V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the stepper motor. If you have a fixed power supply, you likely do
    ///  not need this functionality.
    ///  
    ///  The default value is 8V.
    /// </summary>
    procedure SetMinimumVoltage(const aVoltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickStepper.TBrickStepper.SetMinimumVoltage"/>.
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Turns synchronous rectification on or off (*true* or *false*).
    ///  
    ///  With synchronous rectification on, the decay can be changed
    ///  (see <see cref="BrickStepper.TBrickStepper.SetDecay"/>). Without synchronous rectification fast
    ///  decay is used.
    ///  
    ///  For an explanation of synchronous rectification see
    ///  `here &lt;https://en.wikipedia.org/wiki/Active_rectification&gt;`__.
    ///  
    ///  <note type="caution">
    ///   If you want to use high speeds (&gt; 10000 steps/s) for a large
    ///   stepper motor with a large inductivity we strongly
    ///   suggest that you disable synchronous rectification. Otherwise the
    ///   Brick may not be able to cope with the load and overheat.
    ///  </note>
    ///  
    ///  The default value is *false*.
    /// </summary>
    procedure SetSyncRect(const aSyncRect: boolean); virtual;

    /// <summary>
    ///  Returns *true* if synchronous rectification is enabled, *false* otherwise.
    /// </summary>
    function IsSyncRect: boolean; virtual;

    /// <summary>
    ///  Sets the time base of the velocity and the acceleration of the stepper brick
    ///  (in seconds).
    ///  
    ///  For example, if you want to make one step every 1.5 seconds, you can set
    ///  the time base to 15 and the velocity to 10. Now the velocity is
    ///  10steps/15s = 1steps/1.5s.
    ///  
    ///  The default value is 1.
    /// </summary>
    procedure SetTimeBase(const aTimeBase: longword); virtual;

    /// <summary>
    ///  Returns the time base as set by <see cref="BrickStepper.TBrickStepper.SetTimeBase"/>.
    /// </summary>
    function GetTimeBase: longword; virtual;

    /// <summary>
    ///  Returns the following parameters: The current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    ///  
    ///  There is also a callback for this function, see <see cref="BrickStepper.TBrickStepper.OnAllData"/> callback.
    /// </summary>
    procedure GetAllData(out aCurrentVelocity: word; out aCurrentPosition: longint; out aRemainingSteps: longint; out aStackVoltage: word; out aExternalVoltage: word; out aCurrentConsumption: word); virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickStepper.TBrickStepper.OnAllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickStepper.TBrickStepper.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

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
    ///  <see cref="BrickStepper.TBrickStepper.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickStepper.TBrickStepper.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.3.6$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickStepper.TBrickStepper.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.3.6$nbsp;(Firmware)
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
    ///  .. versionadded:: 2.3.4$nbsp;(Firmware)
    /// </summary>
    function GetSendTimeoutCount(const aCommunicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickStepper.TBrickStepper.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickStepper.TBrickStepper.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    ///  
    ///  .. versionadded:: 2.3.3$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickStepper.TBrickStepper.SetSPITFPBaudrate"/>.
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
    ///  <see cref="BrickStepper.TBrickStepper.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickStepperNotifyUnderVoltage read fUnderVoltageCallback write fUnderVoltageCallback;

    /// <summary>
    ///  This callback is triggered when a position set by <see cref="BrickStepper.TBrickStepper.SetSteps"/> or
    ///  <see cref="BrickStepper.TBrickStepper.SetTargetPosition"/> is reached.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the stepper motor, this only works if the
    ///   acceleration (see <see cref="BrickStepper.TBrickStepper.SetSpeedRamping"/>) is set smaller or equal to the
    ///   maximum acceleration of the motor. Otherwise the motor will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnPositionReached: TBrickStepperNotifyPositionReached read fPositionReachedCallback write fPositionReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickStepper.TBrickStepper.SetAllDataPeriod"/>. The parameters are: the current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    /// </summary>
    property OnAllData: TBrickStepperNotifyAllData read fAllDataCallback write fAllDataCallback;

    /// <summary>
    ///  This callback is triggered whenever the Stepper Brick enters a new state.
    ///  It returns the new state as well as the previous state.
    /// </summary>
    property OnNewState: TBrickStepperNotifyNewState read fNewStateCallback write fNewStateCallback;
  end;

implementation

procedure TBrickStepper.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 4;
end;

procedure TBrickStepper.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_MAX_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_MAX_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_SPEED_RAMPING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_SPEED_RAMPING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_FULL_BRAKE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_CURRENT_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_TARGET_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_TARGET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_STEPS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_STEPS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_REMAINING_STEPS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_STEP_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_STEP_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_DRIVE_FORWARD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_DRIVE_BACKWARD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_STOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_CURRENT_CONSUMPTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_MOTOR_CURRENT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_MOTOR_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_DISABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_IS_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_DECAY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_DECAY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_SYNC_RECT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_IS_SYNC_RECT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_TIME_BASE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_TIME_BASE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_ALL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_STEPPER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickStepper.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_STEPPER_CALLBACK_UNDER_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  aCallBacks[BRICK_STEPPER_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  aCallBacks[BRICK_STEPPER_CALLBACK_ALL_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperAllData;
  aCallBacks[BRICK_STEPPER_CALLBACK_NEW_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperNewState;
end;

procedure TBrickStepper.SetMaxVelocity(const aVelocity: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MAX_VELOCITY, 10);
  LEConvertUInt16To(aVelocity, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetMaxVelocity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MAX_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickStepper.GetCurrentVelocity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickStepper.SetSpeedRamping(const aAcceleration: word; const aDeacceleration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SPEED_RAMPING, 12);
  LEConvertUInt16To(aAcceleration, 8, _request);
  LEConvertUInt16To(aDeacceleration, 10, _request);
  SendRequest(_request);
end;

procedure TBrickStepper.GetSpeedRamping(out aAcceleration: word; out aDeacceleration: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SPEED_RAMPING, 8);
  _response:= SendRequest(_request);
  aAcceleration:= LEConvertUInt16From(8, _response);
  aDeacceleration:= LEConvertUInt16From(10, _response);
end;

procedure TBrickStepper.FullBrake;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_FULL_BRAKE, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.SetCurrentPosition(const aPosition: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_CURRENT_POSITION, 12);
  LEConvertInt32To(aPosition, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetCurrentPosition: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickStepper.SetTargetPosition(const aPosition: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_TARGET_POSITION, 12);
  LEConvertInt32To(aPosition, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetTargetPosition: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_TARGET_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickStepper.SetSteps(const aSteps: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_STEPS, 12);
  LEConvertInt32To(aSteps, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetSteps: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STEPS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickStepper.GetRemainingSteps: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_REMAINING_STEPS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickStepper.SetStepMode(const aMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_STEP_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetStepMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STEP_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickStepper.DriveForward;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DRIVE_FORWARD, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.DriveBackward;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DRIVE_BACKWARD, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.Stop;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_STOP, 8);
  SendRequest(_request);
end;

function TBrickStepper.GetStackInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickStepper.GetExternalInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickStepper.GetCurrentConsumption: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CURRENT_CONSUMPTION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickStepper.SetMotorCurrent(const aCurrent: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MOTOR_CURRENT, 10);
  LEConvertUInt16To(aCurrent, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetMotorCurrent: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MOTOR_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickStepper.Enable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_ENABLE, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.Disable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DISABLE, 8);
  SendRequest(_request);
end;

function TBrickStepper.IsEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_IS_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickStepper.SetDecay(const aDecay: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_DECAY, 10);
  LEConvertUInt16To(aDecay, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetDecay: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_DECAY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickStepper.SetMinimumVoltage(const aVoltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(aVoltage, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetMinimumVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickStepper.SetSyncRect(const aSyncRect: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SYNC_RECT, 9);
  LEConvertBooleanTo(aSyncRect, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.IsSyncRect: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_IS_SYNC_RECT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickStepper.SetTimeBase(const aTimeBase: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_TIME_BASE, 12);
  LEConvertUInt32To(aTimeBase, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetTimeBase: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_TIME_BASE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickStepper.GetAllData(out aCurrentVelocity: word; out aCurrentPosition: longint; out aRemainingSteps: longint; out aStackVoltage: word; out aExternalVoltage: word; out aCurrentConsumption: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_ALL_DATA, 8);
  _response:= SendRequest(_request);
  aCurrentVelocity:= LEConvertUInt16From(8, _response);
  aCurrentPosition:= LEConvertInt32From(10, _response);
  aRemainingSteps:= LEConvertInt32From(14, _response);
  aStackVoltage:= LEConvertUInt16From(18, _response);
  aExternalVoltage:= LEConvertUInt16From(20, _response);
  aCurrentConsumption:= LEConvertUInt16From(22, _response);
end;

procedure TBrickStepper.SetAllDataPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetAllDataPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickStepper.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickStepper.GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  aEnableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  aMinimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickStepper.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickStepper.SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(aBaudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickStepper.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickStepper.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickStepper.EnableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.DisableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickStepper.IsStatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickStepper.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  name:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickStepper.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickStepper.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickStepper.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_STEPPER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickStepper.CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray);
var
  _Voltage: word;
begin
  _Voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fUnderVoltageCallback)) then begin
    fUnderVoltageCallback(self, _Voltage);
  end;
end;

procedure TBrickStepper.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var
  _Position: longint;
begin
  _Position:= LEConvertInt32From(8, aPacket);

  if (Assigned(fPositionReachedCallback)) then begin
    fPositionReachedCallback(self, _Position);
  end;
end;

procedure TBrickStepper.CallbackWrapperAllData(const aPacket: TDynamicByteArray);
var
  _CurrentVelocity: word;
  _CurrentPosition: longint;
  _RemainingSteps: longint;
  _StackVoltage: word;
  _ExternalVoltage: word;
  _CurrentConsumption: word;
begin
  _CurrentVelocity:= LEConvertUInt16From(8, aPacket);
  _CurrentPosition:= LEConvertInt32From(10, aPacket);
  _RemainingSteps:= LEConvertInt32From(14, aPacket);
  _StackVoltage:= LEConvertUInt16From(18, aPacket);
  _ExternalVoltage:= LEConvertUInt16From(20, aPacket);
  _CurrentConsumption:= LEConvertUInt16From(22, aPacket);
  if (Assigned(fAllDataCallback)) then begin
    fAllDataCallback(self, _CurrentVelocity, _CurrentPosition, _RemainingSteps, _StackVoltage, _ExternalVoltage, _CurrentConsumption);
  end;
end;

procedure TBrickStepper.CallbackWrapperNewState(const aPacket: TDynamicByteArray);
var
  _StateNew: byte;
  _StatePrevious: byte;
begin
  _StateNew:= LEConvertUInt8From(8, aPacket);
  _StatePrevious:= LEConvertUInt8From(9, aPacket);
  if (Assigned(fNewStateCallback)) then begin
    fNewStateCallback(self, _StateNew, _StatePrevious);
  end;
end;

end.
