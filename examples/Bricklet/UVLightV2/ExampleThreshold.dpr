program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLightV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletUVLightV2;
  public
    procedure UVICB(sender: TBrickletUVLightV2; const uvi: longint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for UV index callback }
procedure TExample.UVICB(sender: TBrickletUVLightV2; const uvi: longint);
begin
  WriteLn(Format('UV Index: %f', [uvi/10.0]));
  WriteLn('UV index > 3. Use sunscreen!');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletUVLightV2.Create(nil);
  oBricklet.UIDString:= UID;
  oBricklet.IPConnection:= oIPConnection;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register UV index callback to procedure UVICB }
  oBricklet.OnUVI := {$ifdef FPC}@{$endif}UVICB;

  { Configure threshold for UV index "greater than 3"
    with a debounce period of 1s (1000ms) }
  oBricklet.SetUVICallbackConfiguration(1000, false, '>', 3*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
