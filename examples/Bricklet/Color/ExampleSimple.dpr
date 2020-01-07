program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletColor;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletColor;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Color Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var r, g, b, c_: word;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletColor.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current color }
	  oBricklet.GetColor(r, g, b, c_);

	  WriteLn(Format('Color [R]: %d', [r]));
	  WriteLn(Format('Color [G]: %d', [g]));
	  WriteLn(Format('Color [B]: %d', [b]));
	  WriteLn(Format('Color [C]: %d', [c_]));

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
