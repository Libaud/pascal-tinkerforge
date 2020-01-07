program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotionDetectorV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMotionDetectorV2;
  public
    procedure MotionDetectedCB(sender: TBrickletMotionDetectorV2);
    procedure DetectionCycleEndedCB(sender: TBrickletMotionDetectorV2);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motion Detector Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for motion detected callback }
procedure TExample.MotionDetectedCB(sender: TBrickletMotionDetectorV2);
begin
  WriteLn('Motion Detected');
end;

{ Callback procedure for detection cycle ended callback }
procedure TExample.DetectionCycleEndedCB(sender: TBrickletMotionDetectorV2);
begin
  WriteLn('Detection Cycle Ended (next detection possible in ~2 seconds)');
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletMotionDetectorV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register motion detected callback to procedure MotionDetectedCB }
	  oBricklet.OnMotionDetected := {$ifdef FPC}@{$endif}MotionDetectedCB;

	  { Register detection cycle ended callback to procedure DetectionCycleEndedCB }
	  oBricklet.OnDetectionCycleEnded := {$ifdef FPC}@{$endif}DetectionCycleEndedCB;

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
