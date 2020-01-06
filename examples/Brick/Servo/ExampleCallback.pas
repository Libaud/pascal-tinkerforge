program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickServo;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickServo;
  public
    procedure PositionReachedCB(sender: TBrickServo; const servoNum: byte;
                                const position: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Servo Brick }

var
  e: TExample;

{ Use position reached callback to swing back and forth }
procedure TExample.PositionReachedCB(sender: TBrickServo; const servoNum: byte;
                                     const position: smallint);
begin
  if (position = 9000) then begin
    WriteLn('Position: 90°, going to -90°');
    sender.SetPosition(servoNum, -9000);
  end
  else if (position = -9000) then begin
    WriteLn('Position: -90°, going to 90°');
    sender.SetPosition(servoNum, 9000);
  end
  else begin
    WriteLn('Error'); { Can only happen if another program sets position }
  end;
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBrick:= TBrickServo.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register position reached callback to procedure PositionReachedCB }
    oBrick.OnPositionReached:= {$ifdef FPC}@{$endif}PositionReachedCB;

    { Enable position reached callback }
    oBrick.EnablePositionReachedCallback;

    { Set velocity to 100°/s. This has to be smaller or equal to the
      maximum velocity of the oBrick you are using, otherwise the position
      reached callback will be called too early }
    oBrick.SetVelocity(0, 10000);
    oBrick.SetPosition(0, 9000);
    oBrick.Enable(0);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBrick.Disable(0);
    oBrick.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
