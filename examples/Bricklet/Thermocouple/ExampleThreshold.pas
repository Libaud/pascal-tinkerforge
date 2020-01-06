program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletThermocouple;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    t: TBrickletThermocouple;
  public
    procedure TemperatureReachedCB(sender: TBrickletThermocouple;
                                   const temperature: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Thermocouple Bricklet }

var
  e: TExample;

{ Callback procedure for temperature reached callback }
procedure TExample.TemperatureReachedCB(sender: TBrickletThermocouple;
                                        const temperature: longint);
begin
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  t:= TBrickletThermocouple.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  t.SetDebouncePeriod(10000);

  { Register temperature reached callback to procedure TemperatureReachedCB }
  t.OnTemperatureReached:= {$ifdef FPC}@{$endif}TemperatureReachedCB;

  { Configure threshold for temperature "greater than 30 °C" }
  t.SetTemperatureCallbackThreshold('>', 30*100, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
