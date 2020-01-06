program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLEDStripV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    ls: TBrickletLEDStripV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LED Strip Bricklet 2.0 }

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
  ls:= TBrickletLEDStripV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set first 3 LEDs to red, green and blue }
  ls.SetLEDValues(0, [255, 0, 0, 0, 255, 0, 0, 0, 255]);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
