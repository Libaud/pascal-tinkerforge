program ExampleConfiguration;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickServo;

type
  TExample = class
  private
    ipcon: TIPConnection;
    servo: TBrickServo;
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
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  servo := TBrickServo.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Configure two servos with voltage 5.5V
    Servo 1: Connected to port 0, period of 19.5ms, pulse width of 1 to 2ms
             and operating angle -100 to 100°

    Servo 2: Connected to port 5, period of 20ms, pulse width of 0.95
             to 1.95ms and operating angle -90 to 90° }
  servo.SetOutputVoltage(5500);

  servo.SetDegree(0, -10000, 10000);
  servo.SetPulseWidth(0, 1000, 2000);
  servo.SetPeriod(0, 19500);
  servo.SetAcceleration(0, 1000); { Slow acceleration }
  servo.SetVelocity(0, 65535); { Full speed }

  servo.SetDegree(5, -9000, 9000);
  servo.SetPulseWidth(5, 950, 1950);
  servo.SetPeriod(5, 20000);
  servo.SetAcceleration(5, 65535); { Full acceleration }
  servo.SetVelocity(5, 65535); { Full speed }

  servo.SetPosition(0, 10000); { Set to most right position }
  servo.Enable(0);

  servo.SetPosition(5, -9000); { Set to most left position }
  servo.Enable(5);

  WriteLn('Press key to exit');
  ReadLn;
  servo.Disable(0);
  servo.Disable(5);
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
