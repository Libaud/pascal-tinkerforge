program ExampleTouch;

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
    procedure TouchPositionCB(sender: TBrickletLCD128x64; const pressure: word;
                              const x: word; const y: word; const age: longword);
    procedure TouchGestureCB(sender: TBrickletLCD128x64; const gesture: byte;
                             const duration: longword; const pressureMax: word;
                             const xStart: word; const xEnd: word; const yStart: word;
                             const yEnd: word; const age: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 128x64 Bricklet }

var
  e: TExample;

{ Callback procedure for touch position callback }
procedure TExample.TouchPositionCB(sender: TBrickletLCD128x64; const pressure: word;
                                   const x: word; const y: word; const age: longword);
begin
  WriteLn(Format('Pressure: %d', [pressure]));
  WriteLn(Format('X: %d', [x]));
  WriteLn(Format('Y: %d', [y]));
  WriteLn(Format('Age: %d', [age]));
  WriteLn('');
end;

{ Callback procedure for touch gesture callback }
procedure TExample.TouchGestureCB(sender: TBrickletLCD128x64; const gesture: byte;
                                  const duration: longword; const pressureMax: word;
                                  const xStart: word; const xEnd: word;
                                  const yStart: word; const yEnd: word;
                                  const age: longword);
begin
  if (gesture = BRICKLET_LCD_128X64_GESTURE_LEFT_TO_RIGHT) then begin
    WriteLn('Gesture: Left To Right');
  end
  else if (gesture = BRICKLET_LCD_128X64_GESTURE_RIGHT_TO_LEFT) then begin
    WriteLn('Gesture: Right To Left');
  end
  else if (gesture = BRICKLET_LCD_128X64_GESTURE_TOP_TO_BOTTOM) then begin
    WriteLn('Gesture: Top To Bottom');
  end
  else if (gesture = BRICKLET_LCD_128X64_GESTURE_BOTTOM_TO_TOP) then begin
    WriteLn('Gesture: Bottom To Top');
  end;

  WriteLn(Format('Duration: %d', [duration]));
  WriteLn(Format('Pressure Max: %d', [pressureMax]));
  WriteLn(Format('X Start: %d', [xStart]));
  WriteLn(Format('X End: %d', [xEnd]));
  WriteLn(Format('Y Start: %d', [yStart]));
  WriteLn(Format('Y End: %d', [yEnd]));
  WriteLn(Format('Age: %d', [age]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lcd := TBrickletLCD128x64.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register touch position callback to procedure TouchPositionCB }
  lcd.OnTouchPosition := {$ifdef FPC}@{$endif}TouchPositionCB;

  { Register touch gesture callback to procedure TouchGestureCB }
  lcd.OnTouchGesture := {$ifdef FPC}@{$endif}TouchGestureCB;

  { Set period for touch position callback to 0.1s (100ms) }
  lcd.SetTouchPositionCallbackConfiguration(100, true);

  { Set period for touch gesture callback to 0.1s (100ms) }
  lcd.SetTouchGestureCallbackConfiguration(100, true);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
