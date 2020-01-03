program ExampleRemoteCallback;

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
    procedure RemoteStatusACB(sender: TBrickletRemoteSwitchV2; const houseCode: byte;
                              const receiverCode: byte; const switchTo: byte;
                              const repeats: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Remote Switch Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for remote status a callback }
procedure TExample.RemoteStatusACB(sender: TBrickletRemoteSwitchV2; const houseCode: byte;
                                   const receiverCode: byte; const switchTo: byte;
                                   const repeats: word);
begin
  WriteLn(Format('House Code: %d', [houseCode]));
  WriteLn(Format('Receiver Code: %d', [receiverCode]));

  if (switchTo = BRICKLET_REMOTE_SWITCH_V2_SWITCH_TO_OFF) then begin
    WriteLn('Switch To: Off');
  end
  else if (switchTo = BRICKLET_REMOTE_SWITCH_V2_SWITCH_TO_ON) then begin
    WriteLn('Switch To: On');
  end;

  WriteLn(Format('Repeats: %d', [repeats]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rs := TBrickletRemoteSwitchV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Configure to receive from remote type A with minimum repeats set to 1 and enable callback }
  rs.SetRemoteConfiguration(BRICKLET_REMOTE_SWITCH_V2_REMOTE_TYPE_A, 1, true);

  { Register remote status a callback to procedure RemoteStatusACB }
  rs.OnRemoteStatusA := {$ifdef FPC}@{$endif}RemoteStatusACB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
