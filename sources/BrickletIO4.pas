{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIO4;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIO4.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletIO4 = class;
  TBrickletIO4NotifyInterrupt = procedure(aSender: TBrickletIO4; const interruptMask: byte; const valueMask: byte) of object;
  TBrickletIO4NotifyMonoflopDone = procedure(aSender: TBrickletIO4; const selectionMask: byte; const valueMask: byte) of object;

  /// <summary>
  ///  4-channel digital input/output
  /// </summary>
  TBrickletIO4 = class(TDevice)
  private
    interruptCallback: TBrickletIO4NotifyInterrupt;
    monoflopDoneCallback: TBrickletIO4NotifyMonoflopDone;
    procedure CallbackWrapperInterrupt(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's     interruptCallback
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the output value (high or low) with a bitmask (4bit). A 1 in the bitmask
    ///  means high and a 0 in the bitmask means low.
    ///  
    ///  For example: The value 3 or 0b0011 will turn the pins 0-1 high and the
    ///  pins 2-3 low.
    ///  
    ///  All running monoflop timers will be aborted if this function is called.
    ///  
    ///  <note>
    ///   This function does nothing for pins that are configured as input.
    ///   Pull-up resistors can be switched on with <see cref="BrickletIO4.TBrickletIO4.SetConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetValue(const valueMask: byte); virtual;

    /// <summary>
    ///  Returns a bitmask of the values that are currently measured.
    ///  This function works if the pin is configured to input
    ///  as well as if it is configured to output.
    /// </summary>
    function GetValue: byte; virtual;

    /// <summary>
    ///  Configures the value and direction of the specified pins. Possible directions
    ///  are 'i' and 'o' for input and output.
    ///  
    ///  If the direction is configured as output, the value is either high or low
    ///  (set as *true* or *false*).
    ///  
    ///  If the direction is configured as input, the value is either pull-up or
    ///  default (set as *true* or *false*).
    ///  
    ///  For example:
    ///  
    ///  * (15, 'i', true) or (0b1111, 'i', true) will set all pins of as input pull-up.
    ///  * (8, 'i', false) or (0b1000, 'i', false) will set pin 3 of as input default (floating if nothing is connected).
    ///  * (3, 'o', false) or (0b0011, 'o', false) will set pins 0 and 1 as output low.
    ///  * (4, 'o', true) or (0b0100, 'o', true) will set pin 2 of as output high.
    ///  
    ///  Running monoflop timers for the specified pins will be aborted if this
    ///  function is called.
    /// </summary>
    procedure SetConfiguration(const selectionMask: byte; const direction: char; const value: boolean); virtual;

    /// <summary>
    ///  Returns a value bitmask and a direction bitmask. A 1 in the direction bitmask
    ///  means input and a 0 in the bitmask means output.
    ///  
    ///  For example: A return value of (3, 5) or (0b0011, 0b0101) for direction and
    ///  value means that:
    ///  
    ///  * pin 0 is configured as input pull-up,
    ///  * pin 1 is configured as input default,
    ///  * pin 2 is configured as output high and
    ///  * pin 3 is are configured as output low.
    /// </summary>
    procedure GetConfiguration(out directionMask: byte; out valueMask: byte); virtual;

    /// <summary>
    ///  Sets the debounce period of the <see cref="BrickletIO4.TBrickletIO4.OnInterrupt"/> callback.
    ///  
    ///  For example: If you set this value to 100, you will get the interrupt
    ///  maximal every 100ms. This is necessary if something that bounces is
    ///  connected to the IO-4 Bricklet, such as a button.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIO4.TBrickletIO4.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the pins on which an interrupt is activated with a bitmask.
    ///  Interrupts are triggered on changes of the voltage level of the pin,
    ///  i.e. changes from high to low and low to high.
    ///  
    ///  For example: An interrupt bitmask of 10 or 0b1010 will enable the interrupt for
    ///  pins 1 and 3.
    ///  
    ///  The interrupt is delivered with the <see cref="BrickletIO4.TBrickletIO4.OnInterrupt"/> callback.
    /// </summary>
    procedure SetInterrupt(const interruptMask: byte); virtual;

    /// <summary>
    ///  Returns the interrupt bitmask as set by <see cref="BrickletIO4.TBrickletIO4.SetInterrupt"/>.
    /// </summary>
    function GetInterrupt: byte; virtual;

    /// <summary>
    ///  Configures a monoflop of the pins specified by the first parameter as 4 bit
    ///  long bitmask. The specified pins must be configured for output. Non-output
    ///  pins will be ignored.
    ///  
    ///  The second parameter is a bitmask with the desired value of the specified
    ///  output pins. A 1 in the bitmask means high and a 0 in the bitmask means low.
    ///  
    ///  The third parameter indicates the time that the pins should hold
    ///  the value.
    ///  
    ///  If this function is called with the parameters (9, 1, 1500) or
    ///  (0b1001, 0b0001, 1500): Pin 0 will get high and pin 3 will get low. In 1.5s pin
    ///  0 will get low and pin 3 will get high again.
    ///  
    ///  A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
    ///  have a RS485 bus and an IO-4 Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds and pin 0 set to high. Pin 0 will be high all the time. If now
    ///  the RS485 connection is lost, then pin 0 will get low in at most two seconds.
    /// </summary>
    procedure SetMonoflop(const selectionMask: byte; const valueMask: byte; const time: longword); virtual;

    /// <summary>
    ///  Returns (for the given pin) the current value and the time as set by
    ///  <see cref="BrickletIO4.TBrickletIO4.SetMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetMonoflop(const aPin: byte; out aValue: byte; out time: longword; out timeRemaining: longword); virtual;

    /// <summary>
    ///  Sets the output value (high or low) with a bitmask, according to
    ///  the selection mask. The bitmask is 4 bit long, *true* refers to high
    ///  and *false* refers to low.
    ///  
    ///  For example: The parameters (9, 4) or (0b0110, 0b0100) will turn
    ///  pin 1 low and pin 2 high, pin 0 and 3 will remain untouched.
    ///  
    ///  Running monoflop timers for the selected pins will be aborted if this
    ///  function is called.
    ///  
    ///  <note>
    ///   This function does nothing for pins that are configured as input.
    ///   Pull-up resistors can be switched on with <see cref="BrickletIO4.TBrickletIO4.SetConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetSelectedValues(const selectionMask: byte; const valueMask: byte); virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected pin. You can
    ///  configure the edges that are counted with <see cref="BrickletIO4.TBrickletIO4.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetEdgeCount(const aPin: byte; const resetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for the selected pins.
    ///  
    ///  The edge type parameter configures if rising edges, falling edges or
    ///  both are counted if the pin is configured for input. Possible edge types are:
    ///  
    ///  * 0 = rising (default)
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  The debounce time is given in ms.
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetEdgeCountConfig(const selectionMask: byte; const edgeType: byte; const debounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected pin as set by
    ///  <see cref="BrickletIO4.TBrickletIO4.SetEdgeCountConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure GetEdgeCountConfig(const aPin: byte; out edgeType: byte; out debounce: byte); virtual;

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
    ///  This callback is triggered whenever a change of the voltage level is detected
    ///  on pins where the interrupt was activated with <see cref="BrickletIO4.TBrickletIO4.SetInterrupt"/>.
    ///  
    ///  The values are a bitmask that specifies which interrupts occurred
    ///  and the current value bitmask.
    ///  
    ///  For example:
    ///  
    ///  * (1, 1) or (0b0001, 0b0001) means that an interrupt on pin 0 occurred and
    ///    currently pin 0 is high and pins 1-3 are low.
    ///  * (9, 14) or (0b1001, 0b1110) means that interrupts on pins 0 and 3
    ///    occurred and currently pin 0 is low and pins 1-3 are high.
    /// </summary>
    property OnInterrupt: TBrickletIO4NotifyInterrupt read interruptCallback write interruptCallback;

    /// <summary>
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the involved pins and the current value of the pins
    ///  (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIO4NotifyMonoflopDone read monoflopDoneCallback write monoflopDoneCallback;
  end;

implementation

procedure TBrickletIO4.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletIO4.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_SELECTED_VALUES]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_SET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO4_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIO4.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_IO4_CALLBACK_INTERRUPT]:= {$ifdef FPC}@{$endif}CallbackWrapperInterrupt;
  aCallBacks[BRICKLET_IO4_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIO4.SetValue(const valueMask: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_VALUE, 9);
  LEConvertUInt8To(valueMask, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO4.GetValue: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO4.SetConfiguration(const selectionMask: byte; const direction: char; const value: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(selectionMask, 8, _request);
  LEConvertCharTo(direction, 9, _request);
  LEConvertBooleanTo(value, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO4.GetConfiguration(out directionMask: byte; out valueMask: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  directionMask:= LEConvertUInt8From(8, _response);
  valueMask:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIO4.SetDebouncePeriod(const debounce: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO4.GetDebouncePeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO4.SetInterrupt(const interruptMask: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_INTERRUPT, 9);
  LEConvertUInt8To(interruptMask, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO4.GetInterrupt: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_INTERRUPT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO4.SetMonoflop(const selectionMask: byte; const valueMask: byte; const time: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_MONOFLOP, 14);
  LEConvertUInt8To(selectionMask, 8, _request);
  LEConvertUInt8To(valueMask, 9, _request);
  LEConvertUInt32To(time, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO4.GetMonoflop(const aPin: byte; out aValue: byte; out time: longword; out timeRemaining: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_MONOFLOP, 9);
  LEConvertUInt8To(aPin, 8, _request);
  _response:= SendRequest(_request);
  aValue:= LEConvertUInt8From(8, _response);
  time:= LEConvertUInt32From(9, _response);
  timeRemaining:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletIO4.SetSelectedValues(const selectionMask: byte; const valueMask: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_SELECTED_VALUES, 10);
  LEConvertUInt8To(selectionMask, 8, _request);
  LEConvertUInt8To(valueMask, 9, _request);
  SendRequest(_request);
end;

function TBrickletIO4.GetEdgeCount(const aPin: byte; const resetCounter: boolean): longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(aPin, 8, _request);
  LEConvertBooleanTo(resetCounter, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO4.SetEdgeCountConfig(const selectionMask: byte; const edgeType: byte; const debounce: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_SET_EDGE_COUNT_CONFIG, 11);
  LEConvertUInt8To(selectionMask, 8, _request);
  LEConvertUInt8To(edgeType, 9, _request);
  LEConvertUInt8To(debounce, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO4.GetEdgeCountConfig(const aPin: byte; out edgeType: byte; out debounce: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_EDGE_COUNT_CONFIG, 9);
  LEConvertUInt8To(aPin, 8, _request);
  _response:= SendRequest(_request);
  edgeType:= LEConvertUInt8From(8, _response);
  debounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIO4.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO4_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIO4.CallbackWrapperInterrupt(const aPacket: TDynamicByteArray);
var interruptMask: byte; valueMask: byte;
begin
  interruptMask:= LEConvertUInt8From(8, aPacket);
  valueMask:= LEConvertUInt8From(9, aPacket);

  if (Assigned(interruptCallback)) then begin
    interruptCallback(self, interruptMask, valueMask);
  end;
end;

procedure TBrickletIO4.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  selectionMask: byte;
  valueMask: byte;
begin
  selectionMask:= LEConvertUInt8From(8, aPacket);
  valueMask:= LEConvertUInt8From(9, aPacket);

  if (Assigned(monoflopDoneCallback)) then begin
    monoflopDoneCallback(self, selectionMask, valueMask);
  end;
end;

end.
