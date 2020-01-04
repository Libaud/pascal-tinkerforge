program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDualAnalogIn;

type
  TExample = class
  private
    ipcon: TIPConnection;
    idai: TBrickletIndustrialDualAnalogIn;
  public
    procedure VoltageReachedCB(sender: TBrickletIndustrialDualAnalogIn;
                               const channel: byte; const voltage: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual Analog In Bricklet }

var
  e: TExample;

{ Callback procedure for voltage reached callback }
procedure TExample.VoltageReachedCB(sender: TBrickletIndustrialDualAnalogIn;
                                    const channel: byte; const voltage: longint);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  idai := TBrickletIndustrialDualAnalogIn.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  idai.SetDebouncePeriod(10000);

  { Register voltage reached callback to procedure VoltageReachedCB }
  idai.OnVoltageReached := {$ifdef FPC}@{$endif}VoltageReachedCB;

  { Configure threshold for voltage (channel 1) "greater than 10 V" }
  idai.SetVoltageCallbackThreshold(1, '>', 10*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
