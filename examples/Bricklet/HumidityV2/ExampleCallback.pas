program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHumidityV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    h: TBrickletHumidityV2;
  public
    procedure HumidityCB(sender: TBrickletHumidityV2; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for humidity callback }
procedure TExample.HumidityCB(sender: TBrickletHumidityV2; const humidity: word);
begin
  WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  h:= TBrickletHumidityV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register humidity callback to procedure HumidityCB }
  h.OnHumidity:= {$ifdef FPC}@{$endif}HumidityCB;

  { Set period for humidity callback to 1s (1000ms) without a threshold }
  h.SetHumidityCallbackConfiguration(1000, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
