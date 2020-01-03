program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletThermocoupleV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
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
  ipcon := TIPConnection.Create;

  { Create device object }
  t := TBrickletThermocoupleV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register temperature callback to procedure TemperatureCB }
  t.OnTemperature := {$ifdef FPC}@{$endif}TemperatureCB;

  { Configure threshold for temperature "greater than 30 °C"
    with a debounce period of 10s (10000ms) }
  t.SetTemperatureCallbackConfiguration(10000, false, '>', 30*100, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
