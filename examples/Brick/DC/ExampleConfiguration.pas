program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickDC;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dc: TBrickDC;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your DC Brick }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  dc := TBrickDC.Create(nil);
  dc.IPConnection:= ipcon;
  dc.UIDString:= UID;

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  dc.SetDriveMode(BRICK_DC_DRIVE_MODE_DRIVE_COAST);
  dc.SetPWMFrequency(10000); { Use PWM frequency of 10kHz }
  dc.SetAcceleration(5000); { Slow acceleration }
  dc.SetVelocity(32767); { Full speed forward }
  dc.Enable; { Enable motor power }

  WriteLn('Press key to exit');
  ReadLn;
  dc.Disable; { Disable motor power }
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
