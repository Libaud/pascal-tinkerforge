{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickSilentStepper;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickSelientStepper.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickSilentStepper = class;
  TBrickSilentStepperNotifyUnderVoltage = procedure(aSender: TBrickSilentStepper; const aVoltage: word) of object;
  TBrickSilentStepperNotifyPositionReached = procedure(aSender: TBrickSilentStepper; const aPosition: longint) of object;
  TBrickSilentStepperNotifyAllData = procedure(aSender: TBrickSilentStepper; const aCurrentVelocity: word; const aCurrentPosition: longint;
                                               const aRemainingSteps: longint; const aStackVoltage: word; const aExternalVoltage: word;
                                               const acurrentConsumption: word) of object;
  TBrickSilentStepperNotifyNewState = procedure(aSender: TBrickSilentStepper; const aStateNew: byte; const aStatePrevious: byte) of object;

  /// <summary>
  ///  Silently drives one bipolar stepper motor with up to 46V and 1.6A per phase
  /// </summary>
  TBrickSilentStepper = class(TDevice)
  private
    underVoltageCallback: TBrickSilentStepperNotifyUnderVoltage;
    positionReachedCallback: TBrickSilentStepperNotifyPositionReached;
    allDataCallback: TBrickSilentStepperNotifyAllData;
    newStateCallback: TBrickSilentStepperNotifyNewState;
  protected
    procedure CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperPositionReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAllData(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperNewState(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the maximum velocity of the stepper motor in steps per second.
    ///  This function does *not* start the motor, it merely sets the maximum
    ///  velocity the stepper motor is accelerated to. To get the motor running use
    ///  either <see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/>, <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/>, <see cref="BrickSilentStepper.TBrickSilentStepper.DriveForward"/> or
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.DriveBackward"/>.
    /// </summary>
    procedure SetMaxVelocity(const aVelocity: word); virtual;

    /// <summary>
    ///  Returns the velocity as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMaxVelocity"/>.
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
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/>.
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
    ///  Call <see cref="BrickSilentStepper.TBrickSilentStepper.Stop"/> if you just want to stop the motor.
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
    ///  functions (<see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/>, <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/>, <see cref="BrickSilentStepper.TBrickSilentStepper.DriveForward"/> or
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.DriveBackward"/>). It also is possible to reset the steps to 0 or
    ///  set them to any other desired value with <see cref="BrickSilentStepper.TBrickSilentStepper.SetCurrentPosition"/>.
    /// </summary>
    function GetCurrentPosition: longint; virtual;

    /// <summary>
    ///  Sets the target position of the stepper motor in steps. For example,
    ///  if the current position of the motor is 500 and <see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/> is
    ///  called with 1000, the stepper motor will drive 500 steps forward. It will
    ///  use the velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetMaxVelocity"/> and <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/>.
    ///  
    ///  A call of <see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/> with the parameter *x* is equivalent to
    ///  a call of <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/> with the parameter
    ///  (*x* - <see cref="BrickSilentStepper.TBrickSilentStepper.GetCurrentPosition"/>).
    /// </summary>
    procedure SetTargetPosition(const aPosition: longint); virtual;

    /// <summary>
    ///  Returns the last target position as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/>.
    /// </summary>
    function GetTargetPosition: longint; virtual;

    /// <summary>
    ///  Sets the number of steps the stepper motor should run. Positive values
    ///  will drive the motor forward and negative values backward.
    ///  The velocity, acceleration and deacceleration as set by
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetMaxVelocity"/> and <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure SetSteps(const aSteps: longint); virtual;

    /// <summary>
    ///  Returns the last steps as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/>.
    /// </summary>
    function GetSteps: longint; virtual;

    /// <summary>
    ///  Returns the remaining steps of the last call of <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/>.
    ///  For example, if <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/> is called with 2000 and
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.GetRemainingSteps"/> is called after the motor has run for 500 steps,
    ///  it will return 1500.
    /// </summary>
    function GetRemainingSteps: longint; virtual;

    /// <summary>
    ///  Sets the step resolution from full-step up to 1/256-step.
    ///  
    ///  If interpolation is turned on, the Silent Stepper Brick will always interpolate
    ///  your step inputs as 1/256-step. If you use full-step mode with interpolation, each
    ///  step will generate 256 1/256 steps.
    ///  
    ///  For maximum torque use full-step without interpolation. For maximum resolution use
    ///  1/256-step. Turn interpolation on to make the Stepper driving less noisy.
    ///  
    ///  If you often change the speed with high acceleration you should turn the
    ///  interpolation off.
    ///  
    ///  The default is 1/256-step with interpolation on.
    /// </summary>
    procedure SetStepConfiguration(const aStepResolution: byte; const aInterpolation: boolean); virtual;

    /// <summary>
    ///  Returns the step mode as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetStepConfiguration"/>.
    /// </summary>
    procedure GetStepConfiguration(out aStepResolution: byte; out aInterpolation: boolean); virtual;

    /// <summary>
    ///  Drives the stepper motor forward until <see cref="BrickSilentStepper.TBrickSilentStepper.DriveBackward"/> or
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.Stop"/> is called. The velocity, acceleration and deacceleration as
    ///  set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMaxVelocity"/> and <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure DriveForward; virtual;

    /// <summary>
    ///  Drives the stepper motor backward until <see cref="BrickSilentStepper.TBrickSilentStepper.DriveForward"/> or
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.Stop"/> is triggered. The velocity, acceleration and deacceleration as
    ///  set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMaxVelocity"/> and <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/> will be used.
    /// </summary>
    procedure DriveBackward; virtual;

    /// <summary>
    ///  Stops the stepper motor with the deacceleration as set by
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/>.
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
    ///  given via the black power input connector on the Silent Stepper Brick.
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
    ///  Sets the current in mA with which the motor will be driven.
    ///  The minimum value is 360mA, the maximum value 1640mA and the
    ///  default value is 800mA.
    ///  
    ///  <note type="caution">
    ///   Do not set this value above the specifications of your stepper motor.
    ///   Otherwise it may damage your motor.
    ///  </note>
    /// </summary>
    procedure SetMotorCurrent(const aCurrent: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMotorCurrent"/>.
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
    ///  Sets the basic configuration parameters for the different modes (Stealth, Coolstep, Classic).
    ///  
    ///  * Standstill Current: This value can be used to lower the current during stand still. This might
    ///    be reasonable to reduce the heating of the motor and the Brick. When the motor is in standstill
    ///    the configured motor phase current will be driven until the configured
    ///    Power Down Time is elapsed. After that the phase current will be reduced to the standstill
    ///    current. The elapsed time for this reduction can be configured with the Standstill Delay Time.
    ///    The unit is in mA and the maximum allowed value is the configured maximum motor current
    ///    (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetMotorCurrent"/>).
    ///  
    ///  * Motor Run Current: The value sets the motor current when the motor is running.
    ///    Use a value of at least one half of the global maximum motor current for a good
    ///    microstep performance. The unit is in mA and the maximum allowed value is the current
    ///    motor current. The API maps the entered value to 1/32 ... 32/32 of the maximum
    ///    motor current. This value should be used to change the motor current during motor movement,
    ///    whereas the global maximum motor current should not be changed while the motor is moving
    ///    (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetMotorCurrent"/>).
    ///  
    ///  * Standstill Delay Time: Controls the duration for motor power down after a motion
    ///    as soon as standstill is detected and the Power Down Time is expired. A high Standstill Delay
    ///    Time results in a smooth transition that avoids motor jerk during power down.
    ///    The value range is 0 to 307ms
    ///  
    ///  * Power Down Time: Sets the delay time after a stand still.
    ///    The value range is 0 to 5222ms.
    ///  
    ///  * Stealth Threshold: Sets the upper threshold for Stealth mode in steps/s. The value range is
    ///    0-65536 steps/s. If the velocity of the motor goes above this value, Stealth mode is turned
    ///    off. Otherwise it is turned on. In Stealth mode the torque declines with high speed.
    ///  
    ///  * Coolstep Threshold: Sets the lower threshold for Coolstep mode in steps/s. The value range is
    ///    0-65536 steps/s. The Coolstep Threshold needs to be above the Stealth Threshold.
    ///  
    ///  * Classic Threshold: Sets the lower threshold for classic mode. The value range is
    ///    0-65536 steps/s. In classic mode the stepper becomes more noisy, but the torque is maximized.
    ///  
    ///  * High Velocity Shopper Mode: If High Velocity Shopper Mode is enabled, the stepper control
    ///    is optimized to run the stepper motors at high velocities.
    ///  
    ///  If you want to use all three thresholds make sure that
    ///  Stealth Threshold &lt; Coolstep Threshold &lt; Classic Threshold.
    ///  
    ///  The default values are:
    ///  
    ///  * Standstill Current: 200
    ///  * Motor Run Current: 800
    ///  * Standstill Delay Time: 0
    ///  * Power Down Time: 1000
    ///  * Stealth Threshold: 500
    ///  * Coolstep Threshold: 500
    ///  * Classic Threshold: 1000
    ///  * High Velocity Shopper Mode: false
    /// </summary>
    procedure SetBasicConfiguration(const aStandstillCurrent: word; const aMotorRunCurrent: word; const aStandstillDelayTime: word;
                                    const aPowerDownTime: word; const aStealthThreshold: word; const aCoolstepThreshold: word;
                                    const aClassicThreshold: word; const aHighVelocityChopperMode: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>.
    /// </summary>
    procedure GetBasicConfiguration(out aStandstillCurrent: word; out aMotorRunCurrent: word; out aStandstillDelayTime: word;
                                    out aPowerDownTime: word; out aStealthThreshold: word; out aCoolstepThreshold: word;
                                    out aClassicThreshold: word; out aHighVelocityChopperMode: boolean); virtual;

    /// <summary>
    ///  Note: If you don't know what any of this means you can very likely keep all of
    ///  the values as default!
    ///  
    ///  Sets the Spreadcycle configuration parameters. Spreadcycle is a chopper algorithm which actively
    ///  controls the motor current flow. More information can be found in the TMC2130 datasheet on page
    ///  47 (7 spreadCycle and Classic Chopper).
    ///  
    ///  * Slow Decay Duration: Controls duration of off time setting of slow decay phase. The value
    ///    range is 0-15. 0 = driver disabled, all bridges off. Use 1 only with Comparator Blank time &gt;= 2.
    ///  
    ///  * Enable Random Slow Decay: Set to false to fix chopper off time as set by Slow Decay Duration.
    ///    If you set it to true, Decay Duration is randomly modulated.
    ///  
    ///  * Fast Decay Duration: Sets the fast decay duration. The value range is 0-15. This parameters is
    ///    only used if the Chopper Mode is set to Fast Decay.
    ///  
    ///  * Hysteresis Start Value: Sets the hysteresis start value. The value range is 0-7. This parameter is
    ///    only used if the Chopper Mode is set to Spread Cycle.
    ///  
    ///  * Hysteresis End Value: Sets the hysteresis end value. The value range is -3 to 12. This parameter is
    ///    only used if the Chopper Mode is set to Spread Cycle.
    ///  
    ///  * Sine Wave Offset: Sets the sine wave offset. The value range is -3 to 12. This parameters is
    ///    only used if the Chopper Mode is set to Fast Decay. 1/512 of the value becomes added to the absolute
    ///    value of the sine wave.
    ///  
    ///  * Chopper Mode: 0 = Spread Cycle, 1 = Fast Decay.
    ///  
    ///  * Comparator Blank Time: Sets the blank time of the comparator. Available values are
    ///  
    ///    * 0 = 16 clocks,
    ///    * 1 = 24 clocks,
    ///    * 2 = 36 clocks and
    ///    * 3 = 54 clocks.
    ///  
    ///    A value of 1 or 2 is recommended for most applications.
    ///  
    ///  * Fast Decay Without Comparator: If set to true the current comparator usage for termination of the
    ///    fast decay cycle is disabled.
    ///  
    ///  The default values are:
    ///  
    ///  * Slow Decay Duration: 4
    ///  * Enable Random Slow Decay: 0
    ///  * Fast Decay Duration: 0
    ///  * Hysteresis Start Value: 0
    ///  * Hysteresis End Value: 0
    ///  * Sine Wave Offset: 0
    ///  * Chopper Mode: 0
    ///  * Comparator Blank Time: 1
    ///  * Fast Decay Without Comparator: false
    /// </summary>
    procedure SetSpreadcycleConfiguration(const slowDecayDuration: byte; const enableRandomSlowDecay: boolean; const fastDecayDuration: byte;
                                          const hysteresisStartValue: byte; const hysteresisEndValue: shortint; const sineWaveOffset: shortint;
                                          const chopperMode: byte; const comparatorBlankTime: byte; const fastDecayWithoutComparator: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>.
    /// </summary>
    procedure GetSpreadcycleConfiguration(out slowDecayDuration: byte; out enableRandomSlowDecay: boolean; out fastDecayDuration: byte;
                                          out hysteresisStartValue: byte; out hysteresisEndValue: shortint; out sineWaveOffset: shortint;
                                          out chopperMode: byte; out comparatorBlankTime: byte; out fastDecayWithoutComparator: boolean); virtual;

    /// <summary>
    ///  Note: If you don't know what any of this means you can very likely keep all of
    ///  the values as default!
    ///  
    ///  Sets the configuration relevant for Stealth mode.
    ///  
    ///  * Enable Stealth: If set to true the stealth mode is enabled, if set to false the
    ///    stealth mode is disabled, even if the speed is below the threshold set in <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>.
    ///  
    ///  * Amplitude: If autoscale is disabled, the PWM amplitude is scaled by this value. If autoscale is enabled,
    ///    this value defines the maximum PWM amplitude change per half wave. The value range is 0-255.
    ///  
    ///  * Gradient: If autoscale is disabled, the PWM gradient is scaled by this value. If autoscale is enabled,
    ///    this value defines the maximum PWM gradient. With autoscale a value above 64 is recommended,
    ///    otherwise the regulation might not be able to measure the current. The value range is 0-255.
    ///  
    ///  * Enable Autoscale: If set to true, automatic current control is used. Otherwise the user defined
    ///    amplitude and gradient are used.
    ///  
    ///  * Force Symmetric: If true, A symmetric PWM cycle is enforced. Otherwise the PWM value may change within each
    ///    PWM cycle.
    ///  
    ///  * Freewheel Mode: The freewheel mode defines the behavior in stand still if the Standstill Current
    ///    (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>) is set to 0.
    ///  
    ///  The default values are:
    ///  
    ///  * Enable Stealth: true
    ///  * Amplitude: 128
    ///  * Gradient: 4
    ///  * Enable Autoscale: true
    ///  * Force Symmetric: false
    ///  * Freewheel Mode: 0 (Normal)
    /// </summary>
    procedure SetStealthConfiguration(const enableStealth: boolean; const amplitude: byte; const gradient: byte; const enableAutoscale: boolean; const forceSymmetric: boolean; const freewheelMode: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetStealthConfiguration"/>.
    /// </summary>
    procedure GetStealthConfiguration(out enableStealth: boolean; out amplitude: byte; out gradient: byte; out enableAutoscale: boolean; out forceSymmetric: boolean; out freewheelMode: byte); virtual;

    /// <summary>
    ///  Note: If you don't know what any of this means you can very likely keep all of
    ///  the values as default!
    ///  
    ///  Sets the configuration relevant for Coolstep.
    ///  
    ///  * Minimum Stallguard Value: If the Stallguard Result falls below this value*32, the motor current
    ///    is increased to reduce motor load angle. The value range is 0-15. A value of 0 turns Coolstep off.
    ///  
    ///  * Maximum Stallguard Value: If the Stallguard Result goes above
    ///    (Min Stallguard Value + Max Stallguard Value + 1) * 32, the motor current is decreased to save
    ///    energy.
    ///  
    ///  * Current Up Step Width: Sets the up step increment per Stallguard value. The value range is 0-3,
    ///    corresponding to the increments 1, 2, 4 and 8.
    ///  
    ///  * Current Down Step Width: Sets the down step decrement per Stallguard value. The value range is 0-3,
    ///    corresponding to the decrements 1, 2, 8 and 16.
    ///  
    ///  * Minimum Current: Sets the minimum current for Coolstep current control. You can choose between
    ///    half and quarter of the run current.
    ///  
    ///  * Stallguard Threshold Value: Sets the level for stall output (see <see cref="BrickSilentStepper.TBrickSilentStepper.GetDriverStatus"/>). The value
    ///    range is -64 to +63. A lower value gives a higher sensitivity. You have to find a suitable value for your
    ///    motor by trial and error, 0 works for most motors.
    ///  
    ///  * Stallguard Mode: Set to 0 for standard resolution or 1 for filtered mode. In filtered mode the Stallguard
    ///    signal will be updated every four full-steps.
    ///  
    ///  The default values are:
    ///  
    ///  * Minimum Stallguard Value: 2
    ///  * Maximum Stallguard Value: 10
    ///  * Current Up Step Width: 0
    ///  * Current Down Step Width: 0
    ///  * Minimum Current: 0
    ///  * Stallguard Threshold Value: 0
    ///  * Stallguard Mode: 0
    /// </summary>
    procedure SetCoolstepConfiguration(const minimumStallguardValue: byte; const maximumStallguardValue: byte; const currentUpStepWidth: byte; const currentDownStepWidth: byte; const minimumCurrent: byte; const stallguardThresholdValue: shortint; const stallguardMode: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetCoolstepConfiguration"/>.
    /// </summary>
    procedure GetCoolstepConfiguration(out minimumStallguardValue: byte; out maximumStallguardValue: byte; out currentUpStepWidth: byte; out currentDownStepWidth: byte; out minimumCurrent: byte; out stallguardThresholdValue: shortint; out stallguardMode: byte); virtual;

    /// <summary>
    ///  Note: If you don't know what any of this means you can very likely keep all of
    ///  the values as default!
    ///  
    ///  Sets miscellaneous configuration parameters.
    ///  
    ///  * Disable Short To Ground Protection: Set to false to enable short to ground protection, otherwise
    ///    it is disabled.
    ///  
    ///  * Synchronize Phase Frequency: With this parameter you can synchronize the chopper for both phases
    ///    of a two phase motor to avoid the occurrence of a beat. The value range is 0-15. If set to 0,
    ///    the synchronization is turned off. Otherwise the synchronization is done through the formula
    ///    f_sync = f_clk/(value*64). In Classic Mode the synchronization is automatically switched off.
    ///    f_clk is 12.8MHz.
    ///  
    ///  The default values are:
    ///  
    ///  * Disable Short To Ground Protection: 0
    ///  * Synchronize Phase Frequency: 0
    /// </summary>
    procedure SetMiscConfiguration(const disableShortToGroundProtection: boolean; const synchronizePhaseFrequency: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMiscConfiguration"/>.
    /// </summary>
    procedure GetMiscConfiguration(out disableShortToGroundProtection: boolean; out synchronizePhaseFrequency: byte); virtual;

    /// <summary>
    ///  Returns the current driver status.
    ///  
    ///  * Open Load: Indicates if an open load is present on phase A, B or both. This could mean that there is a problem
    ///    with the wiring of the motor. False detection can occur in fast motion as well as during stand still.
    ///  
    ///  * Short To Ground: Indicates if a short to ground is present on phase A, B or both. If this is detected the driver
    ///    automatically becomes disabled and stays disabled until it is enabled again manually.
    ///  
    ///  * Over Temperature: The over temperature indicator switches to "Warning" if the driver IC warms up. The warning flag
    ///    is expected during long duration stepper uses. If the temperature limit is reached the indicator switches
    ///    to "Limit". In this case the driver becomes disabled until it cools down again.
    ///  
    ///  * Motor Stalled: Is true if a motor stall was detected.
    ///  
    ///  * Actual Motor Current: Indicates the actual current control scaling as used in Coolstep mode.
    ///    The returned value is between 0 and 31. It represents a multiplier of 1/32 to 32/32 of the
    ///    ``Motor Run Current`` as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>. Example: If a ``Motor Run Current``
    ///    of 1000mA was set and the returned value is 15, the ``Actual Motor Current`` is 16/32*1000mA = 500mA.
    ///  
    ///  * Stallguard Result: Indicates the load of the motor. A lower value signals a higher load. Per trial and error
    ///    you can find out which value corresponds to a suitable torque for the velocity used in your application.
    ///    After that you can use this threshold value to find out if a motor stall becomes probable and react on it (e.g.
    ///    decrease velocity).
    ///    During stand still this value can not be used for stall detection, it shows the chopper on-time for motor coil A.
    ///  
    ///  * Stealth Voltage Amplitude: Shows the actual PWM scaling. In Stealth mode it can be used to detect motor load and
    ///    stall if autoscale is enabled (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetStealthConfiguration"/>).
    /// </summary>
    procedure GetDriverStatus(out openLoad: byte; out shortToGround: byte; out overTemperature: byte; out motorStalled: boolean; out actualMotorCurrent: byte; out fullStepActive: boolean; out stallguardResult: byte; out stealthVoltageAmplitude: byte); virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickSilentStepper.TBrickSilentStepper.OnUnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the Silent Stepper
    ///  Brick is 8V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the stepper motor. If you have a fixed power supply, you likely do
    ///  not need this functionality.
    ///  
    ///  The default value is 8V.
    /// </summary>
    procedure SetMinimumVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetMinimumVoltage"/>.
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Sets the time base of the velocity and the acceleration of the Silent Stepper
    ///  Brick (in seconds).
    ///  
    ///  For example, if you want to make one step every 1.5 seconds, you can set
    ///  the time base to 15 and the velocity to 10. Now the velocity is
    ///  10steps/15s = 1steps/1.5s.
    ///  
    ///  The default value is 1.
    /// </summary>
    procedure SetTimeBase(const timeBase: longword); virtual;

    /// <summary>
    ///  Returns the time base as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetTimeBase"/>.
    /// </summary>
    function GetTimeBase: longword; virtual;

    /// <summary>
    ///  Returns the following parameters: The current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    ///  
    ///  The current consumption is calculated by multiplying the ``Actual Motor Current``
    ///  value (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetBasicConfiguration"/>) with the ``Motor Run Current``
    ///  (see <see cref="BrickSilentStepper.TBrickSilentStepper.GetDriverStatus"/>). This is an internal calculation of the
    ///  driver, not an independent external measurement.
    ///  
    ///  The current consumption calculation was broken up to firmware 2.0.1, it is fixed
    ///  since firmware 2.0.2.
    ///  
    ///  There is also a callback for this function, see <see cref="BrickSilentStepper.TBrickSilentStepper.OnAllData"/> callback.
    /// </summary>
    procedure GetAllData(out currentVelocity: word; out currentPosition: longint; out remainingSteps: longint; out stackVoltage: word; out externalVoltage: word; out currentConsumption: word); virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickSilentStepper.TBrickSilentStepper.OnAllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetAllDataPeriod"/>.
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
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.0.4$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const enableDynamicBaudrate: boolean; const minimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickSilentStepper.TBrickSilentStepper.SetSPITFPBaudrateConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.4$nbsp;(Firmware)
    /// </summary>
    procedure GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the timeout count for the different communication methods.
    ///  
    ///  The methods 0-2 are available for all Bricks, 3-7 only for Master Bricks.
    ///  
    ///  This function is mostly used for debugging during development, in normal operation
    ///  the counters should nearly always stay at 0.
    /// </summary>
    function GetSendTimeoutCount(const communicationMethod: byte): longword; virtual;

    /// <summary>
    ///  Sets the baudrate for a specific Bricklet port ('a' - 'd'). The
    ///  baudrate can be in the range 400000 to 2000000.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickSilentStepper.TBrickSilentStepper.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    ///  
    ///  The default baudrate for all ports is 1400000.
    /// </summary>
    procedure SetSPITFPBaudrate(const brickletPort: char; const baudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickSilentStepper.TBrickSilentStepper.SetSPITFPBaudrate"/>.
    /// </summary>
    function GetSPITFPBaudrate(const brickletPort: char): longword; virtual;

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
    /// </summary>
    procedure GetSPITFPErrorCount(const brickletPort: char; out errorCountACKChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

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
    procedure GetProtocol1BrickletName(const aPort: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out aName: string); virtual;

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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered when the input voltage drops below the value set by
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetMinimumVoltage"/>. The parameter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickSilentStepperNotifyUnderVoltage read underVoltageCallback write underVoltageCallback;

    /// <summary>
    ///  This callback is triggered when a position set by <see cref="BrickSilentStepper.TBrickSilentStepper.SetSteps"/> or
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetTargetPosition"/> is reached.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the stepper motor, this only works if the
    ///   acceleration (see <see cref="BrickSilentStepper.TBrickSilentStepper.SetSpeedRamping"/>) is set smaller or equal to the
    ///   maximum acceleration of the motor. Otherwise the motor will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnPositionReached: TBrickSilentStepperNotifyPositionReached read positionReachedCallback write positionReachedCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickSilentStepper.TBrickSilentStepper.SetAllDataPeriod"/>. The parameters are: the current velocity,
    ///  the current position, the remaining steps, the stack voltage, the external
    ///  voltage and the current consumption of the stepper motor.
    /// </summary>
    property OnAllData: TBrickSilentStepperNotifyAllData read allDataCallback write allDataCallback;

    /// <summary>
    ///  This callback is triggered whenever the Silent Stepper Brick enters a new state.
    ///  It returns the new state as well as the previous state.
    /// </summary>
    property OnNewState: TBrickSilentStepperNotifyNewState read newStateCallback write newStateCallback;
  end;

implementation

procedure TBrickSilentStepper.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickSilentStepper.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_MAX_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_MAX_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_CURRENT_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_SPEED_RAMPING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SPEED_RAMPING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_FULL_BRAKE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_CURRENT_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_CURRENT_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_TARGET_POSITION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_TARGET_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_STEPS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_STEPS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_REMAINING_STEPS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_STEP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_STEP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_DRIVE_FORWARD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_DRIVE_BACKWARD]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_STOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_MOTOR_CURRENT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_MOTOR_CURRENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_DISABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_IS_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_BASIC_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_BASIC_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_SPREADCYCLE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SPREADCYCLE_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_STEALTH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_STEALTH_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_COOLSTEP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_COOLSTEP_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_MISC_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_MISC_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_DRIVER_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_TIME_BASE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_TIME_BASE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_ALL_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_SILENT_STEPPER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickSilentStepper.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_SILENT_STEPPER_CALLBACK_UNDER_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  aCallBacks[BRICK_SILENT_STEPPER_CALLBACK_POSITION_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperPositionReached;
  aCallBacks[BRICK_SILENT_STEPPER_CALLBACK_ALL_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperAllData;
  aCallBacks[BRICK_SILENT_STEPPER_CALLBACK_NEW_STATE]:= {$ifdef FPC}@{$endif}CallbackWrapperNewState;
end;

procedure TBrickSilentStepper.SetMaxVelocity(const aVelocity: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_MAX_VELOCITY, 10);
  LEConvertUInt16To(aVelocity, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetMaxVelocity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_MAX_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickSilentStepper.GetCurrentVelocity: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_CURRENT_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickSilentStepper.SetSpeedRamping(const aAcceleration: word; const aDeacceleration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_SPEED_RAMPING, 12);
  LEConvertUInt16To(aAcceleration, 8, _request);
  LEConvertUInt16To(aDeacceleration, 10, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetSpeedRamping(out aAcceleration: word; out aDeacceleration: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SPEED_RAMPING, 8);
  _response:= SendRequest(_request);
  aAcceleration:= LEConvertUInt16From(8, _response);
  aDeacceleration:= LEConvertUInt16From(10, _response);
end;

procedure TBrickSilentStepper.FullBrake;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_FULL_BRAKE, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.SetCurrentPosition(const aPosition: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_CURRENT_POSITION, 12);
  LEConvertInt32To(aPosition, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetCurrentPosition: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_CURRENT_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickSilentStepper.SetTargetPosition(const aPosition: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_TARGET_POSITION, 12);
  LEConvertInt32To(aPosition, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetTargetPosition: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_TARGET_POSITION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickSilentStepper.SetSteps(const aSteps: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_STEPS, 12);
  LEConvertInt32To(aSteps, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetSteps: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_STEPS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

function TBrickSilentStepper.GetRemainingSteps: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_REMAINING_STEPS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickSilentStepper.SetStepConfiguration(const aStepResolution: byte; const aInterpolation: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_STEP_CONFIGURATION, 10);
  LEConvertUInt8To(aStepResolution, 8, _request);
  LEConvertBooleanTo(aInterpolation, 9, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetStepConfiguration(out aStepResolution: byte; out aInterpolation: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_STEP_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aStepResolution:= LEConvertUInt8From(8, _response);
  aInterpolation:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickSilentStepper.DriveForward;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_DRIVE_FORWARD, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.DriveBackward;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_DRIVE_BACKWARD, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.Stop;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_STOP, 8);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetStackInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickSilentStepper.GetExternalInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickSilentStepper.SetMotorCurrent(const aCurrent: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_MOTOR_CURRENT, 10);
  LEConvertUInt16To(aCurrent, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetMotorCurrent: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_MOTOR_CURRENT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickSilentStepper.Enable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_ENABLE, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.Disable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_DISABLE, 8);
  SendRequest(_request);
end;

function TBrickSilentStepper.IsEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_IS_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickSilentStepper.SetBasicConfiguration(const aStandstillCurrent: word; const aMotorRunCurrent: word; const aStandstillDelayTime: word; const aPowerDownTime: word;
                                                    const aStealthThreshold: word; const aCoolstepThreshold: word; const aClassicThreshold: word; const aHighVelocityChopperMode: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_BASIC_CONFIGURATION, 23);
  LEConvertUInt16To(aStandstillCurrent, 8, _request);
  LEConvertUInt16To(aMotorRunCurrent, 10, _request);
  LEConvertUInt16To(aStandstillDelayTime, 12, _request);
  LEConvertUInt16To(aPowerDownTime, 14, _request);
  LEConvertUInt16To(aStealthThreshold, 16, _request);
  LEConvertUInt16To(aCoolstepThreshold, 18, _request);
  LEConvertUInt16To(aClassicThreshold, 20, _request);
  LEConvertBooleanTo(aHighVelocityChopperMode, 22, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetBasicConfiguration(out aStandstillCurrent: word; out aMotorRunCurrent: word; out aStandstillDelayTime: word; out aPowerDownTime: word;
                                                    out aStealthThreshold: word; out aCoolstepThreshold: word; out aClassicThreshold: word; out aHighVelocityChopperMode: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_BASIC_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aStandstillCurrent:= LEConvertUInt16From(8, _response);
  aMotorRunCurrent:= LEConvertUInt16From(10, _response);
  aStandstillDelayTime:= LEConvertUInt16From(12, _response);
  aPowerDownTime:= LEConvertUInt16From(14, _response);
  aStealthThreshold:= LEConvertUInt16From(16, _response);
  aCoolstepThreshold:= LEConvertUInt16From(18, _response);
  aClassicThreshold:= LEConvertUInt16From(20, _response);
  aHighVelocityChopperMode:= LEConvertBooleanFrom(22, _response);
end;

procedure TBrickSilentStepper.SetSpreadcycleConfiguration(const slowDecayDuration: byte; const enableRandomSlowDecay: boolean; const fastDecayDuration: byte;
                                                          const hysteresisStartValue: byte; const hysteresisEndValue: shortint; const sineWaveOffset: shortint;
                                                          const chopperMode: byte; const comparatorBlankTime: byte; const fastDecayWithoutComparator: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_SPREADCYCLE_CONFIGURATION, 17);
  LEConvertUInt8To(slowDecayDuration, 8, _request);
  LEConvertBooleanTo(enableRandomSlowDecay, 9, _request);
  LEConvertUInt8To(fastDecayDuration, 10, _request);
  LEConvertUInt8To(hysteresisStartValue, 11, _request);
  LEConvertInt8To(hysteresisEndValue, 12, _request);
  LEConvertInt8To(sineWaveOffset, 13, _request);
  LEConvertUInt8To(chopperMode, 14, _request);
  LEConvertUInt8To(comparatorBlankTime, 15, _request);
  LEConvertBooleanTo(fastDecayWithoutComparator, 16, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetSpreadcycleConfiguration(out slowDecayDuration: byte; out enableRandomSlowDecay: boolean; out fastDecayDuration: byte;
                                                          out hysteresisStartValue: byte; out hysteresisEndValue: shortint; out sineWaveOffset: shortint;
                                                          out chopperMode: byte; out comparatorBlankTime: byte; out fastDecayWithoutComparator: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SPREADCYCLE_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  slowDecayDuration:= LEConvertUInt8From(8, _response);
  enableRandomSlowDecay:= LEConvertBooleanFrom(9, _response);
  fastDecayDuration:= LEConvertUInt8From(10, _response);
  hysteresisStartValue:= LEConvertUInt8From(11, _response);
  hysteresisEndValue:= LEConvertInt8From(12, _response);
  sineWaveOffset:= LEConvertInt8From(13, _response);
  chopperMode:= LEConvertUInt8From(14, _response);
  comparatorBlankTime:= LEConvertUInt8From(15, _response);
  fastDecayWithoutComparator:= LEConvertBooleanFrom(16, _response);
end;

procedure TBrickSilentStepper.SetStealthConfiguration(const enableStealth: boolean; const amplitude: byte; const gradient: byte;
                                                      const enableAutoscale: boolean; const forceSymmetric: boolean; const freewheelMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_STEALTH_CONFIGURATION, 14);
  LEConvertBooleanTo(enableStealth, 8, _request);
  LEConvertUInt8To(amplitude, 9, _request);
  LEConvertUInt8To(gradient, 10, _request);
  LEConvertBooleanTo(enableAutoscale, 11, _request);
  LEConvertBooleanTo(forceSymmetric, 12, _request);
  LEConvertUInt8To(freewheelMode, 13, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetStealthConfiguration(out enableStealth: boolean; out amplitude: byte; out gradient: byte; out enableAutoscale: boolean;
                                                      out forceSymmetric: boolean; out freewheelMode: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_STEALTH_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  enableStealth:= LEConvertBooleanFrom(8, _response);
  amplitude:= LEConvertUInt8From(9, _response);
  gradient:= LEConvertUInt8From(10, _response);
  enableAutoscale:= LEConvertBooleanFrom(11, _response);
  forceSymmetric:= LEConvertBooleanFrom(12, _response);
  freewheelMode:= LEConvertUInt8From(13, _response);
end;

procedure TBrickSilentStepper.SetCoolstepConfiguration(const minimumStallguardValue: byte; const maximumStallguardValue: byte; const currentUpStepWidth: byte;
                                                       const currentDownStepWidth: byte; const minimumCurrent: byte; const stallguardThresholdValue: shortint;
                                                       const stallguardMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_COOLSTEP_CONFIGURATION, 15);
  LEConvertUInt8To(minimumStallguardValue, 8, _request);
  LEConvertUInt8To(maximumStallguardValue, 9, _request);
  LEConvertUInt8To(currentUpStepWidth, 10, _request);
  LEConvertUInt8To(currentDownStepWidth, 11, _request);
  LEConvertUInt8To(minimumCurrent, 12, _request);
  LEConvertInt8To(stallguardThresholdValue, 13, _request);
  LEConvertUInt8To(stallguardMode, 14, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetCoolstepConfiguration(out minimumStallguardValue: byte; out maximumStallguardValue: byte; out currentUpStepWidth: byte;
                                                       out currentDownStepWidth: byte; out minimumCurrent: byte; out stallguardThresholdValue: shortint;
                                                       out stallguardMode: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_COOLSTEP_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  minimumStallguardValue:= LEConvertUInt8From(8, _response);
  maximumStallguardValue:= LEConvertUInt8From(9, _response);
  currentUpStepWidth:= LEConvertUInt8From(10, _response);
  currentDownStepWidth:= LEConvertUInt8From(11, _response);
  minimumCurrent:= LEConvertUInt8From(12, _response);
  stallguardThresholdValue:= LEConvertInt8From(13, _response);
  stallguardMode:= LEConvertUInt8From(14, _response);
end;

procedure TBrickSilentStepper.SetMiscConfiguration(const disableShortToGroundProtection: boolean; const synchronizePhaseFrequency: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_MISC_CONFIGURATION, 10);
  LEConvertBooleanTo(disableShortToGroundProtection, 8, _request);
  LEConvertUInt8To(synchronizePhaseFrequency, 9, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetMiscConfiguration(out disableShortToGroundProtection: boolean; out synchronizePhaseFrequency: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_MISC_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  disableShortToGroundProtection:= LEConvertBooleanFrom(8, _response);
  synchronizePhaseFrequency:= LEConvertUInt8From(9, _response);
end;

procedure TBrickSilentStepper.GetDriverStatus(out openLoad: byte; out shortToGround: byte; out overTemperature: byte; out motorStalled: boolean;
                                              out actualMotorCurrent: byte; out fullStepActive: boolean; out stallguardResult: byte; out stealthVoltageAmplitude: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_DRIVER_STATUS, 8);
  _response:= SendRequest(_request);
  openLoad:= LEConvertUInt8From(8, _response);
  shortToGround:= LEConvertUInt8From(9, _response);
  overTemperature:= LEConvertUInt8From(10, _response);
  motorStalled:= LEConvertBooleanFrom(11, _response);
  actualMotorCurrent:= LEConvertUInt8From(12, _response);
  fullStepActive:= LEConvertBooleanFrom(13, _response);
  stallguardResult:= LEConvertUInt8From(14, _response);
  stealthVoltageAmplitude:= LEConvertUInt8From(15, _response);
end;

procedure TBrickSilentStepper.SetMinimumVoltage(const voltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetMinimumVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickSilentStepper.SetTimeBase(const timeBase: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_TIME_BASE, 12);
  LEConvertUInt32To(timeBase, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetTimeBase: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_TIME_BASE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickSilentStepper.GetAllData(out currentVelocity: word; out currentPosition: longint; out remainingSteps: longint;
                                         out stackVoltage: word; out externalVoltage: word; out currentConsumption: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_ALL_DATA, 8);
  _response:= SendRequest(_request);
  currentVelocity:= LEConvertUInt16From(8, _response);
  currentPosition:= LEConvertInt32From(10, _response);
  remainingSteps:= LEConvertInt32From(14, _response);
  stackVoltage:= LEConvertUInt16From(18, _response);
  externalVoltage:= LEConvertUInt16From(20, _response);
  currentConsumption:= LEConvertUInt16From(22, _response);
end;

procedure TBrickSilentStepper.SetAllDataPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetAllDataPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickSilentStepper.SetSPITFPBaudrateConfig(const enableDynamicBaudrate: boolean; const minimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(enableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(minimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  enableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  minimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickSilentStepper.GetSendTimeoutCount(const communicationMethod: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(communicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickSilentStepper.SetSPITFPBaudrate(const brickletPort: char; const baudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(brickletPort, 8, _request);
  LEConvertUInt32To(baudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickSilentStepper.GetSPITFPBaudrate(const brickletPort: char): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(brickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickSilentStepper.GetSPITFPErrorCount(const brickletPort: char; out errorCountACKChecksum: longword;
                                                  out errorCountMessageChecksum: longword; out errorCountFrame: longword;
                                                  out errorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(brickletPort, 8, _request);
  _response:= SendRequest(_request);
  errorCountACKChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickSilentStepper.EnableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.DisableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickSilentStepper.IsStatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickSilentStepper.GetProtocol1BrickletName(const aPort: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out aName: string);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  protocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  name:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickSilentStepper.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickSilentStepper.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickSilentStepper.GetIdentity(out aUID: string; out connectedUid: string; out position: char;
                                          out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber;
                                          out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_SILENT_STEPPER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickSilentStepper.CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray);
var
  _Voltage: word;
begin
  _Voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(underVoltageCallback)) then begin
    underVoltageCallback(self, _Voltage);
  end;
end;

procedure TBrickSilentStepper.CallbackWrapperPositionReached(const aPacket: TDynamicByteArray);
var
  _Position: longint;
begin
  _Position:= LEConvertInt32From(8, aPacket);

  if (Assigned(positionReachedCallback)) then begin
    positionReachedCallback(self, _Position);
  end;
end;

procedure TBrickSilentStepper.CallbackWrapperAllData(const aPacket: TDynamicByteArray);
var
  _CurrentVelocity: word; currentPosition: longint;
  _RemainingSteps: longint;
  _StackVoltage: word;
  _ExternalVoltage: word;
  _CurrentConsumption: word;
begin
  _CurrentVelocity:= LEConvertUInt16From(8, aPacket);
  currentPosition:= LEConvertInt32From(10, aPacket);
  _RemainingSteps:= LEConvertInt32From(14, aPacket);
  _StackVoltage:= LEConvertUInt16From(18, aPacket);
  _ExternalVoltage:= LEConvertUInt16From(20, aPacket);
  _CurrentConsumption:= LEConvertUInt16From(22, aPacket);

  if (Assigned(allDataCallback)) then begin
    allDataCallback(self, _CurrentVelocity, currentPosition, _RemainingSteps, _StackVoltage, _ExternalVoltage, _CurrentConsumption);
  end;
end;

procedure TBrickSilentStepper.CallbackWrapperNewState(const aPacket: TDynamicByteArray);
var
  _StateNew: byte;
  _StatePrevious: byte;
begin
  _StateNew:= LEConvertUInt8From(8, aPacket);
  _StatePrevious:= LEConvertUInt8From(9, aPacket);

  if (Assigned(newStateCallback)) then begin
    newStateCallback(self, _StateNew, _StatePrevious);
  end;
end;

end.
