program ExampleThreshold;

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
    procedure AccelerationReachedCB(sender: TBrickletAccelerometer; const x: smallint;
                                    const y: smallint; const z: smallint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Accelerometer Bricklet }

var
  e: TExample;

{ Callback procedure for acceleration reached callback }
procedure TExample.AccelerationReachedCB(sender: TBrickletAccelerometer;
                                         const x: smallint; const y: smallint;
                                         const z: smallint);
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
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
	  oBricklet.SetDebouncePeriod(10000);

	  { Register acceleration reached callback to procedure AccelerationReachedCB }
	  oBricklet.OnAccelerationReached := {$ifdef FPC}@{$endif}AccelerationReachedCB;

	  { Configure threshold for acceleration "greater than 2 g, 2 g, 2 g" }
	  oBricklet.SetAccelerationCallbackThreshold('>', 2*1000, 0, 2*1000, 0, 2*1000, 0);

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
