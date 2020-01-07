program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletEnergyMonitor;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletEnergyMonitor;
  public
    procedure EnergyDataCB(sender: TBrickletEnergyMonitor; const voltage: longint;
                           const current: longint; const energy: longint;
                           const realPower: longint; const apparentPower: longint;
                           const reactivePower: longint; const powerFactor: word;
                           const frequency: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Energy Monitor Bricklet }

var
  e: TExample;

{ Callback procedure for Energy Data callback }
procedure TExample.EnergyDataCB(sender: TBrickletEnergyMonitor; const voltage: longint;
                                const current: longint; const energy: longint;
                                const realPower: longint; const apparentPower: longint;
                                const reactivePower: longint; const powerFactor: word;
                                const frequency: word);
begin
  WriteLn(Format('Voltage: %f V', [voltage/100.0]));
  WriteLn(Format('Current: %f A', [current/100.0]));
  WriteLn(Format('Energy: %f Wh', [energy/100.0]));
  WriteLn(Format('Real Power: %f h', [realPower/100.0]));
  WriteLn(Format('Apparent Power: %f VA', [apparentPower/100.0]));
  WriteLn(Format('Reactive Power: %f VAR', [reactivePower/100.0]));
  WriteLn(Format('Power Factor: %f', [powerFactor/1000.0]));
  WriteLn(Format('Frequency: %f Hz', [frequency/100.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletEnergyMonitor.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register Energy Data callback to procedure EnergyDataCB }
	  oBricklet.OnEnergyData := {$ifdef FPC}@{$endif}EnergyDataCB;

	  { Set period for Energy Data callback to 1s (1000ms) }
	  oBricklet.SetEnergyDataCallbackConfiguration(1000, false);

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
