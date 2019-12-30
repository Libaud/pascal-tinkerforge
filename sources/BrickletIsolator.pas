{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletIsolator;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletIsolator.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletIsolator = class;
  TBrickletIsolatorNotifyStatistics = procedure(sender: TBrickletIsolator; const messagesFromBrick: longword; const messagesFromBricklet: longword; const connectedBrickletDeviceIdentifier: word; const connectedBrickletUID: string) of object;

  /// <summary>
  ///  Galvanically isolates any Bricklet from any Brick
  /// </summary>
  TBrickletIsolator = class(TDevice)
  private
    statisticsCallback: TBrickletIsolatorNotifyStatistics;
    procedure CallbackWrapperStatistics(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  Returns statistics for the Isolator Bricklet.
    /// </summary>
    procedure GetStatistics(out messagesFromBrick: longword; out messagesFromBricklet: longword; out connectedBrickletDeviceIdentifier: word; out connectedBrickletUID: string); virtual;

    /// <summary>
    ///  The SPITF protocol can be used with a dynamic baudrate. If the dynamic baudrate is
    ///  enabled, the Isolator Bricklet will try to adapt the baudrate for the communication
    ///  between Bricks and Bricklets according to the amount of data that is transferred.
    ///  
    ///  The baudrate for communication config between
    ///  Brick and Isolator Bricklet can be set through the API of the Brick.
    ///  
    ///  The baudrate will be increased exponentially if lots of data is send/received and
    ///  decreased linearly if little data is send/received.
    ///  
    ///  This lowers the baudrate in applications where little data is transferred (e.g.
    ///  a weather station) and increases the robustness. If there is lots of data to transfer
    ///  (e.g. Thermal Imaging Bricklet) it automatically increases the baudrate as needed.
    ///  
    ///  In cases where some data has to transferred as fast as possible every few seconds
    ///  (e.g. RS485 Bricklet with a high baudrate but small payload) you may want to turn
    ///  the dynamic baudrate off to get the highest possible performance.
    ///  
    ///  The maximum value of the baudrate can be set per port with the function
    ///  <see cref="BrickletIsolator.TBrickletIsolator.SetSPITFPBaudrate"/>. If the dynamic baudrate is disabled, the baudrate
    ///  as set by <see cref="BrickletIsolator.TBrickletIsolator.SetSPITFPBaudrate"/> will be used statically.
    /// </summary>
    procedure SetSPITFPBaudrateConfig(const enableDynamicBaudrate: boolean; const minimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate config, see <see cref="BrickletIsolator.TBrickletIsolator.SetSPITFPBaudrateConfig"/>.
    /// </summary>
    procedure GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword); virtual;

    /// <summary>
    ///  Sets the baudrate for a the communication between Isolator Bricklet
    ///  and the connected Bricklet. The baudrate for communication between
    ///  Brick and Isolator Bricklet can be set through the API of the Brick.
    ///  
    ///  If you want to increase the throughput of Bricklets you can increase
    ///  the baudrate. If you get a high error count because of high
    ///  interference (see <see cref="BrickletIsolator.TBrickletIsolator.GetSPITFPErrorCount"/>) you can decrease the
    ///  baudrate.
    ///                                                    ;           abstract; virtual;
    ///  If the dynamic baudrate feature is enabled, the baudrate set by this
    ///  function corresponds to the maximum baudrate (see <see cref="BrickletIsolator.TBrickletIsolator.SetSPITFPBaudrateConfig"/>).
    ///  
    ///  Regulatory testing is done with the default baudrate. If CE compatibility
    ///  or similar is necessary in you applications we recommend to not change
    ///  the baudrate.
    /// </summary>
    procedure SetSPITFPBaudrate(const baudrate: longword); virtual;

    /// <summary>
    ///  Returns the baudrate, see <see cref="BrickletIsolator.TBrickletIsolator.SetSPITFPBaudrate"/>.
    /// </summary>                                         ;
    function GetSPITFPBaudrate: longword; virtual;

    /// <summary>                                                      abstract; virtual;
    ///  Returns the error count for the communication between Isolator Bricklet and
    ///  the connected Bricklet. Call <see cref="BrickletIsolator.TBrickletIsolator.GetSPITFPErrorCount"/> to get the
    ///  error count between Isolator Bricklet and Brick.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    /// </summary>
    procedure GetIsolatorSPITFPErrorCount(out errorCountACKChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletIsolator.TBrickletIsolator.OnStatistics"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetStatisticsCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletIsolator.TBrickletIsolator.SetStatisticsCallbackConfiguration"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure GetStatisticsCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletIsolator.TBrickletIsolator.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletIsolator.TBrickletIsolator.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to fabstract; virtual;lash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletIsolator.TBrickletIsolator.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletIsolator.TBrickletIsolator.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletIsolator.TBrickletIsolator.SetStatisticsCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletIsolator.TBrickletIsolator.GetStatistics"/>.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    property OnStatistics: TBrickletIsolatorNotifyStatistics read statisticsCallback write statisticsCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletIsolator.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletIsolator.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_STATISTICS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_BAUDRATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_ISOLATOR_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_STATISTICS_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_STATISTICS_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ISOLATOR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletIsolator.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ISOLATOR_CALLBACK_STATISTICS]:= {$ifdef FPC}@{$endif}CallbackWrapperStatistics;
end;

procedure TBrickletIsolator.GetStatistics(out messagesFromBrick: longword; out messagesFromBricklet: longword; out connectedBrickletDeviceIdentifier: word; out connectedBrickletUID: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_STATISTICS, 8);
  _response:= SendRequest(_request);
  messagesFromBrick:= LEConvertUInt32From(8, _response);
  messagesFromBricklet:= LEConvertUInt32From(12, _response);
  connectedBrickletDeviceIdentifier:= LEConvertUInt16From(16, _response);
  connectedBrickletUID:= LEConvertStringFrom(18, 8, _response);
end;

procedure TBrickletIsolator.SetSPITFPBaudrateConfig(const enableDynamicBaudrate: boolean; const minimumDynamicBaudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_SPITFP_BAUDRATE_CONFIG, 13);
  LEConvertBooleanTo(enableDynamicBaudrate, 8, _request);
  LEConvertUInt32To(minimumDynamicBaudrate, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletIsolator.GetSPITFPBaudrateConfig(out enableDynamicBaudrate: boolean; out minimumDynamicBaudrate: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_BAUDRATE_CONFIG, 8);
  _response:= SendRequest(_request);
  enableDynamicBaudrate:= LEConvertBooleanFrom(8, _response);
  minimumDynamicBaudrate:= LEConvertUInt32From(9, _response);
end;

procedure TBrickletIsolator.SetSPITFPBaudrate(const baudrate: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_SPITFP_BAUDRATE, 12);
  LEConvertUInt32To(baudrate, 8, _request);
  SendRequest(_request);
end;

function TBrickletIsolator.GetSPITFPBaudrate: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_BAUDRATE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIsolator.GetIsolatorSPITFPErrorCount(out errorCountACKChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_ISOLATOR_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountACKChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

procedure TBrickletIsolator.SetStatisticsCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_STATISTICS_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletIsolator.GetStatisticsCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_STATISTICS_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletIsolator.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletIsolator.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIsolator.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIsolator.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletIsolator.WriteFirmware(const data: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletIsolator.SetStatusLEDConfig(const config: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletIsolator.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletIsolator.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletIsolator.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletIsolator.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletIsolator.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletIsolator.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ISOLATOR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletIsolator.CallbackWrapperStatistics(const aPacket: TDynamicByteArray);
var
  messagesFromBrick: longword; messagesFromBricklet: longword; connectedBrickletDeviceIdentifier: word; connectedBrickletUID: string;
begin
  messagesFromBrick:= LEConvertUInt32From(8, aPacket);
  messagesFromBricklet:= LEConvertUInt32From(12, aPacket);
  connectedBrickletDeviceIdentifier:= LEConvertUInt16From(16, aPacket);
  connectedBrickletUID:= LEConvertStringFrom(18, 8, aPacket);

  if (Assigned(statisticsCallback)) then begin
    statisticsCallback(self, messagesFromBrick, messagesFromBricklet, connectedBrickletDeviceIdentifier, connectedBrickletUID);
  end;
end;

end.
