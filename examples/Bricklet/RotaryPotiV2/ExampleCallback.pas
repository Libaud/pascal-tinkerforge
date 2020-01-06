program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryPotiV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRotaryPotiV2;
  public
    procedure PositionCB(sender: TBrickletRotaryPotiV2; const position: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Rotary Poti Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for position callback }
procedure TExample.PositionCB(sender: TBrickletRotaryPotiV2; const position: smallint);
begin
  WriteLn(Format('Position: %d °', [position]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletRotaryPotiV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register position callback to procedure PositionCB }
    oBricklet.OnPosition:= {$ifdef FPC}@{$endif}PositionCB;

    { Set period for position callback to 0.25s (250ms) without a threshold }
    oBricklet.SetPositionCallbackConfiguration(250, false, 'x', 0, 0);

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
