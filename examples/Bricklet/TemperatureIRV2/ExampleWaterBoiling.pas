program ExampleWaterBoiling;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIRV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletTemperatureIRV2;
  public
    procedure ObjectTemperatureCB(sender: TBrickletTemperatureIRV2;
                                  const temperature: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for object temperature reached callback }
procedure TExample.ObjectTemperatureCB(sender: TBrickletTemperatureIRV2;
                                       const temperature: smallint);
begin
  WriteLn(Format('Object Temperature: %f °C', [temperature/10.0]));
  WriteLn('The water is boiling!');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletTemperatureIRV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Set emissivity to 0.98 (emissivity of water, 65535 * 0.98 = 64224.299) }
    oBricklet.SetEmissivity(64224);

    { Register object temperature reached callback to procedure ObjectTemperatureCB }
    oBricklet.OnObjectTemperature:= {$ifdef FPC}@{$endif}ObjectTemperatureCB;

    { Configure threshold for object temperature "greater than 100 °C"
      with a debounce period of 10s (10000ms) }
    oBricklet.SetObjectTemperatureCallbackConfiguration(10000, false, '>', 100*10, 0);

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
