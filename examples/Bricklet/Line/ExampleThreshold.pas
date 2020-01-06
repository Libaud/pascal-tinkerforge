program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLine;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    l: TBrickletLine;
  public
    procedure ReflectivityReachedCB(sender: TBrickletLine; const reflectivity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Line Bricklet }

var
  e: TExample;

{ Callback procedure for reflectivity reached callback }
procedure TExample.ReflectivityReachedCB(sender: TBrickletLine; const reflectivity: word);
begin
  WriteLn(Format('Reflectivity: %d', [reflectivity]));
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  l:= TBrickletLine.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 1 second (1000ms) }
  l.SetDebouncePeriod(1000);

  { Register reflectivity reached callback to procedure ReflectivityReachedCB }
  l.OnReflectivityReached:= {$ifdef FPC}@{$endif}ReflectivityReachedCB;

  { Configure threshold for reflectivity "greater than 2000" }
  l.SetReflectivityCallbackThreshold('>', 2000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
