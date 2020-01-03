program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryEncoder;

type
  TExample = class
  private
    ipcon: TIPConnection;
    re: TBrickletRotaryEncoder;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Rotary Encoder Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var count: longint;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  re := TBrickletRotaryEncoder.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current count without reset }
  count := re.GetCount(false);
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
