program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAmbientLightV3;

type
  TExample = class
  private
    oiPConnection: TIPConnection;
    oBricklet: TBrickletAmbientLightV3;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Ambient Light Bricklet 3.0 }

var
  e: TExample;

procedure TExample.Execute;
var illuminance: longword;
begin
  try
	  { Create IP connection }
	  oiPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletAmbientLightV3.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oiPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current Illuminance }
	  illuminance := oBricklet.GetIlluminance;
	  WriteLn(Format('Illuminance: %f lx', [illuminance/100.0]));

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oiPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
