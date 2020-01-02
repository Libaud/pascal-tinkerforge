{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletSegmentDisplay4x7;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletSegmentDisplay4x7.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfUInt8 = array [0..3] of byte;

  TBrickletSegmentDisplay4x7 = class;
  TBrickletSegmentDisplay4x7NotifyCounterFinished = procedure(aSender: TBrickletSegmentDisplay4x7) of object;

  /// <summary>
  ///  Four 7-segment displays with switchable colon
  /// </summary>
  TBrickletSegmentDisplay4x7 = class(TDevice)
  private
    fCounterFinishedCallback: TBrickletSegmentDisplay4x7NotifyCounterFinished;
    procedure CallbackWrapperCounterFinished(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  The 7-segment display can be set with bitmaps. Every bit controls one
    ///  segment:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_segment_display_4x7_bit_order.png
    ///     :scale: 100 %
    ///     :alt: Bit order of one segment
    ///     :align: center
    ///  
    ///  For example to set a "5" you would want to activate segments 0, 2, 3, 5 and 6.
    ///  This is represented by the number 0b01101101 = 0x6d = 109.
    ///  
    ///  The brightness can be set between 0 (dark) and 7 (bright). The colon
    ///  parameter turns the colon of the display on or off.
    /// </summary>
    procedure SetSegments(const aSegments: array of byte; const aBrightness: byte; const aColon: boolean); virtual;

    /// <summary>
    ///  Returns the segment, brightness and color data as set by
    ///  <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.SetSegments"/>.
    /// </summary>
    procedure GetSegments(out aSegments: TArray0To3OfUInt8; out aBrightness: byte; out aColon: boolean); virtual;

    /// <summary>
    ///  Starts a counter with the *from* value that counts to the *to*
    ///  value with the each step incremented by *increment*.
    ///  The *length* of the increment is given in ms.
    ///  
    ///  Example: If you set *from* to 0, *to* to 100, *increment* to 1 and
    ///  *length* to 1000, a counter that goes from 0 to 100 with one second
    ///  pause between each increment will be started.
    ///  
    ///  The maximum values for *from*, *to* and *increment* is 9999,
    ///  the minimum value is -999.
    ///  
    ///  Using a negative increment allows to count backwards.
    ///  
    ///  You can stop the counter at every time by calling <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.SetSegments"/>.
    /// </summary>
    procedure StartCounter(const aValueFrom: smallint; const aValueTo: smallint; const aIncrement: smallint;
                           const aLength: longword); virtual;

    /// <summary>
    ///  Returns the counter value that is currently shown on the display.
    ///  
    ///  If there is no counter running a 0 will be returned.
    /// </summary>
    function GetCounterValue: word; virtual;

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
    ///  This callback is triggered when the counter (see <see cref="BrickletSegmentDisplay4x7.TBrickletSegmentDisplay4x7.StartCounter"/>) is
    ///  finished.
    /// </summary>
    property OnCounterFinished: TBrickletSegmentDisplay4x7NotifyCounterFinished read fCounterFinishedCallback write fCounterFinishedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletSegmentDisplay4x7.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletSegmentDisplay4x7.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_SET_SEGMENTS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_SEGMENTS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_START_COUNTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_COUNTER_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletSegmentDisplay4x7.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_SEGMENT_DISPLAY_4X7_CALLBACK_COUNTER_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCounterFinished;
end;

procedure TBrickletSegmentDisplay4x7.SetSegments(const aSegments: array of byte; const aBrightness: byte; const aColon: boolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_SET_SEGMENTS, 14);
  if (Length(aSegments) <> 4) then raise EInvalidParameterException.Create('Segments has to be exactly 4 items long');
  for _i:= 0 to Length(aSegments) - 1 do LEConvertUInt8To(aSegments[_i], 8 + (_i * 1), _request);
  LEConvertUInt8To(aBrightness, 12, _request);
  LEConvertBooleanTo(aColon, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletSegmentDisplay4x7.GetSegments(out aSegments: TArray0To3OfUInt8; out aBrightness: byte; out aColon: boolean);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_SEGMENTS, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do aSegments[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  aBrightness:= LEConvertUInt8From(12, _response);
  aColon:= LEConvertBooleanFrom(13, _response);
end;

procedure TBrickletSegmentDisplay4x7.StartCounter(const aValueFrom: smallint; const aValueTo: smallint; const aIncrement: smallint; const aLength: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_START_COUNTER, 18);
  LEConvertInt16To(aValueFrom, 8, _request);
  LEConvertInt16To(aValueTo, 10, _request);
  LEConvertInt16To(aIncrement, 12, _request);
  LEConvertUInt32To(aLength, 14, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7.GetCounterValue: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_COUNTER_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletSegmentDisplay4x7.CallbackWrapperCounterFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fCounterFinishedCallback)) then begin
    fCounterFinishedCallback(self);
  end;
end;

end.
