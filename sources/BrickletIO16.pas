{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIO16;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIO16.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletIO16 = class;
  TBrickletIO16NotifyInterrupt = procedure(aSender: TBrickletIO16; const aPort: char; const aInterruptMask: byte; const aValueMask: byte) of object;
  TBrickletIO16NotifyMonoflopDone = procedure(aSender: TBrickletIO16; const aPort: char; const aSelectionMask: byte; const aValueMask: byte) of object;

  /// <summary>
  ///  16-channel digital input/output
  /// </summary>
  TBrickletIO16 = class(TDevice)
  private
    fInterruptCallback: TBrickletIO16NotifyInterrupt;
    fMonoflopDoneCallback: TBrickletIO16NotifyMonoflopDone;
    procedure CallbackWrapperInterrupt(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the output value (high or low) for a port ("a" or "b") with a bitmask
    ///  (8bit). A 1 in the bitmask means high and a 0 in the bitmask means low.
    ///  
    ///  For example: The value 15 or 0b00001111 will turn the pins 0-3 high and the
    ///  pins 4-7 low for the specified port.
    ///  
    ///  All running monoflop timers of the given port will be aborted if this function
    ///  is called.
    ///  
    ///  <note>
    ///   This function does nothing for pins that are configured as input.
    ///   Pull-up resistors can be switched on with <see cref="BrickletIO16.TBrickletIO16.SetPortConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetPort(const aPort: char; const aValueMask: byte); virtual;

    /// <summary>
    ///  Returns a bitmask of the values that are currently measured on the
    ///  specified port. This function works if the pin is configured to input
    ///  as well as if it is configured to output.
    /// </summary>
    function GetPort(const aPort: char): byte; virtual;

    /// <summary>
    ///  Configures the value and direction of a specified port. Possible directions
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
    ///  * ('a', 255, 'i', true) or ('a', 0b11111111, 'i', true) will set all pins of port A as input pull-up.
    ///  * ('a', 128, 'i', false) or ('a', 0b10000000, 'i', false) will set pin 7 of port A as input default (floating if nothing is connected).
    ///  * ('b', 3, 'o', false) or ('b', 0b00000011, 'o', false) will set pins 0 and 1 of port B as output low.
    ///  * ('b', 4, 'o', true) or ('b', 0b00000100, 'o', true) will set pin 2 of port B as output high.
    ///  
    ///  Running monoflop timers for the selected pins will be aborted if this
    ///  function is called.
    /// </summary>
    procedure SetPortConfiguration(const aPort: char; const aselectionMask: byte; const aDirection: char; const aValue: boolean); virtual;

    /// <summary>
    ///  Returns a direction bitmask and a value bitmask for the specified port. A 1 in
    ///  the direction bitmask means input and a 0 in the bitmask means output.
    ///  
    ///  For example: A return value of (15, 51) or (0b00001111, 0b00110011) for
    ///  direction and value means that:
    ///  
    ///  * pins 0 and 1 are configured as input pull-up,
    ///  * pins 2 and 3 are configured as input default,
    ///  * pins 4 and 5 are configured as output high
    ///  * and pins 6 and 7 are configured as output low.
    /// </summary>
    procedure GetPortConfiguration(const aPort: char; out aDirectionMask: byte; out aValueMask: byte); virtual;

    /// <summary>
    ///  Sets the debounce period of the <see cref="BrickletIO16.TBrickletIO16.OnInterrupt"/> callback.
    ///  
    ///  For example: If you set this value to 100, you will get the interrupt
    ///  maximal every 100ms. This is necessary if something that bounces is
    ///  connected to the IO-16 Bricklet, such as a button.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIO16.TBrickletIO16.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the pins on which an interrupt is activated with a bitmask.
    ///  Interrupts are triggered on changes of the voltage level of the pin,
    ///  i.e. changes from high to low and low to high.
    ///  
    ///  For example: ('a', 129) or ('a', 0b10000001) will enable the interrupt for
    ///  pins 0 and 7 of port a.
    ///  
    ///  The interrupt is delivered with the <see cref="BrickletIO16.TBrickletIO16.OnInterrupt"/> callback.
    /// </summary>
    procedure SetPortInterrupt(const aPort: char; const aInterruptMask: byte); virtual;

    /// <summary>
    ///  Returns the interrupt bitmask for the specified port as set by
    ///  <see cref="BrickletIO16.TBrickletIO16.SetPortInterrupt"/>.
    /// </summary>
    function GetPortInterrupt(const aPort: char): byte; virtual;

    /// <summary>
    ///  Configures a monoflop of the pins specified by the second parameter as 8 bit
    ///  long bitmask. The specified pins must be configured for output. Non-output
    ///  pins will be ignored.
    ///  
    ///  The third parameter is a bitmask with the desired value of the specified
    ///  output pins. A 1 in the bitmask means high and a 0 in the bitmask means low.
    ///  
    ///  The forth parameter indicates the time that the pins should hold
    ///  the value.
    ///  
    ///  If this function is called with the parameters ('a', 9, 1, 1500) or
    ///  ('a', 0b00001001, 0b00000001, 1500): Pin 0 will get high and pin 3 will get
    ///  low on port 'a'. In 1.5s pin 0 will get low and pin 3 will get high again.
    ///  
    ///  A monoflop can be used as a fail-safe mechanism. For example: Lets assume you
    ///  have a RS485 bus and an IO-16 Bricklet connected to one of the slave
    ///  stacks. You can now call this function every second, with a time parameter
    ///  of two seconds and pin 0 set to high. Pin 0 will be high all the time. If now
    ///  the RS485 connection is lost, then pin 0 will get low in at most two seconds.
    /// </summary>
    procedure SetPortMonoflop(const aPort: char; const aSelectionMask: byte; const aValueMask: byte; const aTime: longword); virtual;

    /// <summary>
    ///  Returns (for the given pin) the current value and the time as set by
    ///  <see cref="BrickletIO16.TBrickletIO16.SetPortMonoflop"/> as well as the remaining time until the value flips.
    ///  
    ///  If the timer is not running currently, the remaining time will be returned
    ///  as 0.
    /// </summary>
    procedure GetPortMonoflop(const aPort: char; const aPin: byte; out aValue: byte; out aTime: longword; out aTimeRemaining: longword); virtual;

    /// <summary>
    ///  Sets the output value (high or low) for a port ("a" or "b" with a bitmask,
    ///  according to the selection mask. The bitmask is 8 bit long and a 1 in the
    ///  bitmask means high and a 0 in the bitmask means low.
    ///  
    ///  For example: The parameters ('a', 192, 128) or ('a', 0b11000000, 0b10000000)
    ///  will turn pin 7 high and pin 6 low on port A, pins 0-6 will remain untouched.
    ///  
    ///  Running monoflop timers for the selected pins will be aborted if this
    ///  function is called.
    ///  
    ///  <note>
    ///   This function does nothing for pins that are configured as input.
    ///   Pull-up resistors can be switched on with <see cref="BrickletIO16.TBrickletIO16.SetPortConfiguration"/>.
    ///  </note>
    /// </summary>
    procedure SetSelectedValues(const aPort: char; const aSelectionMask: byte; const aValueMask: byte); virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected pin on port A.
    ///  You can configure the edges that are counted with <see cref="BrickletIO16.TBrickletIO16.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    function GetEdgeCount(const aPin: byte; const aResetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for the selected pin of port A. Pins 0 and 1
    ///  are available for edge counting.
    ///  
    ///  The edge type parameter configures if rising edges, falling edges or
    ///  both are counted if the pin is configured for input. Possible edge types are:
    ///  
    ///  * 0 = rising
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure SetEdgeCountConfig(const aPin: byte; const aEdgeType: byte; const aDebounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected pin of port A as set by
    ///  <see cref="BrickletIO16.TBrickletIO16.SetEdgeCountConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.3$nbsp;(Plugin)
    /// </summary>
    procedure GetEdgeCountConfig(const aPin: byte; out aEdgeType: byte; out aDebounce: byte); virtual;

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
    ///  This callback is triggered whenever a change of the voltage level is detected
    ///  on pins where the interrupt was activated with <see cref="BrickletIO16.TBrickletIO16.SetPortInterrupt"/>.
    ///  
    ///  The values are the port, a bitmask that specifies which interrupts occurred
    ///  and the current value bitmask of the port.
    ///  
    ///  For example:
    ///  
    ///  * ('a', 1, 1) or ('a', 0b00000001, 0b00000001) means that on port A an
    ///    interrupt on pin 0 occurred and currently pin 0 is high and pins 1-7 are low.
    ///  * ('b', 129, 254) or ('b', 0b10000001, 0b11111110) means that on port B
    ///    interrupts on pins 0 and 7 occurred and currently pin 0 is low and pins 1-7
    ///    are high.
    /// </summary>
    property OnInterrupt: TBrickletIO16NotifyInterrupt read fInterruptCallback write fInterruptCallback;

    /// <summary>
    ///  This callback is triggered whenever a monoflop timer reaches 0. The
    ///  parameters contain the port, the involved pins and the current value of
    ///  the pins (the value after the monoflop).
    /// </summary>
    property OnMonoflopDone: TBrickletIO16NotifyMonoflopDone read fMonoflopDoneCallback write fMonoflopDoneCallback;
  end;

implementation

procedure TBrickletIO16.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletIO16.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_PORT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_PORT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_PORT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_PORT_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_PORT_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_PORT_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_PORT_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_PORT_MONOFLOP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_SELECTED_VALUES]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_SET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_IO16_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIO16.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_IO16_CALLBACK_INTERRUPT]:= {$ifdef FPC}@{$endif}CallbackWrapperInterrupt;
  aCallBacks[BRICKLET_IO16_CALLBACK_MONOFLOP_DONE]:= {$ifdef FPC}@{$endif}CallbackWrapperMonoflopDone;
end;

procedure TBrickletIO16.SetPort(const aPort: char; const aValueMask: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_PORT, 10);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aValueMask, 9, _request);
  SendRequest(_request);
