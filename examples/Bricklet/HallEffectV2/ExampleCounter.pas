program ExampleCounter;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHallEffectV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    he: TBrickletHallEffectV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Hall Effect Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var count: longword;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  he := TBrickletHallEffectV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current count without counter reset }
  count := he.GetCounter(false);
  WriteLn(Format('Count: %d', [count]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
