program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickDC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickDC;
  public
    procedure VelocityReachedCB(sender: TBrickDC; const velocity: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your DC Brick }

var
  e: TExample;

{ Use velocity reached callback to swing back and forth
  between full speed forward and full speed backward }
procedure TExample.VelocityReachedCB(sender: TBrickDC; const velocity: smallint);
begin
  if (velocity = 32767) then begin
    WriteLn('Velocity: Full speed forward, now turning backward');
    sender.SetVelocity(-32767);
  end
  else if (velocity = -32767) then begin
    WriteLn('Velocity: Full speed backward, now turning forward');
    sender.SetVelocity(32767);
  end
  else begin
    WriteLn('Error'); { Can only happen if another program sets velocity }
  end;
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBrick := TBrickDC.Create(nil);
	  oBrick.IPConnection:= oIPConnection;
	  oBrick.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { The acceleration has to be smaller or equal to the maximum
		acceleration of the DC motor, otherwise the velocity reached
		callback will be called too early }
	  oBrick.SetAcceleration(5000); { Slow acceleration }
	  oBrick.SetVelocity(32767); { Full speed forward }

	  { Register velocity reached callback to procedure VelocityReachedCB }
	  oBrick.OnVelocityReached := {$ifdef FPC}@{$endif}VelocityReachedCB;

	  { Enable motor power }
	  oBrick.Enable;

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBrick.Disable; { Disable motor power }
	  oBrick.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
