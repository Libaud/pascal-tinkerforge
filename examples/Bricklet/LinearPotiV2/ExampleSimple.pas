program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLinearPotiV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lp: TBrickletLinearPotiV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Linear Poti Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var position: byte;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  lp := TBrickletLinearPotiV2.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current position }
  position := lp.GetPosition;
  WriteLn(Format('Position: %d °', [position]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
