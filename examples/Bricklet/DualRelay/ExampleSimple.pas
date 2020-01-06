program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDualRelay;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    dr: TBrickletDualRelay;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Dual Relay Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  dr:= TBrickletDualRelay.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn relays alternating on/off 10 times with 1 second delay }
  for i:= 0 to 4 do begin
    Sleep(1000);
    dr.SetState(true, false);
    Sleep(1000);
    dr.SetState(false, true);
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
