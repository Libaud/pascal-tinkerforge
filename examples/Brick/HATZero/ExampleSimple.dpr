program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickHATZero;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickHATZero;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your HAT Zero Brick }

var
  e: TExample;

procedure TExample.Execute;
var voltage: word;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBrick := TBrickHATZero.Create(nil);
	  oBrick.UIDString:= UID;
	  oBrick.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current voltage }
	  voltage := oBrick.GetUSBVoltage;
	  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBrick.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