end;

function TBrickletIO16.GetPort(const aPort: char): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_PORT, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO16.SetPortConfiguration(const aPort: char; const aselectionMask: byte; const aDirection: char; const aValue: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_PORT_CONFIGURATION, 12);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aselectionMask, 9, _request);
  LEConvertCharTo(aDirection, 10, _request);
  LEConvertBooleanTo(aValue, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16.GetPortConfiguration(const aPort: char; out aDirectionMask: byte; out aValueMask: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_PORT_CONFIGURATION, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  aDirectionMask:= LEConvertUInt8From(8, _response);
  aValueMask:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIO16.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletIO16.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO16.SetPortInterrupt(const aPort: char; const aInterruptMask: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_PORT_INTERRUPT, 10);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aInterruptMask, 9, _request);
  SendRequest(_request);
end;

function TBrickletIO16.GetPortInterrupt(const aPort: char): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_PORT_INTERRUPT, 9);
  LEConvertCharTo(aPort, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIO16.SetPortMonoflop(const aPort: char; const aSelectionMask: byte; const aValueMask: byte; const aTime: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_PORT_MONOFLOP, 15);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aSelectionMask, 9, _request);
  LEConvertUInt8To(aValueMask, 10, _request);
  LEConvertUInt32To(aTime, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16.GetPortMonoflop(const aPort: char; const aPin: byte; out aValue: byte; out aTime: longword; out aTimeRemaining: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_PORT_MONOFLOP, 10);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aPin, 9, _request);
  _response:= SendRequest(_request);
  aValue:= LEConvertUInt8From(8, _response);
  aTime:= LEConvertUInt32From(9, _response);
  aTimeRemaining:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletIO16.SetSelectedValues(const aPort: char; const aSelectionMask: byte; const aValueMask: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_SELECTED_VALUES, 11);
  LEConvertCharTo(aPort, 8, _request);
  LEConvertUInt8To(aSelectionMask, 9, _request);
  LEConvertUInt8To(aValueMask, 10, _request);
  SendRequest(_request);
