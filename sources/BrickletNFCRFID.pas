{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletNFCRFID;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletNFCRFID.inc}

type
  TArray0To15OfUInt8 = array [0..15] of byte;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To5OfUInt8 = array [0..5] of byte;
  TArray0To6OfUInt8 = array [0..6] of byte;

  TBrickletNFCRFID = class;
  TBrickletNFCRFIDNotifyStateChanged = procedure(aSender: TBrickletNFCRFID; const aState: byte; const aIdle: boolean) of object;

  /// <summary>
  ///  Reads and writes NFC and RFID tags
  /// </summary>
  TBrickletNFCRFID = class(TDevice)
  private
    fStateChangedCallback: TBrickletNFCRFIDNotifyStateChanged;
    procedure CallbackWrapperStateChanged(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  To read or write a tag that is in proximity of the NFC/RFID Bricklet you
    ///  first have to call this function with the expected tag type as parameter.
    ///  It is no problem if you don't know the tag type. You can cycle through
    ///  the available tag types until the tag gives an answer to the _request.
    ///  
    ///  Currently the following tag types are supported:
    ///  
    ///  * Mifare Classic
    ///  * NFC Forum Type 1
    ///  * NFC Forum Type 2
    ///  
    ///  After you call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/> the NFC/RFID Bricklet will try to read
    ///  the tag ID from the tag. After this process is done the state will change.
    ///  You can either register the <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback or you can poll
    ///  <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> to find out about the state change.
    ///  
    ///  If the state changes to *_requestTagIDError* it means that either there was
    ///  no tag present or that the tag is of an incompatible type. If the state
    ///  changes to *_requestTagIDReady* it means that a compatible tag was found
    ///  and that the tag ID could be read out. You can now get the tag ID by
    ///  calling <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/>.
    ///  
    ///  If two tags are in the proximity of the NFC/RFID Bricklet, this
    ///  function will cycle through the tags. To select a specific tag you have
    ///  to call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/> until the correct tag id is found.
    ///  
    ///  In case of any *Error* state the selection is lost and you have to
    ///  start again by calling <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>.
    /// </summary>
    procedure RequestTagID(const aTagType: byte); virtual;

    /// <summary>
    ///  Returns the tag type, tag ID and the length of the tag ID
    ///  (4 or 7 bytes are possible length). This function can only be called if the
    ///  NFC/RFID is currently in one of the *Ready* states. The returned ID
    ///  is the ID that was saved through the last call of <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>.
    ///  
    ///  To get the tag ID of a tag the approach is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or
    ///     <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  3. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/>
    /// </summary>
    procedure GetTagID(out aTagType: byte; out aTidLength: byte; out aTid: TArray0To6OfUInt8); virtual;

    /// <summary>
    ///  Returns the current state of the NFC/RFID Bricklet.
    ///                      Matthias Bolte
    ///  On startup the Bricklet will be in the *Initialization* state. The
    ///  initialization will only take about 20ms. After that it changes to *Idle*.
    ///  
    ///  The functions of this Bricklet can be called in the *Idle* state and all of
    ///  the *Ready* and *Error* states.
    ///  
    ///  Example: If you call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestPage"/>, the state will change to
    ///  *_requestPage* until the reading of the page is finished. Then it will change
    ///  to either *_requestPageReady* if it worked or to *_requestPageError* if it
    ///  didn't. If the _request worked you can get the page by calling <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/>.
    ///  
    ///  The same approach is used analogously for the other API functions.
    /// </summary>
    procedure GetState(out aState: byte; out aIdle: boolean); virtual;

    /// <summary>
    ///  Mifare Classic tags use authentication. If you want to read from or write to
    ///  a Mifare Classic page you have to authenticate it beforehand.
    ///  Each page can be authenticated with two keys: A (``key_number`` = 0) and B
    ///  (``key_number`` = 1). A new Mifare Classic
    ///  tag that has not yet been written to can be accessed with key A
    ///  and the default key ``[0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]``.
    ///  
    ///  The approach to read or write a Mifare Classic page is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/>
    ///     or <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if the
    ///     expected tag was found, if it was not found go back to step 1
    ///  4. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/> with page and key for the page
    ///  5. Wait for state to change to *AuthenticatingMifareClassicPageReady* (see
    ///     <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  6. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestPage"/> or <see cref="BrickletNFCRFID.TBrickletNFCRFID.WritePage"/> to read/write page
    /// </summary>
    procedure AuthenticateMifareClassicPage(const aPage: word; const aKeyNumber: byte; const aKey: array of byte); virtual;

    /// <summary>
    ///  Writes 16 bytes starting from the given page. How many pages are written
    ///  depends on the tag type. The page sizes are as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte (one page is written)
    ///  * NFC Forum Type 1 page size: 8 byte (two pages are written)
    ///  * NFC Forum Type 2 page size: 4 byte (four pages are written)
    ///  
    ///  The general approach for writing to a tag is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or
    ///     <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.WritePage"/> with page number and data
    ///  5. Wait for state to change to *WritePageReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> or
    ///     <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can write to it. See <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/>.
    /// </summary>
    procedure WritePage(const aPage: word; const aData: array of byte); virtual;

    /// <summary>
    ///  Reads 16 bytes starting from the given page and stores them into a buffer.
    ///  The buffer can then be read out with <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/>.
    ///  How many pages are read depends on the tag type. The page sizes are
    ///  as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte (one page is read)
    ///  * NFC Forum Type 1 page size: 8 byte (two pages are read)
    ///  * NFC Forum Type 2 page size: 4 byte (four pages are read)
    ///  
    ///  The general approach for reading a tag is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/>
    ///     or <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestPage"/> with page number
    ///  5. Wait for state to change to *_requestPageReady* (see <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/>
    ///     or <see cref="BrickletNFCRFID.TBrickletNFCRFID.OnStateChanged"/> callback)
    ///  6. Call <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetPage"/> to retrieve the page from the buffer
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can read it. See <see cref="BrickletNFCRFID.TBrickletNFCRFID.AuthenticateMifareClassicPage"/>.
    /// </summary>
    procedure RequestPage(const aPage: word); virtual;

    /// <summary>
    ///  Returns 16 bytes of data from an internal buffer. To fill the buffer
    ///  with specific pages you have to call <see cref="BrickletNFCRFID.TBrickletNFCRFID._requestPage"/> beforehand.
    /// </summary>
    function GetPage: TArray0To15OfUInt8; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is called if the state of the NFC/RFID Bricklet changes.
    ///  See <see cref="BrickletNFCRFID.TBrickletNFCRFID.GetState"/> for more information about the possible states.
    /// </summary>
    property OnStateChanged: TBrickletNFCRFIDNotifyStateChanged read fStateChangedCallback write fStateChangedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletNFCRFID.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletNFCRFID.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_REQUEST_TAG_ID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_TAG_ID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_WRITE_PAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_REQUEST_PAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_PAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_RFID_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletNFCRFID.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_NFC_RFID_CALLBACK_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperStateChanged;
end;

procedure TBrickletNFCRFID.RequestTagID(const aTagType: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_REQUEST_TAG_ID, 9);
  LEConvertUInt8To(aTagType, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletNFCRFID.GetTagID(out aTagType: byte; out aTidLength: byte; out aTid: TArray0To6OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_TAG_ID, 8);
  _response:= SendRequest(_request);
  aTagType:= LEConvertUInt8From(8, _response);
  aTidLength:= LEConvertUInt8From(9, _response);
  for _i:= 0 to 6 do aTid[_i]:= LEConvertUInt8From(10 + (_i * 1), _response);
end;

procedure TBrickletNFCRFID.GetState(out aState: byte; out aIdle: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_STATE, 8);
  _response:= SendRequest(_request);
  aState:= LEConvertUInt8From(8, _response);
  aIdle:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletNFCRFID.AuthenticateMifareClassicPage(const aPage: word; const aKeyNumber: byte; const aKey: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_AUTHENTICATE_MIFARE_CLASSIC_PAGE, 17);
  LEConvertUInt16To(aPage, 8, _request);
  LEConvertUInt8To(aKeyNumber, 10, _request);
  if (Length(aKey) <> 6) then raise EInvalidParameterException.Create('Key has to be exactly 6 items long');
  for _i:= 0 to Length(aKey) - 1 do LEConvertUInt8To(aKey[_i], 11 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFCRFID.WritePage(const aPage: word; const aData: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_WRITE_PAGE, 26);
  LEConvertUInt16To(aPage, 8, _request);
  if (Length(aData) <> 16) then raise EInvalidParameterException.Create('Data has to be exactly 16 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 10 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFCRFID.RequestPage(const aPage: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_REQUEST_PAGE, 10);
  LEConvertUInt16To(aPage, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFCRFID.GetPage: TArray0To15OfUInt8;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_PAGE, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 15 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletNFCRFID.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_RFID_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletNFCRFID.CallbackWrapperStateChanged(const aPacket: TDynamicByteArray);
var
  _state: byte;
  _idle: boolean;
begin
  _state:= LEConvertUInt8From(8, aPacket);
  _idle:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fStateChangedCallback)) then begin
    fStateChangedCallback(self, _state, _idle);
  end;
end;

end.
