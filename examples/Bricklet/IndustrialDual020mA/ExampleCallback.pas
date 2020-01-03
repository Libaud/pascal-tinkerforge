program ExampleCallback;

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
    procedure CurrentCB(sender: TBrickletIndustrialDual020mA; const sensor: byte;
                        const current: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual 0-20mA Bricklet }

var
  e: TExample;

{ Callback procedure for current callback }
procedure TExample.CurrentCB(sender: TBrickletIndustrialDual020mA; const sensor: byte;
                             const current: longint);
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

  { Register current callback to procedure CurrentCB }
  id020.OnCurrent := {$ifdef FPC}@{$endif}CurrentCB;

  { Set period for current (sensor 1) callback to 1s (1000ms)
    Note: The current (sensor 1) callback is only called every second
          if the current (sensor 1) has changed since the last call! }
  id020.SetCurrentCallbackPeriod(1, 1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
