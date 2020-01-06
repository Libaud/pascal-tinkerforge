program ExampleThreshold;

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
    procedure AirPressureReachedCB(sender: TBrickletBarometer;
                                   const airPressure: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Barometer Bricklet }

var
  e: TExample;

{ Callback procedure for air pressure reached callback }
procedure TExample.AirPressureReachedCB(sender: TBrickletBarometer;
                                        const airPressure: longint);
begin
  WriteLn(Format('Air Pressure: %f hPa', [airPressure/1000.0]));
  WriteLn('Enjoy the potentially good weather!');
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  b:= TBrickletBarometer.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  b.SetDebouncePeriod(10000);

  { Register air pressure reached callback to procedure AirPressureReachedCB }
  b.OnAirPressureReached:= {$ifdef FPC}@{$endif}AirPressureReachedCB;

  { Configure threshold for air pressure "greater than 1025 hPa" }
  b.SetAirPressureCallbackThreshold('>', 1025*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
