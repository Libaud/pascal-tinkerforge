{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletHallEffect;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletHallEffect.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletHallEffect = class;
  TBrickletHallEffectNotifyEdgeCount = procedure(aSender: TBrickletHallEffect; const aCount: longword; const aValue: boolean) of object;

  /// <summary>
  ///  Detects presence of magnetic field
  /// </summary>
  TBrickletHallEffect = class(TDevice)
  private
    fedgeCountCallback: TBrickletHallEffectNotifyEdgeCount;
    procedure CallbackWrapperEdgeCount(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns *true* if a magnetic field of 35 Gauss (3.5mT) or greater is detected.
    /// </summary>
    function GetValue: boolean; virtual;

    /// <summary>
    ///  Returns the current value of the edge counter. You can configure
    ///  edge type (rising, falling, both) that is counted with
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountConfig"/>.
    ///  
    ///  If you set the reset counter to *true*, the count is set back to 0
    ///  directly after it is read.
    /// </summary>
    function GetEdgeCount(const aResetCounter: boolean): longword; virtual;

    /// <summary>
    ///  The edge type parameter configures if rising edges, falling edges or
    ///  both are counted. Possible edge types are:
    ///  
    ///  * 0 = rising (default)
    ///  * 1 = falling
    ///  * 2 = both
    ///  
    ///  A magnetic field of 35 Gauss (3.5mT) or greater causes a falling edge and a
    ///  magnetic field of 25 Gauss (2.5mT) or smaller causes a rising edge.
    ///  
    ///  If a magnet comes near the Bricklet the signal goes low (falling edge), if
    ///  a magnet is removed from the vicinity the signal goes high (rising edge).
    ///  
    ///  The debounce time is given in ms.
    ///  
    ///  Configuring an edge counter resets its value to 0.
    ///  
    ///  If you don't know what any of this means, just leave it at default. The
    ///  default configuration is very likely OK for you.
    /// </summary>
    procedure SetEdgeCountConfig(const aEdgeType: byte; const aDebounce: byte); virtual;

    /// <summary>
    ///  Returns the edge type and debounce time as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountConfig"/>.
    /// </summary>
    procedure GetEdgeCountConfig(out aEdgeType: byte; out aDebounce: byte); virtual;

    /// <summary>
    ///  Sets the number of edges until an interrupt is invoked.
    ///  
    ///  If *edges* is set to n, an interrupt is invoked for every n-th detected edge.
    ///  
    ///  If *edges* is set to 0, the interrupt is disabled.
    ///  
    ///  Default value is 0.
    /// </summary>
    procedure SetEdgeInterrupt(const aEdges: longword); virtual;

    /// <summary>
    ///  Returns the edges as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeInterrupt"/>.
    /// </summary>
    function GetEdgeInterrupt: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletHallEffect.TBrickletHallEffect.OnEdgeCount"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletHallEffect.TBrickletHallEffect.OnEdgeCount"/> callback is only triggered if the edge count has changed
    ///  since the last triggering.
    /// </summary>
    procedure SetEdgeCountCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountCallbackPeriod"/>.
    /// </summary>
    function GetEdgeCountCallbackPeriod: longword; virtual;

    /// <summary>
    ///  This callback is triggered every n-th count, as configured with
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeInterrupt"/>. The parameters are the
    ///  current count and the current value (see <see cref="BrickletHallEffect.TBrickletHallEffect.GetValue"/> and
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.GetEdgeCount"/>).
    /// </summary>
    procedure EdgeInterrupt(out aCount: longword; out aValue: boolean); virtual;

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
    procedure GetIdentity(out aUID: string; out ConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.SetEdgeCountCallbackPeriod"/>. The parameters are the
    ///  current count and the current value (see <see cref="BrickletHallEffect.TBrickletHallEffect.GetValue"/> and
    ///  <see cref="BrickletHallEffect.TBrickletHallEffect.GetEdgeCount"/>).
    ///  
    ///  The <see cref="BrickletHallEffect.TBrickletHallEffect.OnEdgeCount"/> callback is only triggered if the count or value changed
    ///  since the last triggering.
    /// </summary>
    property OnEdgeCount: TBrickletHallEffectNotifyEdgeCount read fedgeCountCallback write fedgeCountCallback;
  end;

implementation

procedure TBrickletHallEffect.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletHallEffect.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_EDGE_INTERRUPT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_HALL_EFFECT_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletHallEffect.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_HALL_EFFECT_CALLBACK_EDGE_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperEdgeCount;
end;

function TBrickletHallEffect.GetValue: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletHallEffect.GetEdgeCount(const aResetCounter: boolean): longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT, 9);
  LEConvertBooleanTo(aResetCounter, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHallEffect.SetEdgeCountConfig(const aEdgeType: byte; const aDebounce: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CONFIG, 10);
  LEConvertUInt8To(aEdgeType, 8, _request);
  LEConvertUInt8To(aDebounce, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletHallEffect.GetEdgeCountConfig(out aEdgeType: byte; out aDebounce: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CONFIG, 8);
  _response:= SendRequest(_request);
  aEdgeType:= LEConvertUInt8From(8, _response);
  aDebounce:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletHallEffect.SetEdgeInterrupt(const aEdges: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_INTERRUPT, 12);
  LEConvertUInt32To(aEdges, 8, _request);
  SendRequest(_request);
end;

function TBrickletHallEffect.GetEdgeInterrupt: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_INTERRUPT, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHallEffect.SetEdgeCountCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_SET_EDGE_COUNT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletHallEffect.GetEdgeCountCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_EDGE_COUNT_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletHallEffect.EdgeInterrupt(out aCount: longword; out aValue: boolean);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_EDGE_INTERRUPT, 8);
  _response:= SendRequest(_request);
  aCount:= LEConvertUInt32From(8, _response);
  aValue:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletHallEffect.GetIdentity(out aUID: string; out ConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_HALL_EFFECT_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  ConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletHallEffect.CallbackWrapperEdgeCount(const aPacket: TDynamicByteArray);
var
  _count: longword;
  _value: boolean;
begin
  _count:= LEConvertUInt32From(8, aPacket);
  _value:= LEConvertBooleanFrom(12, aPacket);

  if (Assigned(fedgeCountCallback)) then begin
    fedgeCountCallback(self, _count, _value);
  end;
end;

end.
