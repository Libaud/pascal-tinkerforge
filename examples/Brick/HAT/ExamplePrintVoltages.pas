program ExamplePrintVoltages;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickHAT;

type
  TExample = class
  private
    ipcon: TIPConnection;
    hat: TBrickHAT;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your HAT Brick }

var
  e: TExample;

procedure TExample.Execute;
var voltageUSB, voltageDC: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  hat := TBrickHAT.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current get voltages }
  hat.GetVoltages(voltageUSB, voltageDC);

  WriteLn(Format('Voltage USB: %f V', [voltageUSB/1000.0]));
  WriteLn(Format('Voltage DC: %f V', [voltageDC/1000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
