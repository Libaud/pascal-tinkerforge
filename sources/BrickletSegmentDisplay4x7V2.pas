{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletSegmentDisplay4x7V2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletSegmentDisplay4x7V2.inc}

type
  TArray0To1OfBoolean = array [0..1] of boolean;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfInt8 = array [0..3] of shortint;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArray0To7OfBoolean = array [0..7] of boolean;

  TBrickletSegmentDisplay4x7V2 = class;
  TBrickletSegmentDisplay4x7V2NotifyCounterFinished = procedure(aSender: TBrickletSegmentDisplay4x7V2) of object;

  /// <summary>
  ///  Four 7-segment displays with switchable dots
  /// </summary>
  TBrickletSegmentDisplay4x7V2 = class(TDevice)
  private
    fCounterFinishedCallback: TBrickletSegmentDisplay4x7V2NotifyCounterFinished;
    procedure CallbackWrapperCounterFinished(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the segments of the Segment Display 4x7 Bricklet 2.0 segment-by-segment.
    ///  
    ///  The data is split into the four digits, two colon dots and the tick mark.
    ///  
    ///  The indices of the segments in the digit and colon parameters are as follows:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_segment_display_4x7_v2_segment_index.png
    ///     :scale: 100 %
    ///     :alt: Indices of segments
    ///     :align: center
    /// </summary>
    procedure SetSegments(const aDigit0: array of boolean; const aDigit1: array of boolean; const aDigit2: array of boolean;
                          const aDigit3: array of boolean; const aColon: array of boolean; const aTick: boolean); virtual;

    /// <summary>
    ///  Returns the segment data as set by <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetSegments"/>.
    /// </summary>
    procedure GetSegments(out aDigit0: TArray0To7OfBoolean; out aDigit1: TArray0To7OfBoolean; out aDigit2: TArray0To7OfBoolean;
                          out aDigit3: TArray0To7OfBoolean; out aColon: TArray0To1OfBoolean; out aTick: boolean); virtual;

    /// <summary>
    ///  The brightness can be set between 0 (dark) and 7 (bright).
    ///  
    ///  The default value is 7.
    /// </summary>
    procedure SetBrightness(const aBrightness: byte); virtual;

    /// <summary>
    ///  Returns the brightness as set by <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetBrightness"/>.
    /// </summary>
    function GetBrightness: byte; virtual;

    /// <summary>
    ///  Sets a numeric value for each of the digits. The values can be between
    ///  -2 and 15. They represent:
    ///  
    ///  * -2: minus sign
    ///  * -1: blank
    ///  * 0-9: 0-9
    ///  * 10: A
    ///  * 11: b
    ///  * 12: C
    ///  * 13: d
    ///  * 14: E
    ///  * 15: F
    ///  
    ///  Example: A call with [-2, -1, 4, 2] will Result in a display of "- 42".
    /// </summary>
    procedure SetNumericValue(const aValue: array of shortint); virtual;

    /// <summary>
    ///  Turns one specified segment on or off.
    ///  
    ///  The indices of the segments are as follows:
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_segment_display_4x7_v2_selected_segment_index.png
    ///     :scale: 100 %
    ///     :alt: Indices of selected segments
    ///     :align: center
    /// </summary>
    procedure SetSelectedSegment(const aSegment: byte; const aValue: boolean); virtual;

    /// <summary>
    ///  Returns the value of a single segment.
    /// </summary>
    function GetSelectedSegment(const aSegment: byte): boolean; virtual;

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
    ///  Using a negative *increment* allows to count backwards.
    ///  
    ///  You can stop the counter at every time by calling <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetSegments"/>
    ///  or <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetNumericValue"/>.
    /// </summary>
    procedure StartCounter(const aValueFrom: smallint; const aValueTo: smallint; const aIncrement: smallint; const aLength: longword); virtual;

    /// <summary>
    ///  Returns the counter value that is currently shown on the display.
    ///  
    ///  If there is no counter running a 0 will be returned.
    /// </summary>
    function GetCounterValue: word; virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.
    /// </summary>
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

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
    ///  This callback is triggered when the counter (see <see cref="BrickletSegmentDisplay4x7V2.TBrickletSegmentDisplay4x7V2.StartCounter"/>) is
    ///  finished.
    /// </summary>
    property OnCounterFinished: TBrickletSegmentDisplay4x7V2NotifyCounterFinished read fCounterFinishedCallback write fCounterFinishedCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

procedure TBrickletSegmentDisplay4x7V2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletSegmentDisplay4x7V2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_SEGMENTS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SEGMENTS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_BRIGHTNESS]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_BRIGHTNESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_NUMERIC_VALUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_SELECTED_SEGMENT]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SELECTED_SEGMENT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_START_COUNTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_COUNTER_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletSegmentDisplay4x7V2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_SEGMENT_DISPLAY_4X7_V2_CALLBACK_COUNTER_FINISHED]:= {$ifdef FPC}@{$endif}CallbackWrapperCounterFinished;
end;

