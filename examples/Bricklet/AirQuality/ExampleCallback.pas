program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAirQuality;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    aq: TBrickletAirQuality;
  public
    procedure AllValuesCB(sender: TBrickletAirQuality; const iaqIndex: longint;
                          const iaqIndexAccuracy: byte; const temperature: longint;
                          const humidity: longint; const airPressure: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Air Quality Bricklet }

var
  e: TExample;

{ Callback procedure for all values callback }
procedure TExample.AllValuesCB(sender: TBrickletAirQuality; const iaqIndex: longint;
                               const iaqIndexAccuracy: byte; const temperature: longint;
                               const humidity: longint; const airPressure: longint);
begin
  WriteLn(Format('IAQ Index: %d', [iaqIndex]));

  if (iaqIndexAccuracy = BRICKLET_AIR_QUALITY_ACCURACY_UNRELIABLE) then begin
    WriteLn('IAQ Index Accuracy: Unreliable');
  end
  else if (iaqIndexAccuracy = BRICKLET_AIR_QUALITY_ACCURACY_LOW) then begin
    WriteLn('IAQ Index Accuracy: Low');
  end
  else if (iaqIndexAccuracy = BRICKLET_AIR_QUALITY_ACCURACY_MEDIUM) then begin
    WriteLn('IAQ Index Accuracy: Medium');
  end
  else if (iaqIndexAccuracy = BRICKLET_AIR_QUALITY_ACCURACY_HIGH) then begin
    WriteLn('IAQ Index Accuracy: High');
  end;

  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
  WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));
  WriteLn(Format('Air Pressure: %f hPa', [airPressure/100.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  aq:= TBrickletAirQuality.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register all values callback to procedure AllValuesCB }
  aq.OnAllValues:= {$ifdef FPC}@{$endif}AllValuesCB;

  { Set period for all values callback to 1s (1000ms) }
  aq.SetAllValuesCallbackConfiguration(1000, false);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
