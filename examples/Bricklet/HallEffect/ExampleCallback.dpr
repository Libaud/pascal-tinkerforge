program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHallEffect;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletHallEffect;
  public
    procedure EdgeCountCB(sender: TBrickletHallEffect; const count: longword;
                          const value: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Hall Effect Bricklet }

var
  e: TExample;

{ Callback procedure for edge count callback }
procedure TExample.EdgeCountCB(sender: TBrickletHallEffect; const count: longword;
                               const value: boolean);
begin
  WriteLn(Format('Count: %d', [count]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletHallEffect.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register edge count callback to procedure EdgeCountCB }
	  oBricklet.OnEdgeCount := {$ifdef FPC}@{$endif}EdgeCountCB;

	  { Set period for edge count callback to 0.05s (50ms)
		Note: The edge count callback is only called every 0.05 seconds
			  if the edge count has changed since the last call! }
	  oBricklet.SetEdgeCountCallbackPeriod(50);

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
