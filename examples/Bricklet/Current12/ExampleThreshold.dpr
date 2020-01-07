program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletCurrent12;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletCurrent12;
  public
    procedure CurrentReachedCB(sender: TBrickletCurrent12; const current: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Current12 Bricklet }

var
  e: TExample;

{ Callback procedure for current reached callback }
procedure TExample.CurrentReachedCB(sender: TBrickletCurrent12; const current: smallint);
begin
  WriteLn(Format('Current: %f A', [current/1000.0]));
end;

procedure TExample.Execute;
begin
	try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletCurrent12.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
	  oBricklet.SetDebouncePeriod(10000);

	  { Register current reached callback to procedure CurrentReachedCB }
	  oBricklet.OnCurrentReached := {$ifdef FPC}@{$endif}CurrentReachedCB;

	  { Configure threshold for current "greater than 5 A" }
	  oBricklet.SetCurrentCallbackThreshold('>', 5*1000, 0);

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
