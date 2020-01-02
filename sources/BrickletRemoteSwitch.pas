{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRemoteSwitch;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRemoteSwitch.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRemoteSwitch = class;
  TBrickletRemoteSwitchNotifySwitchingDone = procedure(aSender: TBrickletRemoteSwitch) of object;

  /// <summary>
  ///  Controls remote mains switches
  /// </summary>
  TBrickletRemoteSwitch = class(TDevice)
  private
    fSwitchingDoneCallback: TBrickletRemoteSwitchNotifySwitchingDone;
    procedure CallbackWrapperSwitchingDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  This function is deprecated, use <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocketA"/> instead.
    /// </summary>
    procedure SwitchSocket(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  Returns the current switching state. If the current state is busy, the
    ///  Bricklet is currently sending a code to switch a socket. It will not
    ///  accept any calls of <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocket"/> until the state changes to ready.
    ///  
    ///  How long the switching takes is dependent on the number of repeats, see
    ///  <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SetRepeats"/>.
    /// </summary>
    function GetSwitchingState: byte; virtual;

    /// <summary>
    ///  Sets the number of times the code is send when of the <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SwitchSocket"/>
    ///  functions is called. The repeats basically correspond to the amount of time
    ///  that a button of the remote is pressed.
    ///  
    ///  Some dimmers are controlled by the length of a button pressed,
    ///  this can be simulated by increasing the repeats.
    ///  
    ///  The default value is 5.
    /// </summary>
    procedure SetRepeats(const aRepeats: byte); virtual;

    /// <summary>
    ///  Returns the number of repeats as set by <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.SetRepeats"/>.
    /// </summary>
    function GetRepeats: byte; virtual;

    /// <summary>
    ///  To switch a type A socket you have to give the house code, receiver code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The house code and receiver code have a range of 0 to 31 (5bit).
    ///  
    ///  A detailed description on how you can figure out the house and receiver code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_a_house_and_receiver_code&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketA(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  To switch a type B socket you have to give the address, unit and the state
    ///  (on or off) you want to switch to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit) and the unit has a range
    ///  of 0 to 15 (4bit). To switch all devices with the same address use 255 for
    ///  the unit.
    ///  
    ///  A detailed description on how you can teach a socket the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketB(const aAddress: longword; const aUnit: byte; const aSwitchTo: byte); virtual;

    /// <summary>
    ///  To control a type B dimmer you have to give the address, unit and the
    ///  dim value you want to set the dimmer to.
    ///  
    ///  The address has a range of 0 to 67108863 (26bit), the unit and the dim value
    ///  has a range of 0 to 15 (4bit).
    ///  
    ///  A detailed description on how you can teach a dimmer the address and unit can
    ///  be found :ref:`here &lt;remote_switch_bricklet_type_b_address_and_unit&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure DimSocketB(const aAddress: longword; const aUnit: byte; const aDimValue: byte); virtual;

    /// <summary>
    ///  To switch a type C socket you have to give the system code, device code and the
    ///  state (on or off) you want to switch to.
    ///  
    ///  The system code has a range of 'A' to 'P' (4bit) and the device code has a
    ///  range of 1 to 16 (4bit).
    ///  
    ///  A detailed description on how you can figure out the system and device code
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_c_system_and_device_code&gt;`.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SwitchSocketC(const aSystemCode: char; const aDeviceCode: byte; const aSwitchTo: byte); virtual;

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
    ///  This callback is triggered whenever the switching state changes
    ///  from busy to ready, see <see cref="BrickletRemoteSwitch.TBrickletRemoteSwitch.GetSwitchingState"/>.
    /// </summary>
    property OnSwitchingDone: TBrickletRemoteSwitchNotifySwitchingDone read fSwitchingDoneCallback write fSwitchingDoneCallback;
  end;

implementation

procedure TBrickletRemoteSwitch.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletRemoteSwitch.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_SWITCHING_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SET_REPEATS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_REPEATS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_A]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_B]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_DIM_SOCKET_B]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_C]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REMOTE_SWITCH_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRemoteSwitch.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_REMOTE_SWITCH_CALLBACK_SWITCHING_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperSwitchingDone;
end;

procedure TBrickletRemoteSwitch.SwitchSocket(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET, 11);
  LEConvertUInt8To(aHouseCode, 8, _request);
  LEConvertUInt8To(aReceiverCode, 9, _request);
  LEConvertUInt8To(aSwitchTo, 10, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitch.GetSwitchingState: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_SWITCHING_STATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitch.SetRepeats(const aRepeats: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SET_REPEATS, 9);
  LEConvertUInt8To(aRepeats, 8, _request);
  SendRequest(_request);
end;

function TBrickletRemoteSwitch.GetRepeats: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_REPEATS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRemoteSwitch.SwitchSocketA(const aHouseCode: byte; const aReceiverCode: byte; const aSwitchTo: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_A, 11);
  LEConvertUInt8To(aHouseCode, 8, _request);
  LEConvertUInt8To(aReceiverCode, 9, _request);
  LEConvertUInt8To(aSwitchTo, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitch.SwitchSocketB(const aAddress: longword; const aUnit: byte; const aSwitchTo: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_B, 14);
  LEConvertUInt32To(aAddress, 8, _request);
  LEConvertUInt8To(aUnit, 12, _request);
  LEConvertUInt8To(aSwitchTo, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitch.DimSocketB(const aAddress: longword; const aUnit: byte; const aDimValue: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_DIM_SOCKET_B, 14);
  LEConvertUInt32To(aAddress, 8, _request);
  LEConvertUInt8To(aUnit, 12, _request);
  LEConvertUInt8To(aDimValue, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitch.SwitchSocketC(const aSystemCode: char; const aDeviceCode: byte; const aSwitchTo: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_SWITCH_SOCKET_C, 11);
  LEConvertCharTo(aSystemCode, 8, _request);
  LEConvertUInt8To(aDeviceCode, 9, _request);
  LEConvertUInt8To(aSwitchTo, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRemoteSwitch.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REMOTE_SWITCH_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRemoteSwitch.CallbackWrapperSwitchingDone(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fSwitchingDoneCallback)) then begin
    fSwitchingDoneCallback(self);
  end;
end;

end.
