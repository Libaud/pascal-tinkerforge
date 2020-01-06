program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLaserRangeFinder;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLaserRangeFinder;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Laser Range Finder Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var distance: word;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletLaserRangeFinder.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Turn laser on and wait 250ms for very first measurement to be ready }
    oBricklet.EnableLaser;
    Sleep(250);

    { Get current distance }
    distance:= oBricklet.GetDistance;
    WriteLn(Format('Distance: %d cm', [distance]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.DisableLaser; { Turn laser off }
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
