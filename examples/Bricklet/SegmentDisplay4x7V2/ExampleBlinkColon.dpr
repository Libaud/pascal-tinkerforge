program ExampleBlinkColon;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSegmentDisplay4x7V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
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
var i: integer;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  sd := TBrickletSegmentDisplay4x7V2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  sd.SetBrightness(7); { Set to full brightness }

  { Blink colon 10 times }
  for i := 0 to 9 do begin

    { Activate segments of colon }
    sd.SetSelectedSegment(32, true);
    sd.SetSelectedSegment(33, true);

    Sleep(250);

    { Deactivate segments of colon }
    sd.SetSelectedSegment(32, false);
    sd.SetSelectedSegment(33, false);
  end;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
