program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMotionDetector;

type
  TExample = class
  private
    ipcon: TIPConnection;
    md: TBrickletMotionDetector;
  public
    procedure MotionDetectedCB(sender: TBrickletMotionDetector);
    procedure DetectionCycleEndedCB(sender: TBrickletMotionDetector);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Motion Detector Bricklet }

var
  e: TExample;

{ Callback procedure for motion detected callback }
procedure TExample.MotionDetectedCB(sender: TBrickletMotionDetector);
begin
  WriteLn('Motion Detected');
end;

{ Callback procedure for detection cycle ended callback }
procedure TExample.DetectionCycleEndedCB(sender: TBrickletMotionDetector);
begin
  WriteLn('Detection Cycle Ended (next detection possible in ~3 seconds)');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  md := TBrickletMotionDetector.Create(UID, ipcon);

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
