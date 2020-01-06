program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundIntensity;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletSoundIntensity;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletSoundIntensity.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register intensity callback to procedure IntensityCB }
    oBricklet.OnIntensity:= {$ifdef FPC}@{$endif}IntensityCB;

    { Set period for intensity callback to 0.05s (50ms)
      Note: The intensity callback is only called every 0.05 seconds
            if the intensity has changed since the last call! }
    oBricklet.SetIntensityCallbackPeriod(50);

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
