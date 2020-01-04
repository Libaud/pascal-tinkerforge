program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDustDetector;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dd: TBrickletDustDetector;
  public
    procedure DustDensityCB(sender: TBrickletDustDetector; const dustDensity: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Dust Detector Bricklet }

var
  e: TExample;

{ Callback procedure for dust density callback }
procedure TExample.DustDensityCB(sender: TBrickletDustDetector; const dustDensity: word);
begin
  WriteLn(Format('Dust Density: %d µg/m³', [dustDensity]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  dd := TBrickletDustDetector.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register dust density callback to procedure DustDensityCB }
  dd.OnDustDensity := {$ifdef FPC}@{$endif}DustDensityCB;

  { Set period for dust density callback to 1s (1000ms)
    Note: The dust density callback is only called every second
          if the dust density has changed since the last call! }
  dd.SetDustDensityCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
