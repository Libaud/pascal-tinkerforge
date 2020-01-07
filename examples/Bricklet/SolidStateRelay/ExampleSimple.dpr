program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSolidStateRelay;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletSolidStateRelay;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Solid State Relay Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletSolidStateRelay.Create(nil);
	  oBricklet.IPConnection:= oIPConnection;
	  oBricklet.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Turn relay on/off 10 times with 1 second delay }
	  for i := 0 to 4 do begin
		Sleep(1000);
		oBricklet.SetState(true);
		Sleep(1000);
		oBricklet.SetState(false);
	  end;

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
