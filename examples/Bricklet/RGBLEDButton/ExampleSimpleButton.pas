program ExampleSimpleButton;

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
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RGB LED Button Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var state: byte;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rlb := TBrickletRGBLEDButton.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current button state }
  state := rlb.GetButtonState;

  if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_PRESSED) then begin
    WriteLn('State: Pressed');
  end
  else if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_RELEASED) then begin
    WriteLn('State: Released');
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
