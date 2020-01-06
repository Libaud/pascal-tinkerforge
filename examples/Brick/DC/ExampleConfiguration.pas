program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickDC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickDC;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBrick:= TBrickDC.Create(nil);
    oBrick.IPConnection:= oIPConnection;
    oBrick.UIDString:= UID;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    oBrick.SetDriveMode(BRICK_DC_DRIVE_MODE_DRIVE_COAST);
    oBrick.SetPWMFrequency(10000); { Use PWM frequency of 10kHz }
    oBrick.SetAcceleration(5000); { Slow acceleration }
    oBrick.SetVelocity(32767); { Full speed forward }
    oBrick.Enable; { Enable motor power }

    WriteLn('Press key to exit');
    ReadLn;

  finally
    oBrick.Disable; { Disable motor power }
    oBrick.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
