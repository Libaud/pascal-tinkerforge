{
  Copyright (C) 2014 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit DeviceBase;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, DeviceAbstract;

{$I Tinkerforge.inc}
{$I DeviceBase.inc}

type
  TDeviceBase = class(TDeviceAbstract)
    private
      fcallbackWrappers: TTFCallbackWrappers;
      fResponseExpected: TTFResponseExpected;
      // Method's
      // Access method's
    protected
      // Method's
      /// <summary>
      ///  Returns the API version (major, minor, revision) of the bindings for
      ///  this device.
      /// </summary>
      //function GetAPIVersion: TTFVersionNumber; virtual;

      // Abstract method's
      procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); virtual; abstract;
      /// <summary>
      ///  Changes the response expected flag of the function specified by
      ///  the function ID paramdeviceseter. This flag can only be changed for setter
      ///  (default value: *false*)   InitializeVersion(and callback configuration functions
      ///  (default value: *true*). For getter functions it is always enabled.
      ///
      ///  Enabling the response expecstreamMutexted flag for a setter function allows to
      ///  detect timeouts and other error conditions calls of this setter as
      ///  well. The device will then send a response for this purpose. If this
      ///  flag is disabled for a setter function then no response is send and
      ///  errors are silently ignored, because they cannot be detected.
      /// </summary>
      procedure SetResponseExpected(const aFunctionId: byte;
                                    const aResponseExpected: boolean); overload; virtual;
      procedure SetResponseExpected(aFunctionId: byte; aFunctionValue: byte); overload; virtual;
      // Abstract method's, must be overrided in descendants
      procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); virtual; abstract;
      procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); virtual; abstract;
      // properties
    public
      constructor Create(aOwner: TComponent); override;
      destructor Destroy; override;
      /// <summary>
      ///  Returns the response expected flag for the function specified by the
      ///  *functionId* parameter. It is *true* if the function is expected to
      ///  send a response, *false* otherwise.
      ///                    property IPConnection: fIPConnection read write;

      ///  For getter functions this is enabled by default and cannot be disabled,
      ///  because those functions will always send a response. For callback
      ///  configuration functions it is enabled by default too, but can be
      ///  disabled via the setResponseExpected function. For setter functions it
      ///  is disabled by default and can be enabled.
      ///
      ///  Enabling the response expected flag for a setter function allows to
      ///  detect timeouts and other error conditions calls of this setter as
      ///  well. The device will then send a response for this purpose. If this
      ///  flag is disabled for a setter function then no response is send and
      ///  errors are sil    property IPConnection: fIPConnection read write;
      ///  ently ignored, because they cannot be detected.
      /// </summary>
      function GetResponseExpected(const functionId: byte): boolean; virtual;
      // Properties
      property ResponseExpected: TTFResponseExpected read fResponseExpected write fResponseExpected;
      property CallbackWrappers: TTFCallbackWrappers read fCallbackWrappers;
    published
  end;

implementation

{uses
  TinkerforgeExceptions;}

constructor TDeviceBase.Create(aOwner: TComponent);
var
  _i: integer;
begin
  inherited Create(aOwner);
  for _i:= 0 to Length(fResponseExpected) - 1 do
    SetResponseExpected(_i, DEVICE_RESPONSE_EXPECTED_INVALID_FUNCTION_ID);
  InitializeResponseExpected(fResponseExpected);
  InitializeCallbacks(fcallbackWrappers);
end;

destructor TDeviceBase.Destroy;
begin
  if (UIDIsValid) then
    IPConnection.UnregisterDevice(Self);
  inherited Destroy;
end;

// Private method's

// Access method's

procedure TDeviceBase.SetResponseExpected(const aFunctionId: byte; const aResponseExpected: boolean);
var flag: byte;
begin
  flag:= fresponseExpected[aFunctionId];
  if (flag = DEVICE_RESPONSE_EXPECTED_INVALID_FUNCTION_ID) then begin
    raise Exception.Create('Invalid function ID ' + IntToStr(aFunctionId));
  end;
  if (flag = DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE) then begin
    raise Exception.Create('Response Expected flag cannot be changed for function ID ' + IntToStr(aFunctionId));
  end;
  if (aResponseExpected) then begin
    fresponseExpected[aFunctionId]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  end
  else begin
    fresponseExpected[aFunctionId]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  end;
end;

function TDeviceBase.GetResponseExpected(const functionID: byte): boolean;
var flag: byte;
begin
  flag:= fresponseExpected[functionID];
  if (flag = DEVICE_RESPONSE_EXPECTED_INVALID_FUNCTION_ID) then begin
    raise Exception.Create('Invalid function ID ' + IntToStr(functionID));
  end;
  if ((flag = DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE) or
      (flag = DEVICE_RESPONSE_EXPECTED_TRUE)) then begin
    Result:= true;
  end
  else begin
    Result:= false;
  end;
end;

procedure TDeviceBase.SetResponseExpected(aFunctionId: byte; aFunctionValue: byte);
begin
  fResponseExpected[aFunctionId]:= aFunctionValue;
end;

end.
