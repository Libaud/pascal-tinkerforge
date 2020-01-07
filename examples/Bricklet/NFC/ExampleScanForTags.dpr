program ExampleScanForTags;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletNFC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletNFC;
  public
    procedure ReaderStateChangedCB(sender: TBrickletNFC; const state: byte;
                                   const idle: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your NFC Bricklet }

var
  e: TExample;

{ Callback procedure for reader state changed callback }
procedure TExample.ReaderStateChangedCB(sender: TBrickletNFC; const state: byte;
                                        const idle: boolean);
  var i: byte;
  var tagType: byte;
  var tagInfo: string;
  var tagID: TArrayOfUInt8;

begin
  if state = BRICKLET_NFC_READER_STATE_IDLE then begin
    sender.ReaderRequestTagID;
  end
  else if state = BRICKLET_NFC_READER_STATE_REQUEST_TAG_ID_READY then begin
    sender.ReaderGetTagID(tagType, tagID);

    tagInfo := 'Found tag of type ' + IntToStr(tagType) + ' with ID [';

    for i := 0 to (length(tagID) - 1) do begin
      if i < Length(tagID) - 1 then begin
        tagInfo := tagInfo + '0x' + IntToHex(tagID[i], 2) + ' ';
      end
      else begin
        tagInfo := tagInfo + '0x' + IntToHex(tagID[i], 2) + ']';
      end;
    end;

    WriteLn(tagInfo);
  end
  else if state = BRICKLET_NFC_READER_STATE_REQUEST_TAG_ID_ERROR then begin
    WriteLn('Request tag ID error');
  end;
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletNFC.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register reader state changed callback to procedure ReaderStateChangedCB }
	  oBricklet.OnReaderStateChanged := {$ifdef FPC}@{$endif}ReaderStateChangedCB;

	  { Enable reader mode }
	  oBricklet.SetMode(BRICKLET_NFC_MODE_READER);

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
