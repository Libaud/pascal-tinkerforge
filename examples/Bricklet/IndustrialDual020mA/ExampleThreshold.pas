program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDual020mA;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIndustrialDual020mA;
  public
    procedure CurrentReachedCB(sender: TBrickletIndustrialDual020mA; const sensor: byte;
                               const current: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet }

var
  e: TExample;

{ Callback procedure for current reached callback }
procedure TExample.CurrentReachedCB(sender: TBrickletIndustrialDual020mA;
                                    const sensor: byte; const current: longint);
begin
  WriteLn(Format('Sensor: %d', [sensor]));
  WriteLn(Format('Current: %f mA', [current/1000000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIndustrialDual020mA.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
    oBricklet.SetDebouncePeriod(10000);

    { Register current reached callback to procedure CurrentReachedCB }
    oBricklet.OnCurrentReached:= {$ifdef FPC}@{$endif}CurrentReachedCB;

    { Configure threshold for current (sensor 1) "greater than 10 mA" }
    oBricklet.SetCurrentCallbackThreshold(1, '>', 10*1000000, 0);

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
