program ExampleCallback;

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
    procedure HumidityCB(sender: TBrickletHumidity; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet }

var
  e: TExample;

{ Callback procedure for humidity callback }
procedure TExample.HumidityCB(sender: TBrickletHumidity; const humidity: word);
begin
  WriteLn(Format('Humidity: %f %%RH', [humidity/10.0]));
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

	  { Register humidity callback to procedure HumidityCB }
	  oBricklet.OnHumidity := {$ifdef FPC}@{$endif}HumidityCB;

	  { Set period for humidity callback to 1s (1000ms)
		Note: The humidity callback is only called every second
			  if the humidity has changed since the last call! }
	  oBricklet.SetHumidityCallbackPeriod(1000);

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
