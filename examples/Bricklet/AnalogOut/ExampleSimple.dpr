program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogOut;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ao: TBrickletAnalogOut;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Analog Out Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  ao := TBrickletAnalogOut.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set output voltage to 3.3V }
  ao.SetVoltage(3300);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.