program ExampleCallback;

{ FIXME: This example is incomplete }

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLEDStripV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ls: TBrickletLEDStripV2;
  public
    procedure FrameStartedCB(sender: TBrickletLEDStripV2; const length: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LED Strip Bricklet 2.0 }

var
  e: TExample;

{ Use frame started callback to move the active LED every frame }
procedure TExample.FrameStartedCB(sender: TBrickletLEDStripV2; const length: word);
begin
  WriteLn(Format('Length: %d', [length]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  ls := TBrickletLEDStripV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set frame duration to 50ms (20 frames per second) }
  ls.SetFrameDuration(50);

  { Register frame started callback to procedure FrameStartedCB }
  ls.OnFrameStarted := {$ifdef FPC}@{$endif}FrameStartedCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
