program ExampleCallback;

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
    procedure CoordinatesCB(sender: TBrickletGPSV2; const latitude: longword;
                            const ns: char; const longitude: longword; const ew: char);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your GPS Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for coordinates callback }
procedure TExample.CoordinatesCB(sender: TBrickletGPSV2; const latitude: longword;
                                 const ns: char; const longitude: longword;
                                 const ew: char);
begin
  WriteLn(Format('Latitude: %f °', [latitude/1000000.0]));
  WriteLn(Format('N/S: %s', [ns]));
  WriteLn(Format('Longitude: %f °', [longitude/1000000.0]));
  WriteLn(Format('E/W: %s', [ew]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletGPSV2.Create(nil);
    oBricklet.IPConnection:= oIPConnection;
    oBricklet.UIDString:= UID;
    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register coordinates callback to procedure CoordinatesCB }
    oBricklet.OnCoordinates:= {$ifdef FPC}@{$endif}CoordinatesCB;

    { Set period for coordinates callback to 1s (1000ms)
      Note: The coordinates callback is only called every second
            if the coordinates has changed since the last call! }
    oBricklet.SetCoordinatesCallbackPeriod(1000);

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
