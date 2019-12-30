{
  Copyright (C) 2012-2015, 2019 Matthias Bolte <matthias@tinkerforge.com>
  Copyright (C) 2017 Ishraq Ibne Ashraf <ishraq@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit IPConnection;

{ FIXME: add TSocketWrapper to deal with the various socket implementations }

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$else}
  {$ifdef MACOS}
    {$define DELPHI_MACOS}
  {$endif}
{$endif}

interface

uses
  Classes, SysUtils, SyncObjs, Contnrs, TinkerforgeCommon,
  LEConverter, BlockingQueue, TimedSemaphore, SHAone
{$ifdef FPC}
  , Sockets
  {$ifdef UNIX}
  , CThreads, Errors, CNetDB, BaseUnix
  {$else}
  , Windows, WinSock
  {$endif}
{$else}
  {$ifdef MSWINDOWS}
  , Windows, WinSock
  {$endif}
{$endif}
{$ifdef DELPHI_MACOS}
  , Posix.ArpaInet, Posix.Errno, Posix.NetDB, Posix.NetinetIn, Posix.NetinetTcp, Posix.String_,
  Posix.SysSocket, Posix.SysTypes, Posix.Unistd
{$endif}
;

{$I Tinkerforge.inc}
{$I IPConnection.inc}

type
  { TIPConnection }

  { TThreadWrapper }
  TThreadWrapper = class;
  TThreadProcedure = procedure(aThread: TThreadWrapper; aOpaque: pointer) of object;
  TThreadWrapper = class(TThread)
  private
    proc: TThreadProcedure;
    opaque: pointer;
  public
    constructor Create(const aProc: TThreadProcedure; aOpaque: pointer);
    procedure Execute; override;
    function IsCurrent: boolean;
  end;

  PCallbackContext = ^TCallbackContext;
  TCallbackContext = record
    mutex: TCriticalSection;
    queue: TBlockingQueue;
    thread: TThreadWrapper;
    packetDispatchAllowed: boolean;
  end;

  TIPConnection = class;

  TIPConnectionNotifyEnumerate = procedure(aSender: TIPConnection; const aUID: string; const aConnectedUID: string;
                                           const aPosition: char; const aHardwareVersion: TTFVersionNumber;
                                           const aFirmwareVersion: TTFVersionNumber; const aDeviceIdentifier: word;
                                           const aEnumerationType: byte) of object;
  TIPConnectionNotifyConnected = procedure(aSender: TIPConnection; const aConnectReason: byte) of object;
  TIPConnectionNotifyDisconnected = procedure(aSender: TIPConnection; const aDisconnectReason: byte) of object;

  TIPConnection = class(TComponent)
  private
    // Internal storing
    fBrickDaemon: TComponent;
    fTimeout: longint;
    fDevicesList: TComponentList;
    fhost: string;
    fport: word;
    fautoReconnect: boolean;
    fautoReconnectAllowed: boolean;
    fautoReconnectPending: boolean;
    freceiveFlag: boolean;
    freceiveThread: TThreadWrapper;
    fcallback: PCallbackContext;
    fdisconnectProbeFlag: boolean;
    fdisconnectProbeQueue: TBlockingQueue;
    fdisconnectProbeThread: TThreadWrapper;
    fsequenceNumberMutex: TCriticalSection;
    fnextSequenceNumber: byte; { protected by sequenceNumberMutex }
    fauthenticationMutex: TCriticalSection; { protects authentication handshake }
    fnextAuthenticationNonce: longword; { protected by authenticationMutex }
    fpendingData: TDynamicByteArray;
    fsocketMutex: TCriticalSection;
    fsocketSendMutex: TCriticalSection;
{$ifdef DELPHI_MACOS}
    fsocket: longint; { protected by socketMutex }                                               TDeviceList
{$else}
    fsocket: TSocket; { protected by socketMutex }
{$endif}
    fsocketID: longword; { protected by socketMutex }
    fwaiter: TTimedSemaphore;
    fenumerateCallback: TIPConnectionNotifyEnumerate;
    fconnectedCallback: TIPConnectionNotifyConnected;
    fdisconnectedCallback: TIPConnectionNotifyDisconnected;

    procedure ConnectUnlocked(const aIsAutoReconnect: boolean);
    procedure DisconnectUnlocked;
    function GetLastSocketErrorNumber: longint;
    function GetLastSocketErrorMessage: string;
    procedure ReceiveLoop(aThread: TThreadWrapper; aOpaque: pointer);
    procedure ExitCallbackThread(aCallback: PCallbackContext);
    procedure DestroyCallbackContext(aCallback: PCallbackContext);
    procedure CallbackLoop(aThread: TThreadWrapper; aOpaque: pointer);
    procedure DisconnectProbeLoop(aThread: TThreadWrapper; aOpaque: pointer);
    procedure HandleDisconnectByPeer(const aDisconnectReason: byte;
                                     const aSocketID: longword;
                                     const aDisconnectImmediately: boolean);
    procedure Handle_response(const aPacket: TDynamicByteArray);
    procedure DispatchMeta(const aMeta: TDynamicByteArray);
    procedure DispatchPacket(const aPacket: TDynamicByteArray);
  public
    /// <summary>
    ///  Creates an IP Connection object that can be used to enumerate the
    ///  available fDevices. It is also required for the constructor of Bricks
    ///  and Bricklets.
    /// </summary>
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Destroys the IP Connection object. Calls Disconnect internally. The
    ///  connection to the Brick Daemon gets closed and the threads of the
    ///  IP Connection are terminated.
    /// </summary>
    destructor Destroy; override;

    procedure RegisterDevice(aDevice: TComponent);
    procedure UnregisterDevice(aDevice: TComponent);
    /// <summary>
    ///  Creates a TCP/IP connection to the given *fhost* and *fport*. The fhost
    ///  and fport can point to a Brick Daemon or to a WIFI/Ethernet Extension.
    ///
    ///  fDevices can only be controlled when the connection was established
    ///  successfully.
    ///
    ///  Blocks until the connection is established and throws an exception
    ///  if there is no Brick Daemon or WIFI/Ethernet Extension listening at
    ///  the given fhost and fport.
    /// </summary>
    procedure Connect(const ahost: string; const aport: word);

    /// <summary>
    ///  Disconnects the TCP/IP connection from the Brick Daemon or the
    ///  WIFI/Ethernet Extension.
    /// </summary>
    procedure Disconnect;

    /// <summary>
    ///  Performs an authentication handshake with the connected Brick Daemon or
    ///  WIFI/Ethernet Extension. If the handshake succeeds the connection switches
    ///  from non-authenticated to authenticated state and communication can
    ///  continue as normal. If the handshake fails then the connection gets closed.
    ///  Authentication can fail if the wrong secret was used or if authentication
    ///  is not enabled at all on the Brick Daemon or the WIFI/Ethernet Extension.
    ///
    ///  For more information about authentication see
    ///  https://www.tinkerforge.com/en/doc/Tutorials/Tutorial_Authentication/Tutorial.html
    /// </summary>
    procedure Authenticate(const asecret: string);

    /// <summary>
    ///  Can return the following states:
    ///
    ///  - IPCON_CONNECTION_STATE_DISCONNECTED: No connection is established.
    ///  - IPCON_CONNECTION_STATE_CONNECTED: A connection to the Brick Daemon or
    ///    the WIFI/Ethernet Extension  is established.
    ///  - IPCON_CONNECTION_STATE_PENDING: IP Connection is currently trying to
    ///    connect.
    /// </summary>
    function GetConnectionState: byte;

    /// <summary>
    ///  Enables or disables auto-reconnect. If auto-reconnect is enabled,
    ///  the IP Connection will try to reconnect to the previously given
    ///  fhost and fport, if the connection is lost.
    ///
    ///  Default value is *true*.
    /// </summary>
    procedure SetAutoReconnect(const aAutoReconnect: boolean);

    /// <summary>
    ///  Returns *true* if auto-reconnect is enabled, *false* otherwise.
    /// </summary>
    function GetAutoReconnect: boolean;

    /// <summary>
    ///  Sets the fTimeout in milliseconds for getters and for setters for
    ///  which the _response expected flag is activated.
    ///
    ///  Default fTimeout is 2500.
    /// </summary>
    procedure SetTimeout(const aTimeout: longword);

    /// <summary>
    ///  Returns the fTimeout as set by SetTimeout.
    /// </summary>
    function GetTimeout: longword;

    /// <summary>
    ///  Broadcasts an enumerate _request. All fDevices will respond with an
    ///  enumerate fcallback.
    /// </summary>
    procedure Enumerate;

    /// <summary>
    ///  Stops the current thread until Unwait is called.
    ///
    ///  This is useful if you rely solely on callbacks for events, if you want
    ///  to wait for a specific fcallback or if the IP Connection was created in
    ///  a thread.
    ///
    ///  Wait and Unwait act in the same way as "acquire" and "release" of a
    ///  semaphore.
    /// </summary>                                                         TBr
    procedure Wait;

    /// <summary>
    ///  Unwaits the thread previously stopped by Wait.
    ///
    ///  Wait and Unwait act in the same way as "acquire" and "release" of
    ///  a semaphore.
    /// </summary>
    procedure Unwait;

    { Internal }
    function IsConnected: boolean;
    function CreateRequestPacket(const aDevice: TComponent; const aFunctionID: byte; const aLen: byte): TDynamicByteArray;
    procedure SendRequest(const aRequest: TDynamicByteArray);
    // Properties
    // property Devices: TDeviceTable read FDevices;
    property Timeout: longint read fTimeout;
    property OnEnumerate: TIPConnectionNotifyEnumerate read fenumerateCallback write fenumerateCallback;
    property OnConnected: TIPConnectionNotifyConnected read fconnectedCallback write fconnectedCallback;
    property OnDisconnected: TIPConnectionNotifyDisconnected read fdisconnectedCallback write fdisconnectedCallback;

  end;