end;

function TBrickletIO16.GetEdgeCount(const aPin: byte; const aResetCounter: boolean): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(aPin, 8, _request);
  LEConvertBooleanTo(aResetCounter, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIO16.SetEdgeCountConfig(const aPin: byte; const aEdgeType: byte; const aDebounce: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_SET_EDGE_COUNT_CONFIG, 11);
  LEConvertUInt8To(aPin, 8, _request);
  LEConvertUInt8To(aEdgeType, 9, _request);
  LEConvertUInt8To(aDebounce, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletIO16.GetEdgeCountConfig(const aPin: byte; out aEdgeType: byte; out aDebounce: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_EDGE_COUNT_CONFIG, 9);
  LEConvertUInt8To(aPin, 8, _request);
  _response:= SendRequest(_request);
  aEdgeType:= LEConvertUInt8From(8, _response);
  aDebounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIO16.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_IO16_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIO16.CallbackWrapperInterrupt(const aPacket: TDynamicByteArray);
var
  _port: char;
  _interruptMask: byte;
  _valueMask: byte;
begin
  _port:= LEConvertCharFrom(8, aPacket);
  _interruptMask:= LEConvertUInt8From(9, aPacket);
  _valueMask:= LEConvertUInt8From(10, aPacket);

  if (Assigned(fInterruptCallback)) then begin
    fInterruptCallback(self, _port, _interruptMask, _valueMask);
  end;
end;

procedure TBrickletIO16.CallbackWrapperMonoflopDone(const aPacket: TDynamicByteArray);
var
  _port: char;
  _selectionMask: byte;
  _valueMask: byte;
begin
  _port:= LEConvertCharFrom(8, aPacket);
  _selectionMask:= LEConvertUInt8From(9, aPacket);
  _valueMask:= LEConvertUInt8From(10, aPacket);

  if (Assigned(fMonoflopDoneCallback)) then begin
    fMonoflopDoneCallback(self, _port, _selectionMask, _valueMask);
  end;
end;

end.
