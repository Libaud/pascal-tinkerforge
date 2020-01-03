program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotionDetectorV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    md: TBrickletMotionDetectorV2;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  md := TBrickletMotionDetectorV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register motion detected callback to procedure MotionDetectedCB }
  md.OnMotionDetected := {$ifdef FPC}@{$endif}MotionDetectedCB;

  { Register detection cycle ended callback to procedure DetectionCycleEndedCB }
  md.OnDetectionCycleEnded := {$ifdef FPC}@{$endif}DetectionCycleEndedCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
