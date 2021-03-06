program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalOut4V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDigitalOut4V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital Out 4 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialDigitalOut4V2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Set channels alternating high/low 10 times with 100 ms delay }
	  for i := 0 to 9 do begin
		Sleep(100);
		oBricklet.SetValue([true, false, false, false]);
		Sleep(100);
		oBricklet.SetValue([false, true, false, false]);
		Sleep(100);
		oBricklet.SetValue([false, false, true, false]);
		Sleep(100);
		oBricklet.SetValue([false, false, false, true]);
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
