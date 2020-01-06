program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletJoystick;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletJoystick;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletJoystick.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register pressed callback to procedure PressedCB }
    oBricklet.OnPressed:= {$ifdef FPC}@{$endif}PressedCB;

    { Register released callback to procedure ReleasedCB }
    oBricklet.OnReleased:= {$ifdef FPC}@{$endif}ReleasedCB;

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
