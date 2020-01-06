program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialQuadRelay;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialQuadRelay;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Quad Relay Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIndustrialQuadRelay.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Turn relays alternating on/off 10 times with 100 ms delay }
    for i:= 0 to 9 do begin
      Sleep(100);
      oBricklet.SetValue(1 shl 0);
      Sleep(100);
      oBricklet.SetValue(1 shl 1);
      Sleep(100);
      oBricklet.SetValue(1 shl 2);
      Sleep(100);
      oBricklet.SetValue(1 shl 3);
    end;

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
