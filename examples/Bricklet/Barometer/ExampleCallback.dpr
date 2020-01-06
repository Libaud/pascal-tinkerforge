program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletBarometer;

type
  TExample = class
  private
    oiPConnection: TIPConnection;
    oBricklet: TBrickletBarometer;
  public
    procedure AirPressureCB(sender: TBrickletBarometer; const airPressure: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Barometer Bricklet }

var
  e: TExample;

{ Callback procedure for air pressure callback }
procedure TExample.AirPressureCB(sender: TBrickletBarometer; const airPressure: longint);
begin
  WriteLn(Format('Air Pressure: %f hPa', [airPressure/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oiPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletBarometer.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oiPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register air pressure callback to procedure AirPressureCB }
  oBricklet.OnAirPressure := {$ifdef FPC}@{$endif}AirPressureCB;

  { Set period for air pressure callback to 1s (1000ms)
    Note: The air pressure callback is only called every second
          if the air pressure has changed since the last call! }
  oBricklet.SetAirPressureCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oiPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
