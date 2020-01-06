program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColor;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletColor;
  public
    procedure ColorCB(sender: TBrickletColor; const r: word; const g: word; const b: word;
                      const c_: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Color Bricklet }

var
  e: TExample;

{ Callback procedure for color callback }
procedure TExample.ColorCB(sender: TBrickletColor; const r: word; const g: word;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletColor.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register color callback to procedure ColorCB }
    oBricklet.OnColor:= {$ifdef FPC}@{$endif}ColorCB;

    { Set period for color callback to 1s (1000ms)
      Note: The color callback is only called every second
            if the color has changed since the last call! }
    oBricklet.SetColorCallbackPeriod(1000);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
