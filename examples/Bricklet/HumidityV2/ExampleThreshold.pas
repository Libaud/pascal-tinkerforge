program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHumidityV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
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
  WriteLn('Recommended humidity for human comfort is 30 to 60 %RH.');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  h := TBrickletHumidityV2.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register humidity callback to procedure HumidityCB }
  h.OnHumidity := {$ifdef FPC}@{$endif}HumidityCB;

  { Configure threshold for humidity "outside of 30 to 60 %RH"
    with a debounce period of 10s (10000ms) }
  h.SetHumidityCallbackConfiguration(10000, false, 'o', 30*100, 60*100);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
