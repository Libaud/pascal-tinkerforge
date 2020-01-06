program ExampleNumericValue;

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

    { Show "- 42" on the Display }
    oBricklet.SetNumericValue([-2, -1, 4, 2]);

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
