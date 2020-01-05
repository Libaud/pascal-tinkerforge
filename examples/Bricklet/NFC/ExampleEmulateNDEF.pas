program ExampleEmulateNDEF;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletNFC;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    nfc: TBrickletNFC;
  public
    procedure CardemuStateChangedCB(sender: TBrickletNFC; const state: byte;
                                    const idle: boolean);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your NFC Bricklet }
  NDEF_URI = 'www.tinkerforge.com';

var
  e: TExample;

{ Callback procedure for cardemu state changed callback }
procedure TExample.CardemuStateChangedCB(sender: TBrickletNFC; const state: byte;
                                         const idle: boolean);
  var i: byte;
  var ndefRecordURI: Array of Byte;
begin
  if state = BRICKLET_NFC_CARDEMU_STATE_IDLE then begin
    { Only short records are supported } 
    SetLength(ndefRecordURI, Length(NDEF_URI) + 5);

    ndefRecordURI[0]:= $D1;                  { MB/ME/CF/SR=1/IL/TNF }
    ndefRecordURI[1]:= $01;                  { TYPE LENGTH }
    ndefRecordURI[2]:= Length(NDEF_URI) + 1; { Length }
    ndefRecordURI[3]:= ord('U');             { Type }
    ndefRecordURI[4]:= $04;                  { Status }

    for i:= 0 to (Length(NDEF_URI) + 1) do begin
      ndefRecordURI[5 + i]:= ord(NDEF_URI[i + 1]);
    end;

    nfc.CardemuWriteNDEF(ndefRecordURI);
    nfc.CardemuStartDiscovery;
  end
  else if state = BRICKLET_NFC_CARDEMU_STATE_DISCOVER_READY then begin
    sender.CardemuStartTransfer(BRICKLET_NFC_CARDEMU_TRANSFER_WRITE);
  end
  else if state = BRICKLET_NFC_CARDEMU_STATE_DISCOVER_ERROR then begin
    WriteLn('Discover error');
  end
  else if state = BRICKLET_NFC_CARDEMU_STATE_TRANSFER_NDEF_ERROR then begin
    WriteLn('Transfer NDEF error');
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  nfc:= TBrickletNFC.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register cardemu state changed callback to procedure CardemuStateChangedCB }
  nfc.OnCardemuStateChanged:= {$ifdef FPC}@{$endif}CardemuStateChangedCB;

  { Enable cardemu mode }
  nfc.SetMode(BRICKLET_NFC_MODE_CARDEMU);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
