program ExampleCallback;

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
    procedure ReflectivityCB(sender: TBrickletLine; const reflectivity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Line Bricklet }

var
  e: TExample;

{ Callback procedure for reflectivity callback }
procedure TExample.ReflectivityCB(sender: TBrickletLine; const reflectivity: word);
begin
  WriteLn(Format('Reflectivity: %d', [reflectivity]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletLine.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register reflectivity callback to procedure ReflectivityCB }
    oBricklet.OnReflectivity:= {$ifdef FPC}@{$endif}ReflectivityCB;

    { Set period for reflectivity callback to 1s (1000ms)
      Note: The reflectivity callback is only called every second
            if the reflectivity has changed since the last call! }
    oBricklet.SetReflectivityCallbackPeriod(1000);

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
