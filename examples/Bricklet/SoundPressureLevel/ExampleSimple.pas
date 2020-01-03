program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletSoundPressureLevel;

type
  TExample = class
  private
    ipcon: TIPConnection;
    spl: TBrickletSoundPressureLevel;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Sound Pressure Level Bricklet }

var
  e: TExample;

procedure TExample.Execute;
var decibel: word;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  spl := TBrickletSoundPressureLevel.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get current decibel }
  decibel := spl.GetDecibel;
  WriteLn(Format('Decibel: %f dB(A)', [decibel/10.0]));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
