program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletBarometerV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    b: TBrickletBarometerV2;
  public
    procedure AirPressureCB(sender: TBrickletBarometerV2; const airPressure: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Barometer Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for air pressure callback }
procedure TExample.AirPressureCB(sender: TBrickletBarometerV2;
                                 const airPressure: longint);
begin
  WriteLn(Format('Air Pressure: %f hPa', [airPressure/1000.0]));
  WriteLn('Enjoy the potentially good weather!');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  b := TBrickletBarometerV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register air pressure callback to procedure AirPressureCB }
  b.OnAirPressure := {$ifdef FPC}@{$endif}AirPressureCB;

  { Configure threshold for air pressure "greater than 1025 hPa"
    with a debounce period of 1s (1000ms) }
  b.SetAirPressureCallbackConfiguration(1000, false, '>', 1025*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
