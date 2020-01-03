program ExamplePixelMatrix;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  Math, SysUtils, IPConnection, BrickletOLED128x64;

const
  WIDTH = 128;
  HEIGHT = 64;

type
  TPixels = array [0..(HEIGHT - 1), 0..(WIDTH - 1)] of boolean;
  TExample = class
  private
    ipcon: TIPConnection;
    oled: TBrickletOLED128x64;
  public
    procedure DrawMatrix(pixels: TPixels);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your OLED 128x64 Bricklet }

var
  e: TExample;

procedure TExample.DrawMatrix(pixels: TPixels);
var row, column, bit, i: integer;
    pages: array [0..(HEIGHT div 8 - 1), 0..(WIDTH - 1)] of byte;
    section: array [0..63] of byte;
begin
  for row := 0 to HEIGHT div 8 - 1 do begin
    for column := 0 to WIDTH - 1 do begin
      pages[row][column] := 0;
      for bit := 0 to 7 do begin
        if (pixels[(row * 8) + bit, column]) then begin
          pages[row][column] := pages[row][column] or (1 << bit);
        end;
      end;
    end;
  end;
  oled.NewWindow(0, WIDTH - 1, 0, HEIGHT div 8 - 1);
  for row := 0 to HEIGHT div 8 - 1 do begin
    column := 0;
    while column < WIDTH - 1 do begin
      for i := 0 to 63 do begin
        section[i] := pages[row][column + i];
      end;
      oled.write(section);
      column := column + 64;
    end;
  end;
end;

procedure TExample.Execute;
var row, column: integer; pixels: TPixels;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  oled := TBrickletOLED128x64.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Clear display }
  oled.ClearDisplay;

  { Draw checkerboard pattern }
  for row := 0 to HEIGHT - 1 do begin
    for column := 0 to WIDTH - 1 do begin
      pixels[row, column] := (row div 8) mod 2 = (column div 8) mod 2;
    end;
  end;

  e.DrawMatrix(pixels);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
