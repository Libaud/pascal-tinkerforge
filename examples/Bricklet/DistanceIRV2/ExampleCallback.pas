program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceIRV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletDistanceIRV2;
  public
    procedure DistanceCB(sender: TBrickletDistanceIRV2; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Distance IR Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for distance callback }
procedure TExample.DistanceCB(sender: TBrickletDistanceIRV2; const distance: word);
begin
  WriteLn(Format('Distance: %f cm', [distance/10.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletDistanceIRV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register distance callback to procedure DistanceCB }
    oBricklet.OnDistance:= {$ifdef FPC}@{$endif}DistanceCB;

    { Set period for distance callback to 1s (1000ms) without a threshold }
    oBricklet.SetDistanceCallbackConfiguration(1000, false, 'x', 0, 0);

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