procedure TBrickletSegmentDisplay4x7V2.SetSegments(const aDigit0: array of boolean; const aDigit1: array of boolean; const aDigit2: array of boolean; const aDigit3: array of boolean; const aColon: array of boolean; const aTick: boolean);
var
  _request: TDynamicByteArray;
  _i: longint;
  _digit0Bits: array [0..0] of byte;
  _digit1Bits: array [0..0] of byte;
  _digit2Bits: array [0..0] of byte;
  _digit3Bits: array [0..0] of byte;
  _colonBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_SEGMENTS, 14);
  if (Length(aDigit0) <> 8) then raise EInvalidParameterException.Create('Digit0 has to be exactly 8 items long');
  FillChar(_digit0Bits[0], Length(_digit0Bits) * SizeOf(_digit0Bits[0]), 0);
  for _i:= 0 to 7 do if aDigit0[_i] then _digit0Bits[Floor(_i / 8)]:= _digit0Bits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_digit0Bits[_i], 8 + (_i * 1), _request);
  if (Length(aDigit1) <> 8) then raise EInvalidParameterException.Create('Digit1 has to be exactly 8 items long');
  FillChar(_digit1Bits[0], Length(_digit1Bits) * SizeOf(_digit1Bits[0]), 0);
  for _i:= 0 to 7 do if aDigit1[_i] then _digit1Bits[Floor(_i / 8)]:= _digit1Bits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_digit1Bits[_i], 9 + (_i * 1), _request);
  if (Length(aDigit2) <> 8) then raise EInvalidParameterException.Create('Digit2 has to be exactly 8 items long');
  FillChar(_digit2Bits[0], Length(_digit2Bits) * SizeOf(_digit2Bits[0]), 0);
  for _i:= 0 to 7 do if aDigit2[_i] then _digit2Bits[Floor(_i / 8)]:= _digit2Bits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_digit2Bits[_i], 10 + (_i * 1), _request);
  if (Length(aDigit3) <> 8) then raise EInvalidParameterException.Create('Digit3 has to be exactly 8 items long');
  FillChar(_digit3Bits[0], Length(_digit3Bits) * SizeOf(_digit3Bits[0]), 0);
  for _i:= 0 to 7 do if aDigit3[_i] then _digit3Bits[Floor(_i / 8)]:= _digit3Bits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_digit3Bits[_i], 11 + (_i * 1), _request);
  if (Length(aColon) <> 2) then raise EInvalidParameterException.Create('Colon has to be exactly 2 items long');
  FillChar(_colonBits[0], Length(_colonBits) * SizeOf(_colonBits[0]), 0);
  for _i:= 0 to 1 do if aColon[_i] then _colonBits[Floor(_i / 8)]:= _colonBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 0 do LEConvertUInt8To(_colonBits[_i], 12 + (_i * 1), _request);
  LEConvertBooleanTo(aTick, 13, _request);
  SendRequest(_request);
