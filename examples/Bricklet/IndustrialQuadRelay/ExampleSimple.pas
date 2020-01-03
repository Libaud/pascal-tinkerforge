program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialQuadRelay;

type
  TExample = class
  private
    ipcon: TIPConnection;
    iqr: TBrickletIndustrialQuadRelay;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  iqr := TBrickletIndustrialQuadRelay.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn relays alternating on/off 10 times with 100 ms delay }
  for i := 0 to 9 do begin
    Sleep(100);
    iqr.SetValue(1 shl 0);
    Sleep(100);
    iqr.SetValue(1 shl 1);
    Sleep(100);
    iqr.SetValue(1 shl 2);
    Sleep(100);
    iqr.SetValue(1 shl 3);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
