{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletSolidStateRelay;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletSolidStateRelay.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletSolidStateRelay = class;
  TBrickletSolidStateRelayNotifyMonoflopDone = procedure(aSender: TBrickletSolidStateRelay; const state: boolean) of object;

  /// <summary>
  ///  Controls AC and DC Solid State Relays
  /// </summary>
  TBrickletSolidStateRelay = class(TDevice)
  private
    fMonoflopDoneCallback: TBrickletSolidStateRelayNotifyMonoflopDone;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the state of the relays *true* means on and *false* means off.
    ///  
    ///  A running monoflop timer will be aborted if this function is called.
    ///  
    ///  The default value is *false*.
    /// </summary>
    procedure SetState(const state: boolean); virtual;

    /// <summary>
    ///  Returns the state of the relay, *true* means on and *false* means off.
    /// </summary>
    function GetState: boolean; virtual;

    /// <summary>
    ///  The first parameter  is the desired state of the relay (*true* means on
    ///  and *false* means off). The second parameter indicates the time (in ms) that
    ///  the relay should hold the state.
    ///  
    ///  If this function is called with the parameters (true, 1500):
    ///  The relay will turn on and in 1.5s it will turn off again.
    ///  
    ///  A monoflop can be used as a failsafe mechanism. For example: Lets assume you
    ///  have a RS485 bus and a Solid State Relay Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds. The relay will be on all the time. If now the RS485
    ///  connection is lost, the relay will turn off in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const state: boolean; const time: longword); virtual;

    /// <summary>
    ///  Returns the current state and the time as set by
    ///  <see cref="BrickletSolidStateRelay.TBrickletSolidStateRelay.SetMonoflop"/> as well as the remaining time until the state flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(out state: boolean; out time: longword; out timeRemaining: longword); virtual;

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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered whenever the monoflop timer reaches 0.
    ///  The parameter is the current state of the relay
    ///  (the state after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletSolidStateRelayNotifyMonoflopDone read fMonoflopDoneCallback write fMonoflopDoneCallback;
  end;

implementation

procedure TBrickletSolidStateRelay.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletSolidStateRelay.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_STATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletSolidStateRelay.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_SOLID_STATE_RELAY_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletSolidStateRelay.SetState(const state: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_STATE, 9);
  LEConvertBooleanTo(state, 8, _request);
  SendRequest(_request);
end;

function TBrickletSolidStateRelay.GetState: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_STATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletSolidStateRelay.SetMonoflop(const state: boolean; const time: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_SET_MONOFLOP, 13);
  LEConvertBooleanTo(state, 8, _request);
  LEConvertUInt32To(time, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletSolidStateRelay.GetMonoflop(out state: boolean; out time: longword; out timeRemaining: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_MONOFLOP, 8);
  _response:= SendRequest(_request);
  state:= LEConvertBooleanFrom(8, _response);
  time:= LEConvertUInt32From(9, _response);
  timeRemaining:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletSolidStateRelay.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOLID_STATE_RELAY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletSolidStateRelay.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var state: boolean;
begin
  state:= LEConvertBooleanFrom(8, aPacket);

  if (Assigned(fMonoflopDoneCallback)) then begin
    fMonoflopDoneCallback(self, state);
  end;
end;

end.
