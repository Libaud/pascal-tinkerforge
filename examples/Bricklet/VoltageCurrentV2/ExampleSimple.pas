program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltageCurrentV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  vc := TBrickletVoltageCurrentV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current voltage }
  voltage := vc.GetVoltage;
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));

  { Get current current }
  current := vc.GetCurrent;
  WriteLn(Format('Current: %f A', [current/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
