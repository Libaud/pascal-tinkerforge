program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogIn;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    ai: TBrickletAnalogIn;
  public
    procedure VoltageCB(sender: TBrickletAnalogIn; const voltage: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Analog In Bricklet }

var
  e: TExample;

{ Callback procedure for voltage callback }
procedure TExample.VoltageCB(sender: TBrickletAnalogIn; const voltage: word);
begin
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  ai:= TBrickletAnalogIn.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register voltage callback to procedure VoltageCB }
  ai.OnVoltage:= {$ifdef FPC}@{$endif}VoltageCB;

  { Set period for voltage callback to 1s (1000ms)
    Note: The voltage callback is only called every second
          if the voltage has changed since the last call! }
  ai.SetVoltageCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
