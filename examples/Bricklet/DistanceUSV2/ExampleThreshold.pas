program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceUSV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    dus: TBrickletDistanceUSV2;
  public
    procedure DistanceCB(sender: TBrickletDistanceUSV2; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Distance US Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for distance callback }
procedure TExample.DistanceCB(sender: TBrickletDistanceUSV2; const distance: word);
begin
  WriteLn(Format('Distance: %f cm', [distance/10.0]));
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  dus:= TBrickletDistanceUSV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register distance callback to procedure DistanceCB }
  dus.OnDistance:= {$ifdef FPC}@{$endif}DistanceCB;

  { Configure threshold for distance "greater than 100 cm"
    with a debounce period of 0.1s (100ms) }
  dus.SetDistanceCallbackConfiguration(100, false, '>', 100*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
