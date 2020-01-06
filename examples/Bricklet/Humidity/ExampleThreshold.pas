program ExampleThreshold;

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
    procedure HumidityReachedCB(sender: TBrickletHumidity; const humidity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet }

var
  e: TExample;

{ Callback procedure for humidity reached callback }
procedure TExample.HumidityReachedCB(sender: TBrickletHumidity; const humidity: word);
begin
  WriteLn(Format('Humidity: %f %%RH', [humidity/10.0]));
  WriteLn('Recommended humidity for human comfort is 30 to 60 %RH.');
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  h:= TBrickletHumidity.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  h.SetDebouncePeriod(10000);

  { Register humidity reached callback to procedure HumidityReachedCB }
  h.OnHumidityReached:= {$ifdef FPC}@{$endif}HumidityReachedCB;

  { Configure threshold for humidity "outside of 30 to 60 %RH" }
  h.SetHumidityCallbackThreshold('o', 30*10, 60*10);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
