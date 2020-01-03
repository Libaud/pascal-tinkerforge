program ExampleSimpleCurrent;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialAnalogOut;

type
  TExample = class
  private
    ipcon: TIPConnection;
    iao: TBrickletIndustrialAnalogOut;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  iao := TBrickletIndustrialAnalogOut.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set output current to 4.5mA }
  iao.SetCurrent(4500);
  iao.Enable;

  WriteLn('Press key to exit');
  ReadLn;
  iao.Disable;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
