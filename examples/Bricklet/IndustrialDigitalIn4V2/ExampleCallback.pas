program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletIndustrialDigitalIn4V2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    idi4: TBrickletIndustrialDigitalIn4V2;
  public
    procedure ValueCB(sender: TBrickletIndustrialDigitalIn4V2; const channel: byte;
                      const changed: boolean; const value: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Industrial Digital In 4 Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for value callback }
procedure TExample.ValueCB(sender: TBrickletIndustrialDigitalIn4V2; const channel: byte;
                           const changed: boolean; const value: boolean);
begin
  if (channel = BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CHANNEL_0) then begin
    WriteLn('Channel: 0');
  end
  else if (channel = BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CHANNEL_1) then begin
    WriteLn('Channel: 1');
  end
  else if (channel = BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CHANNEL_2) then begin
    WriteLn('Channel: 2');
  end
  else if (channel = BRICKLET_INDUSTRIAL_DIGITAL_IN_4_V2_CHANNEL_3) then begin
    WriteLn('Channel: 3');
  end;

  WriteLn(Format('Changed: %d', [changed]));
  WriteLn(Format('Value: %d', [value]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  idi4 := TBrickletIndustrialDigitalIn4V2.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register value callback to procedure ValueCB }
  idi4.OnValue := {$ifdef FPC}@{$endif}ValueCB;

  { Set period for value (channel 1) callback to 0.1s (100ms) }
  idi4.SetValueCallbackConfiguration(1, 100, false);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
