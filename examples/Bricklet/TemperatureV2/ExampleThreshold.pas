program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletTemperatureV2;
  public
    procedure TemperatureCB(sender: TBrickletTemperatureV2; const temperature: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for temperature callback }
procedure TExample.TemperatureCB(sender: TBrickletTemperatureV2;
                                 const temperature: smallint);
begin
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
  WriteLn('It is too hot, we need air conditioning!');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletTemperatureV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register temperature callback to procedure TemperatureCB }
    oBricklet.OnTemperature:= {$ifdef FPC}@{$endif}TemperatureCB;

    { Configure threshold for temperature "greater than 30 °C"
      with a debounce period of 1s (1000ms) }
    oBricklet.SetTemperatureCallbackConfiguration(1000, false, '>', 30*100, 0);

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
