program ExampleCallback;

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
    procedure PressedCB(sender: TBrickletJoystickV2; const pressed: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Joystick Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for pressed callback }
procedure TExample.PressedCB(sender: TBrickletJoystickV2; const pressed: boolean);
begin
  WriteLn(Format('Pressed: %d', [pressed]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  j := TBrickletJoystickV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register pressed callback to procedure PressedCB }
  j.OnPressed := {$ifdef FPC}@{$endif}PressedCB;

  { Set period for pressed callback to 0.01s (10ms) }
  j.SetPressedCallbackConfiguration(10, true);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
