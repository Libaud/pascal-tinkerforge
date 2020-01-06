program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletBarometer;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletBarometer;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletBarometer.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current air pressure }
    airPressure:= oBricklet.GetAirPressure;
    WriteLn(Format('Air Pressure: %f hPa', [airPressure/1000.0]));

    { Get current altitude }
    altitude:= oBricklet.GetAltitude;
    WriteLn(Format('Altitude: %f m', [altitude/100.0]));

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
