program ExampleWaterBoiling;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIRV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    tir: TBrickletTemperatureIRV2;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  tir := TBrickletTemperatureIRV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set emissivity to 0.98 (emissivity of water, 65535 * 0.98 = 64224.299) }
  tir.SetEmissivity(64224);

  { Register object temperature reached callback to procedure ObjectTemperatureCB }
  tir.OnObjectTemperature := {$ifdef FPC}@{$endif}ObjectTemperatureCB;

  { Configure threshold for object temperature "greater than 100 °C"
    with a debounce period of 10s (10000ms) }
  tir.SetObjectTemperatureCallbackConfiguration(10000, false, '>', 100*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
