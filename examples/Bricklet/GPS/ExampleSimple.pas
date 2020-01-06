program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletGPS;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletGPS;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your GPS Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var latitude, longitude: longword; ns, ew: char; pdop, hdop, vdop, epe: word;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletGPS.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current coordinates }
    oBricklet.GetCoordinates(latitude, ns, longitude, ew, pdop, hdop, vdop, epe);

    WriteLn(Format('Latitude: %f °', [latitude/1000000.0]));
    WriteLn(Format('N/S: %s', [ns]));
    WriteLn(Format('Longitude: %f °', [longitude/1000000.0]));
    WriteLn(Format('E/W: %s', [ew]));

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
