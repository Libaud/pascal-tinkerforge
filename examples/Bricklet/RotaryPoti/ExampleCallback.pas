program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryPoti;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    rp: TBrickletRotaryPoti;
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
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  rp:= TBrickletRotaryPoti.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position callback to procedure PositionCB }
  rp.OnPosition:= {$ifdef FPC}@{$endif}PositionCB;

  { Set period for position callback to 0.05s (50ms)
    Note: The position callback is only called every 0.05 seconds
          if the position has changed since the last call! }
  rp.SetPositionCallbackPeriod(50);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
