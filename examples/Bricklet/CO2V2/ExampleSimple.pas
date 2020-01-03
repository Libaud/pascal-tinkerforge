program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCO2V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    co2: TBrickletCO2V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your CO2 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var co2Concentration, humidity: word; temperature: smallint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  co2 := TBrickletCO2V2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current all values }
  co2.GetAllValues(co2Concentration, temperature, humidity);

  WriteLn(Format('CO2 Concentration: %d ppm', [co2Concentration]));
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
  WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
