program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletVoltageCurrent;

type
  TExample = class
  private
    ipcon: TIPConnection;
    vc: TBrickletVoltageCurrent;
  public
    procedure PowerReachedCB(sender: TBrickletVoltageCurrent; const power: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Voltage/Current Bricklet }

var
  e: TExample;

{ Callback procedure for power reached callback }
procedure TExample.PowerReachedCB(sender: TBrickletVoltageCurrent; const power: longint);
begin
  WriteLn(Format('Power: %f W', [power/1000.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  vc := TBrickletVoltageCurrent.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  vc.SetDebouncePeriod(10000);

  { Register power reached callback to procedure PowerReachedCB }
  vc.OnPowerReached := {$ifdef FPC}@{$endif}PowerReachedCB;

  { Configure threshold for power "greater than 10 W" }
  vc.SetPowerCallbackThreshold('>', 10*1000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
