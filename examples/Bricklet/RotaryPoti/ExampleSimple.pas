program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryPoti;

type
  TExample = class
  private
    ipcon: TIPConnection;
    rp: TBrickletRotaryPoti;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Rotary Poti Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var position: smallint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  rp := TBrickletRotaryPoti.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current position }
  position := rp.GetPosition;
  WriteLn(Format('Position: %d', [position])); { Range: -150 to 150 }

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
