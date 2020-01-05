program ExampleWriteReadType2;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletNFCRFID;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    nr: TBrickletNFCRFID;
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
  const dataWrite: {$ifdef FPC}array [0..15] of byte{$else}TArray0To15OfUInt8{$endif} =
    (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
  var s: String;
  var dataRead: {$ifdef FPC}array [0..15] of byte{$else}TArray0To15OfUInt8{$endif};
  var i: byte;
begin
  if state = BRICKLET_NFC_RFID_STATE_REQUEST_TAG_ID_READY then begin
    { Write 16 byte to pages 5-8 }
    WriteLn('Tag found');
    sender.WritePage(5, dataWrite);
    WriteLn('Writing data...');
  end
  else if state = BRICKLET_NFC_RFID_STATE_WRITE_PAGE_READY then begin
    { Request pages 5-8 }
    sender.RequestPage(5);
    WriteLn('Requesting data...');
  end
  else if state = BRICKLET_NFC_RFID_STATE_REQUEST_PAGE_READY then begin
    { Get and print pages }
    dataRead:= sender.GetPage();
    s:= 'Read data: [' + IntToStr(dataRead[0]);
    for i:= 1 to 15 do begin
      s:= s + ' ' + IntToStr(dataRead[i]);
    end;
    s:= s + ']';
    WriteLn(s);
  end
  else if (state And (1 Shl 6)) = (1 Shl 6) then begin
    WriteLn('Error: ' + IntToStr(state));
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  nr:= TBrickletNFCRFID.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register state changed callback to procedure StateChangedCB }
  nr.OnStateChanged:= {$ifdef FPC}@{$endif}StateChangedCB;

  { Select NFC Forum Type 2 tag }
  nr.RequestTagID(BRICKLET_NFC_RFID_TAG_TYPE_TYPE2);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
