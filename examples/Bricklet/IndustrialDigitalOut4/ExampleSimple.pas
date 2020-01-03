program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalOut4;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ido4: TBrickletIndustrialDigitalOut4;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital Out 4 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ido4 := TBrickletIndustrialDigitalOut4.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set pins alternating high/low 10 times with 100ms delay }
  for i := 0 to 9 do begin
    Sleep(100);
    ido4.SetValue(1 shl 0);
    Sleep(100);
    ido4.SetValue(1 shl 1);
    Sleep(100);
    ido4.SetValue(1 shl 2);
    Sleep(100);
    ido4.SetValue(1 shl 3);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
