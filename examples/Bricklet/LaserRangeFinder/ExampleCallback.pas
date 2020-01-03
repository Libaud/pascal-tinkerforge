program ExampleCallback;

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
    procedure DistanceCB(sender: TBrickletLaserRangeFinder; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Laser Range Finder Bricklet }

var
  e: TExample;

{ Callback procedure for distance callback }
procedure TExample.DistanceCB(sender: TBrickletLaserRangeFinder; const distance: word);
begin
  WriteLn(Format('Distance: %d cm', [distance]));
end;

procedure TExample.Execute;
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

  { Register distance callback to procedure DistanceCB }
  lrf.OnDistance := {$ifdef FPC}@{$endif}DistanceCB;

  { Set period for distance callback to 0.2s (200ms)
    Note: The distance callback is only called every 0.2 seconds
          if the distance has changed since the last call! }
  lrf.SetDistanceCallbackPeriod(200);

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
