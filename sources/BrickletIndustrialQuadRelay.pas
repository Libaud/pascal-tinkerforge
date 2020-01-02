{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialQuadRelay;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialQuadRelay.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfChar = array [0..3] of char;

  TBrickletIndustrialQuadRelay = class;
  TBrickletIndustrialQuadRelayNotifyMonoflopDone = procedure(aSender: TBrickletIndustrialQuadRelay; const aSelectionMask: word; const aValueMask: word) of object;

  /// <summary>
  ///  4 galvanically isolated solid state relays
  /// </summary>
  TBrickletIndustrialQuadRelay = class(TDevice)
  private
    fMonoflopDoneCallback: TBrickletIndustrialQuadRelayNotifyMonoflopDone;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the output value with a bitmask (16bit). A 1 in the bitmask means relay
    ///  closed and a 0 means relay open.
    ///  
    ///  For example: The value 3 or 0b0011 will close the relay of pins 0-1 and open
    ///  the other pins.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>), the pins correspond to the
    ///  markings on the Industrial Quad Relay Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    ///  
    ///  All running monoflop timers will be aborted if this function is called.
    /// </summary>
    procedure SetValue(const aValueMask: word); virtual;

    /// <summary>
    ///  Returns the bitmask as set by <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetValue"/>.
    /// </summary>
    function GetValue: word; virtual;

    /// <summary>
    ///  Configures a monoflop of the pins specified by the first parameter
    ///  bitmask.
    ///  
    ///  The second parameter is a bitmask with the desired value of the specified
    ///  pins. A 1 in the bitmask means relay closed and a 0 means relay open.
    ///  
    ///  The third parameter indicates the time that the pins should hold
    ///  the value.
    ///  
    ///  If this function is called with the parameters (9, 1, 1500) or
    ///  (0b1001, 0b0001, 1500): Pin 0 will close and pin 3 will open. In 1.5s pin 0
    ///  will open and pin 3 will close again.
    ///  
    ///  A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
    ///  have a RS485 bus and a Quad Relay Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds and pin 0 closed. Pin 0 will be closed all the time. If now
    ///  the RS485 connection is lost, then pin 0 will be opened in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const aSelectionMask: word; const aValueMask: word; const aTime: longword); virtual;

    /// <summary>
    ///  Returns (for the given pin) the current value and the time as set by
    ///  <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const aPin: byte; out aValue: word; out aTime: longword; out aTimeRemaining: longword); virtual;

    /// <summary>
    ///  Sets a group of Quad Relay Bricklets that should work together. You can
    ///  find Bricklets that can be grouped together with <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.GetAvailableForGroup"/>.
    ///  
    ///  The group consists of 4 elements. Element 1 in the group will get pins 0-3,
    ///  element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.
    ///  
    ///  Each element can either be one of the ports ('a' to 'd') or 'n' if it should
    ///  not be used.
    ///  
    ///  For example: If you have two Quad Relay Bricklets connected to port A and
    ///  port B respectively, you could call with ``['a', 'b', 'n', 'n']``.
    ///  
    ///  Now the pins on the Quad Relay on port A are assigned to 0-3 and the
    ///  pins on the Quad Relay on port B are assigned to 4-7. It is now possible
    ///  to call <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetValue"/> and control two Bricklets at the same time.
    /// </summary>
    procedure SetGroup(const aGroup: array of char); virtual;

    /// <summary>
    ///  Returns the group as set by <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>
    /// </summary>
    function GetGroup: TArray0To3OfChar; virtual;

    /// <summary>
    ///  Returns a bitmask of ports that are available for grouping. For example the
    ///  value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
    ///  can be grouped together.
    /// </summary>
    function GetAvailableForGroup: byte; virtual;

    /// <summary>
    ///  Sets the output value with a bitmask, according to the selection mask.
    ///  The bitmask is 16 bit long, *true* refers to a closed relay and
    ///  *false* refers to an open relay.
    ///  
    ///  For example: The values (3, 1) or (0b0011, 0b0001) will close the relay of
    ///  pin 0, open the relay of pin 1 and leave the others untouched.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialQuadRelay.TBrickletIndustrialQuadRelay.SetGroup"/>), the pins correspond to the
    ///  markings on the Industrial Quad Relay Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    ///  
    ///  Running monoflop timers for the selected relays will be aborted if this function
    ///  is called.
    /// </summary>
    procedure SetSelectedValues(const aSelectionMask: word; const aValueMask: word); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the involved pins and the current value of the pins
    ///  (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIndustrialQuadRelayNotifyMonoflopDone read fMonoflopDoneCallback write fMonoflopDoneCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialQuadRelay.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletIndustrialQuadRelay.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_GROUP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_GROUP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_AVAILABLE_FOR_GROUP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_SELECTED_VALUES]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialQuadRelay.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_QUAD_RELAY_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIndustrialQuadRelay.SetValue(const aValueMask: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_VALUE, 10);
  LEConvertUInt16To(aValueMask, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelay.GetValue: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialQuadRelay.SetMonoflop(const aSelectionMask: word; const aValueMask: word; const aTime: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_MONOFLOP, 16);
  LEConvertUInt16To(aSelectionMask, 8, _request);
  LEConvertUInt16To(aValueMask, 10, _request);
  LEConvertUInt32To(aTime, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialQuadRelay.GetMonoflop(const aPin: byte; out aValue: word; out aTime: longword; out aTimeRemaining: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(aPin, 8, _request);
  _response:= SendRequest(_request);
  aValue:= LEConvertUInt16From(8, _response);
  aTime:= LEConvertUInt32From(10, _response);
  aTimeRemaining:= LEConvertUInt32From(14, _response);
end;

procedure TBrickletIndustrialQuadRelay.SetGroup(const aGroup: array of char);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_GROUP, 12);
  if (Length(aGroup) <> 4) then raise EInvalidParameterException.Create('Group has to be exactly 4 items long');
  for _i:= 0 to Length(aGroup) - 1 do LEConvertCharTo(aGroup[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletIndustrialQuadRelay.GetGroup: TArray0To3OfChar;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_GROUP, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do Result[_i]:= LEConvertCharFrom(8 + (_i * 1), _response);
end;

function TBrickletIndustrialQuadRelay.GetAvailableForGroup: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_AVAILABLE_FOR_GROUP, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialQuadRelay.SetSelectedValues(const aSelectionMask: word; const aValueMask: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_SET_SELECTED_VALUES, 12);
  LEConvertUInt16To(aSelectionMask, 8, _request);
  LEConvertUInt16To(aValueMask, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialQuadRelay.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_QUAD_RELAY_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialQuadRelay.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  _SelectionMask: word;
  _ValueMask: word;
begin
  _SelectionMask:= LEConvertUInt16From(8, aPacket);
  _ValueMask:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fMonoflopDoneCallback)) then begin
    fMonoflopDoneCallback(self, _SelectionMask, _ValueMask);
  end;
end;

end.
