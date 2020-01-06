program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDustDetector;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletDustDetector;
  public
    procedure DustDensityReachedCB(sender: TBrickletDustDetector;
                                   const dustDensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Dust Detector Bricklet }

var
  e: TExample;

{ Callback procedure for dust density reached callback }
procedure TExample.DustDensityReachedCB(sender: TBrickletDustDetector;
                                        const dustDensity: word);
begin
  WriteLn(Format('Dust Density: %d µg/m³', [dustDensity]));
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletDustDetector.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
    oBricklet.SetDebouncePeriod(10000);

    { Register dust density reached callback to procedure DustDensityReachedCB }
    oBricklet.OnDustDensityReached:= {$ifdef FPC}@{$endif}DustDensityReachedCB;

    { Configure threshold for dust density "greater than 10 µg/m³" }
    oBricklet.SetDustDensityCallbackThreshold('>', 10, 0);

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
