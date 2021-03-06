program ExamplePrintVoltages;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickHAT;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickHAT;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your HAT Brick }

var
  e: TExample;

procedure TExample.Execute;
var voltageUSB, voltageDC: word;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBrick := TBrickHAT.Create(nil);
	  oBrick.UIDString:= UID;
	  oBrick.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current get voltages }
	  oBrick.GetVoltages(voltageUSB, voltageDC);

	  WriteLn(Format('Voltage USB: %f V', [voltageUSB/1000.0]));
	  WriteLn(Format('Voltage DC: %f V', [voltageDC/1000.0]));

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
