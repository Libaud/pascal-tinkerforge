program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColorV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    c: TBrickletColorV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Color Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var r, g, b, c_: word;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  c:= TBrickletColorV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current color }
  c.GetColor(r, g, b, c_);

  WriteLn(Format('Color [R]: %d', [r]));
  WriteLn(Format('Color [G]: %d', [g]));
  WriteLn(Format('Color [B]: %d', [b]));
  WriteLn(Format('Color [C]: %d', [c_]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
