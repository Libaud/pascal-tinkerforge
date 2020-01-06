program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCurrent12;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCurrent12;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Current12 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var current: smallint;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletCurrent12.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current current }
    current:= oBricklet.GetCurrent;
    WriteLn(Format('Current: %f A', [current/1000.0]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
