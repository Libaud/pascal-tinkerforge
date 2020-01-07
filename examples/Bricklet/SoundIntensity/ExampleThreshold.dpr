program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundIntensity;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletSoundIntensity;
  public
    procedure IntensityReachedCB(sender: TBrickletSoundIntensity; const intensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Sound Intensity Bricklet }

var
  e: TExample;

{ Callback procedure for intensity reached callback }
procedure TExample.IntensityReachedCB(sender: TBrickletSoundIntensity;
                                      const intensity: word);
begin
  WriteLn(Format('Intensity: %d', [intensity]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletSoundIntensity.Create(nil);
	  oBricklet.IPConnection:= oIPConnection;
	  oBricklet.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 1 second (1000ms) }
	  oBricklet.SetDebouncePeriod(1000);

	  { Register intensity reached callback to procedure IntensityReachedCB }
	  oBricklet.OnIntensityReached := {$ifdef FPC}@{$endif}IntensityReachedCB;

	  { Configure threshold for intensity "greater than 2000" }
	  oBricklet.SetIntensityCallbackThreshold('>', 2000, 0);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
