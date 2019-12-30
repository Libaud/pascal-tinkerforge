{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRGBLEDMatrix;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRGBLEDMatrix.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletRGBLEDMatrix = class;
  TBrickletRGBLEDMatrixNotifyFrameStarted = procedure(sender: TBrickletRGBLEDMatrix; const frameNumber: longword) of object;

  /// <summary>
  ///  RGB LED Matrix with 8x8 pixel
  /// </summary>
  TBrickletRGBLEDMatrix = class(TDevice)
  private
    frameStartedCallback: TBrickletRGBLEDMatrixNotifyFrameStarted;
    procedure CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the 64 red LED values of the matrix.
    /// </summary>
    procedure SetRed(const red: array of byte); virtual;

    /// <summary>
    ///  Returns the red LED values as set by <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetRed"/>.
    /// </summary>
    function GetRed: TArray0To63OfUInt8; virtual;

    /// <summary>
    ///  Sets the 64 green LED values of the matrix.
    /// </summary>
    procedure SetGreen(const green: array of byte); virtual;

    /// <summary>
    ///  Returns the green LED values as set by <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetGreen"/>.
    /// </summary>
    function GetGreen: TArray0To63OfUInt8; virtual;

    /// <summary>
    ///  Sets the 64 blue LED values of the matrix.
    /// </summary>
    procedure SetBlue(const blue: array of byte);
    ///  can be found :ref:`here &lt;remote_switch_bricklet_type_c_system_and_device_code&gt;`.                                                                                                                                          of byte); virtual;

    /// <summary>
    ///  Returns the blue LED values as set by <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBlue"/>.
    /// </summary>

    function GetBlue: TArray0To63OfUInt8; virtual;

    /// <summary>
    ///  Sets the frame duration in ms.
    ///  
    ///  Example: If you want to achieve 20 frames per second, you should
    ///  set the frame duration to 50ms (50ms * 20 = 1 second).
    ///  
    ///  Set this value to 0 to turn the automatic frame write mechanism off.
    ///  
    ///  Approach:
    ///  
    ///  * Call <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetFrameDuration"/> with value &gt; 0.
    ///  * Set LED values for first frame with <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetRed"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetGreen"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBlue"/>.
    ///  * Wait for <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.OnFrameStarted"/> callback.
    ///  * Set LED values for second frame with <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetRed"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetGreen"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBlue"/>.
    ///  * Wait for <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.OnFrameStarted"/> callback.
    ///  * and so on.
    ///  
    ///  For frame duration of 0 see <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.DrawFrame"/>.
    ///  
    ///  Default value: 0 = off.
    /// </summary>
    procedure SetFrameDuration(const frameDuration: word); virtual;

    /// <summary>
    ///  Returns the frame duration in ms as set by <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetFrameDuration"/>.
    /// </summary>
    function GetFrameDuration: word; virtual;

    /// <summary>
    ///  If you set the frame duration to 0 (see <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetFrameDuration"/>), you can use this
    ///  function to transfer the frame to the matrix.
    ///  
    ///  Approach:
    ///  
    ///  * Call <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetFrameDuration"/> with 0.
    ///  * Set LED values for first frame with <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetRed"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetGreen"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBlue"/>.
    ///  * Call <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.DrawFrame"/>.
    ///  * Wait for <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.OnFrameStarted"/> callback.
    ///  * Set LED values for second frame with <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetRed"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetGreen"/>, <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBlue"/>.
    ///  * Call <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.DrawFrame"/>.
    ///  * Wait for <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.OnFrameStarted"/> callback.
    ///  * and so on.
    /// </summary>
    procedure DrawFrame; virtual;

    /// <summary>
    ///  Returns the current supply voltage of the Bricklet. The voltage is given in mV.
    /// </summary>
    function GetSupplyVoltage: word; virtual;

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
    procedure GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const data: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRGBLEDMatrix.TBrickletRGBLEDMatrix.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered as soon as a new frame write is started.
    ///  The LED values are double buffered, so you can send the LED values
    ///  for the next frame directly after this callback is triggered.
    /// </summary>
    property OnFrameStarted: TBrickletRGBLEDMatrixNotifyFrameStarted read frameStartedCallback write frameStartedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletRGBLEDMatrix.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRGBLEDMatrix.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_RED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_RED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_GREEN]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_GREEN]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_BLUE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_BLUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_FRAME_DURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_DRAW_FRAME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_SUPPLY_VOLTAGE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRGBLEDMatrix.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_RGB_LED_MATRIX_CALLBACK_FRAME_STARTED]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameStarted;
end;

procedure TBrickletRGBLEDMatrix.SetRed(const red: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_RED, 72);
  if (Length(red) <> 64) then raise EInvalidParameterException.Create('Red has to be exactly 64 items long');
  for _i:= 0 to Length(red) - 1 do LEConvertUInt8To(red[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetRed: TArray0To63OfUInt8;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_RED, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 63 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletRGBLEDMatrix.SetGreen(const green: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_GREEN, 72);
  if (Length(green) <> 64) then raise EInvalidParameterException.Create('Green has to be exactly 64 items long');
  for _i:= 0 to Length(green) - 1 do LEConvertUInt8To(green[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetGreen: TArray0To63OfUInt8;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_GREEN, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 63 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletRGBLEDMatrix.SetBlue(const blue: array of byte);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_BLUE, 72);
  if (Length(blue) <> 64) then raise EInvalidParameterException.Create('Blue has to be exactly 64 items long');
  for _i:= 0 to Length(blue) - 1 do LEConvertUInt8To(blue[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetBlue: TArray0To63OfUInt8;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_BLUE, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 63 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletRGBLEDMatrix.SetFrameDuration(const frameDuration: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_FRAME_DURATION, 10);
  LEConvertUInt16To(frameDuration, 8, _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetFrameDuration: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_FRAME_DURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.DrawFrame;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_DRAW_FRAME, 8);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetSupplyVoltage: word;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_SUPPLY_VOLTAGE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletRGBLEDMatrix.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRGBLEDMatrix.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRGBLEDMatrix.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletRGBLEDMatrix.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletRGBLEDMatrix.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRGBLEDMatrix.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RGB_LED_MATRIX_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRGBLEDMatrix.CallbackWrapperFrameStarted(const aPacket: TDynamicByteArray);
var frameNumber: longword;
begin
  frameNumber:= LEConvertUInt32From(8, aPacket);

  if (Assigned(frameStartedCallback)) then begin
    frameStartedCallback(self, frameNumber);
  end;
end;

end.
