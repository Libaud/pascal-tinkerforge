program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRGBLEDButton;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRGBLEDButton;
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
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletRGBLEDButton.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register button state changed callback to procedure ButtonStateChangedCB }
	  oBricklet.OnButtonStateChanged := {$ifdef FPC}@{$endif}ButtonStateChangedCB;

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
