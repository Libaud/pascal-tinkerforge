program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Humidity Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var humidity: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  h := TBrickletHumidityV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current humidity }
  humidity := h.GetHumidity;
  WriteLn(Format('Humidity: %f %%RH', [humidity/100.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
