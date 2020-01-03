program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundIntensity;

type
  TExample = class
  private
    ipcon: TIPConnection;
    si: TBrickletSoundIntensity;
  public
    procedure IntensityCB(sender: TBrickletSoundIntensity; const intensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Sound Intensity Bricklet }

var
  e: TExample;

{ Callback procedure for intensity callback }
procedure TExample.IntensityCB(sender: TBrickletSoundIntensity; const intensity: word);
begin
  WriteLn(Format('Intensity: %d', [intensity]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  si := TBrickletSoundIntensity.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register intensity callback to procedure IntensityCB }
  si.OnIntensity := {$ifdef FPC}@{$endif}IntensityCB;

  { Set period for intensity callback to 0.05s (50ms)
    Note: The intensity callback is only called every 0.05 seconds
          if the intensity has changed since the last call! }
  si.SetIntensityCallbackPeriod(50);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
