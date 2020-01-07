program ExampleThreshold;

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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletLaserRangeFinder.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Turn laser on and wait 250ms for very first measurement to be ready }
	  oBricklet.EnableLaser;
	  Sleep(250);

	  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
	  oBricklet.SetDebouncePeriod(10000);

	  { Register distance reached callback to procedure DistanceReachedCB }
	  oBricklet.OnDistanceReached := {$ifdef FPC}@{$endif}DistanceReachedCB;

	  { Configure threshold for distance "greater than 20 cm" }
	  oBricklet.SetDistanceCallbackThreshold('>', 20, 0);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.DisableLaser; { Turn laser off }
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
