program ExampleButtonCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD20x4;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLCD20x4;
  public
    procedure ButtonPressedCB(sender: TBrickletLCD20x4; const button: byte);
    procedure ButtonReleasedCB(sender: TBrickletLCD20x4; const button: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 20x4 Bricklet }

var
  e: TExample;

{ Callback procedure for button pressed callback }
procedure TExample.ButtonPressedCB(sender: TBrickletLCD20x4; const button: byte);
begin
  WriteLn(Format('Button Pressed: %d', [button]));
end;

{ Callback procedure for button released callback }
procedure TExample.ButtonReleasedCB(sender: TBrickletLCD20x4; const button: byte);
begin
  WriteLn(Format('Button Released: %d', [button]));
end;

procedure TExample.Execute;
begin
  try
	{ Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletLCD20x4.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register button pressed callback to procedure ButtonPressedCB }
	  oBricklet.OnButtonPressed := {$ifdef FPC}@{$endif}ButtonPressedCB;

	  { Register button released callback to procedure ButtonReleasedCB }
	  oBricklet.OnButtonReleased := {$ifdef FPC}@{$endif}ButtonReleasedCB;

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
