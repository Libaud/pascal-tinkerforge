program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIR;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    tir: TBrickletTemperatureIR;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var ambientTemperature, objectTemperature: smallint;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  tir:= TBrickletTemperatureIR.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current ambient temperature }
  ambientTemperature:= tir.GetAmbientTemperature;
  WriteLn(Format('Ambient Temperature: %f °C', [ambientTemperature/10.0]));

  { Get current object temperature }
  objectTemperature:= tir.GetObjectTemperature;
  WriteLn(Format('Object Temperature: %f °C', [objectTemperature/10.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
