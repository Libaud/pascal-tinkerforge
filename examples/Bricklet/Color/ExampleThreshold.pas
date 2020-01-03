program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColor;

type
  TExample = class
  private
    ipcon: TIPConnection;
    c: TBrickletColor;
  public
    procedure ColorReachedCB(sender: TBrickletColor; const r: word; const g: word;
                             const b: word; const c_: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Color Bricklet }

var
  e: TExample;

{ Callback procedure for color reached callback }
procedure TExample.ColorReachedCB(sender: TBrickletColor; const r: word; const g: word;
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
  ipcon := TIPConnection.Create;

  { Create device object }
  c := TBrickletColor.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  c.SetDebouncePeriod(10000);

  { Register color reached callback to procedure ColorReachedCB }
  c.OnColorReached := {$ifdef FPC}@{$endif}ColorReachedCB;

  { Configure threshold for color "greater than 100, 200, 300, 400" }
  c.SetColorCallbackThreshold('>', 100, 0, 200, 0, 300, 0, 400, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
