program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltageCurrentV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletVoltageCurrentV2;
  public
    procedure CurrentCB(sender: TBrickletVoltageCurrentV2; const current: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage/Current Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for current callback }
procedure TExample.CurrentCB(sender: TBrickletVoltageCurrentV2; const current: longint);
begin
  WriteLn(Format('Current: %f A', [current/1000.0]));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletVoltageCurrentV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register current callback to procedure CurrentCB }
	  oBricklet.OnCurrent := {$ifdef FPC}@{$endif}CurrentCB;

	  { Set period for current callback to 1s (1000ms) without a threshold }
	  oBricklet.SetCurrentCallbackConfiguration(1000, false, 'x', 0, 0);

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
