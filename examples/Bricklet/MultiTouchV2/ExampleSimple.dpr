program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMultiTouchV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    mt: TBrickletMultiTouchV2;
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
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  mt := TBrickletMultiTouchV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current touch state }
  state := mt.GetTouchState;

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
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
