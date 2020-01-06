program ExampleBlinkColon;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSegmentDisplay4x7V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletSegmentDisplay4x7V2;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletSegmentDisplay4x7V2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    oBricklet.SetBrightness(7); { Set to full brightness }

    { Blink colon 10 times }
    for i:= 0 to 9 do begin

      { Activate segments of colon }
      oBricklet.SetSelectedSegment(32, true);
      oBricklet.SetSelectedSegment(33, true);

      Sleep(250);

      { Deactivate segments of colon }
      oBricklet.SetSelectedSegment(32, false);
      oBricklet.SetSelectedSegment(33, false);
    end;

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
