program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLine;

type
  TExample = class
  private
    ipcon: TIPConnection;
    l: TBrickletLine;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  l := TBrickletLine.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register reflectivity callback to procedure ReflectivityCB }
  l.OnReflectivity := {$ifdef FPC}@{$endif}ReflectivityCB;

  { Set period for reflectivity callback to 1s (1000ms)
    Note: The reflectivity callback is only called every second
          if the reflectivity has changed since the last call! }
  l.SetReflectivityCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
