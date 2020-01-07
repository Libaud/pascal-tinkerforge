program ExampleHelloWorld;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD16x2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLCD16x2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 16x2 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection := TIPConnection.Create(nil);

    { Create device object }
    oBricklet := TBrickletLCD16x2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before oIPConnection is connected }

    { Turn backlight on }
    oBricklet.BacklightOn;

    { Write "Hello World" }
    oBricklet.WriteLine(0, 0, 'Hello World');

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
