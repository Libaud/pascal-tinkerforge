program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDualAnalogInV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    idai: TBrickletIndustrialDualAnalogInV2;
  public
    procedure VoltageCB(sender: TBrickletIndustrialDualAnalogInV2; const channel: byte;
                        const voltage: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Dual Analog In Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for voltage callback }
procedure TExample.VoltageCB(sender: TBrickletIndustrialDualAnalogInV2;
                             const channel: byte; const voltage: longint);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  idai:= TBrickletIndustrialDualAnalogInV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register voltage callback to procedure VoltageCB }
  idai.OnVoltage:= {$ifdef FPC}@{$endif}VoltageCB;

  { Configure threshold for voltage (channel 0) "greater than 10 V"
    with a debounce period of 10s (10000ms) }
  idai.SetVoltageCallbackConfiguration(0, 10000, false, '>', 10*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
