{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletNFC;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletNFC.inc}

type
  TBrickletNFC = class;

  TBrickletNFCNotifyReaderStateChanged = procedure(aSender: TBrickletNFC; const aState: byte; const aIdle: boolean) of object;
  TBrickletNFCNotifyCardemuStateChanged = procedure(aSender: TBrickletNFC; const aState: byte; const aIdle: boolean) of object;
  TBrickletNFCNotifyP2PStateChanged = procedure(aSender: TBrickletNFC; const aState: byte; const aIdle: boolean) of object;

  /// <summary>
  ///  NFC tag read/write, NFC P2P and Card Emulation
  /// </summary>
  TBrickletNFC = class(TThreadedDevice)
  private
    fReaderStateChangedCallback: TBrickletNFCNotifyReaderStateChanged;
    fCardemuStateChangedCallback: TBrickletNFCNotifyCardemuStateChanged;
    fP2PStateChangedCallback: TBrickletNFCNotifyP2PStateChanged;
    procedure CallbackWrapperReaderStateChanged(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCardemuStateChanged(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperP2PStateChanged(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the mode. The NFC Bricklet supports four modes:
    ///  
    ///  * Off
    ///  * Card Emulation (Cardemu): Emulates a tag for other readers
    ///  * Peer to Peer (P2P): Exchange data with other readers
    ///  * Reader: Reads and writes tags
    ///  
    ///  If you change a mode, the Bricklet will reconfigure the hardware for this mode.
    ///  Therefore, you can only use functions corresponding to the current mode. For
    ///  example, in Reader mode you can only use Reader functions.
    /// </summary>
    procedure SetMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the mode as set by <see cref="BrickletNFC.TBrickletNFC.SetMode"/>.
    /// </summary>
    function GetMode: byte; virtual;

    /// <summary>
    ///  To read or write a tag that is in proximity of the NFC Bricklet you
    ///  first have to call this function with the expected tag type as parameter.
    ///  It is no problem if you don't know the tag type. You can cycle through
    ///  the available tag types until the tag answers the _request.
    ///  
    ///  Currently the following tag types are supported:
    ///  
    ///  * Mifare Classic
    ///  * NFC Forum Type 1
    ///  * NFC Forum Type 2
    ///  * NFC Forum Type 3
    ///  * NFC Forum Type 4
    ///  
    ///  After you call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/> the NFC Bricklet will try to read
    ///  the tag ID from the tag. After this process is done the state will change.
    ///  You can either register the <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback or you can poll
    ///  <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> to find out about the state change.
    ///  
    ///  If the state changes to *Reader_requestTagIDError* it means that either there was
    ///  no tag present or that the tag has an incompatible type. If the state
    ///  changes to *Reader_requestTagIDReady* it means that a compatible tag was found
    ///  and that the tag ID has been saved. You can now read out the tag ID by
    ///  calling <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/>.
    ///  
    ///  If two tags are in the proximity of the NFC Bricklet, this
    ///  function will cycle through the tags. To select a specific tag you have
    ///  to call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/> until the correct tag ID is found.
    ///  
    ///  In case of any *ReaderError* state the selection is lost and you have to
    ///  start again by calling <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>.
    /// </summary>
    procedure ReaderRequestTagID; virtual;

    /// <summary>
    ///  Returns the tag type and the tag ID. This function can only be called if the
    ///  NFC Bricklet is currently in one of the *ReaderReady* states. The returned tag ID
    ///  is the tag ID that was saved through the last call of <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>.
    ///  
    ///  To get the tag ID of a tag the approach is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. Call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/>
    /// </summary>
    procedure ReaderGetTagIDLowLevel(out aTagType: byte; out aTagIDLength: byte; out aTagIDData: TArray0To31OfUInt8); virtual;

    /// <summary>
    ///  Returns the tag type and the tag ID. This function can only be called if the
    ///  NFC Bricklet is currently in one of the *ReaderReady* states. The returned tag ID
    ///  is the tag ID that was saved through the last call of <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>.
    ///  
    ///  To get the tag ID of a tag the approach is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. Call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/>
    /// </summary>
    procedure ReaderGetTagID(out aTagType: byte; out aTagID: TArrayOfUInt8); virtual;

    /// <summary>
    ///  Returns the current reader state of the NFC Bricklet.
    ///  
    ///  On startup the Bricklet will be in the *ReaderInitialization* state. The
    ///  initialization will only take about 20ms. After that it changes to *ReaderIdle*.
    ///  
    ///  The Bricklet is also reinitialized if the mode is changed, see <see cref="BrickletNFC.TBrickletNFC.SetMode"/>.
    ///  
    ///  The functions of this Bricklet can be called in the *ReaderIdle* state and all of
    ///  the *ReaderReady* and *ReaderError* states.
    ///  
    ///  Example: If you call <see cref="BrickletNFC.TBrickletNFC.Reader_requestPage"/>, the state will change to
    ///  *Reader_requestPage* until the reading of the page is finished. Then it will change
    ///  to either *Reader_requestPageReady* if it worked or to *Reader_requestPageError* if it
    ///  didn't. If the _request worked you can get the page by calling <see cref="BrickletNFC.TBrickletNFC.ReaderReadPage"/>.
    ///  
    ///  The same approach is used analogously for the other API functions.
    /// </summary>
    procedure ReaderGetState(out aState: byte; out aIdle: boolean); virtual;

    /// <summary>
    ///  Writes NDEF formated data.
    ///  
    ///  This function currently supports NFC Forum Type 2 and 4.
    ///  
    ///  The general approach for writing a NDEF message is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see
    ///     <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check
    ///     if the expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.ReaderWriteNDEF"/> with the NDEF message that you want to write
    ///  5. Wait for state to change to *ReaderWriteNDEFReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    /// </summary>
    procedure ReaderWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Writes NDEF formated data.
    ///  
    ///  This function currently supports NFC Forum Type 2 and 4.
    ///  
    ///  The general approach for writing a NDEF message is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see
    ///     <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check
    ///     if the expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.ReaderWriteNDEF"/> with the NDEF message that you want to write
    ///  5. Wait for state to change to *ReaderWriteNDEFReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    /// </summary>
    procedure ReaderWriteNDEF(const aNDEF: array of byte); virtual;

    /// <summary>
    ///  Reads NDEF formated data from a tag.
    ///  
    ///  This function currently supports NFC Forum Type 1, 2, 3 and 4.
    ///  
    ///  The general approach for reading a NDEF message is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestNDEF"/>
    ///  5. Wait for state to change to *Reader_requestNDEFReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  6. Call <see cref="BrickletNFC.TBrickletNFC.ReaderReadNDEF"/> to retrieve the NDEF message from the buffer
    /// </summary>
    procedure ReaderRequestNDEF; virtual;

    /// <summary>
    ///  Returns the NDEF data from an internal buffer. To fill the buffer
    ///  with a NDEF message you have to call <see cref="BrickletNFC.TBrickletNFC.Reader_requestNDEF"/> beforehand.
    /// </summary>
    procedure ReaderReadNDEFLowLevel(out aNDefLength: word; out aNDefChunkOffset: word; out aNDefChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns the NDEF data from an internal buffer. To fill the buffer
    ///  with a NDEF message you have to call <see cref="BrickletNFC.TBrickletNFC.Reader_requestNDEF"/> beforehand.
    /// </summary>
    function ReaderReadNDEF: TArrayOfUInt8; virtual;

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
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTndefChunkDataagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.ReaderAuthenticateMifareClassicPage"/> with page and key for the page
    ///  5. Wait for state to change to *ReaderAuthenticatingMifareClassicPageReady* (see
    ///     <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  6. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestPage"/> or <see cref="BrickletNFC.TBrickletNFC.ReaderWritePage"/> to read/write page
    ///  
    ///  The authentication will always work for one whole sector (4 pages).
    /// </summary>
    procedure ReaderAuthenticateMifareClassicPage(const aPage: word; const aKeyNumber: byte; const aKey: array of byte); virtual;

    /// <summary>
    ///  Writes a maximum of 8192 bytes starting from the given page. How many pages are written
    ///  depends on the tag type. The page sizes are as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte
    ///  * NFC Forum Type 1 page size: 8 byte
    ///  * NFC Forum Type 2 page size: 4 byte
    ///  * NFC Forum Type 3 page size: 16 byte
    ///  * NFC Forum Type 4: No pages, page = file selection (CC or NDEF, see below)
    ///  
    ///  The general approach for writing to a tag is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.ReaderWritePage"/> with page number and data
    ///  5. Wait for state to change to *ReaderWritePageReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can write to it. See <see cref="BrickletNFC.TBrickletNFC.ReaderAuthenticateMifareClassicPage"/>.
    ///  
    ///  NFC Forum Type 4 tags are not organized into pages but different files. We currently
    ///  support two files: Capability Container file (CC) and NDEF file.
    ///  
    ///  Choose CC by setting page to 3 or NDEF by setting page to 4.
    /// </summary>
    procedure ReaderWritePageLowLevel(const aPage: word; const aDataLength: word; const aDataChunkOffset: word; const aDataChunkData: TArray0To57OfUInt8); virtual;

    /// <summary>
    ///  Writes a maximum of 8192 bytes starting from the given page. How many pages are written
    ///  depends on the tag type. The page sizes are as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte
    ///  * NFC Forum Type 1 page size: 8 byte
    ///  * NFC Forum Type 2 page size: 4 byte
    ///  * NFC Forum Type 3 page size: 16 byte
    ///  * NFC Forum Type 4: No pages, page = file selection (CC or NDEF, see below)
    ///  
    ///  The general approach for writing to a tag is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *Reader_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.ReaderWritePage"/> with page number and data
    ///  5. Wait for state to change to *ReaderWritePageReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> or
    ///     <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can write to it. See <see cref="BrickletNFC.TBrickletNFC.ReaderAuthenticateMifareClassicPage"/>.
    ///  
    ///  NFC Forum Type 4 tags are not organized into pages but different files. We currently
    ///  support two files: Capability Container file (CC) and NDEF file.
    ///  
    ///  Choose CC by setting page to 3 or NDEF by setting page to 4.
    /// </summary>
    procedure ReaderWritePage(const aPage: word; const aData: array of byte); virtual;

    /// <summary>
    ///  Reads a maximum of 8192 bytes starting from the given page and stores them into a buffer.
    ///  The buffer can then be read out with <see cref="BrickletNFC.TBrickletNFC.ReaderReadPage"/>.
    ///  How many pages are read depends on the tag type. The page sizes are
    ///  as follows:
    ///  
    ///  * Mifare Classic page size: 16 byte
    ///  * NFC Forum Type 1 page size: 8 byte
    ///  * NFC Forum Type 2 page size: 4 byte
    ///  * NFC Forum Type 3 page size: 16 byte
    ///  * NFC Forum Type 4: No pages, page = file selection (CC or NDEF, see below)
    ///  
    ///  The general approach for reading a tag is as follows:
    ///  
    ///  1. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/>
    ///  2. Wait for state to change to *_requestTagIDReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  3. If looking for a specific tag then call <see cref="BrickletNFC.TBrickletNFC.ReaderGetTagID"/> and check if the
    ///     expected tag was found, if it was not found got back to step 1
    ///  4. Call <see cref="BrickletNFC.TBrickletNFC.Reader_requestPage"/> with page number
    ///  5. Wait for state to change to *Reader_requestPageReady* (see <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/>
    ///     or <see cref="BrickletNFC.TBrickletNFC.OnReaderStateChanged"/> callback)
    ///  6. Call <see cref="BrickletNFC.TBrickletNFC.ReaderReadPage"/> to retrieve the page from the buffer
    ///  
    ///  If you use a Mifare Classic tag you have to authenticate a page before you
    ///  can read it. See <see cref="BrickletNFC.TBrickletNFC.ReaderAuthenticateMifareClassicPage"/>.
    ///  
    ///  NFC Forum Type 4 tags are not organized into pages but different files. We currently
    ///  support two files: Capability Container file (CC) and NDEF file.
    ///  
    ///  Choose CC by setting page to 3 or NDEF by setting page to 4.
    /// </summary>
    procedure ReaderRequestPage(const aPage: word; const aLength: word); virtual;

    /// <summary>
    ///  Returns the page data from an internal buffer. To fill the buffer
    ///  with specific pages you have to call <see cref="BrickletNFC.TBrickletNFC.Reader_requestPage"/> beforehand.
    /// </summary>
    procedure ReaderReadPageLowLevel(out aDataLength: word; out aDataChunkOffset: word; out aDataChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns the page data from an internal buffer. To fill the buffer
    ///  with specific pages you have to call <see cref="BrickletNFC.TBrickletNFC.Reader_requestPage"/> beforehand.
    /// </summary>
    function ReaderReadPage: TArrayOfUInt8; virtual;

    /// <summary>
    ///  Returns the current cardemu state of the NFC Bricklet.
    ///  
    ///  On startup the Bricklet will be in the *CardemuInitialization* state. The
    ///  initialization will only take about 20ms. After that it changes to *CardemuIdle*.
    ///  
    ///  The Bricklet is also reinitialized if the mode is changed, see <see cref="BrickletNFC.TBrickletNFC.SetMode"/>.
    ///  
    ///  The functions of this Bricklet can be called in the *CardemuIdle* state and all of
    ///  the *CardemuReady* and *CardemuError* states.
    ///  
    ///  Example: If you call <see cref="BrickletNFC.TBrickletNFC.CardemuStartDiscovery"/>, the state will change to
    ///  *CardemuDiscover* until the discovery is finished. Then it will change
    ///  to either *CardemuDiscoverReady* if it worked or to *CardemuDiscoverError* if it
    ///  didn't.
    ///  
    ///  The same approach is used analogously for the other API functions.
    /// </summary>
    procedure CardemuGetState(out aState: byte; out aIdle: boolean); virtual;

    /// <summary>
    ///  Starts the discovery process. If you call this function while a NFC
    ///  reader device is near to the NFC Bricklet the state will change from
    ///  *CardemuDiscovery* to *CardemuDiscoveryReady*.
    ///  
    ///  If no NFC reader device can be found or if there is an error during
    ///  discovery the cardemu state will change to *CardemuDiscoveryError*. In this case you
    ///  have to restart the discovery process.
    ///  
    ///  If the cardemu state changes to *CardemuDiscoveryReady* you can start the NDEF message
    ///  transfer with <see cref="BrickletNFC.TBrickletNFC.CardemuWriteNDEF"/> and <see cref="BrickletNFC.TBrickletNFC.CardemuStartTransfer"/>.
    /// </summary>
    procedure CardemuStartDiscovery; virtual;

    /// <summary>
    ///  Writes the NDEF messages that is to be transferred to the NFC peer.
    ///  
    ///  The maximum supported NDEF message size in Cardemu mode is 255 byte.
    ///  
    ///  You can call this function at any time in Cardemu mode. The internal buffer
    ///  will not be overwritten until you call this function again or change the
    ///  mode.
    /// </summary>
    procedure CardemuWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Writes the NDEF messages that is to be transferred to the NFC peer.
    ///  
    ///  The maximum supported NDEF message size in Cardemu mode is 255 byte.
    ///  
    ///  You can call this function at any time in Cardemu mode. The internal buffer
    ///  will not be overwritten until you call this function again or change the
    ///  mode.
    /// </summary>
    procedure CardemuWriteNDEF(const aNDef: array of byte); virtual;

    /// <summary>
    ///  You can start the transfer of a NDEF message if the cardemu state is *CardemuDiscoveryReady*.
    ///  
    ///  Before you call this function to start a write transfer, the NDEF message that
    ///  is to be transferred has to be written via <see cref="BrickletNFC.TBrickletNFC.CardemuWriteNDEF"/> first.
    ///  
    ///  After you call this function the state will change to *CardemuTransferNDEF*. It will
    ///  change to *CardemuTransferNDEFReady* if the transfer was successful or
    ///  *CardemuTransferNDEFError* if it wasn't.
    /// </summary>
    procedure CardemuStartTransfer(const aTransfer: byte); virtual;

    /// <summary>
    ///  Returns the current P2P state of the NFC Bricklet.
    ///  
    ///  On startup the Bricklet will be in the *P2PInitialization* state. The
    ///  initialization will only take about 20ms. After that it changes to *P2PIdle*.
    ///  
    ///  The Bricklet is also reinitialized if the mode is changed, see <see cref="BrickletNFC.TBrickletNFC.SetMode"/>.
    ///  
    ///  The functions of this Bricklet can be called in the *P2PIdle* state and all of
    ///  the *P2PReady* and *P2PError* states.
    ///  
    ///  Example: If you call <see cref="BrickletNFC.TBrickletNFC.P2PStartDiscovery"/>, the state will change to
    ///  *P2PDiscover* until the discovery is finished. Then it will change
    ///  to either P2PDiscoverReady* if it worked or to *P2PDiscoverError* if it
    ///  didn't.
    ///  
    ///  The same approach is used analogously for the other API functions.
    /// </summary>
    procedure P2PGetState(out aState: byte; out aIdle: boolean); virtual;

    /// <summary>
    ///  Starts the discovery process. If you call this function while another NFC
    ///  P2P enabled device is near to the NFC Bricklet the state will change from
    ///  *P2PDiscovery* to *P2PDiscoveryReady*.
    ///  
    ///  If no NFC P2P enabled device can be found or if there is an error during
    ///  discovery the P2P state will change to *P2PDiscoveryError*. In this case you
    ///  have to restart the discovery process.
    ///  
    ///  If the P2P state changes to *P2PDiscoveryReady* you can start the NDEF message
    ///  transfer with <see cref="BrickletNFC.TBrickletNFC.P2PStartTransfer"/>.
    /// </summary>
    procedure P2PStartDiscovery; virtual;

    /// <summary>
    ///  Writes the NDEF messages that is to be transferred to the NFC peer.
    ///  
    ///  The maximum supported NDEF message size for P2P transfer is 255 byte.
    ///  
    ///  You can call this function at any time in P2P mode. The internal buffer
    ///  will not be overwritten until you call this function again, change the
    ///  mode or use P2P to read an NDEF messages.
    /// </summary>
    procedure P2PWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Writes the NDEF messages that is to be transferred to the NFC peer.
    ///  
    ///  The maximum supported NDEF message size for P2P transfer is 255 byte.
    ///  
    ///  You can call this function at any time in P2P mode. The internal buffer
    ///  will not be overwritten until you call this function again, change the
    ///  mode or use P2P to read an NDEF messages.
    /// </summary>
    procedure P2PWriteNDEF(const aNDef: array of byte); virtual;

    /// <summary>
    ///  You can start the transfer of a NDEF message if the P2P state is *P2PDiscoveryReady*.
    ///  
    ///  Before you call this function to start a write transfer, the NDEF message that
    ///  is to be transferred has to be written via <see cref="BrickletNFC.TBrickletNFC.P2PWriteNDEF"/> first.
    ///  
    ///  After you call this function the P2P state will change to *P2PTransferNDEF*. It will
    ///  change to *P2PTransferNDEFReady* if the transfer was successfull or
    ///  *P2PTransferNDEFError* if it wasn't.
    ///  
    ///  If you started a write transfer you are now done. If you started a read transfer
    ///  you can now use <see cref="BrickletNFC.TBrickletNFC.P2PReadNDEF"/> to read the NDEF message that was written
    ///  by the NFC peer.
    /// </summary>
    procedure P2PStartTransfer(const aTransfer: byte); virtual;

    /// <summary>
    ///  Returns the NDEF message that was written by a NFC peer in NFC P2P mode.
    ///  
    ///  The NDEF message is ready if you called <see cref="BrickletNFC.TBrickletNFC.P2PStartTransfer"/> with a
    ///  read transfer and the P2P state changed to *P2PTransferNDEFReady*.
    /// </summary>
    procedure P2PReadNDEFLowLevel(out aNDefLength: word; out aNDefChunkOffset: word; out aNDefChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns the NDEF message that was written by a NFC peer in NFC P2P mode.
    ///  
    ///  The NDEF message is ready if you called <see cref="BrickletNFC.TBrickletNFC.P2PStartTransfer"/> with a
    ///  read transfer and the P2P state changed to *P2PTransferNDEFReady*.
    /// </summary>
    function P2PReadNDEF: TArrayOfUInt8; virtual;

    /// <summary>
    ///  Sets the detection LED configuration. By default the LED shows
    ///  if a card/reader is detected.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetDetectionLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletNFC.TBrickletNFC.SetDetectionLEDConfig"/>
    /// </summary>
    function GetDetectionLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the maximum timeout.
    ///  
    ///  This is a global maximum used for all internal state timeouts. The timeouts depend heavily
    ///  on the used tags etc. For example: If you use a Type 2 tag and you want to detect if
    ///  it is present, you have to use <see cref="BrickletNFC.TBrickletNFC.Reader_requestTagID"/> and wait for the state
    ///  to change to either the error state or the ready state.
    ///  
    ///  With the default configuration this takes 2-3 seconds. By setting the maximum timeout to
    ///  100ms you can reduce this time to ~150-200ms. For Type 2 this would also still work
    ///  with a 20ms timeout (a Type 2 tag answers usually within 10ms). A type 4 tag can take
    ///  up to 500ms in our tests.
    ///  
    ///  If you need a fast _response time to discover if a tag is present or not you can find
    ///  a good timeout value by trial and error for your specific tag.
    ///  
    ///  By default we use a very conservative timeout, to be sure that any tag can always
    ///  answer in time.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetMaximumTimeout(const aTimeout: word); virtual;

    /// <summary>
    ///  Returns the timeout as set by <see cref="BrickletNFC.TBrickletNFC.SetMaximumTimeout"/>
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetMaximumTimeout: word; virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.

    /// </summary>
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletNFC.TBrickletNFC.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletNFC.TBrickletNFC.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletNFC.TBrickletNFC.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletNFC.TBrickletNFC.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

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
    ///  This callback is called if the reader state of the NFC Bricklet changes.
    ///  See <see cref="BrickletNFC.TBrickletNFC.ReaderGetState"/> for more information about the possible states.
    /// </summary>
    property OnReaderStateChanged: TBrickletNFCNotifyReaderStateChanged read fReaderStateChangedCallback write fReaderStateChangedCallback;

    /// <summary>
    ///  This callback is called if the cardemu state of the NFC Bricklet changes.
    ///  See <see cref="BrickletNFC.TBrickletNFC.CardemuGetState"/> for more information about the possible states.
    /// </summary>
    property OnCardemuStateChanged: TBrickletNFCNotifyCardemuStateChanged read fCardemuStateChangedCallback write fCardemuStateChangedCallback;

    /// <summary>
    ///  This callback is called if the P2P state of the NFC Bricklet changes.
    ///  See <see cref="BrickletNFC.TBrickletNFC.P2PGetState"/> for more information about the possible states.
    /// </summary>
    property OnP2PStateChanged: TBrickletNFCNotifyP2PStateChanged read fP2PStateChangedCallback write fP2PStateChangedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletNFC.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletNFC.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_REQUEST_TAG_ID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_GET_TAG_ID_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_WRITE_NDEF_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_REQUEST_NDEF]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_READ_NDEF_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_AUTHENTICATE_MIFARE_CLASSIC_PAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_WRITE_PAGE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_REQUEST_PAGE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READER_READ_PAGE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_CARDEMU_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_CARDEMU_START_DISCOVERY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_CARDEMU_WRITE_NDEF_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_CARDEMU_START_TRANSFER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_P2P_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_P2P_START_DISCOVERY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_P2P_WRITE_NDEF_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_P2P_START_TRANSFER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_P2P_READ_NDEF_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_DETECTION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_DETECTION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_MAXIMUM_TIMEOUT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_MAXIMUM_TIMEOUT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_NFC_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletNFC.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_NFC_CALLBACK_READER_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperReaderStateChanged;
  aCallBacks[BRICKLET_NFC_CALLBACK_CARDEMU_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperCardemuStateChanged;
  aCallBacks[BRICKLET_NFC_CALLBACK_P2P_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperP2PStateChanged;
end;

procedure TBrickletNFC.SetMode(const aMode: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.GetMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletNFC.ReaderRequestTagID;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_REQUEST_TAG_ID, 8);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderGetTagIDLowLevel(out aTagType: byte; out aTagIDLength: byte; out aTagIDData: TArray0To31OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_GET_TAG_ID_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aTagType:= LEConvertUInt8From(8, _response);
  aTagIDLength:= LEConvertUInt8From(9, _response);
  for _i:= 0 to 31 do aTagIDData[_i]:= LEConvertUInt8From(10 + (_i * 1), _response);
end;

procedure TBrickletNFC.ReaderGetTagID(out aTagType: byte; out aTagID: TArrayOfUInt8);
var
  _tagIDLength: byte;
  _tagIDData: TArray0To31OfUInt8;
begin
  ReaderGetTagIDLowLevel(aTagType, _tagIDLength, _tagIDData);
  SetLength(aTagID, _tagIDLength);
  Move(_tagIDData, aTagID[0], SizeOf(byte) * _tagIDLength);
end;

procedure TBrickletNFC.ReaderGetState(out aState: byte; out aIdle: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_GET_STATE, 8);
  _response:= SendRequest(_request);
  aState:= LEConvertUInt8From(8, _response);
  aIdle:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletNFC.ReaderWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_WRITE_NDEF_LOW_LEVEL, 72);
  LEConvertUInt16To(aNDefLength, 8, _request);
  LEConvertUInt16To(aNDefChunkOffset, 10, _request);
  for _i:= 0 to Length(aNDefChunkData) - 1 do LEConvertUInt8To(aNDefChunkData[_i], 12 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderWriteNDEF(const aNDEF: array of byte);
var
  _ndefChunkOffset: word;
  _ndefChunkData: TArray0To59OfUInt8;
  _ndefChunkLength: word;
  _ndefLength: word;
begin
  if (Length(aNDEF) > 65535) then begin
    raise EInvalidParameterException.Create('NDEF can be at most 65535 items long');
  end;

  _ndefLength:= Length(aNDEF);
  _ndefChunkOffset:= 0;

  if (_ndefLength = 0) then begin
    FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
    ReaderWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_ndefChunkOffset < _ndefLength) do begin
        _ndefChunkLength:= _ndefLength - _ndefChunkOffset;

        if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;

        FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
        Move(aNDEF[_ndefChunkOffset], _ndefChunkData[0], SizeOf(byte) * _ndefChunkLength);

        ReaderWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
        Inc(_ndefChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletNFC.ReaderRequestNDEF;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_REQUEST_NDEF, 8);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderReadNDEFLowLevel(out aNDefLength: word; out aNDefChunkOffset: word; out aNDefChunkData: TArray0To59OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_READ_NDEF_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aNDefLength:= LEConvertUInt16From(8, _response);
  aNDefChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aNDefChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletNFC.ReaderReadNDEF: TArrayOfUInt8;
var
  _ndef: TArrayOfUInt8;
  _ndefCurrentLength: word;
  _ndefLength: word;
  _ndefChunkOffset: word;
  _ndefChunkData: TArray0To59OfUInt8;
  _ndefOutOfSync: boolean;
  _ndefChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_ndef, 0);
  StreamMutex.Acquire;
  try
    _ndefLength:= 0;
    ReaderReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
    SetLength(_ndef, _ndefLength);
    _ndefOutOfSync:= (_ndefChunkOffset <> 0);

    if ((not _ndefOutOfSync) and (_ndefLength > 0)) then begin
      _ndefChunkLength:= _ndefLength - _ndefChunkOffset;
      if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;
      Move(_ndefChunkData, _ndef[0], SizeOf(byte) * _ndefChunkLength);
      _ndefCurrentLength:= _ndefChunkLength;

      while ((not _ndefOutOfSync) and (_ndefCurrentLength < _ndefLength)) do begin
        ReaderReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
        _ndefOutOfSync:= _ndefChunkOffset <> _ndefCurrentLength;
        _ndefChunkLength:= _ndefLength - _ndefChunkOffset;
        if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;
        Move(_ndefChunkData, _ndef[_ndefCurrentLength], SizeOf(byte) * _ndefChunkLength);
        Inc(_ndefCurrentLength, _ndefChunkLength);
      end;
    end;

    if (_ndefOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_ndefChunkOffset + 60 < _ndefLength) do begin
        ReaderReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
      end;

      raise EStreamOutOfSyncException.Create('NDEF stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _ndef;
end;

procedure TBrickletNFC.ReaderAuthenticateMifareClassicPage(const aPage: word; const aKeyNumber: byte; const aKey: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_AUTHENTICATE_MIFARE_CLASSIC_PAGE, 17);
  LEConvertUInt16To(aPage, 8, _request);
  LEConvertUInt8To(aKeyNumber, 10, _request);
  if (Length(aKey) <> 6) then raise EInvalidParameterException.Create('Key has to be exactly 6 items long');
  for _i:= 0 to Length(aKey) - 1 do LEConvertUInt8To(aKey[_i], 11 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderWritePageLowLevel(const aPage: word; const aDataLength: word; const aDataChunkOffset: word; const aDataChunkData: TArray0To57OfUInt8);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_WRITE_PAGE_LOW_LEVEL, 72);
  LEConvertUInt16To(aPage, 8, _request);
  LEConvertUInt16To(aDataLength, 10, _request);
  LEConvertUInt16To(aDataChunkOffset, 12, _request);
  for _i:= 0 to Length(aDataChunkData) - 1 do LEConvertUInt8To(aDataChunkData[_i], 14 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderWritePage(const aPage: word; const aData: array of byte);
var
  _dataChunkOffset: word;
  _dataChunkData: TArray0To57OfUInt8;
  _dataChunkLength: word;
  _dataLength: word;
begin
  if (Length(aData) > 65535) then begin
    raise EInvalidParameterException.Create('Data can be at most 65535 items long');
  end;

  _dataLength:= Length(aData);
  _dataChunkOffset:= 0;

  if (_dataLength = 0) then begin
    FillChar(_dataChunkData[0], SizeOf(byte) * 58, 0);
    ReaderWritePageLowLevel(aPage, _dataLength, _dataChunkOffset, _dataChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_dataChunkOffset < _dataLength) do begin
        _dataChunkLength:= _dataLength - _dataChunkOffset;

        if (_dataChunkLength > 58) then _dataChunkLength:= 58;

        FillChar(_dataChunkData[0], SizeOf(byte) * 58, 0);
        Move(aData[_dataChunkOffset], _dataChunkData[0], SizeOf(byte) * _dataChunkLength);

        ReaderWritePageLowLevel(aPage, _dataLength, _dataChunkOffset, _dataChunkData);
        Inc(_dataChunkOffset, 58);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletNFC.ReaderRequestPage(const aPage: word; const aLength: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_REQUEST_PAGE, 12);
  LEConvertUInt16To(aPage, 8, _request);
  LEConvertUInt16To(aLength, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.ReaderReadPageLowLevel(out aDataLength: word; out aDataChunkOffset: word; out aDataChunkData: TArray0To59OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READER_READ_PAGE_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aDataLength:= LEConvertUInt16From(8, _response);
  aDataChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aDataChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletNFC.ReaderReadPage: TArrayOfUInt8;
var
  _data: TArrayOfUInt8;
  _dataCurrentLength: word;
  _dataLength: word;
  _dataChunkOffset: word;
  _dataChunkData: TArray0To59OfUInt8;
  _dataOutOfSync: boolean;
  _dataChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_data, 0);
  StreamMutex.Acquire;
  try
    _dataLength:= 0;
    ReaderReadPageLowLevel(_dataLength, _dataChunkOffset, _dataChunkData);
    SetLength(_data, _dataLength);
    _dataOutOfSync:= (_dataChunkOffset <> 0);

    if ((not _dataOutOfSync) and (_dataLength > 0)) then begin
      _dataChunkLength:= _dataLength - _dataChunkOffset;
      if (_dataChunkLength > 60) then _dataChunkLength:= 60;
      Move(_dataChunkData, _data[0], SizeOf(byte) * _dataChunkLength);
      _dataCurrentLength:= _dataChunkLength;

      while ((not _dataOutOfSync) and (_dataCurrentLength < _dataLength)) do begin
        ReaderReadPageLowLevel(_dataLength, _dataChunkOffset, _dataChunkData);
        _dataOutOfSync:= _dataChunkOffset <> _dataCurrentLength;
        _dataChunkLength:= _dataLength - _dataChunkOffset;
        if (_dataChunkLength > 60) then _dataChunkLength:= 60;
        Move(_dataChunkData, _data[_dataCurrentLength], SizeOf(byte) * _dataChunkLength);
        Inc(_dataCurrentLength, _dataChunkLength);
      end;
    end;

    if (_dataOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_dataChunkOffset + 60 < _dataLength) do begin
        ReaderReadPageLowLevel(_dataLength, _dataChunkOffset, _dataChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Data stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _data;
end;

procedure TBrickletNFC.CardemuGetState(out aState: byte; out aIdle: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_CARDEMU_GET_STATE, 8);
  _response:= SendRequest(_request);
  aState:= LEConvertUInt8From(8, _response);
  aIdle:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletNFC.CardemuStartDiscovery;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_CARDEMU_START_DISCOVERY, 8);
  SendRequest(_request);
end;

procedure TBrickletNFC.CardemuWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_CARDEMU_WRITE_NDEF_LOW_LEVEL, 72);
  LEConvertUInt16To(aNDefLength, 8, _request);
  LEConvertUInt16To(aNDefChunkOffset, 10, _request);
  for _i:= 0 to Length(aNDefChunkData) - 1 do LEConvertUInt8To(aNDefChunkData[_i], 12 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.CardemuWriteNDEF(const aNDef: array of byte);
var
  _ndefChunkOffset: word;
  _ndefChunkData: TArray0To59OfUInt8;
  _ndefChunkLength: word;
  _ndefLength: word;
begin
  if (Length(aNDef) > 65535) then begin
    raise EInvalidParameterException.Create('NDEF can be at most 65535 items long');
  end;

  _ndefLength:= Length(aNDef);
  _ndefChunkOffset:= 0;

  if (_ndefLength = 0) then begin
    FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
    CardemuWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_ndefChunkOffset < _ndefLength) do begin
        _ndefChunkLength:= _ndefLength - _ndefChunkOffset;

        if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;

        FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
        Move(aNDef[_ndefChunkOffset], _ndefChunkData[0], SizeOf(byte) * _ndefChunkLength);

        CardemuWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
        Inc(_ndefChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletNFC.CardemuStartTransfer(const aTransfer: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_CARDEMU_START_TRANSFER, 9);
  LEConvertUInt8To(aTransfer, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.P2PGetState(out aState: byte; out aIdle: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_P2P_GET_STATE, 8);
  _response:= SendRequest(_request);
  aState:= LEConvertUInt8From(8, _response);
  aIdle:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletNFC.P2PStartDiscovery;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_P2P_START_DISCOVERY, 8);
  SendRequest(_request);
end;

procedure TBrickletNFC.P2PWriteNDEFLowLevel(const aNDefLength: word; const aNDefChunkOffset: word; const aNDefChunkData: TArray0To59OfUInt8);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_P2P_WRITE_NDEF_LOW_LEVEL, 72);
  LEConvertUInt16To(aNDefLength, 8, _request);
  LEConvertUInt16To(aNDefChunkOffset, 10, _request);
  for _i:= 0 to Length(aNDefChunkData) - 1 do LEConvertUInt8To(aNDefChunkData[_i], 12 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.P2PWriteNDEF(const aNDef: array of byte);
var
  _ndefChunkOffset: word;
  _ndefChunkData: TArray0To59OfUInt8;
  _ndefChunkLength: word;
  _ndefLength: word;
begin
  if (Length(aNDef) > 65535) then begin
    raise EInvalidParameterException.Create('NDEF can be at most 65535 items long');
  end;

  _ndefLength:= Length(aNDef);
  _ndefChunkOffset:= 0;

  if (_ndefLength = 0) then begin
    FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
    P2PWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_ndefChunkOffset < _ndefLength) do begin
        _ndefChunkLength:= _ndefLength - _ndefChunkOffset;

        if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;

        FillChar(_ndefChunkData[0], SizeOf(byte) * 60, 0);
        Move(aNDef[_ndefChunkOffset], _ndefChunkData[0], SizeOf(byte) * _ndefChunkLength);

        P2PWriteNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
        Inc(_ndefChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletNFC.P2PStartTransfer(const aTransfer: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_P2P_START_TRANSFER, 9);
  LEConvertUInt8To(aTransfer, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletNFC.P2PReadNDEFLowLevel(out aNDefLength: word; out aNDefChunkOffset: word; out aNDefChunkData: TArray0To59OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_P2P_READ_NDEF_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aNDefLength:= LEConvertUInt16From(8, _response);
  aNDefChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aNDefChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletNFC.P2PReadNDEF: TArrayOfUInt8;
var
  _ndef: TArrayOfUInt8;
  _ndefCurrentLength: word;
  _ndefLength: word;
  _ndefChunkOffset: word;
  _ndefChunkData: TArray0To59OfUInt8;
  _ndefOutOfSync: boolean;
  _ndefChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_ndef, 0);
  StreamMutex.Acquire;
  try
    _ndefLength:= 0;
    P2PReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
    SetLength(_ndef, _ndefLength);
    _ndefOutOfSync:= (_ndefChunkOffset <> 0);

    if ((not _ndefOutOfSync) and (_ndefLength > 0)) then begin
      _ndefChunkLength:= _ndefLength - _ndefChunkOffset;
      if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;
      Move(_ndefChunkData, _ndef[0], SizeOf(byte) * _ndefChunkLength);
      _ndefCurrentLength:= _ndefChunkLength;

      while ((not _ndefOutOfSync) and (_ndefCurrentLength < _ndefLength)) do begin
        P2PReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
        _ndefOutOfSync:= _ndefChunkOffset <> _ndefCurrentLength;
        _ndefChunkLength:= _ndefLength - _ndefChunkOffset;
        if (_ndefChunkLength > 60) then _ndefChunkLength:= 60;
        Move(_ndefChunkData, _ndef[_ndefCurrentLength], SizeOf(byte) * _ndefChunkLength);
        Inc(_ndefCurrentLength, _ndefChunkLength);
      end;
    end;

    if (_ndefOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_ndefChunkOffset + 60 < _ndefLength) do begin
        P2PReadNDEFLowLevel(_ndefLength, _ndefChunkOffset, _ndefChunkData);
      end;

      raise EStreamOutOfSyncException.Create('NDEF stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _ndef;
end;

procedure TBrickletNFC.SetDetectionLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_DETECTION_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.GetDetectionLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_DETECTION_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletNFC.SetMaximumTimeout(const aTimeout: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_MAXIMUM_TIMEOUT, 10);
  LEConvertUInt16To(aTimeout, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.GetMaximumTimeout: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_MAXIMUM_TIMEOUT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletNFC.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletNFC.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletNFC.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletNFC.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletNFC.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletNFC.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletNFC.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletNFC.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletNFC.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletNFC.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_NFC_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletNFC.CallbackWrapperReaderStateChanged(const aPacket: TDynamicByteArray);
var
  _state: byte;
  _idle: boolean;
begin
  _state:= LEConvertUInt8From(8, aPacket);
  _idle:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fReaderStateChangedCallback)) then begin
    fReaderStateChangedCallback(self, _state, _idle);
  end;
end;

procedure TBrickletNFC.CallbackWrapperCardemuStateChanged(const aPacket: TDynamicByteArray);
var
  _state: byte;
  _idle: boolean;
begin
  _state:= LEConvertUInt8From(8, aPacket);
  _idle:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fCardemuStateChangedCallback)) then begin
    fCardemuStateChangedCallback(self, _state, _idle);
  end;
end;

procedure TBrickletNFC.CallbackWrapperP2PStateChanged(const aPacket: TDynamicByteArray);
var
  _state: byte;
  _idle: boolean;
begin
  _state:= LEConvertUInt8From(8, aPacket);
  _idle:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fP2PStateChangedCallback)) then begin
    fP2PStateChangedCallback(self, _state, _idle);
  end;
end;

end.
