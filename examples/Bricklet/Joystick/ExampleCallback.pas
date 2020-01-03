program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletJoystick;

type
  TExample = class
  private
    ipcon: TIPConnection;
    j: TBrickletJoystick;
  public
    procedure PressedCB(sender: TBrickletJoystick);
    procedure ReleasedCB(sender: TBrickletJoystick);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Joystick Bricklet }

var
  e: TExample;

{ Callback procedure for pressed callback }
procedure TExample.PressedCB(sender: TBrickletJoystick);
begin
  WriteLn('Pressed');
end;

{ Callback procedure for released callback }
procedure TExample.ReleasedCB(sender: TBrickletJoystick);
begin
  WriteLn('Released');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  j := TBrickletJoystick.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register pressed callback to procedure PressedCB }
  j.OnPressed := {$ifdef FPC}@{$endif}PressedCB;

  { Register released callback to procedure ReleasedCB }
  j.OnReleased := {$ifdef FPC}@{$endif}ReleasedCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
