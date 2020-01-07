program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDustDetector;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletDustDetector;
  public
    procedure DustDensityCB(sender: TBrickletDustDetector; const dustDensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Dust Detector Bricklet }

var
  e: TExample;

{ Callback procedure for dust density callback }
procedure TExample.DustDensityCB(sender: TBrickletDustDetector; const dustDensity: word);
begin
  WriteLn(Format('Dust Density: %d µg/m³', [dustDensity]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletDustDetector.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register dust density callback to procedure DustDensityCB }
	  oBricklet.OnDustDensity := {$ifdef FPC}@{$endif}DustDensityCB;

	  { Set period for dust density callback to 1s (1000ms)
		Note: The dust density callback is only called every second
			  if the dust density has changed since the last call! }
	  oBricklet.SetDustDensityCallbackPeriod(1000);

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
