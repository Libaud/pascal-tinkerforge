program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletGPS;

type
  TExample = class
  private
    ipcon: TIPConnection;
    gps: TBrickletGPS;
  public
    procedure CoordinatesCB(sender: TBrickletGPS; const latitude: longword;
                            const ns: char; const longitude: longword; const ew: char;
                            const pdop: word; const hdop: word; const vdop: word;
                            const epe: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your GPS Bricklet }

var
  e: TExample;

{ Callback procedure for coordinates callback }
procedure TExample.CoordinatesCB(sender: TBrickletGPS; const latitude: longword;
                                 const ns: char; const longitude: longword;
                                 const ew: char; const pdop: word; const hdop: word;
                                 const vdop: word; const epe: word);
begin
  WriteLn(Format('Latitude: %f °', [latitude/1000000.0]));
  WriteLn(Format('N/S: %s', [ns]));
  WriteLn(Format('Longitude: %f °', [longitude/1000000.0]));
  WriteLn(Format('E/W: %s', [ew]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  gps := TBrickletGPS.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register coordinates callback to procedure CoordinatesCB }
  gps.OnCoordinates := {$ifdef FPC}@{$endif}CoordinatesCB;

  { Set period for coordinates callback to 1s (1000ms)
    Note: The coordinates callback is only called every second
          if the coordinates has changed since the last call! }
  gps.SetCoordinatesCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
