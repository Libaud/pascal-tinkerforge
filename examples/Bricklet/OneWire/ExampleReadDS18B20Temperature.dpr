program ExampleReadDS18B20Temperature;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletOneWire;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletOneWire;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your One Wire Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
var t_low, t_high, status: byte;
var temperature: Single;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletOneWire.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  oBricklet.WriteCommand(0, 78); { WRITE SCRATCHPAD }
	  oBricklet.Write(0); { ALARM H (unused) }
	  oBricklet.Write(0); { ALARM L (unused) }
	  oBricklet.Write(127); { CONFIGURATION: 12-bit mode }

	  { Read temperature 10 times }
	  for i := 0 to 9 do begin
		oBricklet.WriteCommand(0, 68); { CONVERT T (start temperature conversion) }
		Sleep(1000); { Wait for conversion to finish }
		oBricklet.WriteCommand(0, 190); { READ SCRATCHPAD }

		oBricklet.Read(t_low, status);
		oBricklet.Read(t_high, status);

		temperature := t_low or (t_high shl 8);

		{ Negative 12-bit values are sign-extended to 16-bit two's complement }

		if (temperature > 1 shl 12) then
		begin
		  temperature := temperature - 1 shl 16;
		end;

		{ 12-bit mode measures in units of 1/16°C }
		WriteLn('Temperature: %f °C', temperature/16.0);
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
