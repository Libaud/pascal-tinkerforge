program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDualAnalogInV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDualAnalogInV2;
  public
    procedure VoltageCB(sender: TBrickletIndustrialDualAnalogInV2; const channel: byte;
                        const voltage: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual Analog In Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for voltage callback }
procedure TExample.VoltageCB(sender: TBrickletIndustrialDualAnalogInV2;
                             const channel: byte; const voltage: longint);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletIndustrialDualAnalogInV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register voltage callback to procedure VoltageCB }
	  oBricklet.OnVoltage := {$ifdef FPC}@{$endif}VoltageCB;

	  { Set period for voltage (channel 0) callback to 1s (1000ms) without a threshold }
	  oBricklet.SetVoltageCallbackConfiguration(0, 1000, false, 'x', 0, 0);

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
