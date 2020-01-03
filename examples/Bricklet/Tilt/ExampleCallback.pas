program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTilt;

type
  TExample = class
  private
    ipcon: TIPConnection;
    t: TBrickletTilt;
  public
    procedure TiltStateCB(sender: TBrickletTilt; const state: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Tilt Bricklet }

var
  e: TExample;

{ Callback procedure for tilt state callback }
procedure TExample.TiltStateCB(sender: TBrickletTilt; const state: byte);
begin
  if (state = BRICKLET_TILT_TILT_STATE_CLOSED) then begin
    WriteLn('Tilt State: Closed');
  end
  else if (state = BRICKLET_TILT_TILT_STATE_OPEN) then begin
    WriteLn('Tilt State: Open');
  end
  else if (state = BRICKLET_TILT_TILT_STATE_CLOSED_VIBRATING) then begin
    WriteLn('Tilt State: Closed Vibrating');
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  t := TBrickletTilt.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Enable tilt state callback }
  t.EnableTiltStateCallback;

  { Register tilt state callback to procedure TiltStateCB }
  t.OnTiltState := {$ifdef FPC}@{$endif}TiltStateCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
