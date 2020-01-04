program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickServo;

type
  TExample = class
  private
    ipcon: TIPConnection;
    servo: TBrickServo;
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
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  servo := TBrickServo.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position reached callback to procedure PositionReachedCB }
  servo.OnPositionReached := {$ifdef FPC}@{$endif}PositionReachedCB;

  { Enable position reached callback }
  servo.EnablePositionReachedCallback;

  { Set velocity to 100°/s. This has to be smaller or equal to the
    maximum velocity of the servo you are using, otherwise the position
    reached callback will be called too early }
  servo.SetVelocity(0, 10000);
  servo.SetPosition(0, 9000);
  servo.Enable(0);

  WriteLn('Press key to exit');
  ReadLn;
  servo.Disable(0);
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
