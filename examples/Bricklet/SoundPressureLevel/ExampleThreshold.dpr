program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundPressureLevel;

type
  TExample = class
  private
    ipcon: TIPConnection;
    spl: TBrickletSoundPressureLevel;
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
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  spl := TBrickletSoundPressureLevel.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register decibel callback to procedure DecibelCB }
  spl.OnDecibel := {$ifdef FPC}@{$endif}DecibelCB;

  { Configure threshold for decibel "greater than 60 dB(A)"
    with a debounce period of 1s (1000ms) }
  spl.SetDecibelCallbackConfiguration(1000, false, '>', 60*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
