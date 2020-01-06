program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletMultiTouch;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletMultiTouch;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Multi Touch Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var state: word; i: integer;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  oBricklet:= TBrickletMultiTouch.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current touch state }
  state:= oBricklet.GetTouchState;

  if (state And (1 Shl 12)) = (1 Shl 12) then begin
    Write('In proximity, ');
  end;

  if (state And $fff) = 0 then begin
    WriteLn('No electrodes touched');
  end
  else begin
    Write('Electrodes ');
    for i:= 0 to 11 do begin
      if (state And (1 Shl i)) = (1 Shl i) then begin
        Write(IntToStr(i) + ' ');
      end;
    end;
    WriteLn('touched');
  end;
  WriteLn('');

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
