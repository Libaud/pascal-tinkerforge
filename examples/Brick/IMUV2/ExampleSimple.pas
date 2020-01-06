program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickIMUV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    imu: TBrickIMUV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your IMU Brick 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var w, x, y, z: smallint;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  imu:= TBrickIMUV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current quaternion }
  imu.GetQuaternion(w, x, y, z);

  WriteLn(Format('Quaternion [W]: %f', [w/16383.0]));
  WriteLn(Format('Quaternion [X]: %f', [x/16383.0]));
  WriteLn(Format('Quaternion [Y]: %f', [y/16383.0]));
  WriteLn(Format('Quaternion [Z]: %f', [z/16383.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
