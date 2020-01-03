program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryEncoderV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    re: TBrickletRotaryEncoderV2;
  public
    procedure CountCB(sender: TBrickletRotaryEncoderV2; const count: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Rotary Encoder Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for count callback }
procedure TExample.CountCB(sender: TBrickletRotaryEncoderV2; const count: longint);
begin
  WriteLn(Format('Count: %d', [count]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  re := TBrickletRotaryEncoderV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register count callback to procedure CountCB }
  re.OnCount := {$ifdef FPC}@{$endif}CountCB;

  { Set period for count callback to 1s (1000ms) without a threshold }
  re.SetCountCallbackConfiguration(1000, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
