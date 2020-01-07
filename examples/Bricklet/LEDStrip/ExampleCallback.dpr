program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLEDStrip;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLEDStrip;
    r: {$ifdef FPC}array [0..15] of byte{$else}TArray0To15OfUInt8{$endif};
    g: {$ifdef FPC}array [0..15] of byte{$else}TArray0To15OfUInt8{$endif};
    b: {$ifdef FPC}array [0..15] of byte{$else}TArray0To15OfUInt8{$endif};
    rIndex: integer;
  public
    procedure FrameRenderedCB(sender: TBrickletLEDStrip; const length: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LED Strip Bricklet }
  NUM_LEDS = 16;

var
  e: TExample;

{ Use frame rendered callback to move the active LED every frame }
procedure TExample.FrameRenderedCB(sender: TBrickletLEDStrip; const length: word);
begin
  b[rIndex] := 0;
  if rIndex = NUM_LEDS-1 then begin
    rIndex := 0
  end
  else begin
    rIndex := rIndex + 1
  end;
  b[rIndex] := 255;

  { Set new data for next render cycle }
  sender.SetRGBValues(0, NUM_LEDS, r, g, b);
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletLEDStrip.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Set frame duration to 50ms (20 frames per second) }
	  oBricklet.SetFrameDuration(50);

	  { Register frame rendered callback to procedure FrameRenderedCB }
	  oBricklet.OnFrameRendered := {$ifdef FPC}@{$endif}FrameRenderedCB;

	  { Set initial rgb values to get started }
	  oBricklet.SetRGBValues(0, NUM_LEDS, r, g, b);

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
