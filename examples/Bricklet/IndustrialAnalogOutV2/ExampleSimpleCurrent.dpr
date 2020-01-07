program ExampleSimpleCurrent;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialAnalogOutV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialAnalogOutV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Analog Out Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
	try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialAnalogOutV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Set output current to 4.5mA }
	  oBricklet.SetCurrent(4500);
	  oBricklet.SetEnabled(true);

	  WriteLn('Press key to exit');
	  ReadLn;
	  oBricklet.SetEnabled(false);
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
