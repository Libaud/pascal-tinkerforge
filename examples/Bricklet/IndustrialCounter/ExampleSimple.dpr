program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialCounter;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialCounter;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Counter Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var counter: int64; dutyCycle: word; period: uint64; frequency: longword; value: boolean;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialCounter.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current counter from channel 0 }
	  counter := oBricklet.GetCounter(BRICKLET_INDUSTRIAL_COUNTER_CHANNEL_0);
	  WriteLn(Format('Counter (Channel 0): %d', [counter]));

	  { Get current signal data from channel 0 }
	  oBricklet.GetSignalData(BRICKLET_INDUSTRIAL_COUNTER_CHANNEL_0, dutyCycle, period, frequency,
					   value);

	  WriteLn(Format('Duty Cycle (Channel 0): %f %%', [dutyCycle/100.0]));
	  WriteLn(Format('Period (Channel 0): %d ns', [period]));
	  WriteLn(Format('Frequency (Channel 0): %f Hz', [frequency/1000.0]));
	  WriteLn(Format('Value (Channel 0): %d', [value]));

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
