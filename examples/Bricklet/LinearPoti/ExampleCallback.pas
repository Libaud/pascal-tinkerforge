program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLinearPoti;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lp: TBrickletLinearPoti;
  public
    procedure PositionCB(sender: TBrickletLinearPoti; const position: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Linear Poti Bricklet }

var
  e: TExample;

{ Callback procedure for position callback }
procedure TExample.PositionCB(sender: TBrickletLinearPoti; const position: word);
begin
  WriteLn(Format('Position: %d', [position])); { Range: 0 to 100 }
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lp := TBrickletLinearPoti.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position callback to procedure PositionCB }
  lp.OnPosition := {$ifdef FPC}@{$endif}PositionCB;

  { Set period for position callback to 0.05s (50ms)
    Note: The position callback is only called every 0.05 seconds
          if the position has changed since the last call! }
  lp.SetPositionCallbackPeriod(50);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
