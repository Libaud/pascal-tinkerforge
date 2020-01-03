program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialCounter;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ic: TBrickletIndustrialCounter;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ic := TBrickletIndustrialCounter.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current counter from channel 0 }
  counter := ic.GetCounter(BRICKLET_INDUSTRIAL_COUNTER_CHANNEL_0);
  WriteLn(Format('Counter (Channel 0): %d', [counter]));

  { Get current signal data from channel 0 }
  ic.GetSignalData(BRICKLET_INDUSTRIAL_COUNTER_CHANNEL_0, dutyCycle, period, frequency,
                   value);

  WriteLn(Format('Duty Cycle (Channel 0): %f %%', [dutyCycle/100.0]));
  WriteLn(Format('Period (Channel 0): %d ns', [period]));
  WriteLn(Format('Frequency (Channel 0): %f Hz', [frequency/1000.0]));
  WriteLn(Format('Value (Channel 0): %d', [value]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
