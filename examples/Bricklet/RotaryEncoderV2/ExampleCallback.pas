program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRotaryEncoderV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRotaryEncoderV2;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletRotaryEncoderV2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register count callback to procedure CountCB }
    oBricklet.OnCount:= {$ifdef FPC}@{$endif}CountCB;

    { Set period for count callback to 1s (1000ms) without a threshold }
    oBricklet.SetCountCallbackConfiguration(1000, false, 'x', 0, 0);

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
