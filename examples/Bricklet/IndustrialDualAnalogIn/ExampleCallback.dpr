program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDualAnalogIn;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDualAnalogIn;
  public
    procedure VoltageCB(sender: TBrickletIndustrialDualAnalogIn; const channel: byte;
                        const voltage: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual Analog In Bricklet }

var
  e: TExample;

{ Callback procedure for voltage callback }
procedure TExample.VoltageCB(sender: TBrickletIndustrialDualAnalogIn; const channel: byte;
                             const voltage: longint);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialDualAnalogIn.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register voltage callback to procedure VoltageCB }
	  oBricklet.OnVoltage := {$ifdef FPC}@{$endif}VoltageCB;

	  { Set period for voltage (channel 1) callback to 1s (1000ms)
		Note: The voltage (channel 1) callback is only called every second
			  if the voltage (channel 1) has changed since the last call! }
	  oBricklet.SetVoltageCallbackPeriod(1, 1000);

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
