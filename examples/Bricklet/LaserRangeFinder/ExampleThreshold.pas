program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLaserRangeFinder;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    lrf: TBrickletLaserRangeFinder;
  public
    procedure DistanceReachedCB(sender: TBrickletLaserRangeFinder; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Laser Range Finder Bricklet }

var
  e: TExample;

{ Callback procedure for distance reached callback }
procedure TExample.DistanceReachedCB(sender: TBrickletLaserRangeFinder;
                                     const distance: word);
begin
  WriteLn(Format('Distance: %d cm', [distance]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  lrf:= TBrickletLaserRangeFinder.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn laser on and wait 250ms for very first measurement to be ready }
  lrf.EnableLaser;
  Sleep(250);

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  lrf.SetDebouncePeriod(10000);

  { Register distance reached callback to procedure DistanceReachedCB }
  lrf.OnDistanceReached:= {$ifdef FPC}@{$endif}DistanceReachedCB;

  { Configure threshold for distance "greater than 20 cm" }
  lrf.SetDistanceCallbackThreshold('>', 20, 0);

  WriteLn('Press key to exit');
  ReadLn;
  lrf.DisableLaser; { Turn laser off }
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
