program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletGPSV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletGPSV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your GPS Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var latitude, longitude: longword; ns, ew: char;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  oBricklet:= TBrickletGPSV2.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current coordinates }
  oBricklet.GetCoordinates(latitude, ns, longitude, ew);

  WriteLn(Format('Latitude: %f °', [latitude/1000000.0]));
  WriteLn(Format('N/S: %s', [ns]));
  WriteLn(Format('Longitude: %f °', [longitude/1000000.0]));
  WriteLn(Format('E/W: %s', [ew]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
