program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDual020mA;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDual020mA;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var current: longint;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIndustrialDual020mA.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current current from sensor 1 }
    current:= oBricklet.GetCurrent(1);
    WriteLn(Format('Current (Sensor 1): %f mA', [current/1000000.0]));

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
