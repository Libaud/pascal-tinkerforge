{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickDC;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, Device, LEConverter;

{$I Tinkerforge.inc}
{$I BrickDC.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickDC = class;
  TBrickDCNotifyUnderVoltage = procedure(aSender: TBrickDC; const aVoltage: word) of object;
  TBrickDCNotifyEmergencyShutdown = procedure(aSender: TBrickDC) of object;
  TBrickDCNotifyVelocityReached = procedure(aSender: TBrickDC; const aVelocity: smallint) of object;
  TBrickDCNotifyCurrentVelocity = procedure(aSender: TBrickDC; const aVelocity: smallint) of object;

  /// <summary>
  ///  Drives one brushed DC motor with up to 28V and 5A (peak)
  /// </summary>
  TBrickDC = class(TDevice)
  private
    fUnderVoltageCallback: TBrickDCNotifyUnderVoltage;
    fEmergencyShutdownCallback: TBrickDCNotifyEmergencyShutdown;
    fVelocityReachedCallback: TBrickDCNotifyVelocityReached;
    fCurrentVelocityCallback: TBrickDCNotifyCurrentVelocity;
    // Method's
    procedure CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperEmergencyShutdown(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCurrentVelocity(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeresponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the velocity of the motor. Whereas -32767 is full speed backward,
    ///  0 is stop and 32767 is full speed forward. Depending on the
    ///  acceleration (see <see cref="BrickDC.TBrickDC.SetAcceleration"/>), the motor is not immediately
    ///  brought to the velocity but smoothly accelerated.
    ///  
    ///  The velocity describes the duty cycle of the PWM with which the motor is
    ///  controlled, e.g. a velocity of 3277 sets a PWM with a 10% duty cycle.
    ///  You can not only control the duty cycle of the PWM but also the frequency,
    ///  see <see cref="BrickDC.TBrickDC.SetPWMFrequency"/>.
    ///  
    ///  The default velocity is 0.
    /// </summary>
    procedure SetVelocity(const aVelocity: smallint); virtual;

    /// <summary>
    ///  Returns the velocity as set by <see cref="BrickDC.TBrickDC.SetVelocity"/>.
    /// </summary>
    function GetVelocity: smallint; virtual;

    /// <summary>
    ///  Returns the *current* velocity of the motor. This value is different
    ///  from <see cref="BrickDC.TBrickDC.GetVelocity"/> whenever the motor is currently accelerating
    ///  to a goal set by <see cref="BrickDC.TBrickDC.SetVelocity"/>.
    /// </summary>
    function GetCurrentVelocity: smallint; virtual;

    /// <summary>
    ///  Sets the acceleration of the motor. It is given in *velocity/s*. An
    ///  acceleration of 10000 means, that every second the velocity is increased
    ///  by 10000 (or about 30% duty cycle).
    ///  
    ///  For example: If the current velocity is 0 and you want to accelerate to a
    ///  velocity of 16000 (about 50% duty cycle) in 10 seconds, you should set
    ///  an acceleration of 1600.
    ///  
    ///  If acceleration is set to 0, there is no speed ramping, i.e. a new velocity
    ///  is immediately given to the motor.
    ///  
    ///  The default acceleration is 10000.
    /// </summary>
    procedure SetAcceleration(const aAcceleration: word); virtual;

    /// <summary>
    ///  Returns the acceleration as set by <see cref="BrickDC.TBrickDC.SetAcceleration"/>.
    /// </summary>
    function GetAcceleration: word; virtual;

    /// <summary>
    ///  Sets the frequency (in Hz) of the PWM with which the motor is driven.
    ///  The possible range of the frequency is 1-20000Hz. Often a high frequency
    ///  is less noisy and the motor runs smoother. However, with a low frequency
    ///  there are less switches and therefore fewer switching losses. Also with
    ///  most motors lower frequencies enable higher torque.
    ///  
    ///  If you have no idea what all this means, just ignore this function and use
    ///  the default frequency, it will very likely work fine.
    ///  
    ///  The default frequency is 15 kHz.
    /// </summary>
    procedure SetPWMFrequency(const aFrequency: word); virtual;

    /// <summary>
    ///  Returns the PWM frequency (in Hz) as set by <see cref="BrickDC.TBrickDC.SetPWMFrequency"/>.
    /// </summary>
    function GetPWMFrequency: word; virtual;

    /// <summary>
    ///  Executes an active full brake.
    ///  
    ///  <note type="caution">

    ///   This function is for emergency purposes,
    ///   where an immediate brake is necessary. Depending on the current velocity and
    ///   the strength of the motor, a full brake can be quite violent.
    ///  </note>
    ///  
    ///  Call <see cref="BrickDC.TBrickDC.SetVelocity"/> with 0 if you just want to stop the motor.
    /// </summary>
    procedure FullBrake; virtual;

    /// <summary>
    ///  Returns the stack input voltage in mV. The stack input voltage is the
    ///  voltage that is supplied via the stack, i.e. it is given by a
    ///  Step-Down or Step-Up Power Supply.
    /// </summary>
    function GetStackInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the external input voltage in mV. The external input voltage is
    ///  given via the black power input connector on the DC Brick.
    ///  
    ///  If there is an external input voltage and a stack input voltage, the motor
    ///  will be driven by the external input voltage. If there is only a stack
    ///  voltage present, the motor will be driven by this voltage.
    ///  
    ///  <note type="caution">
    ///   This means, if you have a high stack voltage and a low external voltage,
    ///   the motor will be driven with the low external voltage. If you then remove
    ///   the external connection, it will immediately be driven by the high
    ///   stack voltage.
    ///  </note>
    /// </summary>
    function GetExternalInputVoltage: word; virtual;

    /// <summary>
    ///  Returns the current consumption of the motor in mA.
    /// </summary>
    function GetCurrentConsumption: word; virtual;

    /// <summary>
    ///  Enables the driver chip. The driver parameters can be configured (velocity,
    ///  acceleration, etc) before it is enabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the driver chip. The configurations are kept (velocity,
    ///  acceleration, etc) but the motor is not driven until it is enabled again.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if the driver chip is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the minimum voltage in mV, below which the <see cref="BrickDC.TBrickDC.OnUnderVoltage"/> callback
    ///  is triggered. The minimum possible value that works with the DC Brick is 6V.
    ///  You can use this function to detect the discharge of a battery that is used
    ///  to drive the motor. If you have a fixed power supply, you likely do not need
    ///  this functionality.
    ///  
    ///  The default value is 6V.
    /// </summary>
    procedure SetMinimumVoltage(const aVoltage: word); virtual;

    /// <summary>
    ///  Returns the minimum voltage as set by <see cref="BrickDC.TBrickDC.SetMinimumVoltage"/>
    /// </summary>
    function GetMinimumVoltage: word; virtual;

    /// <summary>
    ///  Sets the drive mode. Possible modes are:
    ///  
    ///  * 0 = Drive/Brake
    ///  * 1 = Drive/Coast
    ///  
    ///  These modes are different kinds of motor controls.
    ///  
    ///  In Drive/Brake mode, the motor is always either driving or braking. There
    ///  is no freewheeling. Advantages are: A more linear correlation between
    ///  PWM and velocity, more exact accelerations and the possibility to drive
    ///  with slower velocities.
    ///  
    ///  In Drive/Coast mode, the motor is always either driving or freewheeling.
    ///  Advantages are: Less current consumption and less demands on the motor and
    ///  driver chip.
    ///  
    ///  The default value is 0 = Drive/Brake.
    /// </summary>
    procedure SetDriveMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the drive mode, as set by <see cref="BrickDC.TBrickDC.SetDriveMode"/>.
    /// </summary>
    function GetDriveMode: byte; virtual;

    /// <summary>
    ///  Sets a period in ms with which the <see cref="BrickDC.TBrickDC.OnCurrentVelocity"/> callback is triggered.
    ///  A period of 0 turns the callback off.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCurrentVelocityPeriod(const aPeriod: word); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickDC.TBrickDC.SetCurrentVelocityPeriod"/>.
    /// </summary>
    function GetCurrentVelocityPeriod: word; virtual;

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
    ///  <see cref="BrickDC.TBrickDC.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickDC.TBrickDC.SetSPITFPBaudrate"/> will be used statically.
    ///  
    ///  The minimum dynamic baudrate has a value range of 400000 to 2000000 baud.
    ///  
    ///  By default dynamic baudrate is enabled and the minimum dynamic baudrate is 400000.
    ///  
    ///  .. versionadded:: 2.3.5$nbsp;(Firmware)
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickDC.TBrickDC.SetSPITFPBaudrateConfig"/>.
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
    ///  interference (see <see cref="BrickDC.TBrickDC.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///  
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickDC.TBrickDC.SetSPITFPBaudrateConfig"/>).
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
    ///  Returns the baudrate for a given Bricklet port, see <see cref="BrickDC.TBrickDC.SetSPITFPBaudrate"/>.
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered when the input voltage drops below the value set by
    ///  <see cref="BrickDC.TBrickDC.SetMinimumVoltage"/>. The param_requesteter is the current voltage given
    ///  in mV.
    /// </summary>
    property OnUnderVoltage: TBrickDCNotifyUnderVoltage read fUnderVoltageCallback write fUnderVoltageCallback;

    /// <summary>
    ///  This callback is triggered if either the current consumption
    ///  is too high (above 5A) or the temperature of the driver chip is too high
    ///  (above 175°C). These two possibilities are essentially the same, since the
    ///  temperature will reach this threshold immediately if the motor consumes too
    ///  much current. In case of a voltage below 3.3V (external or stack) this
    ///  callback is triggered as well.
    ///  
    ///  If this callback is triggered, the driver chip gets disabled at the same time.
    ///  That means, <see cref="BrickDC.TBrickDC.Enable"/> has to be called to drive the motor again.
    ///  
    ///  <note>
    ///   This callback only works in Drive/Brake mode (see <see cref="BrickDC.TBrickDC.SetDriveMode"/>). In
    ///   Drive/Coast mode it is unfortunately impossible to reliably read the
    ///   overcurrent/overtemperature signal from the driver chip.
    ///  </note>
    /// </summary>
    property OnEmergencyShutdown: TBrickDCNotifyEmergencyShutdown read fEmergencyShutdownCallback write fEmergencyShutdownCallback;

    /// <summary>
    ///  This callback is triggered whenever a set velocity is reached. For example:
    ///  If a velocity of 0 is present, acceleration is set to 5000 and velocity
    ///  to 10000, the <see cref="BrickDC.TBrickDC.OnVelocityReached"/> callback will be triggered after about
    ///  2 seconds, when the set velocity is actually reached.
    ///  
    ///  <note>
    ///   Since we can't get any feedback from the DC motor, this only works if the
    ///   acceleration (see <see cref="BrickDC.TBrickDC.SetAcceleration"/>) is set smaller or equal to the
    ///   maximum acceleration of the motor. Otherwise the motor will lag behind the
    ///   control value and the callback will be triggered too early.
    ///  </note>
    /// </summary>
    property OnVelocityReached: TBrickDCNotifyVelocityReached read fVelocityReachedCallback write fVelocityReachedCallback;

    /// <summary>
    ///  This callback is triggered with the period that is set by
    ///  <see cref="BrickDC.TBrickDC.SetCurrentVelocityPeriod"/>. The parameter is the *current*
    ///  velocity used by the motor.
    ///  
    ///  The <see cref="BrickDC.TBrickDC.OnCurrentVelocity"/> callback is only triggered after the set period
    ///  if there is a change in the velocity.
    /// </summary>
    property OnCurrentVelocity: TBrickDCNotifyCurrentVelocity read fCurrentVelocityCallback write fCurrentVelocityCallback;
  end;

implementation

uses
  IPConnection;

procedure TBrickDC.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 3;
end;

procedure TBrickDC.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_DC_FUNCTION_SET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_ACCELERATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_PWM_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_PWM_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_FULL_BRAKE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_STACK_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_CURRENT_CONSUMPTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_ENABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_DISABLE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_IS_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_MINIMUM_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_DRIVE_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_DRIVE_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_CURRENT_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_SEND_TIMEOUT_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_ENABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_DISABLE_STATUS_LED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_IS_STATUS_LED_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_DC_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_DC_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickDC.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_DC_CALLBACK_UNDER_VOLTAGE]:= {$ifdef FPC}@{$endif}CallbackWrapperUnderVoltage;
  aCallBacks[BRICK_DC_CALLBACK_EMERGENCY_SHUTDOWN]:= {$ifdef FPC}@{$endif}CallbackWrapperEmergencyShutdown;
  aCallBacks[BRICK_DC_CALLBACK_VELOCITY_REACHED]:= {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
  aCallBacks[BRICK_DC_CALLBACK_CURRENT_VELOCITY]:= {$ifdef FPC}@{$endif}CallbackWrapperCurrentVelocity;
end;

procedure TBrickDC.SetVelocity(const aVelocity: smallint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_VELOCITY, 10);
  LEConvertInt16To(aVelocity, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetVelocity: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

function TBrickDC.GetCurrentVelocity: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickDC.SetAcceleration(const aAcceleration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_ACCELERATION, 10);
  LEConvertUInt16To(aAcceleration, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetAcceleration: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_ACCELERATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickDC.SetPWMFrequency(const aFrequency: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_PWM_FREQUENCY, 10);
  LEConvertUInt16To(aFrequency, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetPWMFrequency: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_PWM_FREQUENCY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickDC.FullBrake;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_FULL_BRAKE, 8);
  SendRequest(_request);
end;

function TBrickDC.GetStackInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_STACK_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickDC.GetExternalInputVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_EXTERNAL_INPUT_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickDC.GetCurrentConsumption: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_CONSUMPTION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickDC.Enable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_ENABLE, 8);
  SendRequest(_request);
end;

procedure TBrickDC.Disable;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_DISABLE, 8);
  SendRequest(_request);
end;

function TBrickDC.IsEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_IS_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickDC.SetMinimumVoltage(const aVoltage: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_MINIMUM_VOLTAGE, 10);
  LEConvertUInt16To(aVoltage, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetMinimumVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_MINIMUM_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickDC.SetDriveMode(const aMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_DRIVE_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetDriveMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_DRIVE_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickDC.SetCurrentVelocityPeriod(const aPeriod: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_CURRENT_VELOCITY_PERIOD, 10);
  LEConvertUInt16To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickDC.GetCurrentVelocityPeriod: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CURRENT_VELOCITY_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickDC.SetSPITFPBaudrateConfig(const aEnableDynamicBaudrate: boolean; const aMinimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(aEnableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(aMinimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickDC.GetSPITFPBaudrateConfig(out aEnableDynamicBaudrate: boolean; out aMinimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  aEnableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  aMinimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

function TBrickDC.GetSendTimeoutCount(const aCommunicationMethod: byte): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_SEND_TIMEOUT_COUNT, 9);
  LEConvertUInt8To(aCommunicationMethod, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickDC.SetSPITFPBaudrate(const aBrickletPort: char; const aBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_SET_SPITFP_BAUDRATE, 13);
  LEConvertCharTo(aBrickletPort, 8, _request);
  LEConvertUInt32To(aBaudrate, 9, _request);
  SendRequest(_request);
end;

function TBrickDC.GetSPITFPBaudrate(const aBrickletPort: char): longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_SPITFP_BAUDRATE, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickDC.GetSPITFPErrorCount(const aBrickletPort: char; out aErrorCountACKChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_SPITFP_ERROR_COUNT, 9);
  LEConvertCharTo(aBrickletPort, 8, _request);
  _response:= SendRequest(_request);
  aErrorCountACKChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickDC.EnableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

procedure TBrickDC.DisableStatusLED;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(_request);
end;

function TBrickDC.IsStatusLEDEnabled: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickDC.GetProtocol1BrickletName(const aPort: char; out aProtocolVersion: byte; out aFirmwareVersion: TArray0To2OfUInt8; out aName: string);
var
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aProtocolVersion:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  aName:= LEConvertStringFrom(12, 40, _response);
end;

function TBrickDC.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickDC.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickDC.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_DC_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickDC.CallbackWrapperUnderVoltage(const aPacket: TDynamicByteArray);
var
  _voltage: word;
begin
  _voltage:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fUnderVoltageCallback)) then begin
    fUnderVoltageCallback(self, _voltage);
  end;
end;

procedure TBrickDC.CallbackWrapperEmergencyShutdown(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fEmergencyShutdownCallback)) then begin
    fEmergencyShutdownCallback(self);
  end;
end;

procedure TBrickDC.CallbackWrapperVelocityReached(const aPacket: TDynamicByteArray);
var
  _velocity: smallint;
begin
  _velocity:= LEConvertInt16From(8, aPacket);

  if (Assigned(fVelocityReachedCallback)) then begin
    fVelocityReachedCallback(self, _velocity);
  end;
end;

procedure TBrickDC.CallbackWrapperCurrentVelocity(const aPacket: TDynamicByteArray);
var
  _velocity: smallint;
begin
  _velocity:= LEConvertInt16From(8, aPacket);

  if (Assigned(fCurrentVelocityCallback)) then begin
    fCurrentVelocityCallback(self, _velocity);
  end;
end;

end.
