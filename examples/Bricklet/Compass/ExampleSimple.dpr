﻿program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCompass;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCompass;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Compass Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var heading: smallint;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletCompass.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current heading }
  heading := oBricklet.GetHeading;
  WriteLn(Format('Heading: %f °', [heading/10.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
