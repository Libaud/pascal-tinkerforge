program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var ambientTemperature, objectTemperature: smallint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  tir := TBrickletTemperatureIRV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current ambient temperature }
  ambientTemperature := tir.GetAmbientTemperature;
  WriteLn(Format('Ambient Temperature: %f °C', [ambientTemperature/10.0]));

  { Get current object temperature }
  objectTemperature := tir.GetObjectTemperature;
  WriteLn(Format('Object Temperature: %f °C', [objectTemperature/10.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