end;

procedure TBrickletSegmentDisplay4x7V2.GetSegments(out aDigit0: TArray0To7OfBoolean; out aDigit1: TArray0To7OfBoolean; out aDigit2: TArray0To7OfBoolean; out aDigit3: TArray0To7OfBoolean; out aColon: TArray0To1OfBoolean; out aTick: boolean);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  _digit0Bits: array [0..0] of byte;
  _digit1Bits: array [0..0] of byte;
  _digit2Bits: array [0..0] of byte;
  _digit3Bits: array [0..0] of byte;
  _colonBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SEGMENTS, 8);
  _response:= SendRequest(_request);
  FillChar(_digit0Bits[0], Length(_digit0Bits) * SizeOf(_digit0Bits[0]), 0);
  for _i:= 0 to 0 do _digit0Bits[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  for _i:= 0 to 7 do aDigit0[_i]:= ((_digit0Bits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(_digit1Bits[0], Length(_digit1Bits) * SizeOf(_digit1Bits[0]), 0);
  for _i:= 0 to 0 do _digit1Bits[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  for _i:= 0 to 7 do aDigit1[_i]:= ((_digit1Bits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(_digit2Bits[0], Length(_digit2Bits) * SizeOf(_digit2Bits[0]), 0);
  for _i:= 0 to 0 do _digit2Bits[_i]:= LEConvertUInt8From(10 + (_i * 1), _response);
  for _i:= 0 to 7 do aDigit2[_i]:= ((_digit2Bits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(_digit3Bits[0], Length(_digit3Bits) * SizeOf(_digit3Bits[0]), 0);
  for _i:= 0 to 0 do _digit3Bits[_i]:= LEConvertUInt8From(11 + (_i * 1), _response);
  for _i:= 0 to 7 do aDigit3[_i]:= ((_digit3Bits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  FillChar(_colonBits[0], Length(_colonBits) * SizeOf(_colonBits[0]), 0);
  for _i:= 0 to 0 do _colonBits[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  for _i:= 0 to 1 do aColon[_i]:= ((_colonBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  aTick:= LEConvertBooleanFrom(13, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.SetBrightness(const aBrightness: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_BRIGHTNESS, 9);
  LEConvertUInt8To(aBrightness, 8, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.GetBrightness: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_BRIGHTNESS, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.SetNumericValue(const aValue: array of shortint);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_NUMERIC_VALUE, 12);
  if (Length(aValue) <> 4) then raise EInvalidParameterException.Create('Value has to be exactly 4 items long');
  for _i:= 0 to Length(aValue) - 1 do LEConvertInt8To(aValue[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletSegmentDisplay4x7V2.SetSelectedSegment(const aSegment: byte; const aValue: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_SELECTED_SEGMENT, 10);
  LEConvertUInt8To(aSegment, 8, _request);
  LEConvertBooleanTo(aValue, 9, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.GetSelectedSegment(const aSegment: byte): boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SELECTED_SEGMENT, 9);
  LEConvertUInt8To(aSegment, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.StartCounter(const aValueFrom: smallint; const aValueTo: smallint; const aIncrement: smallint; const aLength: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_START_COUNTER, 18);
  LEConvertInt16To(aValueFrom, 8, _request);
  LEConvertInt16To(aValueTo, 10, _request);
  LEConvertInt16To(aIncrement, 12, _request);
  LEConvertUInt32To(aLength, 14, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.GetCounterValue: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_COUNTER_VALUE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletSegmentDisplay4x7V2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletSegmentDisplay4x7V2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletSegmentDisplay4x7V2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletSegmentDisplay4x7V2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletSegmentDisplay4x7V2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SEGMENT_DISPLAY_4X7_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletSegmentDisplay4x7V2.CallbackWrapperCounterFinished(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fCounterFinishedCallback)) then begin
    fCounterFinishedCallback(self);
  end;
end;

end.
