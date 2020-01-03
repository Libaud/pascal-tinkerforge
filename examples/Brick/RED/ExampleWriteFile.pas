program ExampleWriteFile;

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
    procedure WriteFile(localPath: string; remotePath: string);
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

procedure TExample.WriteFile(localPath: string; remotePath: string);
var errorCode: byte; sessionId: word; remotePathStringId: word; remoteFileId: word;
    buffer: TArray0To60OfUInt8; lengthRead: longint; localFile: file; lengthWritten: byte;
    counter: longint;
begin
  { Create session }
  red.CreateSession(60, errorCode, sessionId);
  CheckError('CreateSession', errorCode);

  { Open local file for reading }
  Assign(localFile, localPath);
  Reset(localFile, 1);

  { Wrap remote path string }
  remotePathStringId := AllocateString(sessionId, remotePath);

  { Create remote non-executable file for writing as user/group tf }
  red.OpenFile(remotePathStringId, BRICK_RED_FILE_FLAG_WRITE_ONLY or BRICK_RED_FILE_FLAG_CREATE or BRICK_RED_FILE_FLAG_NON_BLOCKING,
               420 { 0o644 }, 1000, 1000, sessionId, errorCode, remoteFileId);
  CheckError('OpenFile', errorCode);

  { Read local file and write to remote file }
  counter := 500;

  repeat
    BlockRead(localFile, buffer, 60, lengthRead);
    red.WriteFile(remoteFileId, buffer, lengthRead, errorCode, lengthWritten);
    CheckError('WriteFile', errorCode);

    if (lengthRead <> lengthWritten) then begin
      { FIXME: Currently this example doesn't handle short writes }
      raise Exception.Create('Short write');
    end;

    Dec(counter);

    if (counter = 0) then begin
      counter := 500;
      Write('.');
      errorCode := red.KeepSessionAlive(sessionId, 30);
      CheckError('KeepSessionAlive', errorCode);
    end;
  until (lengthRead = 0);

  WriteLn('.');

  { Close remote file }
  red.ReleaseObjectUnchecked(remoteFileId, sessionId);

  { Close local file }
  Close(localFile);

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

  { Read foobar.txt locally and write it to /home/tf/foobar.txt on RED Brick }
  WriteFile('foobar.txt', '/home/tf/foobar.txt');

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
