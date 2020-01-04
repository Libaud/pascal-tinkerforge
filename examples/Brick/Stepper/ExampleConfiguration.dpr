program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickStepper;

type
  TExample = class
  private
    ipcon: TIPConnection;
    stepper: TBrickStepper;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Stepper Brick }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  stepper := TBrickStepper.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  stepper.SetMotorCurrent(800); { 800mA }
  stepper.SetStepMode(8); { 1/8 step mode }
  stepper.SetMaxVelocity(2000); { Velocity 2000 steps/s }

  { Slow acceleration (500 steps/s^2),
    Fast deacceleration (5000 steps/s^2) }
  stepper.SetSpeedRamping(500, 5000);

  stepper.Enable; { Enable motor power }
  stepper.SetSteps(60000); { Drive 60000 steps forward }

  WriteLn('Press key to exit');
  ReadLn;
  stepper.Disable;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
