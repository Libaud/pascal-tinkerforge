program ExampleCallback;

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

{ Callback procedure for object temperature callback }
procedure TExample.ObjectTemperatureCB(sender: TBrickletTemperatureIRV2;
                                       const temperature: smallint);
begin
  WriteLn(Format('Object Temperature: %f °C', [temperature/10.0]));
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

  { Register object temperature callback to procedure ObjectTemperatureCB }
  tir.OnObjectTemperature := {$ifdef FPC}@{$endif}ObjectTemperatureCB;

  { Set period for object temperature callback to 1s (1000ms) without a threshold }
  tir.SetObjectTemperatureCallbackConfiguration(1000, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
