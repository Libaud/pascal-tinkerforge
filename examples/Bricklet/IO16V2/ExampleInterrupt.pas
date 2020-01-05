program ExampleInterrupt;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIO16V2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    io: TBrickletIO16V2;
  public
    procedure InputValueCB(sender: TBrickletIO16V2; const channel: byte;
                           const changed: boolean; const value: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your IO-16 Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for input value callback }
procedure TExample.InputValueCB(sender: TBrickletIO16V2; const channel: byte;
                                const changed: boolean; const value: boolean);
begin
  WriteLn(Format('Channel: %d', [channel]));
  WriteLn(Format('Changed: %d', [changed]));
  WriteLn(Format('Value: %d', [value]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  io:= TBrickletIO16V2.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register input value callback to procedure InputValueCB }
  io.OnInputValue:= {$ifdef FPC}@{$endif}InputValueCB;

  { Set period for input value (channel 4) callback to 0.5s (500ms) }
  io.SetInputValueCallbackConfiguration(4, 500, false);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
