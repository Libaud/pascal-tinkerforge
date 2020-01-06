program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletTilt;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletTilt;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Tilt Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var state: byte;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletTilt.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current tilt state }
  state := oBricklet.GetTiltState;

  if (state = BRICKLET_TILT_TILT_STATE_CLOSED) then begin
    WriteLn('Tilt State: Closed');
  end
  else if (state = BRICKLET_TILT_TILT_STATE_OPEN) then begin
    WriteLn('Tilt State: Open');
  end
  else if (state = BRICKLET_TILT_TILT_STATE_CLOSED_VIBRATING) then begin
    WriteLn('Tilt State: Closed Vibrating');
  end;

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
