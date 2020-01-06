program ExampleSwitchSocket;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRemoteSwitch;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    rs: TBrickletRemoteSwitch;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Remote Switch Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  try

  finally
  end;
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  rs:= TBrickletRemoteSwitch.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Switch on a type A socket with house code 17 and receiver code 1.
    House code 17 is 10001 in binary (least-significant bit first)
    and means that the DIP switches 1 and 5 are on and 2-4 are off.
    Receiver code 1 is 10000 in binary (least-significant bit first)
    and means that the DIP switch A is on and B-E are off. }
  rs.SwitchSocketA(17, 1, BRICKLET_REMOTE_SWITCH_SWITCH_TO_ON);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
