program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLine;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletLine;
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
    { Create IP connection }
    oIPConnection := TIPConnection.Create(nil);

    { Create device object }
    oBricklet := TBrickletLine.Create(nil);
    oBricklet.UIDString:= UID;
    oBricklet.IPConnection:= oIPConnection;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before oIPConnection is connected }

    { Get threshold callbacks with a debounce time of 1 second (1000ms) }
    oBricklet.SetDebouncePeriod(1000);

    { Register reflectivity reached callback to procedure ReflectivityReachedCB }
    oBricklet.OnReflectivityReached := {$ifdef FPC}@{$endif}ReflectivityReachedCB;

    { Configure threshold for reflectivity "greater than 2000" }
    oBricklet.SetReflectivityCallbackThreshold('>', 2000, 0);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
