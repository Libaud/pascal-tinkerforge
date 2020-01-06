program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltageCurrentV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    vc: TBrickletVoltageCurrentV2;
  public
    procedure PowerCB(sender: TBrickletVoltageCurrentV2; const power: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage/Current Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for power callback }
procedure TExample.PowerCB(sender: TBrickletVoltageCurrentV2; const power: longint);
begin
  WriteLn(Format('power: %f W', [power/1000.0]));
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  vc:= TBrickletVoltageCurrentV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register power callback to procedure PowerCB }
  vc.OnPower:= {$ifdef FPC}@{$endif}PowerCB;

  { Configure threshold for power "greater than 10 W"
    with a debounce period of 1s (1000ms) }
  vc.SetPowerCallbackConfiguration(1000, false, '>', 10*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
