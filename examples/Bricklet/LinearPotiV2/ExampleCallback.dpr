program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLinearPotiV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lp: TBrickletLinearPotiV2;
  public
    procedure PositionCB(sender: TBrickletLinearPotiV2; const position: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Linear Poti Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for position callback }
procedure TExample.PositionCB(sender: TBrickletLinearPotiV2; const position: byte);
begin
  WriteLn(Format('Position: %d °', [position]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  lp := TBrickletLinearPotiV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position callback to procedure PositionCB }
  lp.OnPosition := {$ifdef FPC}@{$endif}PositionCB;

  { Set period for position callback to 0.25s (250ms) without a threshold }
  lp.SetPositionCallbackConfiguration(250, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
