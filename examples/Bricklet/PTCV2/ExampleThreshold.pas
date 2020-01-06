program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletPTCV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletPTCV2;
  public
    procedure TemperatureCB(sender: TBrickletPTCV2; const temperature: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your PTC Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for temperature callback }
procedure TExample.TemperatureCB(sender: TBrickletPTCV2; const temperature: longint);
begin
  WriteLn(Format('Temperature: %f °C', [temperature/100.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletPTCV2.Create(nil);

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
