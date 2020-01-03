program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLaserRangeFinder;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lrf: TBrickletLaserRangeFinder;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lrf := TBrickletLaserRangeFinder.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn laser on and wait 250ms for very first measurement to be ready }
  lrf.EnableLaser;
  Sleep(250);

  { Get current distance }
  distance := lrf.GetDistance;
  WriteLn(Format('Distance: %d cm', [distance]));

  WriteLn('Press key to exit');
  ReadLn;
  lrf.DisableLaser; { Turn laser off }
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
