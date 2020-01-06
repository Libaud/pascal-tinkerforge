program ExampleSimple;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage/Current Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var voltage, current: longint;
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

  { Get current voltage }
  voltage:= vc.GetVoltage;
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));

  { Get current current }
  current:= vc.GetCurrent;
  WriteLn(Format('Current: %f A', [current/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
