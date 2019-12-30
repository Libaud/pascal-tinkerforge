{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletLEDStripV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletLEDStripV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To57OfUInt8 = array [0..57] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt8 = array of byte;

  TBrickletLEDStripV2 = class;
  TBrickletLEDStripV2NotifyFrameStarted = procedure(aSender: TBrickletLEDStripV2; const aLength: word) of object;

  /// <summary>
  ///  Controls up to 2048 RGB(W) LEDs
  /// </summary>
  TBrickletLEDStripV2 = class(TThreadedDevice)
  private
    frameStartedCallback: TBrickletLEDStripV2NotifyFrameStarted;
    procedure CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Sets the RGB(W) values for the LEDs starting from *index*.
    ///  You can set at most 2048 RGB values or 1536 RGBW values.
    ///  
    ///  To make the colors show correctly you need to configure the chip type
    ///  (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChipType"/>) and a channel mapping (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChannelMapping"/>)
    ///  according to the connected LEDs.
    ///  
    ///  If the channel mapping has 3 colors, you need to give the data in the sequence
    ///  RGBRGBRGB... if the channel mapping has 4 colors you need to give data in the
    ///  sequence RGBWRGBWRGBW...
    ///  
    ///  The data is double buffered and the colors will be transfered to the
    ///  LEDs when the next frame duration ends (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetFrameDuration"/>).
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents the number of frames per
    ///    second you want to achieve.
    ///  * Set all of the LED colors for one frame.
    ///  * Wait for the <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.OnFrameStarted"/> callback.
    ///  * Set all of the LED colors for next frame.
    ///  * Wait for the <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.OnFrameStarted"/> callback.
    ///  * And so on.
    ///  
    ///  This approach ensures that you can change the LED colors with a fixed frame rate.
    /// </summary>
    procedure SetLEDValuesLowLevel(const aIndex: word; const aValueLength: word;
                                   const aValueChunkOffset: word; const aValueChunkData: TArray0To57OfUInt8); virtual;

    /// <summary>
    ///  Sets the RGB(W) values for the LEDs starting from *index*.
    ///  You can set at most 2048 RGB values or 1536 RGBW values.
    ///  
    ///  To make the colors show correctly you need to configure the chip type
    ///  (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChipType"/>) and a channel mapping (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChannelMapping"/>)
    ///  according to the connected LEDs.
    ///  
    ///  If the channel mapping has 3 colors, you need to give the data in the sequence
    ///  RGBRGBRGB... if the channel mapping has 4 colors you need to give data in the
    ///  sequence RGBWRGBWRGBW...
    ///  
    ///  The data is double buffered and the colors will be transfered to the
    ///  LEDs when the next frame duration ends (see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetFrameDuration"/>).
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents the number of frames per
    ///    second you want to achieve.
    ///  * Set all of the LED colors for one frame.
    ///  * Wait for the <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.OnFrameStarted"/> callback.
    ///  * Set all of the LED colors for next frame.
    ///  * Wait for the <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.OnFrameStarted"/> callback.
    ///  * And so on.
    ///  
    ///  This approach ensures that you can change the LED colors with a fixed frame rate.
    /// </summary>
    procedure SetLEDValues(const aIndex: word; const aValue: array of byte); virtual;

    /// <summary>
    ///  Returns *length* RGB(W) values starting from the
    ///  given *index*.
    ///  
    ///  If the channel mapping has 3 colors, you will get the data in the sequence
    ///  RGBRGBRGB... if the channel mapping has 4 colors you will get the data in the
    ///  sequence RGBWRGBWRGBW...
    ///  (assuming you start at an index divisible by 3 (RGB) or 4 (RGBW)).
    /// </summary>
    procedure GetLEDValuesLowLevel(const aIndex: word; const aLength: word; out aValueLength: word;
                                   out aValueChunkOffset: word; out aValueChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns *length* RGB(W) values starting from the
    ///  given *index*.
    ///  
    ///  If the channel mapping has 3 colors, you will get the data in the sequence
    ///  RGBRGBRGB... if the channel mapping has 4 colors you will get the data in the
    ///  sequence RGBWRGBWRGBW...
    ///  (assuming you start at an index divisible by 3 (RGB) or 4 (RGBW)).
    /// </summary>
    function GetLEDValues(const aIndex: word; const aLength: word): TArrayOfUInt8; virtual;

    /// <summary>
    ///  Sets the frame duration in ms.
    ///  
    ///  Example: If you want to achieve 20 frames per second, you should
    ///  set the frame duration to 50ms (50ms * 20 = 1 second).
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetLEDValues"/>.
    ///  
    ///  Default value: 100ms (10 frames per second).
    /// </summary>
    procedure SetFrameDuration(const aDuration: word); virtual;

    /// <summary>
    ///  Returns the frame duration in ms as set by <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetFrameDuration"/>.
    /// </summary>
    function GetFrameDuration: word; virtual;

    /// <summary>
    ///  Returns the current supply voltage of the LEDs. The voltage is given in mV.
    /// </summary>
    function GetSupplyVoltage: word; virtual;

    /// <summary>
    ///  Sets the frequency of the clock in Hz. The range is 10000Hz (10kHz) up to
    ///  2000000Hz (2MHz).
    ///  
    ///  The Bricklet will choose the nearest achievable frequency, which may
    ///  be off by a few Hz. You can get the exact frequency that is used by
    ///  calling <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.GetClockFrequency"/>.
    ///  
    ///  If you have problems with flickering LEDs, they may be bits flipping. You
    ///  can fix this by either making the connection between the LEDs and the
    ///  Bricklet shorter or by reducing the frequency.
    ///  
    ///  With a decreasing frequency your maximum frames per second will decrease
    ///  too.
    ///  
    ///  The default value is 1.66MHz.
    /// </summary>
    procedure SetClockFrequency(const aFrequency: longword); virtual;

    /// <summary>
    ///  Returns the currently used clock frequency as set by <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetClockFrequency"/>.
    /// </summary>
    function GetClockFrequency: longword; virtual;

    /// <summary>
    ///  Sets the type of the LED driver chip. We currently support the chips
    ///  
    ///  * WS2801,
    ///  * WS2811,
    ///  * WS2812 / SK6812 / NeoPixel RGB,
    ///  * SK6812RGBW / NeoPixel RGBW (Chip Type = WS2812),
    ///  * WS2813 / WS2815 (Chip Type = WS2812)
    ///  * LPD8806 and
    ///  * APA102 / DotStar.
    ///  
    ///  The default value is WS2801 (2801).
    /// </summary>
    procedure SetChipType(const aChip: word); virtual;

    /// <summary>
    ///  Returns the currently used chip type as set by <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChipType"/>.
    /// </summary>
    function GetChipType: word; virtual;

    /// <summary>
    ///  Sets the channel mapping for the connected LEDs.
    ///  
    ///  If the mapping has 4 colors, the function <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetLEDValues"/> expects 4
    ///  values per pixel and if the mapping has 3 colors it expects 3 values per pixel.
    ///  
    ///  The function always expects the order RGB(W). The connected LED driver chips
    ///  might have their 3 or 4 channels in a different order. For example, the WS2801
    ///  chips typically use BGR order, then WS2812 chips typically use GRB order and
    ///  the APA102 chips typically use WBGR order.
    ///  
    ///  The APA102 chips are special. They have three 8-bit channels for RGB
    ///  and an additional 5-bit channel for the overall brightness of the RGB LED
    ///  making them 4-channel chips. Internally the brightness channel is the first
    ///  channel, therefore one of the Wxyz channel mappings should be used. Then
    ///  the W channel controls the brightness.
    ///  
    ///  The default value is BGR (36).
    /// </summary>
    procedure SetChannelMapping(const aMapping: byte); virtual;

    /// <summary>
    ///  Returns the currently used channel mapping as set by <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetChannelMapping"/>.
    /// </summary>
    function GetChannelMapping: byte; virtual;

    /// <summary>
    ///  Enables/disables the <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.OnFrameStarted"/> callback.
    ///  
    ///  By default the callback is enabled.
    /// </summary>
    procedure SetFrameStartedCallbackConfiguration(const aEnable: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by
    ///  <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetFrameStartedCallbackConfiguration"/>.
    /// </summary>
    function GetFrameStartedCallbackConfiguration: boolean; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered directly after a new frame render is started.
    ///  The parameter is the number of LEDs in that frame.
    ///  
    ///  You should send the data for the next frame directly after this callback
    ///  was triggered.
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletLEDStripV2.TBrickletLEDStripV2.SetLEDValues"/>.
    /// </summary>
    property OnFrameStarted: TBrickletLEDStripV2NotifyFrameStarted read frameStartedCallback write frameStartedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletLEDStripV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletLEDStripV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_LED_VALUES_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_LED_VALUES_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_SUPPLY_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_CLOCK_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_CLOCK_FREQUENCY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_CHIP_TYPE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHIP_TYPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_CHANNEL_MAPPING]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHANNEL_MAPPING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_FRAME_STARTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_FRAME_STARTED_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_LED_STRIP_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;
                                           

procedure TBrickletLEDStripV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_LED_STRIP_V2_CALLBACK_FRAME_STARTED]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameStarted;
end;

procedure TBrickletLEDStripV2.SetLEDValuesLowLevel(const aIndex: word; const aValueLength: word; const aValueChunkOffset: word; const aValueChunkData: TArray0To57OfUInt8);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_LED_VALUES_LOW_LEVEL, 72);
  LEConvertUInt16To(aIndex, 8, _request);
  LEConvertUInt16To(aValueLength, 10, _request);
  LEConvertUInt16To(aValueChunkOffset, 12, _request);
  for _i:= 0 to Length(aValueChunkData) - 1 do LEConvertUInt8To(aValueChunkData[_i], 14 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletLEDStripV2.SetLEDValues(const aIndex: word; const aValue: array of byte);
var
  _valueChunkOffset: word;
  _valueChunkData: TArray0To57OfUInt8;
  _valueChunkLength: word;
  _valueLength: word;
begin
  if (Length(aValue) > 65535) then begin
    raise EInvalidParameterException.Create('Value can be at most 65535 items long');
  end;

  _valueLength:= Length(aValue);
  _valueChunkOffset:= 0;

  if (_valueLength = 0) then begin
    FillChar(_valueChunkData[0], SizeOf(byte) * 58, 0);
    SetLEDValuesLowLevel(aIndex, _valueLength, _valueChunkOffset, _valueChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_valueChunkOffset < _valueLength) do begin
        _valueChunkLength:= _valueLength - _valueChunkOffset;
        if (_valueChunkLength > 58) then
           _valueChunkLength:= 58;

        FillChar(_valueChunkData[0], SizeOf(byte) * 58, 0);
        Move(aValue[_valueChunkOffset], _valueChunkData[0], SizeOf(byte) * _valueChunkLength);

        SetLEDValuesLowLevel(aIndex, _valueLength, _valueChunkOffset, _valueChunkData);
        Inc(_valueChunkOffset, 58);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletLEDStripV2.GetLEDValuesLowLevel(const aIndex: word; const aLength: word; out aValueLength: word; out aValueChunkOffset: word; out aValueChunkData: TArray0To59OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_LED_VALUES_LOW_LEVEL, 12);
  LEConvertUInt16To(aIndex, 8, _request);
  LEConvertUInt16To(aLength, 10, _request);
  _response:= SendRequest(_request);
  aValueLength:= LEConvertUInt16From(8, _response);
  aValueChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aValueChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletLEDStripV2.GetLEDValues(const aIndex: word; const aLength: word): TArrayOfUInt8;
var
  _value: TArrayOfUInt8;
  _valueCurrentLength: word;
  _valueLength: word;
  _valueChunkOffset: word;
  _valueChunkData: TArray0To59OfUInt8;
  _valueOutOfSync: boolean;
  _valueChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_value, 0);
  StreamMutex.Acquire;
  try
    _valueLength:= 0;
    GetLEDValuesLowLevel(aIndex, aLength, _valueLength, _valueChunkOffset, _valueChunkData);
    SetLength(_value, _valueLength);
    _valueOutOfSync:= (_valueChunkOffset <> 0);

    if ((not _valueOutOfSync) and (_valueLength > 0)) then begin
      _valueChunkLength:= _valueLength - _valueChunkOffset;
      if (_valueChunkLength > 60) then _valueChunkLength:= 60;
      Move(_valueChunkData, _value[0], SizeOf(byte) * _valueChunkLength);
      _valueCurrentLength:= _valueChunkLength;

      while ((not _valueOutOfSync) and (_valueCurrentLength < _valueLength)) do begin
        GetLEDValuesLowLevel(aIndex, aLength, _valueLength, _valueChunkOffset, _valueChunkData);
        _valueOutOfSync:= _valueChunkOffset <> _valueCurrentLength;
        _valueChunkLength:= _valueLength - _valueChunkOffset;
        if (_valueChunkLength > 60) then _valueChunkLength:= 60;
        Move(_valueChunkData, _value[_valueCurrentLength], SizeOf(byte) * _valueChunkLength);
        Inc(_valueCurrentLength, _valueChunkLength);
      end;
    end;

    if (_valueOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_valueChunkOffset + 60 < _valueLength) do begin
        GetLEDValuesLowLevel(aIndex, aLength, _valueLength, _valueChunkOffset, _valueChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Value stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _value;
end;

procedure TBrickletLEDStripV2.SetFrameDuration(const aDuration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_FRAME_DURATION, 10);
  LEConvertUInt16To(aDuration, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetFrameDuration: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_FRAME_DURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

function TBrickletLEDStripV2.GetSupplyVoltage: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_SUPPLY_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLEDStripV2.SetClockFrequency(const aFrequency: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_CLOCK_FREQUENCY, 12);
  LEConvertUInt32To(aFrequency, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetClockFrequency: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_CLOCK_FREQUENCY, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLEDStripV2.SetChipType(const aChip: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_CHIP_TYPE, 10);
  LEConvertUInt16To(aChip, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetChipType: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHIP_TYPE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletLEDStripV2.SetChannelMapping(const aMapping: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_CHANNEL_MAPPING, 9);
  LEConvertUInt8To(aMapping, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetChannelMapping: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHANNEL_MAPPING, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLEDStripV2.SetFrameStartedCallbackConfiguration(const aEnable: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_FRAME_STARTED_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnable, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetFrameStartedCallbackConfiguration: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_FRAME_STARTED_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletLEDStripV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletLEDStripV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLEDStripV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLEDStripV2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletLEDStripV2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletLEDStripV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletLEDStripV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletLEDStripV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletLEDStripV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletLEDStripV2.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_LED_STRIP_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletLEDStripV2.CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray);
var
  _length: word;
begin
  _length:= LEConvertUInt16From(8, aPacket);

  if (Assigned(frameStartedCallback)) then begin
    frameStartedCallback(self, _length);
  end;
end;

end.
