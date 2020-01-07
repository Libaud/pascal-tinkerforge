program ExampleMotor;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotorizedLinearPoti;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMotorizedLinearPoti;
  public
    procedure PositionReachedCB(sender: TBrickletMotorizedLinearPoti;
                                const position: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motorized Linear Poti Bricklet }

var
  e: TExample;

{ Callback procedure for position reached callback }
procedure TExample.PositionReachedCB(sender: TBrickletMotorizedLinearPoti;
                                     const position: word);
begin
  WriteLn(Format('Position: %d', [position])); { Range: 0 to 100 }
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletMotorizedLinearPoti.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register position reached callback to procedure PositionReachedCB }
	  oBricklet.OnPositionReached := {$ifdef FPC}@{$endif}PositionReachedCB;

	  { Move slider smooth to the middle }
	  oBricklet.SetMotorPosition(50, BRICKLET_MOTORIZED_LINEAR_POTI_DRIVE_MODE_SMOOTH, false);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
