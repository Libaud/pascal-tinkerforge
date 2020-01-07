program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCurrent25;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCurrent25;
  public
    procedure CurrentCB(sender: TBrickletCurrent25; const current: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Current25 Bricklet }

var
  e: TExample;

{ Callback procedure for current callback }
procedure TExample.CurrentCB(sender: TBrickletCurrent25; const current: smallint);
begin
  WriteLn(Format('Current: %f A', [current/1000.0]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletCurrent25.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register current callback to procedure CurrentCB }
	  oBricklet.OnCurrent := {$ifdef FPC}@{$endif}CurrentCB;

	  { Set period for current callback to 1s (1000ms)
		Note: The current callback is only called every second
			  if the current has changed since the last call! }
	  oBricklet.SetCurrentCallbackPeriod(1000);

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
