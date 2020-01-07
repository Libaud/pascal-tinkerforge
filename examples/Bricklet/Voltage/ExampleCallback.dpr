program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltage;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletVoltage;
  public
    procedure VoltageCB(sender: TBrickletVoltage; const voltage: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage Bricklet }

var
  e: TExample;

{ Callback procedure for voltage callback }
procedure TExample.VoltageCB(sender: TBrickletVoltage; const voltage: word);
begin
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletVoltage.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register voltage callback to procedure VoltageCB }
	  oBricklet.OnVoltage := {$ifdef FPC}@{$endif}VoltageCB;

	  { Set period for voltage callback to 1s (1000ms)
		Note: The voltage callback is only called every second
			  if the voltage has changed since the last call! }
	  oBricklet.SetVoltageCallbackPeriod(1000);

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
