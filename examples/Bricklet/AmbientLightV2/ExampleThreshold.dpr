program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAmbientLightV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletAmbientLightV2;
  public
    procedure IlluminanceReachedCB(sender: TBrickletAmbientLightV2;
                                   const illuminance: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Ambient Light Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for illuminance reached callback }
procedure TExample.IlluminanceReachedCB(sender: TBrickletAmbientLightV2;
                                        const illuminance: longword);
begin
  WriteLn(Format('Illuminance: %f lx', [illuminance/100.0]));
  WriteLn('Too bright, close the curtains!');
end;

procedure TExample.Execute;
begin
  	try
	{ Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletAmbientLightV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
	  oBricklet.SetDebouncePeriod(10000);

	  { Register illuminance reached callback to procedure IlluminanceReachedCB }
	  oBricklet.OnIlluminanceReached := {$ifdef FPC}@{$endif}IlluminanceReachedCB;

	  { Configure threshold for illuminance "greater than 500 lx" }
	  oBricklet.SetIlluminanceCallbackThreshold('>', 500*100, 0);

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
