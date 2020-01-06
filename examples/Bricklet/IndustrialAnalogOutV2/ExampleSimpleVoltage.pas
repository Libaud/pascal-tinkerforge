program ExampleSimpleVoltage;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialAnalogOutV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    iao: TBrickletIndustrialAnalogOutV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Analog Out Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  iao:= TBrickletIndustrialAnalogOutV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set output voltage to 3.3V }
  iao.SetVoltage(3300);
  iao.SetEnabled(true);

  WriteLn('Press key to exit');
  ReadLn;
  iao.SetEnabled(false);
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
