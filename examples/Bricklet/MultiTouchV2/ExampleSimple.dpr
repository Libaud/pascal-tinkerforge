program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMultiTouchV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMultiTouchV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Multi Touch Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var state: TArray0To12OfBoolean;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletMultiTouchV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current touch state }
	  state := oBricklet.GetTouchState;

	  WriteLn(Format('Electrode 0: %d', [state[0]]));
	  WriteLn(Format('Electrode 1: %d', [state[1]]));
	  WriteLn(Format('Electrode 2: %d', [state[2]]));
	  WriteLn(Format('Electrode 3: %d', [state[3]]));
	  WriteLn(Format('Electrode 4: %d', [state[4]]));
	  WriteLn(Format('Electrode 5: %d', [state[5]]));
	  WriteLn(Format('Electrode 6: %d', [state[6]]));
	  WriteLn(Format('Electrode 7: %d', [state[7]]));
	  WriteLn(Format('Electrode 8: %d', [state[8]]));
	  WriteLn(Format('Electrode 9: %d', [state[9]]));
	  WriteLn(Format('Electrode 10: %d', [state[10]]));
	  WriteLn(Format('Electrode 11: %d', [state[11]]));
	  WriteLn(Format('Proximity: %d', [state[12]]));

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
