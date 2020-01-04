program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickSilentStepper;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ss: TBrickSilentStepper;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Silent Stepper Brick }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  ss := TBrickSilentStepper.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  ss.SetMotorCurrent(800); { 800mA }
  ss.SetStepConfiguration(BRICK_SILENT_STEPPER_STEP_RESOLUTION_8,
                          true); { 1/8 steps (interpolated) }
  ss.SetMaxVelocity(2000); { Velocity 2000 steps/s }

  { Slow acceleration (500 steps/s^2),
    Fast deacceleration (5000 steps/s^2) }
  ss.SetSpeedRamping(500, 5000);

  ss.Enable; { Enable motor power }
  ss.SetSteps(60000); { Drive 60000 steps forward }

  WriteLn('Press key to exit');
  ReadLn;
  ss.Disable;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
