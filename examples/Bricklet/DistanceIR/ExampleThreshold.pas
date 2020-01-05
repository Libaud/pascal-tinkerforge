program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceIR;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    dir: TBrickletDistanceIR;
  public
    procedure DistanceReachedCB(sender: TBrickletDistanceIR; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Distance IR Bricklet }

var
  e: TExample;

{ Callback procedure for distance reached callback }
procedure TExample.DistanceReachedCB(sender: TBrickletDistanceIR; const distance: word);
begin
  WriteLn(Format('Distance: %f cm', [distance/10.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  dir:= TBrickletDistanceIR.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  dir.SetDebouncePeriod(10000);

  { Register distance reached callback to procedure DistanceReachedCB }
  dir.OnDistanceReached:= {$ifdef FPC}@{$endif}DistanceReachedCB;

  { Configure threshold for distance "smaller than 30 cm" }
  dir.SetDistanceCallbackThreshold('<', 30*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
