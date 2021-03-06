program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMoisture;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMoisture;
  public
    procedure MoistureReachedCB(sender: TBrickletMoisture; const moisture: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Moisture Bricklet }

var
  e: TExample;

{ Callback procedure for moisture value reached callback }
procedure TExample.MoistureReachedCB(sender: TBrickletMoisture; const moisture: word);
begin
  WriteLn(Format('Moisture Value: %d', [moisture]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletMoisture.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 1 second (1000ms) }
	  oBricklet.SetDebouncePeriod(1000);

	  { Register moisture value reached callback to procedure MoistureReachedCB }
	  oBricklet.OnMoistureReached := {$ifdef FPC}@{$endif}MoistureReachedCB;

	  { Configure threshold for moisture value "greater than 200" }
	  oBricklet.SetMoistureCallbackThreshold('>', 200, 0);

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
