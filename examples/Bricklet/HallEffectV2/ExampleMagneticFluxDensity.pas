program ExampleMagneticFluxDensity;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletHallEffectV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletHallEffectV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Hall Effect Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var magneticFluxDensity: smallint;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  oBricklet:= TBrickletHallEffectV2.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current Magnetic Flux Density }
  magneticFluxDensity:= oBricklet.GetMagneticFluxDensity;
  WriteLn(Format('Magnetic Flux Density: %d µT', [magneticFluxDensity]));

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
