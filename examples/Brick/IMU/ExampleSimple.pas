program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickIMU;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickIMU;
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
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBrick:= TBrickIMU.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current quaternion }
    oBrick.GetQuaternion(x, y, z, w);

    WriteLn(Format('Quaternion [X]: %f', [x]));
    WriteLn(Format('Quaternion [Y]: %f', [y]));
    WriteLn(Format('Quaternion [Z]: %f', [z]));
    WriteLn(Format('Quaternion [W]: %f', [w]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBrick.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
