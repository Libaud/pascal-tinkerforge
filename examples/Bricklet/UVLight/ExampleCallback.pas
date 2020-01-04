program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLight;

type
  TExample = class
  private
    ipcon: TIPConnection;
    uvl: TBrickletUVLight;
  public
    procedure UVLightCB(sender: TBrickletUVLight; const uvLight: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet }

var
  e: TExample;

{ Callback procedure for UV light callback }
procedure TExample.UVLightCB(sender: TBrickletUVLight; const uvLight: longword);
begin
  WriteLn(Format('UV Light: %f mW/m²', [uvLight/10.0]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create(nil);

  { Create device object }
  uvl := TBrickletUVLight.Create(nil);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register UV light callback to procedure UVLightCB }
  uvl.OnUVLight := {$ifdef FPC}@{$endif}UVLightCB;

  { Set period for UV light callback to 1s (1000ms)
    Note: The UV light callback is only called every second
          if the UV light has changed since the last call! }
  uvl.SetUVLightCallbackPeriod(1000);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
