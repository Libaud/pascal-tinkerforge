program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalIn4V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    idi4: TBrickletIndustrialDigitalIn4V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital In 4 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var value: TArray0To3OfBoolean;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  idi4:= TBrickletIndustrialDigitalIn4V2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current value }
  value:= idi4.GetValue;

  WriteLn(Format('Channel 0: %d', [value[0]]));
  WriteLn(Format('Channel 1: %d', [value[1]]));
  WriteLn(Format('Channel 2: %d', [value[2]]));
  WriteLn(Format('Channel 3: %d', [value[3]]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
