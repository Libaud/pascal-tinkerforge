program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAmbientLightV3;

type
  TExample = class
  private
    ipcon: TIPConnection;
    al: TBrickletAmbientLightV3;
  public
    procedure IlluminanceCB(sender: TBrickletAmbientLightV3; const illuminance: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Ambient Light Bricklet 3.0 }

var
  e: TExample;

{ Callback procedure for illuminance callback }
procedure TExample.IlluminanceCB(sender: TBrickletAmbientLightV3;
                                 const illuminance: longword);
begin
  WriteLn(Format('Illuminance: %f lx', [illuminance/100.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  al := TBrickletAmbientLightV3.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register illuminance callback to procedure IlluminanceCB }
  al.OnIlluminance := {$ifdef FPC}@{$endif}IlluminanceCB;

  { Set period for illuminance callback to 1s (1000ms) without a threshold }
  al.SetIlluminanceCallbackConfiguration(1000, false, 'x', 0, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
