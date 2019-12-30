unit DeviceAbstract;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, SyncObjs, TinkerforgeCommon, IPConnection, BlockingQueue;

type
  { TDeviceAbstract declaration }

  TDeviceAbstract = class(TComponent)
    private
      fuid: longword;
      fuidString: string;
      fUIDIsValid: boolean;
      fAPIVersion: TTFVersionNumber;
      fIPConnection: TIPConnection;
      fRequestMutex: TCriticalSection;
      fexpectedResponseFunctionID: byte; { protected by _requestMutex }
      fexpectedResponseSequenceNumber: byte; { protected by _requestMutex }
      fresponseQueue: TBlockingQueue;
      // Method's
      //procedure SetUIDValid(const aUIDValid: boolean);
      // Access method's
      procedure SetIPConnection(aIPConnection: TIPConnection);
      procedure SetUIDString(const aUIDString: string);
    protected
      // Method's
      // Abstract method's, must be overrided in descendants
      procedure InitializeVersion(var aVersion: TTFVersionNumber); virtual; abstract;
      function SendRequest(const aRequest: TDynamicByteArray): TDynamicByteArray;
      // Properties
      property UIDIsValid: boolean read fUIDIsValid;
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      // Properties
      property APIVersion: TTFVersionNumber read fAPIVersion;
      property IPConnection: TIPConnection read fIPConnection write SetIPConnection;
      property uid: longword read fuid write fuid;
      property UIDString: string read fUIDString write SetUIDString;
      property ResponseQueue: TBlockingQueue read fResponseQueue;
      property ExpectedResponseFunctionID: byte read fExpectedResponseFunctionID;
      property ExpectedResponseSequenceNumber: byte read fExpectedResponseSequenceNumber;
  end;

  { End of TDeviceAbstract declaration }

implementation

uses
  TinkerforgeExceptions, Base58;

{ TDeviceAbstract implementation }

constructor TDeviceAbstract.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  InitializeVersion(fAPIVersion);
  fexpectedResponseFunctionID:= 0;
  fexpectedResponseSequenceNumber:= 0;
  fRequestMutex:= TCriticalSection.Create;
  fresponseQueue:= TBlockingQueue.Create;
end;

destructor TDeviceAbstract.Destroy;
begin
  fRequestMutex.Destroy;
  fresponseQueue.Destroy;
  inherited Destroy;
end;

procedure TDeviceAbstract.SetIPConnection(aIPConnection: TIPConnection);
begin
  if Assigned(aIPConnection) then
  begin
    fIPConnection:= aIPConnection;
    if (fUIDIsValid) then
      fIPConnection.RegisterDevice(Self)
    else
      raise
        Exception.Create('IPConnection component in argument is not assigned !');
  end;
end;

procedure TDeviceAbstract.SetUIDString(const aUIDString: string);
var
  _longUid: uint64;
  _Value1, _Value2: longint;
begin
  if aUIDString <> fUIDString then
  begin
    fuidString:= aUIDString;
    fUIDIsValid:= Base58Decode(fUIDString, _longUid);
    if (fUIDIsValid and (_longUid > $FFFFFFFF)) then begin
      { Convert from 64bit to 32bit }
      _value1:= _longUid and $FFFFFFFF;
      _value2:= longword((_longUid shr 32) and $FFFFFFFF);
      _longUid:= (_value1 and $00000FFF);
      _longUid:= _longUid or ((_value1 and longword($0F000000)) shr 12);
      _longUid:= _longUid or ((_value2 and longword($0000003F)) shl 16);
      _longUid:= _longUid or ((_value2 and longword($000F0000)) shl 6);
      _longUid:= _longUid or ((_value2 and longword($3F000000)) shl 2);
    end;
    uid:= _longUid;
    if (uid = 0) then begin
      fUIDIsValid:= false; { broadcast UID is forbidden }
    end;
  end;
end;

// Protected method's

function TDeviceAbstract.SendRequest(const aRequest: TDynamicByteArray): TDynamicByteArray;
var
  //oIPConnection: TIPConnection;
  _kind, _ErrorCode, _functionID: byte;
begin
  if (not UIDIsValid) then
    raise EInvalidUIDException.Create('UID "' + UIDString + '" is invalid');
  SetLength(Result, 0);
  //oIPConnection:= fIPConnection as TIPConnection;
  if (GetResponseExpectedFromData(aRequest)) then begin
    _functionID:= GetFunctionIDFromData(aRequest);
    fRequestMutex.Acquire;
    try
      fexpectedResponseFunctionID:= _functionID;
      fexpectedResponseSequenceNumber:= GetSequenceNumberFromData(aRequest);
      try
        fIPConnection.SendRequest(aRequest);
        while true do begin
          if (not fresponseQueue.Dequeue(_kind, Result, IPConnection.timeout)) then begin
            raise ETimeoutException.Create('Did not receive response in time for function ID ' + IntToStr(_functionID));
          end;
          if ((fexpectedResponseFunctionID = GetFunctionIDFromData(Result)) and
              (fexpectedResponseSequenceNumber = GetSequenceNumberFromData(Result))) then begin
            { Ignore old responses that arrived after the timeout expired, but before setting
              fexpectedResponseFunctionID and fexpectedResponseSequenceNumber back to 0 }
            break;
          end;
        end;
      finally
        fexpectedResponseFunctionID:= 0;
        fexpectedResponseSequenceNumber:= 0;
      end;
    finally
      fRequestMutex.Release;
    end;
    _ErrorCode:= GetErrorCodeFromData(Result);
    if (_errorCode = 0) then begin
      { No error }
    end
    else if (_ErrorCode = 1) then begin
      raise EInvalidParameterException.Create('Got invalid parameter for function ID ' + IntToStr(_functionID));
    end
    else if (_ErrorCode = 2) then begin
      raise ENotSupportedException.Create('Function ID ' + IntToStr(_functionID) + ' is not supported');
    end
    else begin
      raise EUnknownErrorCodeException.Create('Function ID ' + IntToStr(_functionID) + ' returned an unknown error');
    end;
  end
  else begin
    fIPConnection.SendRequest(aRequest);
  end;
end;

{ End of TDeviceAbstract implementation }

end.

