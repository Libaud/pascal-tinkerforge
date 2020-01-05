program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogInV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    ai: TBrickletAnalogInV2;
  public
    procedure VoltageReachedCB(sender: TBrickletAnalogInV2; const voltage: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Analog In Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for voltage reached callback }
procedure TExample.VoltageReachedCB(sender: TBrickletAnalogInV2; const voltage: word);
begin
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  ai:= TBrickletAnalogInV2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  ai.SetDebouncePeriod(10000);

  { Register voltage reached callback to procedure VoltageReachedCB }
  ai.OnVoltageReached:= {$ifdef FPC}@{$endif}VoltageReachedCB;

  { Configure threshold for voltage "smaller than 5 V" }
  ai.SetVoltageCallbackThreshold('<', 5*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
