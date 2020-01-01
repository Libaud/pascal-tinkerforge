{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIndustrialDigitalIn4;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIndustrialDigitalIn4.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfChar = array [0..3] of char;

  TBrickletIndustrialDigitalIn4 = class;
  TBrickletIndustrialDigitalIn4NotifyInterrupt = procedure(aSender: TBrickletIndustrialDigitalIn4; const aInterruptMask: word; const aValueMask: word) of object;

  /// <summary>
  ///  4 galvanically isolated digital inputs
  /// </summary>
  TBrickletIndustrialDigitalIn4 = class(TDevice)
  private
    fInterruptCallback: TBrickletIndustrialDigitalIn4NotifyInterrupt;
    procedure CallbackWrapperInterrupt(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the input value with a bitmask. The bitmask is 16bit long, *true*
    ///  refers to high and *false* refers to low.
    ///  
    ///  For example: The value 3 or 0b0011 means that pins 0-1 are high and the other
    ///  pins are low.
    ///  
    ///  If no groups are used (see <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>), the pins correspond to the
    ///  markings on the IndustrialDigital In 4 Bricklet.
    ///  
    ///  If groups are used, the pins correspond to the element in the group.
    ///  Element 1 in the group will get pins 0-3, element 2 pins 4-7, element 3
    ///  pins 8-11 and element 4 pins 12-15.
    /// </summary>
    function GetValue: word; virtual;

    /// <summary>
    ///  Sets a group of Digital In 4 Bricklets that should work together. You can
    ///  find Bricklets that can be grouped together with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.GetAvailableForGroup"/>.
    ///  
    ///  The group consists of 4 elements. Element 1 in the group will get pins 0-3,
    ///  element 2 pins 4-7, element 3 pins 8-11 and element 4 pins 12-15.
    ///  
    ///  Each element can either be one of the ports ('a' to 'd') or 'n' if it should
    ///  not be used.
    ///  
    ///  For example: If you have two Digital In 4 Bricklets connected to port A and
    ///  port B respectively, you could call with ``['a', 'b', 'n', 'n']``.
    ///  
    ///  Now the pins on the Digital In 4 on port A are assigned to 0-3 and the
    ///  pins on the Digital In 4 on port B are assigned to 4-7. It is now possible
    ///  to call <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.GetValue"/> and read out two Bricklets at the same time.
    ///  
    ///  Changing the group configuration resets all edge counter configurations
    ///  and values.
    /// </summary>
    procedure SetGroup(const aGroup: array of char); virtual;

    /// <summary>
    ///  Returns the group as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>
    /// </summary>
    function GetGroup: TArray0To3OfChar; virtual;

    /// <summary>
    ///  Returns a bitmask of ports that are available for grouping. For example the
    ///  value 5 or 0b0101 means: Port A and port C are connected to Bricklets that
    ///  can be grouped together.
    /// </summary>
    function GetAvailableForGroup: byte; virtual;

    /// <summary>
    ///  Sets the debounce period of the <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.OnInterrupt"/> callback.
    ///  
    ///  For example: If you set this value to 100, you will get the interrupt
    ///  maximal every 100ms. This is necessary if something that bounces is
    ///  connected to the Digital In 4 Bricklet, such as a button.
    /// </summary>
    procedure SetDebouncePeriod(const aDebounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the pins on which an interrupt is activated with a bitmask.
    ///  Interrupts are triggered on changes of the voltage level of the pin,
    ///  i.e. changes from high to low and low to high.
    ///  
    ///  For example: An interrupt bitmask of 9 or 0b1001 will enable the interrupt for
    ///  pins 0 and 3.
    ///  
    ///  The interrupts use the grouping as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>.
    ///  
    ///  The interrupt is delivered with the <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.OnInterrupt"/> callback.
    /// </summary>
    procedure SetInterrupt(const aInterruptMask: word); virtual;

    /// <summary>
    ///  Returns the interrupt bitmask as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetInterrupt"/>.
    /// </summary>
    function GetInterrupt: word; virtual;

    /// <summary>
    ///  Returns the current value of the edge counter for the selected pin. You can
    ///  configure the edges that are counted with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    ///  
    ///  The edge counters use the grouping as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetEdgeCount(const aPin: byte; const aResetCounter: boolean): longword; virtual;

    /// <summary>
    ///  Configures the edge counter for the selected pins. A bitmask of 9 or 0b1001 will
    ///  enable the edge counter for pins 0 and 3.
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
    ///  The edge counters use the grouping as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetEdgeCountConfig(const aSelectionMask: word; const aEdgeType: byte; const aDebounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time for the selected pin as set by
    ///  <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetEdgeCountConfig"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
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
    ///  on pins where the interrupt was activated with <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetInterrupt"/>.
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
    ///  
    ///  The interrupts use the grouping as set by <see cref="BrickletIndustrialDigitalIn4.TBrickletIndustrialDigitalIn4.SetGroup"/>.
    /// </summary>
    property OnInterrupt: TBrickletIndustrialDigitalIn4NotifyInterrupt read fInterruptCallback write fInterruptCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIndustrialDigitalIn4.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletIndustrialDigitalIn4.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_GROUP]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_GROUP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_AVAILABLE_FOR_GROUP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_DEBOUNCE_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIndustrialDigitalIn4.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_INDUSTRIAL_DIGITAL_IN_4_CALLBACK_INTERRUPT]:= {$ifdef FPC}@{$endif}CallbackWrapperInterrupt;
end;

function TBrickletIndustrialDigitalIn4.GetValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4.SetGroup(const aGroup: array of char);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_GROUP, 12);
  if (Length(aGroup) <> 4) then raise EInvalidParameterException.Create('Group has to be exactly 4 items long');
  for _i:= 0 to Length(aGroup) - 1 do LEConvertCharTo(aGroup[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4.GetGroup: TArray0To3OfChar;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_GROUP, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do Result[_i]:= LEConvertCharFrom(8 + (_i * 1), _response);
end;

function TBrickletIndustrialDigitalIn4.GetAvailableForGroup: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_AVAILABLE_FOR_GROUP, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4.SetDebouncePeriod(const aDebounce: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(aDebounce, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4.GetDebouncePeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4.SetInterrupt(const aInterruptMask: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_INTERRUPT, 10);
  LEConvertUInt16To(aInterruptMask, 8, _request);
  SendRequest(_request);
end;

function TBrickletIndustrialDigitalIn4.GetInterrupt: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_INTERRUPT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletIndustrialDigitalIn4.GetEdgeCount(const aPin: byte; const aResetCounter: boolean): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT, 10);
  LEConvertUInt8To(aPin, 8, _request);
  LEConvertBooleanTo(aResetCounter, 9, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIndustrialDigitalIn4.SetEdgeCountConfig(const aSelectionMask: word; const aEdgeType: byte; const aDebounce: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_SET_EDGE_COUNT_CONFIG, 12);
  LEConvertUInt16To(aSelectionMask, 8, _request);
  LEConvertUInt8To(aEdgeType, 10, _request);
  LEConvertUInt8To(aDebounce, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletIndustrialDigitalIn4.GetEdgeCountConfig(const aPin: byte; out aEdgeType: byte; out aDebounce: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_EDGE_COUNT_CONFIG, 9);
  LEConvertUInt8To(aPin, 8, _request);
  _response:= SendRequest(_request);
  aEdgeType:= LEConvertUInt8From(8, _response);
  aDebounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletIndustrialDigitalIn4.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DIGITAL_IN_4_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIndustrialDigitalIn4.CallbackWrapperInterrupt(const aPacket: TDynamicByteArray);
var
  _interruptMask: word;
  _valueMask: word;
begin
  _interruptMask:= LEConvertUInt16From(8, aPacket);
  _valueMask:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fInterruptCallback)) then begin
    fInterruptCallback(self, _interruptMask, _valueMask);
  end;
end;

end.
