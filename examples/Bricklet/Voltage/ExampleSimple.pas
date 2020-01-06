program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltage;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletVoltage;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var voltage: word;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletVoltage.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current voltage }
    voltage:= oBricklet.GetVoltage;
    WriteLn(Format('Voltage: %f V', [voltage/1000.0]));

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
