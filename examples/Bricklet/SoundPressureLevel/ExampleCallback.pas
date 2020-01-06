program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundPressureLevel;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletSoundPressureLevel;
  public
    procedure DecibelCB(sender: TBrickletSoundPressureLevel; const decibel: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Sound Pressure Level Bricklet }

var
  e: TExample;

{ Callback procedure for decibel callback }
procedure TExample.DecibelCB(sender: TBrickletSoundPressureLevel; const decibel: word);
begin
  WriteLn(Format('Decibel: %f dB(A)', [decibel/10.0]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletSoundPressureLevel.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register decibel callback to procedure DecibelCB }
    oBricklet.OnDecibel:= {$ifdef FPC}@{$endif}DecibelCB;

    { Set period for decibel callback to 1s (1000ms) without a threshold }
    oBricklet.SetDecibelCallbackConfiguration(1000, false, 'x', 0, 0);

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
