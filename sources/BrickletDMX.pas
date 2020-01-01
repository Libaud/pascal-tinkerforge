{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletDMX;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletDMX.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To55OfUInt8 = array [0..55] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt8 = array of byte;

  TFrameHighLevelCallbackState = record data: TArrayOfUInt8; length: word; end;

  TBrickletDMX = class;
  TBrickletDMXNotifyFrameStarted = procedure(aSender: TBrickletDMX) of object;
  TBrickletDMXNotifyFrameAvailable = procedure(aSender: TBrickletDMX; const aFrameNumber: longword) of object;
  TBrickletDMXNotifyFrameLowLevel = procedure(aSender: TBrickletDMX; const aFrameLength: word; const aFrameChunkOffset: word;
                                              const aFrameChunkData: TArray0To55OfUInt8; const aFrameNumber: longword) of object;
  TBrickletDMXNotifyFrame = procedure(aSender: TBrickletDMX; const aFrame: TArrayOfUInt8; const aFrameNumber: longword) of object;
  TBrickletDMXNotifyFrameErrorCount = procedure(aSender: TBrickletDMX; const aOverrunErrorCount: longword; const aFramingErrorCount: longword) of object;

  /// <summary>
  ///  DMX master and slave
  /// </summary>
  TBrickletDMX = class(TThreadedDevice)
  private
    fFrameHighLevelCallbackState: TFrameHighLevelCallbackState;
    fFrameStartedCallback: TBrickletDMXNotifyFrameStarted;
    fFrameAvailableCallback: TBrickletDMXNotifyFrameAvailable;
    fFrameLowLevelCallback: TBrickletDMXNotifyFrameLowLevel;
    fFrameCallback: TBrickletDMXNotifyFrame;
    fFrameErrorCountCallback: TBrickletDMXNotifyFrameErrorCount;
    procedure CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperFrameAvailable(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperFrameLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperFrameErrorCount(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Sets the DMX mode to either master or slave.
    ///  
    ///  Calling this function sets frame number to 0.
    /// </summary>
    procedure SetDMXMode(const aDMXMode: byte); virtual;

    /// <summary>
    ///  Returns the DMX mode, as set by <see cref="BrickletDMX.TBrickletDMX.SetDMXMode"/>.
    /// </summary>
    function GetDMXMode: byte; virtual;

    /// <summary>
    ///  Writes a DMX frame. The maximum frame size is 512 byte. Each byte represents one channel.
    ///  
    ///  The next frame can be written after the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback was called. The frame
    ///  is double buffered, so a new frame can be written as soon as the writing of the prior frame
    ///  starts.
    ///  
    ///  The data will be transfered when the next frame duration ends, see <see cref="BrickletDMX.TBrickletDMX.SetFrameDuration"/>.
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents the number of frames per second you want to achieve.
    ///  * Set channels for first frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback.
    ///  * Set channels for next frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback.
    ///  * and so on.
    ///  
    ///  This approach ensures that you can set new DMX data with a fixed frame rate.
    ///  
    ///  This function can only be called in master mode.
    /// </summary>
    procedure WriteFrameLowLevel(const aFrameLength: word; const aFrameChunkOffset: word; const aFrameChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Writes a DMX frame. The maximum frame size is 512 byte. Each byte represents one channel.
    ///  
    ///  The next frame can be written after the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback was called. The frame
    ///  is double buffered, so a new frame can be written as soon as the writing of the prior frame
    ///  starts.
    ///  
    ///  The data will be transfered when the next frame duration ends, see <see cref="BrickletDMX.TBrickletDMX.SetFrameDuration"/>.
    ///  
    ///  Generic approach:
    ///  
    ///  * Set the frame duration to a value that represents the number of frames per second you want to achieve.
    ///  * Set channels for first frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback.
    ///  * Set channels for next frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback.
    ///  * and so on.
    ///  
    ///  This approach ensures that you can set new DMX data with a fixed frame rate.
    ///  
    ///  This function can only be called in master mode.
    /// </summary>
    procedure WriteFrame(const aFrame: array of byte); virtual;

    /// <summary>
    ///  Returns the last frame that was written by the DMX master. The size of the array
    ///  is equivalent to the number of channels in the frame. Each byte represents one channel.
    ///  
    ///  The next frame is available after the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback was called.
    ///  
    ///  Generic approach:
    ///  
    ///  * Call <see cref="BrickletDMX.TBrickletDMX.ReadFrame"/> to get first frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback.
    ///  * Call <see cref="BrickletDMX.TBrickletDMX.ReadFrame"/> to get second frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback.
    ///  * and so on.
    ///  
    ///  Instead of polling this function you can also use the <see cref="BrickletDMX.TBrickletDMX.OnFrame"/> callback.
    ///  You can enable it with <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    ///  
    ///  The frame number starts at 0 and it is increased by one with each received frame.
    ///  
    ///  This function can only be called in slave mode.
    /// </summary>
    procedure ReadFrameLowLevel(out aFrameLength: word; out aFrameChunkOffset: word; out aFrameChunkData: TArray0To55OfUInt8; out aFrameNumber: longword); virtual;

    /// <summary>
    ///  Returns the last frame that was written by the DMX master. The size of the array
    ///  is equivalent to the number of channels in the frame. Each byte represents one channel.
    ///  
    ///  The next frame is available after the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback was called.
    ///  
    ///  Generic approach:
    ///  
    ///  * Call <see cref="BrickletDMX.TBrickletDMX.ReadFrame"/> to get first frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback.
    ///  * Call <see cref="BrickletDMX.TBrickletDMX.ReadFrame"/> to get second frame.
    ///  * Wait for the <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback.
    ///  * and so on.
    ///  
    ///  Instead of polling this function you can also use the <see cref="BrickletDMX.TBrickletDMX.OnFrame"/> callback.
    ///  You can enable it with <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    ///  
    ///  The frame number starts at 0 and it is increased by one with each received frame.
    ///  
    ///  This function can only be called in slave mode.
    /// </summary>
    procedure ReadFrame(out aFrame: TArrayOfUInt8; out aFrameNumber: longword); virtual;

    /// <summary>
    ///  Sets the duration of a frame.
    ///  
    ///  Example: If you want to achieve 20 frames per second, you should
    ///  set the frame duration to 50ms (50ms * 20 = 1 second).
    ///  
    ///  If you always want to send a frame as fast as possible you can set
    ///  this value to 0.
    ///  
    ///  This setting is only used in master mode.
    /// </summary>
    procedure SetFrameDuration(const aFrameDuration: word); virtual;

    /// <summary>
    ///  Returns the frame duration as set by <see cref="BrickletDMX.TBrickletDMX.SetFrameDuration"/>.
    /// </summary>
    function GetFrameDuration: word; virtual;

    /// <summary>
    ///  Returns the current number of overrun and framing errors.
    /// </summary>
    procedure GetFrameErrorCount(out aOverrunErrorCount: longword; out aFramingErrorCount: longword); virtual;

    /// <summary>
    ///  Sets the communication LED configuration. By default the LED shows
    ///  communication traffic, it flickers once for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetCommunicationLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletDMX.TBrickletDMX.SetCommunicationLEDConfig"/>
    /// </summary>
    function GetCommunicationLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the error LED configuration.
    ///  
    ///  By default the error LED turns on if there is any error (see <see cref="BrickletDMX.TBrickletDMX.OnFrameErrorCount"/>
    ///  callback). If you call this function with the Show-Error option again, the LED
    ///  will turn off until the next error occurs.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetErrorLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletDMX.TBrickletDMX.SetErrorLEDConfig"/>.
    /// </summary>
    function GetErrorLEDConfig: byte; virtual;

    /// <summary>
    ///  Enables/Disables the different callbacks. By default the
    ///  <see cref="BrickletDMX.TBrickletDMX.OnFrameStarted"/> callback and <see cref="BrickletDMX.TBrickletDMX.OnFrameAvailable"/> callback are enabled while
    ///  the <see cref="BrickletDMX.TBrickletDMX.OnFrame"/> callback and <see cref="BrickletDMX.TBrickletDMX.OnFrameErrorCount"/> callback are disabled.
    ///  
    ///  If you want to use the <see cref="BrickletDMX.TBrickletDMX.OnFrame"/> callback you can enable it and disable
    ///  the cb:`Frame Available` callback at the same time. It becomes redundant in
    ///  this case.
    /// </summary>
    procedure SetFrameCallbackConfig(const aFrameStartedCallbackEnabled: boolean; const aframeAvailableCallbackEnabled: boolean;
                                     const aFrameCallbackEnabled: boolean; const aFrameErrorCountCallbackEnabled: boolean); virtual;

    /// <summary>
    ///  Returns the frame callback config as set by <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    /// </summary>
    procedure GetFrameCallbackConfig(out aFrameStartedCallbackEnabled: boolean; out aFrameAvailableCallbackEnabled: boolean;
                                     out aFrameCallbackEnabled: boolean; out aFrameErrorCountCallbackEnabled: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletDMX.TBrickletDMX.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletDMX.TBrickletDMX.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletDMX.TBrickletDMX.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletDMX.TBrickletDMX.SetStatusLEDConfig"/>
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
    ///  This callback is triggered as soon as a new frame write is started.
    ///  You should send the data for the next frame directly after this callback
    ///  was triggered.
    ///  
    ///  For an explanation of the general approach see <see cref="BrickletDMX.TBrickletDMX.WriteFrame"/>.
    ///  
    ///  This callback can be enabled via <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    ///  
    ///  This callback can only be triggered in master mode.
    /// </summary>
    property OnFrameStarted: TBrickletDMXNotifyFrameStarted read fFrameStartedCallback write fFrameStartedCallback;

    /// <summary>
    ///  This callback is triggered in slave mode when a new frame was received from the DMX master
    ///  and it can be read out. You have to read the frame before the master has written
    ///  the next frame, see <see cref="BrickletDMX.TBrickletDMX.ReadFrame"/> for more details.
    ///  
    ///  The parameter is the frame number, it is increased by one with each received frame.
    ///  
    ///  This callback can be enabled via <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    ///  
    ///  This callback can only be triggered in slave mode.
    /// </summary>
    property OnFrameAvailable: TBrickletDMXNotifyFrameAvailable read fFrameAvailableCallback write fFrameAvailableCallback;

    /// <summary>
    ///  <see cref="BrickletDMX.TBrickletDMX.OnFrame"/>
    /// </summary>
    property OnFrameLowLevel: TBrickletDMXNotifyFrameLowLevel read fFrameLowLevelCallback write fFrameLowLevelCallback;

    /// <summary>
    ///  This callback is called as soon as a new frame is available
    ///  (written by the DMX master).
    ///  
    ///  The size of the array is equivalent to the number of channels in
    ///  the frame. Each byte represents one channel.
    ///  
    ///  This callback can be enabled via <see cref="BrickletDMX.TBrickletDMX.SetFrameCallbackConfig"/>.
    ///  
    ///  This callback can only be triggered in slave mode.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for frame.
    ///  </note>
    /// </summary>
    property OnFrame: TBrickletDMXNotifyFrame read fFrameCallback write fFrameCallback;

    /// <summary>
    ///  This callback is called if a new error occurs. It returns
    ///  the current overrun and framing error count.
    /// </summary>
    property OnFrameErrorCount: TBrickletDMXNotifyFrameErrorCount read fFrameErrorCountCallback write fFrameErrorCountCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

constructor TBrickletDMX.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(fFrameHighLevelCallbackState.data, 0);
  fFrameHighLevelCallbackState.data:= nil;
  fFrameHighLevelCallbackState.length:= 0;
end;

procedure TBrickletDMX.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletDMX.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_DMX_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_DMX_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_WRITE_FRAME_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_READ_FRAME_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_FRAME_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_FRAME_CALLBACK_CONFIG]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_FRAME_CALLBACK_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_DMX_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletDMX.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_DMX_CALLBACK_FRAME_STARTED]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameStarted;
  aCallBacks[BRICKLET_DMX_CALLBACK_FRAME_AVAILABLE]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameAvailable;
  aCallBacks[BRICKLET_DMX_CALLBACK_FRAME_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameLowLevel;
  aCallBacks[BRICKLET_DMX_CALLBACK_FRAME_ERROR_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameErrorCount;
end;

procedure TBrickletDMX.SetDMXMode(const aDMXMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_DMX_MODE, 9);
  LEConvertUInt8To(aDMXMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.GetDMXMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_DMX_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDMX.WriteFrameLowLevel(const aFrameLength: word; const aFrameChunkOffset: word; const aFrameChunkData: TArray0To59OfUInt8);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_WRITE_FRAME_LOW_LEVEL, 72);
  LEConvertUInt16To(aFrameLength, 8, _request);
  LEConvertUInt16To(aFrameChunkOffset, 10, _request);
  for _i:= 0 to Length(aFrameChunkData) - 1 do LEConvertUInt8To(aFrameChunkData[_i], 12 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletDMX.WriteFrame(const aFrame: array of byte);
var
  _frameChunkOffset: word;
  _frameChunkData: TArray0To59OfUInt8;
  _frameChunkLength: word;
  _frameLength: word;
begin
  if (Length(aFrame) > 65535) then begin
    raise EInvalidParameterException.Create('Frame can be at most 65535 items long');
  end;

  _frameLength:= Length(aFrame);
  _frameChunkOffset:= 0;

  if (_frameLength = 0) then begin
    FillChar(_frameChunkData[0], SizeOf(byte) * 60, 0);
    WriteFrameLowLevel(_frameLength, _frameChunkOffset, _frameChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_frameChunkOffset < _frameLength) do begin
        _frameChunkLength:= _frameLength - _frameChunkOffset;

        if (_frameChunkLength > 60) then _frameChunkLength:= 60;

        FillChar(_frameChunkData[0], SizeOf(byte) * 60, 0);
        Move(aFrame[_frameChunkOffset], _frameChunkData[0], SizeOf(byte) * _frameChunkLength);

        WriteFrameLowLevel(_frameLength, _frameChunkOffset, _frameChunkData);
        Inc(_frameChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletDMX.ReadFrameLowLevel(out aFrameLength: word; out aFrameChunkOffset: word; out aFrameChunkData: TArray0To55OfUInt8; out aFrameNumber: longword);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_READ_FRAME_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aFrameLength:= LEConvertUInt16From(8, _response);
  aFrameChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 55 do aFrameChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
  aFrameNumber:= LEConvertUInt32From(68, _response);
end;

procedure TBrickletDMX.ReadFrame(out aFrame: TArrayOfUInt8; out aFrameNumber: longword);
var
  _frameCurrentLength: word;
  _frameLength: word;
  _frameChunkOffset: word;
  _frameChunkData: TArray0To55OfUInt8;
  _frameOutOfSync: boolean;
  _frameChunkLength: word;
begin
  StreamMutex.Acquire;
  try
    _frameLength:= 0;
    ReadFrameLowLevel(_frameLength, _frameChunkOffset, _frameChunkData, aFrameNumber);
    SetLength(aFrame, _frameLength);
    _frameOutOfSync:= (_frameChunkOffset <> 0);

    if ((not _frameOutOfSync) and (_frameLength > 0)) then begin
      _frameChunkLength:= _frameLength - _frameChunkOffset;
      if (_frameChunkLength > 56) then _frameChunkLength:= 56;
      Move(_frameChunkData, aFrame[0], SizeOf(byte) * _frameChunkLength);
      _frameCurrentLength:= _frameChunkLength;

      while ((not _frameOutOfSync) and (_frameCurrentLength < _frameLength)) do begin
        ReadFrameLowLevel(_frameLength, _frameChunkOffset, _frameChunkData, aFrameNumber);
        _frameOutOfSync:= _frameChunkOffset <> _frameCurrentLength;
        _frameChunkLength:= _frameLength - _frameChunkOffset;
        if (_frameChunkLength > 56) then _frameChunkLength:= 56;
        Move(_frameChunkData, aFrame[_frameCurrentLength], SizeOf(byte) * _frameChunkLength);
        Inc(_frameCurrentLength, _frameChunkLength);
      end;
    end;

    if (_frameOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_frameChunkOffset + 56 < _frameLength) do begin
        ReadFrameLowLevel(_frameLength, _frameChunkOffset, _frameChunkData, aFrameNumber);
      end;

      raise EStreamOutOfSyncException.Create('Frame stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
end;

procedure TBrickletDMX.SetFrameDuration(const aFrameDuration: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_FRAME_DURATION, 10);
  LEConvertUInt16To(aFrameDuration, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.GetFrameDuration: word;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_FRAME_DURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletDMX.GetFrameErrorCount(out aOverrunErrorCount: longword; out aFramingErrorCount: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_FRAME_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aOverrunErrorCount:= LEConvertUInt32From(8, _response);
  aFramingErrorCount:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletDMX.SetCommunicationLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_COMMUNICATION_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.GetCommunicationLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_COMMUNICATION_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDMX.SetErrorLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_ERROR_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.GetErrorLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_ERROR_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDMX.SetFrameCallbackConfig(const aFrameStartedCallbackEnabled: boolean; const aframeAvailableCallbackEnabled: boolean; const aFrameCallbackEnabled: boolean; const aFrameErrorCountCallbackEnabled: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_FRAME_CALLBACK_CONFIG, 12);
  LEConvertBooleanTo(aFrameStartedCallbackEnabled, 8, _request);
  LEConvertBooleanTo(aframeAvailableCallbackEnabled, 9, _request);
  LEConvertBooleanTo(aFrameCallbackEnabled, 10, _request);
  LEConvertBooleanTo(aFrameErrorCountCallbackEnabled, 11, _request);
  SendRequest(_request);
end;

procedure TBrickletDMX.GetFrameCallbackConfig(out aFrameStartedCallbackEnabled: boolean; out aFrameAvailableCallbackEnabled: boolean; out aFrameCallbackEnabled: boolean; out aFrameErrorCountCallbackEnabled: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_FRAME_CALLBACK_CONFIG, 8);
  _response:= SendRequest(_request);
  aFrameStartedCallbackEnabled:= LEConvertBooleanFrom(8, _response);
  aFrameAvailableCallbackEnabled:= LEConvertBooleanFrom(9, _response);
  aFrameCallbackEnabled:= LEConvertBooleanFrom(10, _response);
  aFrameErrorCountCallbackEnabled:= LEConvertBooleanFrom(11, _response);
end;

procedure TBrickletDMX.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletDMX.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDMX.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDMX.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletDMX.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletDMX.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletDMX.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletDMX.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletDMX.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletDMX.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_DMX_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletDMX.CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fFrameStartedCallback)) then begin
    fFrameStartedCallback(self);
  end;
end;

procedure TBrickletDMX.CallbackWrapperFrameAvailable(const aPacket: TDynamicByteArray);
var
  _frameNumber: longword;
begin
  _frameNumber:= LEConvertUInt32From(8, aPacket);

  if (Assigned(fFrameAvailableCallback)) then begin
    fFrameAvailableCallback(self, _frameNumber);
  end;
end;

procedure TBrickletDMX.CallbackWrapperFrameLowLevel(const aPacket: TDynamicByteArray);
var
  _frameLength: word;
  _frameChunkOffset: word;
  _frameChunkData: TArray0To55OfUInt8;
  _frameNumber: longword;
  _frameChunkLength: word;
  _i: longint;
begin
  _frameLength:= LEConvertUInt16From(8, aPacket);
  _frameChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 55 do _frameChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), aPacket);
  _frameNumber:= LEConvertUInt32From(68, aPacket);

  _frameChunkLength:= _frameLength - _frameChunkOffset;
  if (_frameChunkLength > 56) then begin
    _frameChunkLength:= 56;
  end;
  if (fFrameHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_frameChunkOffset = 0) then begin { Stream starts }
      SetLength(fFrameHighLevelCallbackState.data, _frameLength);
      Move(_frameChunkData[0], fFrameHighLevelCallbackState.data[0], SizeOf(byte) * _frameChunkLength);
      fFrameHighLevelCallbackState.length:= _frameChunkLength;

      if (fFrameHighLevelCallbackState.length >= _frameLength) then begin { Stream complete }
        if (Assigned(fFrameCallback)) then begin
          fFrameCallback(self, fFrameHighLevelCallbackState.data, _frameNumber);
        end;
        SetLength(fFrameHighLevelCallbackState.data, 0);
        fFrameHighLevelCallbackState.data:= nil;
        fFrameHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_frameChunkOffset <> fFrameHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fFrameHighLevelCallbackState.data, 0);
      fFrameHighLevelCallbackState.data:= nil;
      fFrameHighLevelCallbackState.length:= 0;
      if (Assigned(fFrameCallback)) then begin
        fFrameCallback(self, fFrameHighLevelCallbackState.data, _frameNumber);
      end;
    end
    else begin { Stream in-sync }
      Move(_frameChunkData[0], fFrameHighLevelCallbackState.data[fFrameHighLevelCallbackState.length], SizeOf(byte) * _frameChunkLength);
      Inc(fFrameHighLevelCallbackState.length, _frameChunkLength);

      if fFrameHighLevelCallbackState.length >= _frameLength then begin { Stream complete }
        if (Assigned(fFrameCallback)) then begin
          fFrameCallback(self, fFrameHighLevelCallbackState.data, _frameNumber);
        end;
        SetLength(fFrameHighLevelCallbackState.data, 0);
        fFrameHighLevelCallbackState.data:= nil;
        fFrameHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fFrameLowLevelCallback)) then begin
    fFrameLowLevelCallback(self, _frameLength, _frameChunkOffset, _frameChunkData, _frameNumber);
  end;
end;

procedure TBrickletDMX.CallbackWrapperFrameErrorCount(const aPacket: TDynamicByteArray);
var
  _overrunErrorCount: longword;
  _framingErrorCount: longword;
begin
  _overrunErrorCount:= LEConvertUInt32From(8, aPacket);
  _framingErrorCount:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fFrameErrorCountCallback)) then begin
    fFrameErrorCountCallback(self, _overrunErrorCount, _framingErrorCount);
  end;
end;

end.
