program ExampleEnumerate;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  Classes, SysUtils, TinkerforgeCommon, IPConnection, Device;

type
  TExample = class(TComponent)
  private
    oIPConnection: TIPConnection;
  public
    procedure EnumerateCB(sender: TIPConnection;
                          const uid: string; const connectedUid: string; const position: char;
                          const hardwareVersion: TTFVersionNumber; const firmwareVersion: TTFVersionNumber;
                          const deviceIdentifier: word; const enumerationType: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;

var
  e: TExample;

{ Print incoming enumeration }
procedure TExample.EnumerateCB(sender: TIPConnection;
                               const uid: string; const connectedUid: string; const position: char;
                               const hardwareVersion: TTFVersionNumber; const firmwareVersion: TTFVersionNumber;
                               const deviceIdentifier: word; const enumerationType: byte);
begin
  WriteLn('UID:               ' + uid);
  WriteLn('Enumerate Type:    ' + IntToStr(enumerationType));

  if (enumerationType <> IPCON_ENUMERATION_TYPE_DISCONNECTED) then begin
    WriteLn('Connected UID:     ' + connectedUid);
    WriteLn('Position:          ' + position);
    WriteLn('Hardware Version:  ' + IntToStr(hardwareVersion[0]) + '.' +
                                    IntToStr(hardwareVersion[1]) + '.' +
                                    IntToStr(hardwareVersion[2]));
    WriteLn('Firmware Version:  ' + IntToStr(firmwareVersion[0]) + '.' +
                                    IntToStr(firmwareVersion[1]) + '.' +
                                    IntToStr(firmwareVersion[2]));
    WriteLn('Device Identifier: ' + IntToStr(deviceIdentifier));
  end;

  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create connection and connect to brickd }
    oIPConnection:= TIPConnection.Create(Self);
    oIPConnection.Connect(HOST, PORT);

    { Register enumerate callback to "EnumerateCB" }
    oIPConnection.OnEnumerate:= {$ifdef FPC}@{$endif}EnumerateCB;

    { Trigger enumerate }
    oIPConnection.Enumerate;

    WriteLn('Press key to exit');
    ReadLn;

  finally
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create(nil);
  e.Execute;
  e.Destroy;
end.
