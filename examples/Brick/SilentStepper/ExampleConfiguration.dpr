program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickSilentStepper;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickSilentStepper;
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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBrick := TBrickSilentStepper.Create(nil);
	  oBrick.UIDString:= UID;
	  oBrick.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  oBrick.SetMotorCurrent(800); { 800mA }
	  oBrick.SetStepConfiguration(BRICK_SILENT_STEPPER_STEP_RESOLUTION_8,
							  true); { 1/8 steps (interpolated) }
	  oBrick.SetMaxVelocity(2000); { Velocity 2000 steps/s }

	  { Slow acceleration (500 steps/s^2),
		Fast deacceleration (5000 steps/s^2) }
	  oBrick.SetSpeedRamping(500, 5000);

	  oBrick.Enable; { Enable motor power }
	  oBrick.SetSteps(60000); { Drive 60000 steps forward }

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBrick.Disable;
	  oBrick.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
