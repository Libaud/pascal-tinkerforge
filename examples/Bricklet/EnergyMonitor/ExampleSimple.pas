program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletEnergyMonitor;

type
  TExample = class
  private
    ipcon: TIPConnection;
    em: TBrickletEnergyMonitor;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Energy Monitor Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var voltage, current, energy, realPower, apparentPower, reactivePower: longint;
    powerFactor, frequency: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  em := TBrickletEnergyMonitor.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current Energy Data }
  em.GetEnergyData(voltage, current, energy, realPower, apparentPower, reactivePower,
                   powerFactor, frequency);

  WriteLn(Format('Voltage: %f V', [voltage/100.0]));
  WriteLn(Format('Current: %f A', [current/100.0]));
  WriteLn(Format('Energy: %f Wh', [energy/100.0]));
  WriteLn(Format('Real Power: %f h', [realPower/100.0]));
  WriteLn(Format('Apparent Power: %f VA', [apparentPower/100.0]));
  WriteLn(Format('Reactive Power: %f VAR', [reactivePower/100.0]));
  WriteLn(Format('Power Factor: %f', [powerFactor/1000.0]));
  WriteLn(Format('Frequency: %f Hz', [frequency/100.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
