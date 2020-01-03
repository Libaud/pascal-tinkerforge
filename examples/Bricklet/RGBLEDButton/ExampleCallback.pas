program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRGBLEDButton;

type
  TExample = class
  private
    ipcon: TIPConnection;
    rlb: TBrickletRGBLEDButton;
  public
    procedure ButtonStateChangedCB(sender: TBrickletRGBLEDButton; const state: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RGB LED Button Bricklet }

var
  e: TExample;

{ Callback procedure for button state changed callback }
procedure TExample.ButtonStateChangedCB(sender: TBrickletRGBLEDButton; const state: byte);
begin
  if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_PRESSED) then begin
    WriteLn('State: Pressed');
  end
  else if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_RELEASED) then begin
    WriteLn('State: Released');
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rlb := TBrickletRGBLEDButton.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register button state changed callback to procedure ButtonStateChangedCB }
  rlb.OnButtonStateChanged := {$ifdef FPC}@{$endif}ButtonStateChangedCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
