program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletPTC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    ptc: TBrickletPTC;
  public
    procedure TemperatureCB(sender: TBrickletPTC; const temperature: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your PTC Bricklet }

var
  e: TExample;

{ Callback procedure for temperature callback }
procedure TExample.TemperatureCB(sender: TBrickletPTC; const temperature: longint);
begin
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  ptc:= TBrickletPTC.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register temperature callback to procedure TemperatureCB }
  ptc.OnTemperature:= {$ifdef FPC}@{$endif}TemperatureCB;

  { Set period for temperature callback to 1s (1000ms)
    Note: The temperature callback is only called every second
          if the temperature has changed since the last call! }
  ptc.SetTemperatureCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
