program ExampleReadFile;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickRED;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBrick: TBrickRED;
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
  oBrick.AllocateString(Length(buffer), buffer, sessionId, errorCode, stringId);
  CheckError('AllocateString', errorCode);
  result := stringId;
end;

procedure TExample.ReadFile(remotePath: string; localPath: string);
var errorCode: byte; sessionId: word; remotePathStringId: word; remoteFileId: word;
    buffer: TArray0To61OfUInt8; lengthRead: byte; localFile: file; counter: longint;
begin
  { Create session }
  oBrick.CreateSession(60, errorCode, sessionId);
  CheckError('CreateSession', errorCode);

  { Wrap remote path string }
  remotePathStringId := AllocateString(sessionId, remotePath);

  { Open remote file for reading }
  oBrick.OpenFile(remotePathStringId, BRICK_RED_FILE_FLAG_READ_ONLY or BRICK_RED_FILE_FLAG_NON_BLOCKING,
               0, 0, 0, sessionId, errorCode, remoteFileId);
  CheckError('OpenFile', errorCode);

  { Open local file for writing }
  Assign(localFile, localPath);
  Rewrite(localFile, 1);

  { Read remote file and write to local file }
  counter := 500;

  repeat
    oBrick.ReadFile(remoteFileId, 61, errorCode, buffer, lengthRead);
    CheckError('ReadFile', errorCode);
    BlockWrite(localFile, buffer, lengthRead);
    Dec(counter);

    if (counter = 0) then begin
      counter := 500;
      Write('.');
      errorCode := oBrick.KeepSessionAlive(sessionId, 30);
      CheckError('KeepSessionAlive', errorCode);
    end;
  until (lengthRead = 0);

  WriteLn('.');

  { Close local file }
  Close(localFile);

  { Close remote file }
  oBrick.ReleaseObjectUnchecked(remoteFileId, sessionId);

  { Expire session }
  oBrick.ExpireSessionUnchecked(sessionId);
end;

procedure TExample.Execute;
begin
  try
	{ Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBrick := TBrickRED.Create(nil);
	  oBrick.IPConnection:= oIPConnection;
	  oBrick.UIDString:= UID;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Read /home/tf/foobar.txt on RED Brick and write it locally to foobar.txt }
	  ReadFile('/home/tf/foobar.txt', 'foobar.txt');

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBrick.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
