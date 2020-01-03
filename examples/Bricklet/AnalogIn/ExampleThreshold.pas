program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAnalogIn;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ai: TBrickletAnalogIn;
  public
    procedure VoltageReachedCB(sender: TBrickletAnalogIn; const voltage: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Analog In Bricklet }

var
  e: TExample;

{ Callback procedure for voltage reached callback }
procedure TExample.VoltageReachedCB(sender: TBrickletAnalogIn; const voltage: word);
begin
  WriteLn(Format('Voltage: %f V', [voltage/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  ai := TBrickletAnalogIn.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  ai.SetDebouncePeriod(10000);

  { Register voltage reached callback to procedure VoltageReachedCB }
  ai.OnVoltageReached := {$ifdef FPC}@{$endif}VoltageReachedCB;

  { Configure threshold for voltage "smaller than 5 V" }
  ai.SetVoltageCallbackThreshold('<', 5*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
