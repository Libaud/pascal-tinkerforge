program ExampleFindBorders;

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
    procedure PositionReachedCB(sender: TBrickletJoystick; const x: smallint;
                                const y: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Joystick Bricklet }

var
  e: TExample;

{ Callback procedure for position reached callback }
procedure TExample.PositionReachedCB(sender: TBrickletJoystick; const x: smallint;
                                     const y: smallint);
begin
  if (y = 100) then begin
    WriteLn('Top');
  end
  else if (y = -100) then begin
    WriteLn('Bottom');
  end;
  if (x = 100) then begin
    WriteLn('Right');
  end
  else if (x = -100) then begin
    WriteLn('Left');
  end;
  WriteLn('');
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

  { Get threshold callbacks with a debounce time of 0.2 seconds (200ms) }
  j.SetDebouncePeriod(200);

  { Register position reached callback to procedure PositionReachedCB }
  j.OnPositionReached := {$ifdef FPC}@{$endif}PositionReachedCB;

  { Configure threshold for position "outside of -99, -99 to 99, 99" }
  j.SetPositionCallbackThreshold('o', -99, 99, -99, 99);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
