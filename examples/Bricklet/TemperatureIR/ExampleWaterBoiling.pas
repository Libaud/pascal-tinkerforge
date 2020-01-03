program ExampleWaterBoiling;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIR;

type
  TExample = class
  private
    ipcon: TIPConnection;
    tir: TBrickletTemperatureIR;
  public
    procedure ObjectTemperatureReachedCB(sender: TBrickletTemperatureIR;
                                         const temperature: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet }

var
  e: TExample;

{ Callback procedure for object temperature reached callback }
procedure TExample.ObjectTemperatureReachedCB(sender: TBrickletTemperatureIR;
                                              const temperature: smallint);
begin
  WriteLn(Format('Object Temperature: %f °C', [temperature/10.0]));
  WriteLn('The water is boiling!');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  tir := TBrickletTemperatureIR.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set emissivity to 0.98 (emissivity of water, 65535 * 0.98 = 64224.299) }
  tir.SetEmissivity(64224);

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  tir.SetDebouncePeriod(10000);

  { Register object temperature reached callback to procedure ObjectTemperatureReachedCB }
  tir.OnObjectTemperatureReached := {$ifdef FPC}@{$endif}ObjectTemperatureReachedCB;

  { Configure threshold for object temperature "greater than 100 °C" }
  tir.SetObjectTemperatureCallbackThreshold('>', 100*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
