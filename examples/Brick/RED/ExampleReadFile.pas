program ExampleReadFile;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickRED;

type
  TExample = class
  private
    ipcon: TIPConnection;
    red: TBrickRED;
  public
    procedure CheckError(context: string; errorCode: byte);
    function AllocateString(sessionId: word; buffer: string): word;
    procedure ReadFile(remotePath: string; localPath: string);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your RED Brick }

var
  e: TExample;

procedure TExample.CheckError(context: string; errorCode: byte);
begin
  if (errorCode <> 0) then begin
    raise Exception.Create(Format('%s error occurred: %d', [context, errorCode]));
  end;
end;

function TExample.AllocateString(sessionId: word; buffer: string): word;
var errorCode: byte; stringId: word;
begin
  if (Length(buffer) > 60) then begin
    { FIXME: Currently this helper function only supports strings up to 60 characters }
    raise Exception.Create('String too long');
  end;
  red.AllocateString(Length(buffer), buffer, sessionId, errorCode, stringId);
  CheckError('AllocateString', errorCode);
  result := stringId;
end;

procedure TExample.ReadFile(remotePath: string; localPath: string);
var errorCode: byte; sessionId: word; remotePathStringId: word; remoteFileId: word;
    buffer: TArray0To61OfUInt8; lengthRead: byte; localFile: file; counter: longint;
begin
  { Create session }
  red.CreateSession(60, errorCode, sessionId);
  CheckError('CreateSession', errorCode);

  { Wrap remote path string }
  remotePathStringId := AllocateString(sessionId, remotePath);

  { Open remote file for reading }
  red.OpenFile(remotePathStringId, BRICK_RED_FILE_FLAG_READ_ONLY or BRICK_RED_FILE_FLAG_NON_BLOCKING,
               0, 0, 0, sessionId, errorCode, remoteFileId);
  CheckError('OpenFile', errorCode);

  { Open local file for writing }
  Assign(localFile, localPath);
  Rewrite(localFile, 1);

  { Read remote file and write to local file }
  counter := 500;

  repeat
    red.ReadFile(remoteFileId, 61, errorCode, buffer, lengthRead);
    CheckError('ReadFile', errorCode);
    BlockWrite(localFile, buffer, lengthRead);
    Dec(counter);

    if (counter = 0) then begin
      counter := 500;
      Write('.');
      errorCode := red.KeepSessionAlive(sessionId, 30);
      CheckError('KeepSessionAlive', errorCode);
    end;
  until (lengthRead = 0);

  WriteLn('.');

  { Close local file }
  Close(localFile);

  { Close remote file }
  red.ReleaseObjectUnchecked(remoteFileId, sessionId);

  { Expire session }
  red.ExpireSessionUnchecked(sessionId);
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  red := TBrickRED.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Read /home/tf/foobar.txt on RED Brick and write it locally to foobar.txt }
  ReadFile('/home/tf/foobar.txt', 'foobar.txt');

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
