program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCO2V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCO2V2;
  public
    procedure AllValuesCB(sender: TBrickletCO2V2; const co2Concentration: word;
                          const temperature: smallint; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your CO2 Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for all values callback }
procedure TExample.AllValuesCB(sender: TBrickletCO2V2; const co2Concentration: word;
                               const temperature: smallint; const humidity: word);
begin
  WriteLn(Format('CO2 Concentration: %d ppm', [co2Concentration]));
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
  WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletCO2V2.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register all values callback to procedure AllValuesCB }
  oBricklet.OnAllValues := {$ifdef FPC}@{$endif}AllValuesCB;

  { Set period for all values callback to 1s (1000ms) }
  oBricklet.SetAllValuesCallbackConfiguration(1000, false);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
