program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAccelerometer;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletAccelerometer;
  public
    procedure AccelerationCB(sender: TBrickletAccelerometer; const x: smallint;
                             const y: smallint; const z: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Accelerometer Bricklet }

var
  e: TExample;

{ Callback procedure for acceleration callback }
procedure TExample.AccelerationCB(sender: TBrickletAccelerometer; const x: smallint;
                                  const y: smallint; const z: smallint);
begin
  WriteLn(Format('Acceleration [X]: %f g', [x/1000.0]));
  WriteLn(Format('Acceleration [Y]: %f g', [y/1000.0]));
  WriteLn(Format('Acceleration [Z]: %f g', [z/1000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletAccelerometer.Create(nil);
	  oBricklet.IPConnection:= oIPConnection;
	  oBricklet.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register acceleration callback to procedure AccelerationCB }
	  oBricklet.OnAcceleration := {$ifdef FPC}@{$endif}AccelerationCB;

	  { Set period for acceleration callback to 1s (1000ms)
		Note: The acceleration callback is only called every second
			  if the acceleration has changed since the last call! }
	  oBricklet.SetAccelerationCallbackPeriod(1000);

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
