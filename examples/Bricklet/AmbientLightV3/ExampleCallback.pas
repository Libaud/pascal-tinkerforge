program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletAmbientLightV3;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletAmbientLightV3;
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
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletAmbientLightV3.Create(nil);
    oBricklet.IPConnection:= oIPConnection;
    oBricklet.UIDString:= UID;

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Register illuminance callback to procedure IlluminanceCB }
    oBricklet.OnIlluminance:= {$ifdef FPC}@{$endif}IlluminanceCB;

    { Set period for illuminance callback to 1s (1000ms) without a threshold }
    oBricklet.SetIlluminanceCallbackConfiguration(1000, false, 'x', 0, 0);

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
