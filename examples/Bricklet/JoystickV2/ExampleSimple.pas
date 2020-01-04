program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletJoystickV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    j: TBrickletJoystickV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Joystick Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var x, y: smallint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  j := TBrickletJoystickV2.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current position }
  j.GetPosition(x, y);

  WriteLn(Format('Position [X]: %d', [x]));
  WriteLn(Format('Position [Y]: %d', [y]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
