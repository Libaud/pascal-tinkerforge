program ExampleScanForTags;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletNFCRFID;

type
  TExample = class
  private
    ipcon: TIPConnection;
    nr: TBrickletNFCRFID;
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
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  nr := TBrickletNFCRFID.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register state changed callback to procedure StateChangedCB }
  nr.OnStateChanged := {$ifdef FPC}@{$endif}StateChangedCB;

  { Start scan loop }
  currentTagType := BRICKLET_NFC_RFID_TAG_TYPE_MIFARE_CLASSIC;
  nr.RequestTagID(currentTagType);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
