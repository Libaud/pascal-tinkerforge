program ExampleIndicator;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotionDetectorV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMotionDetectorV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motion Detector Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletMotionDetectorV2.Create(nil);
    oBricklet.IPConnection:= oIPConnection;
    oBricklet.UIDString:= UID;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Turn blue backlight LEDs on (maximum brightness) }
    oBricklet.SetIndicator(255, 255, 255);

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
