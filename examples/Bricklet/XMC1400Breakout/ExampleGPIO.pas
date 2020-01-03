program ExampleGPIO;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletXMC1400Breakout;

type
  TExample = class
  private
    ipcon: TIPConnection;
    xb: TBrickletXMC1400Breakout;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your XMC1400 Breakout Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  xb := TBrickletXMC1400Breakout.Create(nil);
  xb.IPConnection:= ipcon;
  xb.UIDString:= UID;

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set Port 1, Pin 0 alternating high/low for 5 times with 1s delay }
  for i := 0 to 4 do begin
    Sleep(1000);
    xb.SetGPIOConfig(1, 0, BRICKLET_XMC1400_BREAKOUT_GPIO_MODE_OUTPUT_PUSH_PULL, 0,
                     false);
    Sleep(1000);
    xb.SetGPIOConfig(1, 0, BRICKLET_XMC1400_BREAKOUT_GPIO_MODE_OUTPUT_PUSH_PULL, 0,
                     true);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
