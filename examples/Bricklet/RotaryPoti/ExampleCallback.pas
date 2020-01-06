program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryPoti;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRotaryPoti;
  public
    procedure PositionCB(sender: TBrickletRotaryPoti; const position: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Rotary Poti Bricklet }

var
  e: TExample;

{ Callback procedure for position callback }
procedure TExample.PositionCB(sender: TBrickletRotaryPoti; const position: smallint);
begin
  WriteLn(Format('Position: %d', [position])); { Range: -150 to 150 }
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletRotaryPoti.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register position callback to procedure PositionCB }
    oBricklet.OnPosition:= {$ifdef FPC}@{$endif}PositionCB;

    { Set period for position callback to 0.05s (50ms)
      Note: The position callback is only called every 0.05 seconds
            if the position has changed since the last call! }
    oBricklet.SetPositionCallbackPeriod(50);

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
