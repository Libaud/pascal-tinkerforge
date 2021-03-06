program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletJoystickV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletJoystickV2;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletJoystickV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register pressed callback to procedure PressedCB }
    oBricklet.OnPressed:= {$ifdef FPC}@{$endif}PressedCB;

    { Set period for pressed callback to 0.01s (10ms) }
    oBricklet.SetPressedCallbackConfiguration(10, true);

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
