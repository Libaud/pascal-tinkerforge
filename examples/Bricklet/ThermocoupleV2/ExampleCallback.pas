program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletThermocoupleV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    t: TBrickletThermocoupleV2;
  public
    procedure TemperatureCB(sender: TBrickletThermocoupleV2; const temperature: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Thermocouple Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for temperature callback }
procedure TExample.TemperatureCB(sender: TBrickletThermocoupleV2;
                                 const temperature: longint);
begin
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  t:= TBrickletThermocoupleV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register temperature callback to procedure TemperatureCB }
  t.OnTemperature:= {$ifdef FPC}@{$endif}TemperatureCB;

  { Set period for temperature callback to 1s (1000ms) without a threshold }
  t.SetTemperatureCallbackConfiguration(1000, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
