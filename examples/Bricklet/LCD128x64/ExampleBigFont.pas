program ExampleBigFont;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD128x64;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lcd: TBrickletLCD128x64;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 128x64 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lcd := TBrickletLCD128x64.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Clear display }
  lcd.ClearDisplay;

  { Write "Hello World" with big 24x32 font }
  lcd.DrawText(0, 0, BRICKLET_LCD_128X64_FONT_24X32, BRICKLET_LCD_128X64_COLOR_BLACK,
               '24x32');

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
