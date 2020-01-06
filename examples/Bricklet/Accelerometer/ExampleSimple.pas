program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAccelerometer;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletAccelerometer;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Accelerometer Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var x, y, z: smallint;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletAccelerometer.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current acceleration }
    oBricklet.GetAcceleration(x, y, z);

    WriteLn(Format('Acceleration [X]: %f g', [x/1000.0]));
    WriteLn(Format('Acceleration [Y]: %f g', [y/1000.0]));
    WriteLn(Format('Acceleration [Z]: %f g', [z/1000.0]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
