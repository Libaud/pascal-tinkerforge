program ExampleInterrupt;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIO4V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletIO4V2;
  public
    procedure InputValueCB(sender: TBrickletIO4V2; const channel: byte;
                           const changed: boolean; const value: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your IO-4 Bricklet 2.0 }

var
  e: TExample;                                              io

{ Callback procedure for input value callback }
procedure TExample.InputValueCB(sender: TBrickletIO4V2; const channel: byte;
                                const changed: boolean; const value: boolean);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Changed: %d', [changed]));
  WriteLn(Format('Value: %d', [value]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletIO4V2.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register input value callback to procedure InputValueCB }
    oBricklet.OnInputValue:= {$ifdef FPC}@{$endif}InputValueCB;

    { Set period for input value (channel 1) callback to 0.5s (500ms) }
    oBricklet.SetInputValueCallbackConfiguration(1, 500, false);

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
