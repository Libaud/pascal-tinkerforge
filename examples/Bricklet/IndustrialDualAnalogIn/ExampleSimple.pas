program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDualAnalogIn;

type
  TExample = class
  private
    ipcon: TIPConnection;
    idai: TBrickletIndustrialDualAnalogIn;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual Analog In Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var voltage: longint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  idai := TBrickletIndustrialDualAnalogIn.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current voltage from channel 1 }
  voltage := idai.GetVoltage(1);
  WriteLn(Format('Voltage (Channel 1): %f V', [voltage/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
