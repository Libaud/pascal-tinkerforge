program ExampleSwitchSocket;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRemoteSwitchV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    rs: TBrickletRemoteSwitchV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Remote Switch Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rs := TBrickletRemoteSwitchV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Switch on a type A socket with house code 17 and receiver code 1.
    House code 17 is 10001 in binary (least-significant bit first)
    and means that the DIP switches 1 and 5 are on and 2-4 are off.
    Receiver code 1 is 10000 in binary (least-significant bit first)
    and means that the DIP switch A is on and B-E are off. }
  rs.SwitchSocketA(17, 1, BRICKLET_REMOTE_SWITCH_V2_SWITCH_TO_ON);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
