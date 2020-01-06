program ExampleSimple;

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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletCO2V2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current all values }
    oBricklet.GetAllValues(co2Concentration, temperature, humidity);

    WriteLn(Format('CO2 Concentration: %d ppm', [co2Concentration]));
    WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
    WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
