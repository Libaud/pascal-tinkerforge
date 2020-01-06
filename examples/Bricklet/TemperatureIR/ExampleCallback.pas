program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIR;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletTemperatureIR;
  public
    procedure ObjectTemperatureCB(sender: TBrickletTemperatureIR;
                                  const temperature: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Temperature IR Bricklet }

var
  e: TExample;

{ Callback procedure for object temperature callback }
procedure TExample.ObjectTemperatureCB(sender: TBrickletTemperatureIR;
                                       const temperature: smallint);
begin
  WriteLn(Format('Object Temperature: %f °C', [temperature/10.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletTemperatureIR.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register object temperature callback to procedure ObjectTemperatureCB }
    oBricklet.OnObjectTemperature:= {$ifdef FPC}@{$endif}ObjectTemperatureCB;

    { Set period for object temperature callback to 1s (1000ms)
      Note: The object temperature callback is only called every second
            if the object temperature has changed since the last call! }
    oBricklet.SetObjectTemperatureCallbackPeriod(1000);

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
