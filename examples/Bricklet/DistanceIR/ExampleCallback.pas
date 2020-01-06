program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceIR;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletDistanceIR;
  public
    procedure DistanceCB(sender: TBrickletDistanceIR; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Distance IR Bricklet }

var
  e: TExample;

{ Callback procedure for distance callback }
procedure TExample.DistanceCB(sender: TBrickletDistanceIR; const distance: word);
begin
  WriteLn(Format('Distance: %f cm', [distance/10.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletDistanceIR.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register distance callback to procedure DistanceCB }
    oBricklet.OnDistance:= {$ifdef FPC}@{$endif}DistanceCB;

    { Set period for distance callback to 0.2s (200ms)
      Note: The distance callback is only called every 0.2 seconds
            if the distance has changed since the last call! }
    oBricklet.SetDistanceCallbackPeriod(200);

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
