program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motorized Linear Poti Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var position: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  mlp := TBrickletMotorizedLinearPoti.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current position }
  position := mlp.GetPosition;
  WriteLn(Format('Position: %d', [position])); { Range: 0 to 100 }

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
