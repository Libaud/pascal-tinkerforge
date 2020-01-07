program ExampleScanForTags;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletNFCRFID;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletNFCRFID;
    currentTagType: byte;
  public
    procedure StateChangedCB(sender: TBrickletNFCRFID; const state: byte;
                             const idle: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your NFC/RFID Bricklet }

var
  e: TExample;

{ Callback procedure for state changed callback }
procedure TExample.StateChangedCB(sender: TBrickletNFCRFID; const state: byte;
                                  const idle: boolean);
  var tagType: byte;
  var tidLength: byte;
  var tid: {$ifdef FPC}array [0..6] of byte{$else}TArray0To6OfUInt8{$endif};
  var s: string;
  var i: byte;
begin
  if state = BRICKLET_NFC_RFID_STATE_REQUEST_TAG_ID_READY then begin
    sender.GetTagID(tagType, tidLength, tid);
    s := 'Found tag of type ' + IntToStr(tagType);
    s := s + ' with ID [' + IntToHex(tid[0], 2);
    for i := 1 to (tidLength - 1) do begin
      s := s + ' ' + IntToHex(tid[i], 2);
    end;
    s := s + ']';
    WriteLn(s);
  end;

  { Cycle through all types }
  if idle then begin
    currentTagType := (currentTagType + 1) mod 3;
    sender.RequestTagID(currentTagType);
  end;
end;

procedure TExample.Execute;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletNFCRFID.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Register state changed callback to procedure StateChangedCB }
	  oBricklet.OnStateChanged := {$ifdef FPC}@{$endif}StateChangedCB;

	  { Start scan loop }
	  currentTagType := BRICKLET_NFC_RFID_TAG_TYPE_MIFARE_CLASSIC;
	  oBricklet.RequestTagID(currentTagType);

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
