program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHumidity;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    h: TBrickletHumidity;
  public
    procedure HumidityCB(sender: TBrickletHumidity; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet }

var
  e: TExample;

{ Callback procedure for humidity callback }
procedure TExample.HumidityCB(sender: TBrickletHumidity; const humidity: word);
begin
  WriteLn(Format('Humidity: %f %%RH', [humidity/10.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  h:= TBrickletHumidity.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register humidity callback to procedure HumidityCB }
  h.OnHumidity:= {$ifdef FPC}@{$endif}HumidityCB;

  { Set period for humidity callback to 1s (1000ms)
    Note: The humidity callback is only called every second
          if the humidity has changed since the last call! }
  h.SetHumidityCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
