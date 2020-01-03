program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDual020mA;

type
  TExample = class
  private
    ipcon: TIPConnection;
    id020: TBrickletIndustrialDual020mA;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  id020 := TBrickletIndustrialDual020mA.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  id020.SetDebouncePeriod(10000);

  { Register current reached callback to procedure CurrentReachedCB }
  id020.OnCurrentReached := {$ifdef FPC}@{$endif}CurrentReachedCB;

  { Configure threshold for current (sensor 1) "greater than 10 mA" }
  id020.SetCurrentCallbackThreshold(1, '>', 10*1000000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
