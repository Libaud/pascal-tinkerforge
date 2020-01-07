program ExampleHelloWorld;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD20x4;

type
  TExample = class
  private
    oiPConnection: TIPConnection;
    oBricklet: TBrickletLCD20x4;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 20x4 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oiPConnection := TIPConnection.Create(nil);

    { Create device object }
    oBricklet := TBrickletLCD20x4.Create(nil);
    oBricklet.UIDString:= UID;
    oBricklet.IPConnection:= oIPConnection;

    { Connect to brickd }
    oiPConnection.Connect(HOST, PORT);
    { Don't use device before oIPConnection is connected }

    { Turn backlight on }
    oBricklet.BacklightOn;

    { Write "Hello World" }
    oBricklet.WriteLine(0, 0, 'Hello World');

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oiPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
