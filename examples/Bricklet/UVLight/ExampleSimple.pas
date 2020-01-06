program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletUVLight;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletUVLight;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your UV Light Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var uvLight: longword;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletUVLight.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Get current UV light }
    uvLight:= oBricklet.GetUVLight;
    WriteLn(Format('UV Light: %f mW/m²', [uvLight/10.0]));

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
