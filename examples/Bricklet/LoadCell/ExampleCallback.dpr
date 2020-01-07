program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLoadCell;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLoadCell;
  public
    procedure WeightCB(sender: TBrickletLoadCell; const weight: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Load Cell Bricklet }

var
  e: TExample;

{ Callback procedure for weight callback }
procedure TExample.WeightCB(sender: TBrickletLoadCell; const weight: longint);
begin
  WriteLn(Format('Weight: %d g', [weight]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletLoadCell.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register weight callback to procedure WeightCB }
	  oBricklet.OnWeight := {$ifdef FPC}@{$endif}WeightCB;

	  { Set period for weight callback to 1s (1000ms)
		Note: The weight callback is only called every second
			  if the weight has changed since the last call! }
	  oBricklet.SetWeightCallbackPeriod(1000);

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
