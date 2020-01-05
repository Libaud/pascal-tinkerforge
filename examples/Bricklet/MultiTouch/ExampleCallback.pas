program ExampleCallback;

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
    procedure TouchStateCB(sender: TBrickletMultiTouch; const state: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Multi Touch Bricklet }

var
  e: TExample;

{ Callback procedure for touch state callback }
procedure TExample.TouchStateCB(sender: TBrickletMultiTouch; const state: word);
var i: integer;
begin
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
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  oBricklet:= TBrickletMultiTouch.Create(nil);
  oBricklet.IPConnection:= oIPConnection;
  oBricklet.UIDString:= UID;

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register touch state callback to procedure TouchStateCB }
  oBricklet.OnTouchState:= {$ifdef FPC}@{$endif}TouchStateCB;

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
