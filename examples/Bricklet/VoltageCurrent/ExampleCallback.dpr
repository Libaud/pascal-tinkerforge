program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltageCurrent;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletVoltageCurrent;
  public
    procedure CurrentCB(sender: TBrickletVoltageCurrent; const current: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage/Current Bricklet }

var
  e: TExample;

{ Callback procedure for current callback }
procedure TExample.CurrentCB(sender: TBrickletVoltageCurrent; const current: longint);
begin
  WriteLn(Format('Current: %f A', [current/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletVoltageCurrent.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register current callback to procedure CurrentCB }
  oBricklet.OnCurrent := {$ifdef FPC}@{$endif}CurrentCB;

  { Set period for current callback to 1s (1000ms)
    Note: The current callback is only called every second
          if the current has changed since the last call! }
  oBricklet.SetCurrentCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
