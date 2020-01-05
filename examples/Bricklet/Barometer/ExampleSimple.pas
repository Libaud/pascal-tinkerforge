program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletBarometer;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    b: TBrickletBarometer;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Barometer Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var airPressure, altitude: longint;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  b:= TBrickletBarometer.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current air pressure }
  airPressure:= b.GetAirPressure;
  WriteLn(Format('Air Pressure: %f hPa', [airPressure/1000.0]));

  { Get current altitude }
  altitude:= b.GetAltitude;
  WriteLn(Format('Altitude: %f m', [altitude/100.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
