program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColorV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletColorV2;
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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletColorV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register color callback to procedure ColorCB }
	  oBricklet.OnColor := {$ifdef FPC}@{$endif}ColorCB;

	  { Set period for color callback to 0.1s (100ms) }
	  oBricklet.SetColorCallbackConfiguration(100, false);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
