program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundIntensity;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    si: TBrickletSoundIntensity;
  public
    procedure IntensityReachedCB(sender: TBrickletSoundIntensity; const intensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Sound Intensity Bricklet }

var
  e: TExample;

{ Callback procedure for intensity reached callback }
procedure TExample.IntensityReachedCB(sender: TBrickletSoundIntensity;
                                      const intensity: word);
begin
  WriteLn(Format('Intensity: %d', [intensity]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  si:= TBrickletSoundIntensity.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 1 second (1000ms) }
  si.SetDebouncePeriod(1000);

  { Register intensity reached callback to procedure IntensityReachedCB }
  si.OnIntensityReached:= {$ifdef FPC}@{$endif}IntensityReachedCB;

  { Configure threshold for intensity "greater than 2000" }
  si.SetIntensityCallbackThreshold('>', 2000, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
