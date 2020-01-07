program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHumidity;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletHumidity;
  public
    procedure HumidityReachedCB(sender: TBrickletHumidity; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet }

var
  e: TExample;

{ Callback procedure for humidity reached callback }
procedure TExample.HumidityReachedCB(sender: TBrickletHumidity; const humidity: word);
begin
  WriteLn(Format('Humidity: %f %%RH', [humidity/10.0]));
  WriteLn('Recommended humidity for human comfort is 30 to 60 %RH.');
end;

procedure TExample.Execute;
begin
  try
	{ Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletHumidity.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
	  oBricklet.SetDebouncePeriod(10000);

	  { Register humidity reached callback to procedure HumidityReachedCB }
	  oBricklet.OnHumidityReached := {$ifdef FPC}@{$endif}HumidityReachedCB;

	  { Configure threshold for humidity "outside of 30 to 60 %RH" }
	  oBricklet.SetHumidityCallbackThreshold('o', 30*10, 60*10);

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
