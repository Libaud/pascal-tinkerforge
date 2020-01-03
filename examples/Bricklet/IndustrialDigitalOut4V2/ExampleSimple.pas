program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalOut4V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ido4: TBrickletIndustrialDigitalOut4V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital Out 4 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var i: integer;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ido4 := TBrickletIndustrialDigitalOut4V2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set channels alternating high/low 10 times with 100 ms delay }
  for i := 0 to 9 do begin
    Sleep(100);
    ido4.SetValue([true, false, false, false]);
    Sleep(100);
    ido4.SetValue([false, true, false, false]);
    Sleep(100);
    ido4.SetValue([false, false, true, false]);
    Sleep(100);
    ido4.SetValue([false, false, false, true]);
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
