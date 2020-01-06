program ExampleGUI;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD128x64;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLCD128x64;
  public
    procedure GUIButtonPressedCB(sender: TBrickletLCD128x64; const index: byte;
                                 const pressed: boolean);
    procedure GUISliderValueCB(sender: TBrickletLCD128x64; const index: byte;
                               const value: byte);
    procedure GUITabSelectedCB(sender: TBrickletLCD128x64; const index: shortint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 128x64 Bricklet }

var
  e: TExample;

{ Callback procedure for GUI button pressed callback }
procedure TExample.GUIButtonPressedCB(sender: TBrickletLCD128x64; const index: byte;
                                      const pressed: boolean);
begin
  WriteLn(Format('Index: %d', [index]));
  WriteLn(Format('Pressed: %d', [pressed]));
  WriteLn('');
end;

{ Callback procedure for GUI slider value callback }
procedure TExample.GUISliderValueCB(sender: TBrickletLCD128x64; const index: byte;
                                    const value: byte);
begin
  WriteLn(Format('Index: %d', [index]));
  WriteLn(Format('Value: %d', [value]));
  WriteLn('');
end;

{ Callback procedure for GUI tab selected callback }
procedure TExample.GUITabSelectedCB(sender: TBrickletLCD128x64; const index: shortint);
begin
  WriteLn(Format('Index: %d', [index]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletLCD128x64.Create(nil);
    oBricklet.IPConnection:= oIPConnection;
    oBricklet.UIDString:= UID;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register GUI button pressed callba  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
ck to procedure GUIButtonPressedCB }
    oBricklet.OnGUIButtonPressed:= {$ifdef FPC}@{$endif}GUIButtonPressedCB;

    { Register GUI slider value callback to procedure GUISliderValueCB }
    oBricklet.OnGUISliderValue:= {$ifdef FPC}@{$endif}GUISliderValueCB;

    { Register GUI tab selected callback to procedure GUITabSelectedCB }
    oBricklet.OnGUITabSelected:= {$ifdef FPC}@{$endif}GUITabSelectedCB;

    { Clear display }
    oBricklet.ClearDisplay;
    oBricklet.RemoveAllGUI;

    { Add GUI elements: Button, Slider and Graph with 60 data points }
    oBricklet.SetGUIButton(0, 0, 0, 60, 20, 'button');
    oBricklet.SetGUISlider(0, 0, 30, 60, BRICKLET_LCD_128X64_DIRECTION_HORIZONTAL, 50);
    oBricklet.SetGUIGraphConfiguration(0, BRICKLET_LCD_128X64_GRAPH_TYPE_LINE, 62, 0, 60, 52,
                                 'X', 'Y');

    { Add a few data points (the remaining points will be 0) }
    oBricklet.SetGUIGraphData(0, [20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240]);

    { Add 5 text tabs without and configure it for click and swipe without auto-redraw }
    oBricklet.SetGUITabConfiguration(BRICKLET_LCD_128X64_CHANGE_TAB_ON_CLICK_AND_SWIPE, false);
    oBricklet.SetGUITabText(0, 'Tab A');
    oBricklet.SetGUITabText(1, 'Tab B');
    oBricklet.SetGUITabText(2, 'Tab C');
    oBricklet.SetGUITabText(3, 'Tab D');
    oBricklet.SetGUITabText(4, 'Tab E');

    { Set period for GUI button pressed callback to 0.1s (100ms) }
    oBricklet.SetGUIButtonPressedCallbackConfiguration(100, true);

    { Set period for GUI slider value callback to 0.1s (100ms) }
    oBricklet.SetGUISliderValueCallbackConfiguration(100, true);

    { Set period for GUI tab selected callback to 0.1s (100ms) }
    oBricklet.SetGUITabSelectedCallbackConfiguration(100, true);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
