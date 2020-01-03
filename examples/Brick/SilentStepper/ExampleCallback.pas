program ExampleCallback;

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
    procedure PositionReachedCB(sender: TBrickSilentStepper; const position: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Silent Stepper Brick }

var
  e: TExample;

{ Use position reached callback to program random movement }
procedure TExample.PositionReachedCB(sender: TBrickSilentStepper;
                                     const position: longint);
var steps: longint; vel: smallint; acc, dec: word;
begin
  if (Random(2) = 0) then begin
    steps := Random(4000) + 1000; { steps (forward) }
    WriteLn(Format('Driving forward: %d steps', [steps]));
  end
  else begin
    steps := -(Random(4000) + 1000); { steps (backward) }
    WriteLn(Format('Driving backward: %d steps', [steps]));
  end;

  vel := Random(1800) + 200; { steps/s }
  acc := Random(900) + 100; { steps/s^2 }
  dec := Random(900) + 100; { steps/s^2 }
  WriteLn(Format('Configuration (vel, acc, dec): %d, %d %d', [vel, acc, dec]));

  sender.SetSpeedRamping(acc, dec);
  sender.SetMaxVelocity(vel);
  sender.SetSteps(steps);
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ss := TBrickSilentStepper.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position reached callback to procedure PositionReachedCB }
  ss.OnPositionReached := {$ifdef FPC}@{$endif}PositionReachedCB;

  ss.SetStepConfiguration(BRICK_SILENT_STEPPER_STEP_RESOLUTION_8,
                          true); { 1/8 steps (interpolated) }
  ss.Enable; { Enable motor power }
  ss.SetSteps(1); { Drive one step forward to get things going }

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
