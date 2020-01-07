program ExampleGPIO;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletXMC1400Breakout;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletXMC1400Breakout;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your XMC1400 Breakout Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletXMC1400Breakout.Create(nil);
	  oBricklet.IPConnection:= oIPConnection;
	  oBricklet.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Set Port 1, Pin 0 alternating high/low for 5 times with 1s delay }
	  for i := 0 to 4 do begin
		Sleep(1000);
		oBricklet.SetGPIOConfig(1, 0, BRICKLET_XMC1400_BREAKOUT_GPIO_MODE_OUTPUT_PUSH_PULL, 0,
						 false);
		Sleep(1000);
		oBricklet.SetGPIOConfig(1, 0, BRICKLET_XMC1400_BREAKOUT_GPIO_MODE_OUTPUT_PUSH_PULL, 0,
						 true);
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
