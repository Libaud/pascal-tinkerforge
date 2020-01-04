program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickDC;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dc: TBrickDC;
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
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  dc := TBrickDC.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { The acceleration has to be smaller or equal to the maximum
    acceleration of the DC motor, otherwise the velocity reached
    callback will be called too early }
  dc.SetAcceleration(5000); { Slow acceleration }
  dc.SetVelocity(32767); { Full speed forward }

  { Register velocity reached callback to procedure VelocityReachedCB }
  dc.OnVelocityReached := {$ifdef FPC}@{$endif}VelocityReachedCB;

  { Enable motor power }
  dc.Enable;

  WriteLn('Press key to exit');
  ReadLn;
  dc.Disable; { Disable motor power }
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
