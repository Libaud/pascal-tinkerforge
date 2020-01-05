program ExampleSetSegments;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSegmentDisplay4x7V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    sd: TBrickletSegmentDisplay4x7V2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Segment Display 4x7 Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  sd:= TBrickletSegmentDisplay4x7V2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  sd.SetBrightness(7); { Set to full brightness }

  { Activate all segments }
  sd.SetSegments([true, true, true, true, true, true, true, true],
                 [true, true, true, true, true, true, true, true],
                 [true, true, true, true, true, true, true, true],
                 [true, true, true, true, true, true, true, true], [true, true], true);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
