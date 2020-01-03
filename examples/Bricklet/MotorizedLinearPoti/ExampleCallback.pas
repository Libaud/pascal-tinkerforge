program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotorizedLinearPoti;

type
  TExample = class
  private
    ipcon: TIPConnection;
    mlp: TBrickletMotorizedLinearPoti;
  public
    procedure PositionCB(sender: TBrickletMotorizedLinearPoti; const position: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motorized Linear Poti Bricklet }

var
  e: TExample;

{ Callback procedure for position callback }
procedure TExample.PositionCB(sender: TBrickletMotorizedLinearPoti; const position: word);
begin
  WriteLn(Format('Position: %d', [position])); { Range: 0 to 100 }
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  mlp := TBrickletMotorizedLinearPoti.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register position callback to procedure PositionCB }
  mlp.OnPosition := {$ifdef FPC}@{$endif}PositionCB;

  { Set period for position callback to 0.05s (50ms) without a threshold }
  mlp.SetPositionCallbackConfiguration(50, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
