program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickServo;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickServo;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your Servo Brick }

var
  e: TExample;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBrick:= TBrickServo.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Configure two servos with voltage 5.5V
      oBrick 1: Connected to port 0, period of 19.5ms, pulse width of 1 to 2ms
               and operating angle -100 to 100°

      oBrick 2: Connected to port 5, period of 20ms, pulse width of 0.95
               to 1.95ms and operating angle -90 to 90° }
    oBrick.SetOutputVoltage(5500);

    oBrick.SetDegree(0, -10000, 10000);
    oBrick.SetPulseWidth(0, 1000, 2000);
    oBrick.SetPeriod(0, 19500);
    oBrick.SetAcceleration(0, 1000); { Slow acceleration }
    oBrick.SetVelocity(0, 65535); { Full speed }

    oBrick.SetDegree(5, -9000, 9000);
    oBrick.SetPulseWidth(5, 950, 1950);
    oBrick.SetPeriod(5, 20000);
    oBrick.SetAcceleration(5, 65535); { Full acceleration }
    oBrick.SetVelocity(5, 65535); { Full speed }

    oBrick.SetPosition(0, 10000); { Set to most right position }
    oBrick.Enable(0);

    oBrick.SetPosition(5, -9000); { Set to most left position }
    oBrick.Enable(5);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBrick.Disable(0);
    oBrick.Disable(5);
    oBrick.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
