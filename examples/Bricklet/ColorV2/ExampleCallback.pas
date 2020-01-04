program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColorV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    c: TBrickletColorV2;
  public
    procedure ColorCB(sender: TBrickletColorV2; const r: word; const g: word;
                      const b: word; const c_: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Color Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for color callback }
procedure TExample.ColorCB(sender: TBrickletColorV2; const r: word; const g: word;
                           const b: word; const c_: word);
begin
  WriteLn(Format('Color [R]: %d', [r]));
  WriteLn(Format('Color [G]: %d', [g]));
  WriteLn(Format('Color [B]: %d', [b]));
  WriteLn(Format('Color [C]: %d', [c_]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  c := TBrickletColorV2.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register color callback to procedure ColorCB }
  c.OnColor := {$ifdef FPC}@{$endif}ColorCB;

  { Set period for color callback to 0.1s (100ms) }
  c.SetColorCallbackConfiguration(100, false);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
