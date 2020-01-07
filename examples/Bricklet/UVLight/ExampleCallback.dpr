program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLight;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletUVLight;
  public
    procedure UVLightCB(sender: TBrickletUVLight; const uvLight: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet }

var
  e: TExample;

{ Callback procedure for UV light callback }
procedure TExample.UVLightCB(sender: TBrickletUVLight; const uvLight: longword);
begin
  WriteLn(Format('UV Light: %f mW/m²', [uvLight/10.0]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletUVLight.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register UV light callback to procedure UVLightCB }
	  oBricklet.OnUVLight := {$ifdef FPC}@{$endif}UVLightCB;

	  { Set period for UV light callback to 1s (1000ms)
		Note: The UV light callback is only called every second
			  if the UV light has changed since the last call! }
	  oBricklet.SetUVLightCallbackPeriod(1000);

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
