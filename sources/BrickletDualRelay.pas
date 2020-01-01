{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDualRelay;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletDualRelay.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDualRelay = class;
  TBrickletDualRelayNotifyMonoflopDone = procedure(aSender: TBrickletDualRelay; const aRelay: byte; const aState: boolean) of object;

  /// <summary>
  ///  Two relays to switch AC/DC devices
  /// </summary>
  TBrickletDualRelay = class(TDevice)
  private
    fMonoflopDoneCallback: TBrickletDualRelayNotifyMonoflopDone;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the state of the relays, *true* means on and *false* means off.
    ///  For example: (true, false) turns relay 1 on and relay 2 off.
    ///  
    ///  If you just want to set one of the relays and don't know the current state
    ///  of the other relay, you can get the state with <see cref="BrickletDualRelay.TBrickletDualRelay.GetState"/> or you
    ///  can use <see cref="BrickletDualRelay.TBrickletDualRelay.SetSelectedState"/>.
    ///  
    ///  All running monoflop timers will be aborted if this function is called.
    /// </summary>
    procedure SetState(const aRelay1: boolean; const aRelay2: boolean); virtual;

    /// <summary>
    ///  Returns the state of the relays, *true* means on and *false* means off.
    /// </summary>
    procedure GetState(out aRelay1: boolean; out aRelay2: boolean); virtual;

    /// <summary>
    ///  The first parameter can be 1 or 2 (relay 1 or relay 2). The second parameter
    ///  is the desired state of the relay (*true* means on and *false* means off).
    ///  The third parameter indicates the time that the relay should hold
    ///  the state.
    ///  
    ///  If this function is called with the parameters (1, true, 1500):
    ///  Relay 1 will turn on and in 1.5s it will turn off again.
    ///  
    ///  A monoflop can be used as a failsafe mechanism. For example: Lets assume you
    ///  have a RS485 bus and a Dual Relay Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds. The relay will be on all the time. If now the RS485
    ///  connection is lost, the relay will turn off in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const aRelay: byte; const aState: boolean; const aTime: longword); virtual;

    /// <summary>
    ///  Returns (for the given relay) the current state and the time as set by
    ///  <see cref="BrickletDualRelay.TBrickletDualRelay.SetMonoflop"/> as well as the remaining time until the state flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const aRelay: byte; out aState: boolean; out aTime: longword; out aTimeRemaining: longword); virtual;

    /// <summary>
    ///  Sets the state of the selected relay (1 or 2), *true* means on and *false* means off.
    ///  
    ///  A running monoflop timer for the selected relay will be aborted if this function is called.
    ///  
    ///  The other relay remains untouched.
    /// </summary>
    procedure SetSelectedState(const aRelay: byte; const aState: boolean); virtual;

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
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameter contain the relay (1 or 2) and the current state of the relay
    ///  (the state after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletDualRelayNotifyMonoflopDone read fMonoflopDoneCallback write fMonoflopDoneCallback;
  end;

implementation

procedure TBrickletDualRelay.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletDualRelay.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_SET_SELECTED_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DUAL_RELAY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDualRelay.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DUAL_RELAY_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletDualRelay.SetState(const aRelay1: boolean; const aRelay2: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_STATE, 10);
  LEConvertBooleanTo(aRelay1, 8, _request);
  LEConvertBooleanTo(aRelay2, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualRelay.GetState(out aRelay1: boolean; out aRelay2: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_STATE, 8);
  _response:= SendRequest(_request);
  aRelay1:= LEConvertBooleanFrom(8, _response);
  aRelay2:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletDualRelay.SetMonoflop(const aRelay: byte; const aState: boolean; const aTime: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_MONOFLOP, 14);
  LEConvertUInt8To(aRelay, 8, _request);
  LEConvertBooleanTo(aState, 9, _request);
  LEConvertUInt32To(aTime, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletDualRelay.GetMonoflop(const aRelay: byte; out aState: boolean; out aTime: longword; out aTimeRemaining: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(aRelay, 8, _request);
  _response:= SendRequest(_request);
  aState:= LEConvertBooleanFrom(8, _response);
  aTime:= LEConvertUInt32From(9, _response);
  aTimeRemaining:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletDualRelay.SetSelectedState(const aRelay: byte; const aState: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_SET_SELECTED_STATE, 10);
  LEConvertUInt8To(aRelay, 8, _request);
  LEConvertBooleanTo(aState, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletDualRelay.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DUAL_RELAY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDualRelay.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  _relay: byte;
  _state: boolean;
begin
  _relay:= LEConvertUInt8From(8, aPacket);
  _state:= LEConvertBooleanFrom(9, aPacket);

  if (Assigned(fMonoflopDoneCallback)) then begin
    fMonoflopDoneCallback(self, _relay, _state);
  end;
end;

end.
