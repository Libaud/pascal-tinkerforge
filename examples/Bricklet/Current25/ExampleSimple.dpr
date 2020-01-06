program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCurrent25;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCurrent25;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Current25 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var current: smallint;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletCurrent25.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current current }
  current := oBricklet.GetCurrent;
  WriteLn(Format('Current: %f A', [current/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
