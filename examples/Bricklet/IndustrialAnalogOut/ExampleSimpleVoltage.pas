program ExampleSimpleVoltage;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialAnalogOut;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialAnalogOut;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Analog Out Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Create device object }
  oBricklet:= TBrickletIndustrialAnalogOut.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set output voltage to 3.3V }
  oBricklet.SetVoltage(3300);
  oBricklet.Enable;

  WriteLn('Press key to exit');
  ReadLn;
  oBricklet.Disable;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
