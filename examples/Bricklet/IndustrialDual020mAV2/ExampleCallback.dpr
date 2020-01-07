program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDual020mAV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDual020mAV2;
  public
    procedure CurrentCB(sender: TBrickletIndustrialDual020mAV2; const channel: byte;
                        const current: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for current callback }
procedure TExample.CurrentCB(sender: TBrickletIndustrialDual020mAV2; const channel: byte;
                             const current: longint);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Current: %f mA', [current/1000000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialDual020mAV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register current callback to procedure CurrentCB }
	  oBricklet.OnCurrent := {$ifdef FPC}@{$endif}CurrentCB;

	  { Set period for current (channel 0) callback to 1s (1000ms) without a threshold }
	  oBricklet.SetCurrentCallbackConfiguration(0, 1000, false, 'x', 0, 0);

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
