program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLight;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    uvl: TBrickletUVLight;
  public
    procedure UVLightReachedCB(sender: TBrickletUVLight; const uvLight: longword);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet }

var
  e: TExample;

{ Callback procedure for UV light reached callback }
procedure TExample.UVLightReachedCB(sender: TBrickletUVLight; const uvLight: longword);
begin
  WriteLn(Format('UV Light: %f mW/m²', [uvLight/10.0]));
  WriteLn('UV Index > 3. Use sunscreen!');
end;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  uvl:= TBrickletUVLight.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  uvl.SetDebouncePeriod(10000);

  { Register UV light reached callback to procedure UVLightReachedCB }
  uvl.OnUVLightReached:= {$ifdef FPC}@{$endif}UVLightReachedCB;

  { Configure threshold for UV light "greater than 75 mW/m²" }
  uvl.SetUVLightCallbackThreshold('>', 75*10, 0);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
