program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAccelerometerV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    a: TBrickletAccelerometerV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Accelerometer Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var x, y, z: longint;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  a:= TBrickletAccelerometerV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current acceleration }
  a.GetAcceleration(x, y, z);

  WriteLn(Format('Acceleration [X]: %f g', [x/10000.0]));
  WriteLn(Format('Acceleration [Y]: %f g', [y/10000.0]));
  WriteLn(Format('Acceleration [Z]: %f g', [z/10000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
