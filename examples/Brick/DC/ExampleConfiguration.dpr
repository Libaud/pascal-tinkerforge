program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickDC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickDC;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your DC Brick }

var
  e: TExample;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickDC.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  oBricklet.SetDriveMode(BRICK_DC_DRIVE_MODE_DRIVE_COAST);
	  oBricklet.SetPWMFrequency(10000); { Use PWM frequency of 10kHz }
	  oBricklet.SetAcceleration(5000); { Slow acceleration }
	  oBricklet.SetVelocity(32767); { Full speed forward }
	  oBricklet.Enable; { Enable motor power }

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Disable; { Disable motor power }
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
