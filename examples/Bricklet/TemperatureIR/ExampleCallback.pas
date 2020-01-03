program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTemperatureIR;

type
  TExample = class
  private
    ipcon: TIPConnection;
    tir: TBrickletTemperatureIR;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  tir := TBrickletTemperatureIR.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register object temperature callback to procedure ObjectTemperatureCB }
  tir.OnObjectTemperature := {$ifdef FPC}@{$endif}ObjectTemperatureCB;

  { Set period for object temperature callback to 1s (1000ms)
    Note: The object temperature callback is only called every second
          if the object temperature has changed since the last call! }
  tir.SetObjectTemperatureCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
