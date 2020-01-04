program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDual020mAV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    id020: TBrickletIndustrialDual020mAV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var current: longint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  id020 := TBrickletIndustrialDual020mAV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current current from channel 0 }
  current := id020.GetCurrent(0);
  WriteLn(Format('Current (Channel 0): %f mA', [current/1000000.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
