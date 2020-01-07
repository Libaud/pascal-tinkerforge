program ExampleAuthenticate;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, TinkerforgeCommon, IPConnection, Device;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
  public
    procedure ConnectedCB(sender: TIPConnection; const connectReason: byte);
    procedure EnumerateCB(sender: TIPConnection;
                          const uid: string; const connectedUid: string; const position: char;
                          const hardwareVersion: TTFVersionNumber; const firmwareVersion: TTFVersionNumber;
                          const deviceIdentifier: word; const enumerationType: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  SECRET = 'My Authentication Secret!';

var
  e: TExample;

{ Authenticate each time the connection got (re-)established }
procedure TExample.ConnectedCB(sender: TIPConnection; const connectReason: byte);
begin
  case connectReason of
    IPCON_CONNECT_REASON_REQUEST:
    begin
      WriteLn('Connected by request');
    end;
    IPCON_CONNECT_REASON_AUTO_RECONNECT:
    begin
      WriteLn('Auto-Reconnect');
    end;
  end;
  { Authenticate first... }
  try
    sender.Authenticate(SECRET);
    WriteLn('Authentication succeeded');
  except
    WriteLn('Could not authenticate');
    exit;
  end;

  { ...reenable auto reconnect mechanism, as described below... }
  sender.SetAutoReconnect(true);

  { ...then trigger enumerate }
  sender.Enumerate;
end;

{ Print incoming enumeration }
procedure TExample.EnumerateCB(sender: TIPConnection;
                               const uid: string; const connectedUid: string; const position: char;
                               const hardwareVersion: TTFVersionNumber; const firmwareVersion: TTFVersionNumber;
                               const deviceIdentifier: word; const enumerationType: byte);
begin
  WriteLn('UID: ' + uid + ', Enumerate Type: ' + IntToStr(enumerationType));
end;

procedure TExample.Execute;
begin
  try
	  { Create IP Connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Disable auto reconnect mechanism, in case we have the wrong secret.
		If the authentication is successful, reenable it. }
	  oIPConnection.SetAutoReconnect(false);

	  { Register connected callback to "ConnectedCB" }
	  oIPConnection.OnConnected := {$ifdef FPC}@{$endif}ConnectedCB;

	  { Register enumerate callback to "EnumerateCB" }
	  oIPConnection.OnEnumerate := {$ifdef FPC}@{$endif}EnumerateCB;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
