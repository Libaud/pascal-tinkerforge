program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLightV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletUVLightV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var uva, uvb, uvi: longint;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletUVLightV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current UV-A }
	  uva := oBricklet.GetUVA;
	  WriteLn(Format('UV-A: %f mW/m²', [uva/10.0]));

	  { Get current UV-B }
	  uvb := oBricklet.GetUVB;
	  WriteLn(Format('UV-B: %f mW/m²', [uvb/10.0]));

	  { Get current UV index }
	  uvi := oBricklet.GetUVI;
	  WriteLn(Format('UV Index: %f', [uvi/10.0]));

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
