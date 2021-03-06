program ExampleSimpleButton;

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

	  { Get current button state }
	  state := oBricklet.GetButtonState;

	  if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_PRESSED) then begin
		WriteLn('State: Pressed');
	  end
	  else if (state = BRICKLET_RGB_LED_BUTTON_BUTTON_STATE_RELEASED) then begin
		WriteLn('State: Released');
	  end;

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
