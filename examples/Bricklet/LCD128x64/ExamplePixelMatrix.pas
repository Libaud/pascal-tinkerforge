program ExamplePixelMatrix;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  Math, SysUtils, IPConnection, BrickletLCD128x64;

const
  WIDTH = 128;
  HEIGHT = 64;

type
  TPixels = array [0..(HEIGHT*WIDTH - 1)] of boolean;
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLCD128x64;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your OLED 128x64 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var row, column: integer; pixels: TPixels;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  oBricklet:= TBrickletLCD128x64.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Clear display }
  oBricklet.ClearDisplay;

  { Draw checkerboard pattern }
  for row:= 0 to HEIGHT - 1 do begin
    for column:= 0 to WIDTH - 1 do begin
      pixels[row * WIDTH + column]:= (row div 8) mod 2 = (column div 8) mod 2;
    end;
  end;

  oBricklet.WritePixels(0, 0, WIDTH-1, HEIGHT-1, pixels);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
