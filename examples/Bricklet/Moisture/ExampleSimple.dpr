program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMoisture;

type
  TExample = class
  private
    ipcon: TIPConnection;
    m: TBrickletMoisture;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Moisture Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var moisture: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  m := TBrickletMoisture.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current moisture value }
  moisture := m.GetMoistureValue;
  WriteLn(Format('Moisture Value: %d', [moisture]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
