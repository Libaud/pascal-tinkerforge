program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSegmentDisplay4x7;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    sd: TBrickletSegmentDisplay4x7;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Segment Display 4x7 Bricklet }
  DIGITS : array [0..15] of byte = ($3f,$06,$5b,$4f,
                                    $66,$6d,$7d,$07,
                                    $7f,$6f,$77,$7c,
                                    $39,$5e,$79,$71);

var
  e: TExample;

procedure TExample.Execute;
var segments: array [0..3] of byte;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  sd:= TBrickletSegmentDisplay4x7.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Write "4223" to the display with full brightness without colon }
  segments[0]:= DIGITS[4];
  segments[1]:= DIGITS[2];
  segments[2]:= DIGITS[2];
  segments[3]:= DIGITS[3];
  sd.SetSegments(segments, 7, false);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
