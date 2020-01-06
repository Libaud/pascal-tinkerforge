program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickIMU;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    imu: TBrickIMU;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your IMU Brick }

var
  e: TExample;

procedure TExample.Execute;
var x, y, z, w: single;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  imu:= TBrickIMU.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current quaternion }
  imu.GetQuaternion(x, y, z, w);

  WriteLn(Format('Quaternion [X]: %f', [x]));
  WriteLn(Format('Quaternion [Y]: %f', [y]));
  WriteLn(Format('Quaternion [Z]: %f', [z]));
  WriteLn(Format('Quaternion [W]: %f', [w]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
