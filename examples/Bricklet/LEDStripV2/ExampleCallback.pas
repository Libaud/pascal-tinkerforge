program ExampleCallback;

{ FIXME: This example is incomplete }

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLEDStripV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLEDStripV2;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletLEDStripV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Set frame duration to 50ms (20 frames per second) }
    oBricklet.SetFrameDuration(50);

    { Register frame started callback to procedure FrameStartedCB }
    oBricklet.OnFrameStarted:= {$ifdef FPC}@{$endif}FrameStartedCB;

    WriteLn('Press key to exit');
    ReadLn;

  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
