program ExampleCounterCallback;

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
    procedure CounterCB(sender: TBrickletHallEffectV2; const counter: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Hall Effect Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for counter callback }
procedure TExample.CounterCB(sender: TBrickletHallEffectV2; const counter: longword);
begin
  WriteLn(Format('Counter: %d', [counter]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  he := TBrickletHallEffectV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Configure counter with ±3000µT threshold and 10ms debounce }
  he.SetCounterConfig(3000, -3000, 10000);

  { Register counter callback to procedure CounterCB }
  he.OnCounter := {$ifdef FPC}@{$endif}CounterCB;

  { Set period for counter callback to 0.1s (100ms) }
  he.SetCounterCallbackConfiguration(100, true);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