function GetUIDFromData(const aData: TDynamicByteArray): longword;
function GetLengthFromData(const aData: TDynamicByteArray): byte;

implementation

uses
  TinkerforgeExceptions, DeviceBase, DeviceTable, BrickDaemon;

{ TThreadWrapper }
constructor TThreadWrapper.Create(const aProc: TThreadProcedure; aOpaque: pointer);
begin
  proc := aProc;
  opaque := aOpaque;
  inherited Create(false);
end;

procedure TThreadWrapper.Execute;
begin
  proc(self, opaque);
end;

function TThreadWrapper.IsCurrent: boolean;
begin
{$ifdef FPC}
  Result := GetCurrentThreadId = ThreadID;
{$else}
 {$ifdef MSWINDOWS}
  Result := Windows.GetCurrentThreadId = ThreadID;
 {$else}
  Result := CurrentThread.ThreadID = ThreadID;
 {$endif}
{$endif}
end;

{$ifdef MSWINDOWS}

function CryptAcquireContextA(phProv: pointer; pszContainer: LPCSTR; pszProvider: LPCSTR; dwProvType: DWORD; dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll' name 'CryptAcquireContextA';
function CryptReleaseContext(hProv: pointer; dwFlags: DWORD): BOOL; stdcall; external 'advapi32.dll' name 'CryptReleaseContext';
function CryptGenRandom(hProv: ULONG; dwLen: DWORD; pbBuffer: PBYTE): BOOL; stdcall; external 'advapi32.dll' name 'CryptGenRandom';

{$else}

function ReadUInt32(const filename: string): longword;
var
  _fh: File;
  _bytes: TDynamicByteArray;
  _count: {$ifdef FPC}longint{$else}integer{$endif};
begin
  SetLength(_bytes, 4);
  _count := 0;
  AssignFile(_fh, filename);
  try
    Reset(_fh, 1);
    BlockRead(_fh, _bytes, 4, _count);
  finally
    CloseFile(_fh);
  end;
  if (_count <> 4) then begin
    raise Exception.Create('Insufficent number of random bytes read');
  end;
  Result := LEConvertUInt32From(0, _bytes);
end;

{$endif}

function GetRandomUInt32: longword;
var success: boolean; days: double; seconds, microseconds, pid: longword;
{$ifdef MSWINDOWS}
    provider: ULONG; bytes: TDynamicByteArray;
{$endif}
begin
  Result := 0;
  success := false;
{$ifdef MSWINDOWS}
  provider := 0;
  if (CryptAcquireContextA(@provider, nil, nil, 1, $F0000040)) then begin
    SetLength(bytes, 4);
    if (CryptGenRandom(provider, 4, @bytes[0])) then begin
      Result := LEConvertUInt32From(0, bytes);
      success := true;
    end;
    CryptReleaseContext(@provider, 0);
  end;
{$else}
  try
    { Try the non-blocking /dev/urandom first, as there seems to be no direct
      way to do a non-blocking read from Delphi. }
    Result := ReadUInt32('/dev/urandom');
    success := true;
  except
  end;
  if (not success) then begin
    try
      { If /de
procedure TIPConnection.Conv/urandom is not available fallback to /dev/random which might
        block on read }
      Result := ReadUInt32('/dev/random');
      success := true;
    except
    end;
  end;
{$endif}
  if (not success) then begin
    days := Now;
    seconds := Trunc(days * 86400);
    microseconds := Trunc(Frac(days * 86400) * 1000000);
{$ifdef FPC}
    pid := GetProcessID;
{$else}
 {$ifdef MSWINDOWS}
    pid := Windows.GetCurrentProcessId;
 {$else}
    { FIXME: no clue how to get PID }
    pid := 0;
 {$endif}
{$endif}
    Result := ((seconds shl 26) or (seconds shr 6)) + microseconds + pid; { overflow is intended }
  end;
end;

function HMACSHA1(const secret: TDynamicByteArray; const aData: TDynamicByteArray): TSHAoneDigest;
var
  preparedSecret: TDynamicByteArray;
  sha1: TSHAone;
  _i: longint;
    ipad, opad: array [0..63] of byte; digest: TSHAoneDigest;
begin
  if Length(secret) > 64 then begin
    SHAoneInit(sha1);
    SHAoneUpdate(sha1, secret);
    digest := SHAoneFinal(sha1);
    SetLength(preparedSecret, 64);
    Move(digest, preparedSecret, 64);
  end
  else begin
    preparedSecret := secret;
  end;
  for _i := 0 to 63 do begin
    ipad[_i] := $36;
    opad[_i] := $5C;
  end;
  for _i := 0 to (Length(preparedSecret) - 1) do begin
    ipad[_i] := preparedSecret[_i] xor ipad[_i];
    opad[_i] := preparedSecret[_i] xor opad[_i];
  end;
  SHAoneInit(sha1);
  SHAoneUpdate(sha1, ipad);
  SHAoneUpdate(sha1, aData);
  digest := SHAoneFinal(sha1);
  SHAoneInit(sha1);
  SHAoneUpdate(sha1, opad);
  SHAoneUpdate(sha1, digest);
  Result := SHAoneFinal(sha1);
end;

{ TIPConnection }
constructor TIPConnection.Create(aOwner: TComponent);
begin
  fhost := '';
  fport := 0;
  fTimeout := 2500;
  fautoReconnect := true;
  fautoReconnectAllowed := false;
  fautoReconnectPending := false;
  freceiveFlag := false;
  freceiveThread := nil;
  fcallback := nil;
  fdisconnectProbeFlag := false;
  fdisconnectProbeQueue := nil;
  fdisconnectProbeThread := nil;
  fsequenceNumberMutex := TCriticalSection.Create;
  fnextSequenceNumber := 0;
  fauthenticationMutex := TCriticalSection.Create;
  fnextAuthenticationNonce := 0;
  SetLength(fpendingData, 0);
  fDevicesList := TDeviceList.Create;
  fsocketMutex := TCriticalSection.Create;
  fsocketSendMutex := TCriticalSection.Create;
  fsocket := INVALID_SOCKET;
  fwaiter := TTimedSemaphore.Create;
  fBrickDaemon := TBrickDaemon.Create(Self);
end;

destructor TIPConnection.Destroy;
begin
  if (IsConnected) then begin
    Disconnect;
  end;
  fBrickDaemon.Destroy;
  fauthenticationMutex.Destroy;
  fsequenceNumberMutex.Destroy;
  fDevicesList.Destroy;
  fsocketMutex.Destroy;
  fsocketSendMutex.Destroy;
  fwaiter.Destroy;
  inherited Destroy;
end;

procedure TIPConnection.RegisterDevice(aDevice: TComponent);
begin
  if Assigned(aDevice) and (aDevice is TDeviceBase) then
    fDevicesList.Add(aDevice);
end;

procedure TIPConnection.UnregisterDevice(aDevice: TComponent);
begin
  if Assigned(aDevice) and (aDevice is TDeviceBase) then
    fDevicesList.Remove(aDevice)
end;

procedure TIPConnection.Connect(const ahost: string; const aport: word);
begin
  fsocketMutex.Acquire;
  try
    if (IsConnected) then begin
      raise EAlreadyConnectedException.Create('Already connected to ' + fhost + ':' + IntToStr(fport));
    end;
    fhost := ahost;
    fport := aport;
    ConnectUnlocked(false);
  finally
    fsocketMutex.Release;
  end;
end;

procedure TIPConnection.Disconnect;
var
  _Callback: PCallbackContext;
  _Meta: TDynamicByteArray;
begin
  _Callback := nil;
  fsocketMutex.Acquire;
  try
    fautoReconnectAllowed := false;
    if (fautoReconnectPending) then begin
      { Abort pending auto-reconnect }
      fautoReconnectPending := false;
    end
    else begin
      if (not IsConnected) then begin
        raise ENotConnectedException.Create('Not connected');
      end;
      DisconnectUnlocked;
      SetLength(fpendingData, 0);
    end;
    { Destroy fcallback thread }
    _Callback := fcallback;
    fcallback := nil;
  finally
    fsocketMutex.Release;
  end;
  if (_Callback <> nil) then begin
    { Do this outside of fsocketMutex to allow calling (dis-)connect from
      the callbacks while blocking on the WaitFor call here }
    SetLength(_Meta, 2);
    _Meta[0] := IPCON_CALLBACK_DISCONNECTED;
    _Meta[1] := IPCON_DISCONNECT_REASON_REQUEST;
    _Callback^.queue.Enqueue(IPCON_QUEUE_KIND_META, _Meta);
    ExitCallbackThread(_Callback);
  end;
end;

function IsASCII(const s: string): boolean;
var c: char;
begin
  Result := true;
  for c in s do
  begin
    if Ord(c) > 127 then begin
        Result := false;
        break;
    end;
  end;
end;

procedure TIPConnection.Authenticate(const asecret: string);
var
  serverNonce, clientNonce: TArray0To3OfUInt8;
  _i: longint;
  secretBytes, clientNonceBytes, data: TDynamicByteArray;
  digest: TSHAoneDigest;
begin
  if not IsASCII(asecret) then begin
    raise Exception.Create('Authentication secret contains non-ASCII characters.');
  end;

  fauthenticationMutex.Acquire;
  try
    if (fnextAuthenticationNonce = 0) then begin
      fnextAuthenticationNonce := GetRandomUInt32;
    end;
    serverNonce := (fBrickDaemon as TBrickDaemon).GetAuthenticationNonce;
    SetLength(clientNonceBytes, 4);
    LEConvertUInt32To(fnextAuthenticationNonce, 0, clientNonceBytes);
    Inc(fnextAuthenticationNonce);
    SetLength(data, 8);
    for _i := 0 to 3 do begin
      data[_i] := serverNonce[_i];
    end;
    for _i := 0 to 3 do begin
      data[4 + _i] := clientNonceBytes[_i];
      clientNonce[_i] := clientNonceBytes[_i];
    end;
    SetLength(secretBytes, Length(asecret));
    LEConvertStringTo(asecret, 0, Length(asecret), secretBytes);
    digest := HMACSHA1(secretBytes, data);
    (fBrickDaemon as TBrickDaemon).Authenticate(clientNonce, TArray0To19OfUInt8(digest));
  finally
    fauthenticationMutex.Release;
  end;
end;

function TIPConnection.GetConnectionState: byte;
begin
  if (IsConnected) then begin
    Result := IPCON_CONNECTION_STATE_CONNECTED;
  end
  else if (fautoReconnectPending) then begin
    Result := IPCON_CONNECTION_STATE_PENDING;
  end
  else begin
    Result := IPCON_CONNECTION_STATE_DISCONNECTED;
  end;
end;

procedure TIPConnection.SetAutoReconnect(const aAutoReconnect: boolean);
begin
  fautoReconnect := aAutoReconnect;
  if (not fAutoReconnect) then begin
    { Abort potentially pending auto-reconnect }
    fautoReconnectAllowed := false;
  end;
end;

function TIPConnection.GetAutoReconnect: boolean;
begin
  Result := fautoReconnect;
end;

procedure TIPConnection.SetTimeout(const aTimeout: longword);
begin
  fTimeout := aTimeout;
end;

function TIPConnection.GetTimeout: longword;
begin
  Result := fTimeout;
end;

procedure TIPConnection.Enumerate;
var
  _request: TDynamicByteArray;
begin
  _request := CreateRequestPacket(nil, IPCON_FUNCTION_ENUMERATE, 8);
  SendRequest(_request);
end;

procedure TIPConnection.Wait;
begin
  fwaiter.Acquire(-1);
end;

procedure TIPConnection.Unwait;
begin
  fwaiter.Release;
end;

{ NOTE: Assumes that socket is nil and socketMutex is locked }
procedure TIPConnection.ConnectUnlocked(const aIsAutoReconnect: boolean);
var
{$ifndef FPC}
 {$ifdef MSWINDOWS}
    _data: WSAData;
 {$endif}
{$endif}
{$ifdef DELPHI_MACOS}
    _tmp: longint;
{$else}
    _tmp: TSocket;
{$endif}
    _nodelay: longint;
{$ifdef DELPHI_MACOS}
    hints: addrinfo;
    entry: PAddrInfo;
    error: longint;
{$else}
    _entry: PHostEnt;
{$endif}
{$ifdef FPC}
    _address: TInetSockAddr;
{$else}
 {$ifdef DELPHI_MACOS}
    _address: sockaddr_in;
 {$else}
    _address: TSockAddrIn;
 {$endif}
{$endif}
{$ifdef DELPHI_MACOS}
    _resolved: in_addr;
{$else}
    _resolved: TInAddr;
{$endif}
    _connectReason: word;
    _meta: TDynamicByteArray;
begin
  { Create fcallback queue and thread }
  if (fcallback = nil) then begin
    New(fcallback);
    fcallback^.mutex := TCriticalSection.Create;
    fcallback^.packetDispatchAllowed := false;
    fcallback^.queue := TBlockingQueue.Create;
    fcallback^.thread := TThreadWrapper.Create({$ifdef FPC}@{$endif}self.CallbackLoop,
                                              fcallback);
  end;
  { Create and connect fsocket }
{$ifndef FPC}
 {$ifdef MSWINDOWS}
  if (WSAStartup(MakeWord(2, 2), _data) <> 0) then begin
    { Destroy callback thread }
    if (not aIsAutoReconnect) then
    begin
      ExitCallbackThread(fcallback);
      fcallback := nil;
    end;
    raise
      Exception.Create('Could not initialize Windows Sockets 2.2: ' + GetLastSocketErrorMessage);
  end;
 {$endif}
{$endif}
{$ifdef FPC}
  _tmp := fpsocket(AF_INET, SOCK_STREAM, 0);
  if (_tmp < 0) then begin
{$else}
 {$ifdef DELPHI_MACOS}
  tmp := Posix.SysSocket.socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
 {$else}
  _tmp := WinSock.socket(AF_INET, SOCK_STREAM, 0);
 {$endif}
  if (_tmp = INVALID_SOCKET) then begin
{$endif}
    { Destroy fcallback thread }
    if (not aIsAutoReconnect) then begin
      ExitCallbackThread(fcallback);
      fcallback := nil;
    end;
    raise Exception.Create('Could not create socket: ' + GetLastSocketErrorMessage);
  end;
  _nodelay := 1;
{$ifdef FPC}
  if (fpsetsockopt(_tmp, IPPROTO_TCP, TCP_NODELAY, @_nodelay, sizeof(_nodelay)) < 0) then begin
{$else}
 {$ifdef DELPHI_MACOS}
  if (setsockopt(tmp, IPPROTO_TCP, TCP_NODELAY, nodelay, sizeof(nodelay)) < 0) then begin
 {$else}
  if (setsockopt(_tmp, IPPROTO_TCP, TCP_NODELAY, @_nodelay, sizeof(_nodelay)) = SOCKET_ERROR) then begin
 {$endif}
{$endif}
    raise Exception.Create('Could not set TCP_NODELAY socket option: ' + GetLastSocketErrorMessage);
  end;
{$ifdef DELPHI_MACOS}
  FillChar(hints, SizeOf(hints), 0);
  hints.ai_flags := AI_PASSIVE;
  hints.ai_family := AF_UNSPEC;
  hints.ai_socktype := SOCK_STREAM;
 {$if CompilerVersion >= 22.0}
  error := getaddrinfo(MarshaledAString(UTF8Encode(host)), nil, hints, entry);
 {$else}
  error := getaddrinfo(PAnsiChar(AnsiString(host)), nil, hints, entry);
 {$ifend}
  if (error <> 0) then begin
    { Destroy callback thread }
    if (not isAutoReconnect) then begin
      ExitCallbackThread(callback);
      callback := nil;
    end;
    { Destroy socket }
    Posix.Unistd.__close(tmp);
    raise Exception.Create('Could not resolve host ' + host + ': ' + string(gai_strerror(error)));
  end;
  resolved := sockaddr_in(entry.ai_addr^).sin_addr;
  freeaddrinfo(entry^);
{$else}
  _entry := gethostbyname(PAnsiChar(AnsiString(fhost)));
  if (_entry = nil) then begin
    { Destroy fcallback thread }
    if (not aIsAutoReconnect) then begin
      ExitCallbackThread(fcallback);
      fcallback := nil;
    end;
    { Destroy fsocket }
    closesocket(_tmp);
    raise Exception.Create('Could not resolve host: ' + fhost);
  end;
  _resolved.s_addr := longint(pointer(_entry^.h_addr_list^)^);
{$endif}
  _address.sin_family := AF_INET;
  _address.sin_port := htons(fport);
  _address.sin_addr := _resolved;
{$ifdef FPC}
  if (fpconnect(_tmp, @_address, sizeof(_address)) < 0) then begin
{$else}
 {$ifdef DELPHI_MACOS}
  if (Posix.SysSocket.connect(tmp, sockaddr(address), sizeof(address)) < 0) then begin
 {$else}
  if (WinSock.connect(_tmp, _address, sizeof(_address)) = SOCKET_ERROR) then begin
 {$endif}
{$endif}
    { Destroy fcallback thread }
    if (not aIsAutoReconnect) then begin
      ExitCallbackThread(fcallback);
      fcallback := nil;
    end;
    { Destroy fsocket }
{$ifdef DELPHI_MACOS}
    Posix.Unistd.__close(tmp);
{$else}
    closesocket(_tmp);
{$endif}
    raise Exception.Create('Could not connect socket: ' + GetLastSocketErrorMessage);
  end;
  fsocket := _tmp;
  fsocketID := fsocketID + 1;
  { Create disconnect probe thread }
  fdisconnectProbeFlag := true;
  fdisconnectProbeQueue := TBlockingQueue.Create;
  fdisconnectProbeThread := TThreadWrapper.Create({$ifdef FPC}@{$endif}self.DisconnectProbeLoop, nil);
  { Create receive thread }
  fcallback^.packetDispatchAllowed := true;
  freceiveFlag := true;
  freceiveThread := TThreadWrapper.Create({$ifdef FPC}@{$endif}self.ReceiveLoop, nil);
  fautoReconnectAllowed := false;
  fautoReconnectPending := false;
  { Trigger connected fcallback }
  if (aIsAutoReconnect) then begin
    _connectReason := IPCON_CONNECT_REASON_AUTO_RECONNECT;
  end
  else begin
    _connectReason := IPCON_CONNECT_REASON_REQUEST;
  end;
  SetLength(_meta, 2);
  _meta[0] := IPCON_CALLBACK_CONNECTED;
  _meta[1] := _connectReason;
  fcallback^.queue.Enqueue(IPCON_QUEUE_KIND_META, _meta);
end;

{ NOTE: Assumes that socket is not nil and socketMutex is locked }
procedure TIPConnection.DisconnectUnlocked;
begin
  { Destroy disconnect probe thread }
  fdisconnectProbeQueue.Enqueue(0, nil);
  fdisconnectProbeThread.WaitFor;
  fdisconnectProbeThread.Destroy;
  fdisconnectProbeThread := nil;
  fdisconnectProbeQueue.Destroy;
  fdisconnectProbeQueue := nil;
  { Stop dispatching aPacket callbacks before ending the receive
    thread to avoid fTimeout exceptions due to fcallback function
    trying to call getters }
  if (not fcallback^.thread.IsCurrent) then begin
    { FIXME: Cannot lock fcallback mutex here because this can
             deadlock due to an ordering problem with the fsocket mutex }
    //fcallback^.mutex.Acquire;
    //try
      fcallback^.packetDispatchAllowed := false;
    //finally
    //  fcallback^.mutex.Release;
    //end;
  end
  else begin
    fcallback^.packetDispatchAllowed := false;
  end;
  { Destroy receive thread }
  freceiveFlag := false;
{$ifdef FPC}
  fpshutdown(fsocket, 2);
{$else}
 {$ifdef DELPHI_MACOS}
  shutdown(fsocket, SHUT_RDWR);
 {$else}
  shutdown(fsocket, SD_BOTH);
 {$endif}
{$endif}
  if (not freceiveThread.IsCurrent) then begin
    freceiveThread.WaitFor;
  end;
  freceiveThread.Destroy;
  freceiveThread := nil;
  { Destroy fsocket }
{$ifdef DELPHI_MACOS}
    Posix.Unistd.__close(socket);
{$else}
    closesocket(fsocket);
{$endif}
  fsocket := INVALID_SOCKET;
end;

function TIPConnection.GetLastSocketErrorNumber: longint;
begin
{$ifdef FPC}
  Result := socketerror;
{$else}
 {$ifdef DELPHI_MACOS}
  Result := errno;
 {$else}
  Result := WSAGetLastError;
 {$endif}
{$endif}
end;

function TIPConnection.GetLastSocketErrorMessage: string;
begin
{$ifdef FPC}
 {$ifdef UNIX}
  Result := strerror(socketerror);
 {$else}
  Result := SysErrorMessage(socketerror);
 {$endif}
{$else}
 {$ifdef DELPHI_MACOS}
  Result := string(strerror(errno));
 {$else}
  Result := SysErrorMessage(WSAGetLastError);
 {$endif}
{$endif}
end;

procedure TIPConnection.ReceiveLoop(aThread: TThreadWrapper; aOpaque: pointer);
var socketID_: longword; data: array [0..8191] of byte;
    len, pendingLen, remainingLen: longint; aPacket: TDynamicByteArray;
    disconnectReason: byte;
begin
  socketID_ := fsocketID;
  while (freceiveFlag) do begin
{$ifdef FPC}
    len := fprecv(fsocket, @data[0], Length(data), 0);
{$else}
 {$ifdef DELPHI_MACOS}
    len := recv(socket, data, Length(data), 0);
 {$else}
    len := WinSock.Recv(fsocket, data, Length(data), 0);
 {$endif}
{$endif}
    if (not freceiveFlag) then begin
      exit;
    end;
    if ((len < 0) or (len = 0)) then begin
      if (len < 0) then begin
        if (GetLastSocketErrorNumber = ESysEINTR) then begin
          continue;
        end;
        disconnectReason := IPCON_DISCONNECT_REASON_ERROR;
      end
      else begin
        disconnectReason := IPCON_DISCONNECT_REASON_SHUTDOWN;
      end;
      HandleDisconnectByPeer(disconnectReason, socketID_, false);
      exit;
    end;
    pendingLen := Length(fpendingData);
    SetLength(fpendingData, pendingLen + len);
    Move(data[0], fpendingData[pendingLen], len);
    while (freceiveFlag) do begin
      if (Length(fpendingData) < 8) then begin
        { Wait for complete header }
        break;
      end;
      len := GetLengthFromData(fpendingData);
      if (Length(fpendingData) < len) then begin
        { Wait for complete aPacket }
        break;
      end;
      SetLength(aPacket, len);
      Move(fpendingData[0], aPacket[0], len);
      remainingLen := Length(fpendingData) - len;
      if (remainingLen > 0) then begin
        { Don't call Move with remainingLen of 0, because in this case len is
          outside the bounds of fpendingData. This would trigger an ERangeCheck
          error at runtime }
        Move(fpendingData[len], fpendingData[0], remainingLen);
      end;
      SetLength(fpendingData, remainingLen);
      Handle_response(aPacket);
    end;
  end;
end;

procedure TIPConnection.ExitCallbackThread(aCallback: PCallbackContext);
begin
  if (not aCallback^.thread.IsCurrent) then begin
    aCallback^.queue.Enqueue(IPCON_QUEUE_KIND_EXIT, nil);
    aCallback^.thread.WaitFor;
    DestroyCallbackContext(aCallback);
  end
  else begin
    aCallback^.queue.Enqueue(IPCON_QUEUE_KIND_DESTROY_AND_EXIT, nil);
  end;
end;

procedure TIPConnection.DestroyCallbackContext(aCallback: PCallbackContext);
begin
  aCallback^.thread.Destroy;
  aCallback^.mutex.Destroy;
  aCallback^.queue.Destroy;
  Dispose(aCallback);
end;

procedure TIPConnection.CallbackLoop(aThread: TThreadWrapper; aOpaque: pointer);
var callback_: PCallbackContext; kind: byte; data: TDynamicByteArray;
begin
  callback_ := PCallbackContext(aOpaque);
  callback_^.thread := aThread;
  while (true) do begin
    SetLength(data, 0);
    if (not callback_^.queue.Dequeue(kind, data, -1)) then begin
      { FIXME: What to do here? try again? exit? }
      break;
    end;
    if (kind = IPCON_QUEUE_KIND_EXIT) then begin
      break;
    end
    else if (kind = IPCON_QUEUE_KIND_DESTROY_AND_EXIT) then begin
      DestroyCallbackContext(callback_);
      break;
    end;
    { FIXME: Cannot lock fcallback mutex here because this can
             deadlock due to an ordering problem with the fsocket mutex }
    //callback_^.mutex.Acquire;
    //try
      if (kind = IPCON_QUEUE_KIND_META) then begin
        DispatchMeta(data);
      end
      else if (kind = IPCON_QUEUE_KIND_PACKET) then begin
        { Don't dispatch callbacks when the receive thread isn't running }
        if (callback_^.packetDispatchAllowed) then begin
          DispatchPacket(data);
        end;
      end;
    //finally
    //  callback_.mutex.Release;
    //end;
  end;
end;

{ NOTE: The disconnect probe loop is not allowed to hold the socketMutex at any
        time because it is created and joined while the socketMutex is locked }
procedure TIPConnection.DisconnectProbeLoop(aThread: TThreadWrapper; aOpaque: pointer);
var kind: byte; data, _request: TDynamicByteArray; error: boolean;
begin
  SetLength(data, 0);
  _request := CreateRequestPacket(nil, IPCON_FUNCTION_DISCONNECT_PROBE, 8);
  while (not fdisconnectProbeQueue.Dequeue(kind, data, IPCON_DISCONNECT_PROBE_INTERVAL)) do begin
    if (fdisconnectProbeFlag) then begin
      fsocketSendMutex.Acquire;
      try
{$ifdef FPC}
        error := fpsend(fsocket, @_request[0], Length(_request), 0) < 0;
{$else}
 {$ifdef DELPHI_MACOS}
        error := send(socket, _request[0], Length(_request), 0) < 0;
 {$else}
        error := WinSock.Send(fsocket, _request[0], Length(_request), 0) = SOCKET_ERROR;
 {$endif}
{$endif}
      finally
        fsocketSendMutex.Release;
      end;
      if (error) then begin
        HandleDisconnectByPeer(IPCON_DISCONNECT_REASON_ERROR, fsocketID, false);
        break;
      end;
    end
    else begin
      fdisconnectProbeFlag := true;
    end;
  end;
end;

{ NOTE: Assumes that socketMutex is locked if disconnectImmediately is true }
procedure TIPConnection.HandleDisconnectByPeer(const aDisconnectReason: byte;
                                               const aSocketID: longword;
                                               const aDisconnectImmediately: boolean);
var meta: TDynamicByteArray;
begin
  fautoReconnectAllowed := true;
  if (aDisconnectImmediately) then begin
    DisconnectUnlocked;
  end;
  SetLength(meta, 6);
  meta[0] := IPCON_CALLBACK_DISCONNECTED;
  meta[1] := aDisconnectReason;
  LEConvertUInt32To(aSocketID, 2, meta);
  fcallback^.queue.Enqueue(IPCON_QUEUE_KIND_META, meta);
end;

procedure TIPConnection.Handle_response(const aPacket: TDynamicByteArray);
var
  sequenceNumber, functionID: byte;
  _device: TDeviceBase;
begin
  fdisconnectProbeFlag := false;
  functionID := GetFunctionIDFromData(aPacket);
  sequenceNumber := GetSequenceNumberFromData(aPacket);
  if ((sequenceNumber = 0) and (functionID = IPCON_CALLBACK_ENUMERATE)) then begin
    if (Assigned(fenumerateCallback)) then begin
      fcallback^.queue.Enqueue(IPCON_QUEUE_KIND_PACKET, aPacket);
    end;
    exit;
  end;
  _device := (fDevicesList as TDeviceList).GetItemWithUID(GetUIDFromData(aPacket));
  if (_device = nil) then begin
    { _response from an unknown device, ignoring it }
    exit;
  end;
  if (sequenceNumber = 0) then begin
    if (Assigned((_device as TDeviceBase).CallbackWrappers[functionID])) then begin
      fcallback^.queue.Enqueue(IPCON_QUEUE_KIND_PACKET, aPacket);
    end;
    exit;
  end;
  if (((_device as TDeviceBase).ExpectedResponseFunctionID = functionID) and
      ((_device as TDeviceBase).ExpectedResponseSequenceNumber = sequenceNumber)) then begin
    (_device as TDeviceBase).ResponseQueue.Enqueue(0, aPacket);
    exit;
  end;
end;

procedure TIPConnection.DispatchMeta(const aMeta: TDynamicByteArray);
var retry: boolean;
begin
  if (aMeta[0] = IPCON_CALLBACK_CONNECTED) then begin
    if (Assigned(fconnectedCallback)) then begin
      try
        fconnectedCallback(self, aMeta[1]);
      except
        { Ignore exceptions in user code }
      end;
    end;
  end
  else if (aMeta[0] = IPCON_CALLBACK_DISCONNECTED) then begin
    { Need to do this here, the receive loop is not allowed to hold the fsocket
      mutex because this could cause a deadlock with a concurrent call to the
      (dis-)connect function }
    if (aMeta[1] <> IPCON_DISCONNECT_REASON_REQUEST) then begin
      fsocketMutex.Acquire;
      try
        { Don't close the socket if it got disconnected or reconnected
          in the meantime }
        if (IsConnected and (fsocketID = LEConvertUInt32From(2, aMeta))) then begin
          { Destroy disconnect probe thread }
          fdisconnectProbeQueue.Enqueue(0, nil);
          fdisconnectProbeThread.WaitFor;
          fdisconnectProbeThread.Destroy;
          fdisconnectProbeThread := nil;
          fdisconnectProbeQueue.Destroy;
          fdisconnectProbeQueue := nil;
          { Destroy fsocket }
{$ifdef DELPHI_MACOS}
          Posix.Unistd.__close(socket);
{$else}
          closesocket(fsocket);
{$endif}
          fsocket := INVALID_SOCKET;
        end;
      finally
        fsocketMutex.Release;
      end;
    end;
    { FIXME: Wait a moment here, otherwise the next connect attempt will
      succeed, even if there is no open server fsocket. The first receive will
      then fail directly }
    Sleep(100);
    if (Assigned(fdisconnectedCallback)) then begin
      try
        fdisconnectedCallback(self, aMeta[1]);
      except
        { Ignore exceptions in user code }
      end;
    end;
    if ((aMeta[1] <> IPCON_DISCONNECT_REASON_REQUEST) and fautoReconnect and
        fautoReconnectAllowed) then begin
      fautoReconnectPending := true;
      retry := true;
      { Block here until reconnect. this is okay, there is no fcallback to
        deliver when there is no connection }
      while (retry) do begin
        retry := false;
        fsocketMutex.Acquire;
        try
          if (fautoReconnectAllowed and (not IsConnected)) then begin
            try
              ConnectUnlocked(true);
            except
              retry := true;
            end;
          end
          else begin
            fautoReconnectPending := false;
          end;
        finally
          fsocketMutex.Release;
        end;
        if (retry) then begin
          { Wait a moment to give another thread a chance to interrupt the
            auto-reconnect }
          Sleep(100);
        end;
      end;
    end;
  end;
end;

procedure TIPConnection.DispatchPacket(const aPacket: TDynamicByteArray);
var
  _FunctionID: byte;
  _UID, connectedUid: string;
  position: char;
  hardwareVersion, firmwareVersion: TTFVersionNumber;
  deviceIdentifier: word;
  _EnumerationType: byte;
  _device: TDeviceBase;
  _CallbackWrapper: TTFCallbackWrapper;
begin
  _FunctionID := GetFunctionIDFromData(aPacket);
  if (_FunctionID = IPCON_CALLBACK_ENUMERATE) then begin
    if (Assigned(fenumerateCallback)) then begin
      _UID := LEConvertStringFrom(8, 8, aPacket);
      connectedUid := LEConvertStringFrom(16, 8, aPacket);
      position := LEConvertCharFrom(24, aPacket);
      hardwareVersion[0] := LEConvertUInt8From(25, aPacket);
      hardwareVersion[1] := LEConvertUInt8From(26, aPacket);
      hardwareVersion[2] := LEConvertUInt8From(27, aPacket);
      firmwareVersion[0] := LEConvertUInt8From(28, aPacket);
      firmwareVersion[1] := LEConvertUInt8From(29, aPacket);
      firmwareVersion[2] := LEConvertUInt8From(30, aPacket);
      deviceIdentifier := LEConvertUInt16From(31, aPacket);
      _EnumerationType := LEConvertUInt8From(33, aPacket);
      try
        fenumerateCallback(self, _UID, connectedUid, position,
                          hardwareVersion, firmwareVersion,
                          deviceIdentifier, _EnumerationType);
      except
        { Ignore exceptions in user code }
      end;
    end ;

  end
  else begin
    _device := (fDevicesList as TDeviceList).GetItemWithUID(GetUIDFromData(aPacket));
    if (_device = nil) then begin
      exit;
    end;
    _CallbackWrapper := (_device as TDeviceBase).CallbackWrappers[_FunctionID];
    if (Assigned(_CallbackWrapper)) then begin
      try
        _CallbackWrapper(aPacket);
      except
        { Ignore exceptions in user code }
      end;
    end;
  end;
end;

function TIPConnection.IsConnected: boolean;
begin
  Result := fsocket <> INVALID_SOCKET;
end;

function TIPConnection.CreateRequestPacket(const aDevice: TComponent; const aFunctionID: byte; const aLen: byte): TDynamicByteArray;
var
  _SequenceNumber, _responseExpected: byte;
begin
  SetLength(Result, alen);
  FillChar(Result[0], alen, 0);
  fsequenceNumberMutex.Acquire;
  try
    _SequenceNumber := fnextSequenceNumber + 1;
    fnextSequenceNumber := _SequenceNumber mod 15;
  finally
    fsequenceNumberMutex.Release;
  end;
  _responseExpected := 0;
  if (adevice <> nil) then begin
    LEConvertUInt32To((aDevice as TDeviceBase).UID, 0, Result);
    if ((adevice as TDeviceBase).GetResponseExpected(aFunctionID)) then begin
      _responseExpected := 1;
    end;
  end;
  Result[4] := alen;
  Result[5] := afunctionID;
  Result[6] := (_SequenceNumber shl 4) or (_responseExpected shl 3);
end;

procedure TIPConnection.SendRequest(const aRequest: TDynamicByteArray);
var
  _error: boolean;
begin
  fsocketMutex.Acquire;
  try
    if (not IsConnected) then begin
      raise ENotConnectedException.Create('Not connected');
    end;
    fsocketSendMutex.Acquire;
    try
      {$ifdef FPC}
        _error := fpsend(fsocket, @aRequest[0], Length(aRequest), 0) < 0;
      {$else}
        {$ifdef DELPHI_MACOS}
          _error := send(fsocket, arequest[0], Length(arequest), 0) < 0;
        {$else}
          _error := WinSock.Send(fsocket, arequest[0], Length(arequest), 0) = SOCKET_ERROR;
        {$endif}
      {$endif}
    finally
      fsocketSendMutex.Release;
    end;
    if (_error) then begin
      HandleDisconnectByPeer(IPCON_DISCONNECT_REASON_ERROR, 0, true);
      raise ENotConnectedException.Create('Not connected');
    end;
    fdisconnectProbeFlag := false;
  finally
    fsocketMutex.Release;
  end;
end;

function GetUIDFromData(const aData: TDynamicByteArray): longword;
begin
  Result := LEConvertUInt32From(0, aData);
end;

function GetLengthFromData(const aData: TDynamicByteArray): byte;
begin
  Result := aData[4];
end;

end.
