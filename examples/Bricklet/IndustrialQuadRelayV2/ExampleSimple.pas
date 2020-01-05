program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialQuadRelayV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    iqr: TBrickletIndustrialQuadRelayV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Quad Relay Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  iqr:= TBrickletIndustrialQuadRelayV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn relays alternating on/off 10 times with 100 ms delay }
  for i:= 0 to 9 do begin
    Sleep(100);
    iqr.SetValue([true, false, false, false]);
    Sleep(100);
    iqr.SetValue([false, true, false, false]);
    Sleep(100);
    iqr.SetValue([false, false, true, false]);
    Sleep(100);
    iqr.SetValue([false, false, false, true]);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
