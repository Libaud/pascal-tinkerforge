program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogOutV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    ao: TBrickletAnalogOutV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Analog Out Bricklet 2.0 }

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
  ao:= TBrickletAnalogOutV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set output voltage to 3.3V }
  ao.SetOutputVoltage(3300);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
