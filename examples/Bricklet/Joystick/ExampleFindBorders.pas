program ExampleFindBorders;

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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletJoystick.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get threshold callbacks with a debounce time of 0.2 seconds (200ms) }
    oBricklet.SetDebouncePeriod(200);

    { Register position reached callback to procedure PositionReachedCB }
    oBricklet.OnPositionReached:= {$ifdef FPC}@{$endif}PositionReachedCB;

    { Configure threshold for position "outside of -99, -99 to 99, 99" }
    oBricklet.SetPositionCallbackThreshold('o', -99, 99, -99, 99);

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
