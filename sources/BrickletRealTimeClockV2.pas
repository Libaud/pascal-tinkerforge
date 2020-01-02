{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRealTimeClockV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRealTimeClockV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletRealTimeClockV2 = class;
  TBrickletRealTimeClockV2NotifyDateTime = procedure(aSender: TBrickletRealTimeClockV2; const aYear: word; const aMonth: byte; const aDay: byte;
                                                     const aHour: byte; const aMinute: byte; const aSecond: byte; const aCentisecond: byte;
                                                     const aWeekday: byte; const aTimestamp: int64) of object;
  TBrickletRealTimeClockV2NotifyAlarm = procedure(aSender: TBrickletRealTimeClockV2; const aYear: word; const aMonth: byte; const aDay: byte;
                                                  const aHour: byte; const aMinute: byte; const aSecond: byte; const aCentisecond: byte;
                                                  const aWeekday: byte; const aTimestamp: int64) of object;

  /// <summary>
  ///  Battery-backed real-time clock
  /// </summary>
  TBrickletRealTimeClockV2 = class(TDevice)
  private
    dateTimeCallback: TBrickletRealTimeClockV2NotifyDateTime;
    alarmCallback: TBrickletRealTimeClockV2NotifyAlarm;
  protected
    procedure CallbackWrapperDateTime(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAlarm(const aPacket: TDynamicByteArray); virtual;
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Sets the current date (including weekday) and the current time with hundredths
    ///  of a second resolution.
    ///  
    ///  Possible value ranges:
    ///  
    ///  * Year: 2000 to 2099
    ///  * Month: 1 to 12 (January to December)
    ///  * Day: 1 to 31
    ///  * Hour: 0 to 23
    ///  * Minute: 0 to 59
    ///  * Second: 0 to 59
    ///  * Centisecond: 0 to 99
    ///  * Weekday: 1 to 7 (Monday to Sunday)
    ///  
    ///  If the backup battery is installed then the real-time clock keeps date and
    ///  time even if the Bricklet is not powered by a Brick.
    ///  
    ///  The real-time clock handles leap year and inserts the 29th of February
    ///  accordingly. But leap seconds, time zones and daylight saving time are not
    ///  handled.
    /// </summary>
    procedure SetDateTime(const aYear: word; const aMonth: byte; const aDay: byte; const aHour: byte; const aMinute: byte;
                          const aSecond: byte; const aCentisecond: byte; const aWeekday: byte); virtual;

    /// <summary>
    ///  Returns the current date (including weekday) and the current time of the
    ///  real-time clock with hundredths of a second resolution.
    ///  
    ///  The timestamp represents the current date and the the current time of the
    ///  real-time clock converted to milliseconds.
    /// </summary>
    procedure GetDateTime(out aYear: word; out aMonth: byte; out aDay: byte; out aHour: byte; out aMinute: byte; out aSecond: byte;
                          out aCentisecond: byte; out aWeekday: byte; out aTimestamp: int64); virtual;

    /// <summary>
    ///  Returns the current date and the time of the real-time clock converted to
    ///  milliseconds. The timestamp has an effective resolution of hundredths of a
    ///  second.
    /// </summary>
    function GetTimestamp: int64; virtual;

    /// <summary>
    ///  Sets the offset the real-time clock should compensate for in 2.17 ppm steps
    ///  between -277.76 ppm (-128) and +275.59 ppm (127).
    ///  
    ///  The real-time clock time can deviate from the actual time due to the frequency
    ///  deviation of its 32.768 kHz crystal. Even without compensation (factory
    ///  default) the resulting time deviation should be at most ±20 ppm (±52.6
    ///  seconds per month).
    ///  
    ///  This deviation can be calculated by comparing the same duration measured by the
    ///  real-time clock (``rtc_duration``) an accurate reference clock
    ///  (``ref_duration``).
    ///  
    ///  For best results the configured offset should be set to 0 ppm first and then a
    ///  duration of at least 6 hours should be measured.
    ///  
    ///  The new offset (``new_offset``) can be calculated from the currently configured
    ///  offset (``current_offset``) and the measured durations as follow::
    ///  
    ///    new_offset = current_offset - round(1000000 * (rtc_duration - ref_duration) / rtc_duration / 2.17)
    ///  
    ///  If you want to calculate the offset, then we recommend using the calibration
    ///  dialog in Brick Viewer, instead of doing it manually.
    ///  
    ///  The offset is saved in the EEPROM of the Bricklet and only needs to be
    ///  configured once.
    /// </summary>
    procedure SetOffset(const aOffset: shortint); virtual;

    /// <summary>
    ///  Returns the offset as set by <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetOffset"/>.
    /// </summary>
    function GetOffset: shortint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.OnDateTime"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetDateTimeCallbackConfiguration(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetDateTimeCallbackConfiguration"/>.
    /// </summary>
    function GetDateTimeCallbackConfiguration: longword; virtual;

    /// <summary>
    ///  Configures a repeatable alarm. The <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.OnAlarm"/> callback is triggered if the
    ///  current date and time matches the configured alarm.
    ///  
    ///  Setting a parameter to -1 means that it should be disabled and doesn't take part
    ///  in the match. Setting all parameters to -1 disables the alarm completely.
    ///  
    ///  For example, to make the alarm trigger every day at 7:30 AM it can be
    ///  configured as (-1, -1, 7, 30, -1, -1, -1). The hour is set to match 7 and the
    ///  minute is set to match 30. The alarm is triggered if all enabled parameters
    ///  match.
    ///  
    ///  The interval has a special role. It allows to make the alarm reconfigure itself.
    ///  This is useful if you need a repeated alarm that cannot be expressed by matching
    ///  the current date and time. For example, to make the alarm trigger every 23
    ///  seconds it can be configured as (-1, -1, -1, -1, -1, -1, 23). Internally the
    ///  Bricklet will take the current date and time, add 23 seconds to it and set the
    ///  Result as its alarm. The first alarm will be triggered 23 seconds after the
    ///  call. Because the interval is not -1, the Bricklet will do the same again
    ///  internally, take the current date and time, add 23 seconds to it and set that
    ///  as its alarm. This results in a repeated alarm that triggers every 23 seconds.
    ///  
    ///  The interval can also be used in combination with the other parameters. For
    ///  example, configuring the alarm as (-1, -1, 7, 30, -1, -1, 300) results in an
    ///  alarm that triggers every day at 7:30 AM and is then repeated every 5 minutes.
    /// </summary>
    procedure SetAlarm(const aMonth: shortint; const aDay: shortint; const aHour: shortint; const aMinute: shortint;
                       const aSecond: shortint; const aWeekday: shortint; const aInterval: longint); virtual;

    /// <summary>
    ///  Returns the alarm configuration as set by <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetAlarm"/>.
    /// </summary>
    procedure GetAlarm(out aMonth: shortint; out aDay: shortint; out aHour: shortint; out aMinute: shortint;
                       out aSecond: shortint; out aWeekday: shortint; out aInterval: longint); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetDateTimeCallbackConfiguration"/>. The parameters are the
    ///  same as for <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.GetDateTime"/>.
    /// </summary>
    property OnDateTime: TBrickletRealTimeClockV2NotifyDateTime read dateTimeCallback write dateTimeCallback;

    /// <summary>
    ///  This callback is triggered every time the current date and time matches the
    ///  configured alarm (see <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.SetAlarm"/>). The parameters are the same
    ///  as for <see cref="BrickletRealTimeClockV2.TBrickletRealTimeClockV2.GetDateTime"/>.
    /// </summary>
    property OnAlarm: TBrickletRealTimeClockV2NotifyAlarm read alarmCallback write alarmCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletRealTimeClockV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRealTimeClockV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_TIMESTAMP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_OFFSET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_OFFSET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_DATE_TIME_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_DATE_TIME_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_ALARM]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_ALARM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRealTimeClockV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_REAL_TIME_CLOCK_V2_CALLBACK_DATE_TIME]:= {$ifdef FPC}@{$endif}CallbackWrapperDateTime;
  aCallBacks[BRICKLET_REAL_TIME_CLOCK_V2_CALLBACK_ALARM]:= {$ifdef FPC}@{$endif}CallbackWrapperAlarm;
end;

procedure TBrickletRealTimeClockV2.SetDateTime(const aYear: word; const aMonth: byte; const aDay: byte; const aHour: byte; const aMinute: byte; const aSecond: byte; const aCentisecond: byte; const aWeekday: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_DATE_TIME, 17);
  LEConvertUInt16To(aYear, 8, _request);
  LEConvertUInt8To(aMonth, 10, _request);
  LEConvertUInt8To(aDay, 11, _request);
  LEConvertUInt8To(aHour, 12, _request);
  LEConvertUInt8To(aMinute, 13, _request);
  LEConvertUInt8To(aSecond, 14, _request);
  LEConvertUInt8To(aCentisecond, 15, _request);
  LEConvertUInt8To(aWeekday, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletRealTimeClockV2.GetDateTime(out aYear: word; out aMonth: byte; out aDay: byte; out aHour: byte; out aMinute: byte; out aSecond: byte; out aCentisecond: byte; out aWeekday: byte; out aTimestamp: int64);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_DATE_TIME, 8);
  _response:= SendRequest(_request);
  aYear:= LEConvertUInt16From(8, _response);
  aMonth:= LEConvertUInt8From(10, _response);
  aDay:= LEConvertUInt8From(11, _response);
  aHour:= LEConvertUInt8From(12, _response);
  aMinute:= LEConvertUInt8From(13, _response);
  aSecond:= LEConvertUInt8From(14, _response);
  aCentisecond:= LEConvertUInt8From(15, _response);
  aWeekday:= LEConvertUInt8From(16, _response);
  aTimestamp:= LEConvertInt64From(17, _response);
end;

function TBrickletRealTimeClockV2.GetTimestamp: int64;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_TIMESTAMP, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt64From(8, _response);
end;

procedure TBrickletRealTimeClockV2.SetOffset(const aOffset: shortint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_OFFSET, 9);
  LEConvertInt8To(aOffset, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClockV2.GetOffset: shortint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_OFFSET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickletRealTimeClockV2.SetDateTimeCallbackConfiguration(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_DATE_TIME_CALLBACK_CONFIGURATION, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClockV2.GetDateTimeCallbackConfiguration: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_DATE_TIME_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRealTimeClockV2.SetAlarm(const aMonth: shortint; const aDay: shortint; const aHour: shortint; const aMinute: shortint; const aSecond: shortint; const aWeekday: shortint; const aInterval: longint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_ALARM, 18);
  LEConvertInt8To(aMonth, 8, _request);
  LEConvertInt8To(aDay, 9, _request);
  LEConvertInt8To(aHour, 10, _request);
  LEConvertInt8To(aMinute, 11, _request);
  LEConvertInt8To(aSecond, 12, _request);
  LEConvertInt8To(aWeekday, 13, _request);
  LEConvertInt32To(aInterval, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletRealTimeClockV2.GetAlarm(out aMonth: shortint; out aDay: shortint; out aHour: shortint; out aMinute: shortint; out aSecond: shortint; out aWeekday: shortint; out aInterval: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_ALARM, 8);
  _response:= SendRequest(_request);
  aMonth:= LEConvertInt8From(8, _response);
  aDay:= LEConvertInt8From(9, _response);
  aHour:= LEConvertInt8From(10, _response);
  aMinute:= LEConvertInt8From(11, _response);
  aSecond:= LEConvertInt8From(12, _response);
  aWeekday:= LEConvertInt8From(13, _response);
  aInterval:= LEConvertInt32From(14, _response);
end;

procedure TBrickletRealTimeClockV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletRealTimeClockV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRealTimeClockV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRealTimeClockV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClockV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRealTimeClockV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClockV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRealTimeClockV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletRealTimeClockV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletRealTimeClockV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClockV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRealTimeClockV2.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRealTimeClockV2.CallbackWrapperDateTime(const aPacket: TDynamicByteArray);
var
  _year: word;
  _month: byte;
  _day: byte;
  _hour: byte;
  _minute: byte;
  _second: byte;
  _centisecond: byte;
  _weekday: byte;
  _timestamp: int64;
begin
  _year:= LEConvertUInt16From(8, aPacket);
  _month:= LEConvertUInt8From(10, aPacket);
  _day:= LEConvertUInt8From(11, aPacket);
  _hour:= LEConvertUInt8From(12, aPacket);
  _minute:= LEConvertUInt8From(13, aPacket);
  _second:= LEConvertUInt8From(14, aPacket);
  _centisecond:= LEConvertUInt8From(15, aPacket);
  _weekday:= LEConvertUInt8From(16, aPacket);
  _timestamp:= LEConvertInt64From(17, aPacket);

  if (Assigned(dateTimeCallback)) then begin
    dateTimeCallback(self, _year, _month, _day, _hour, _minute, _second, _centisecond, _weekday, _timestamp);
  end;
end;

procedure TBrickletRealTimeClockV2.CallbackWrapperAlarm(const aPacket: TDynamicByteArray);
var
  _year: word;
  _month: byte;
  _day: byte;
  _hour: byte;
  _minute: byte;
  _second: byte;
  _centisecond: byte;
  _weekday: byte;
  _timestamp: int64;
begin
  _year:= LEConvertUInt16From(8, aPacket);
  _month:= LEConvertUInt8From(10, aPacket);
  _day:= LEConvertUInt8From(11, aPacket);
  _hour:= LEConvertUInt8From(12, aPacket);
  _minute:= LEConvertUInt8From(13, aPacket);
  _second:= LEConvertUInt8From(14, aPacket);
  _centisecond:= LEConvertUInt8From(15, aPacket);
  _weekday:= LEConvertUInt8From(16, aPacket);
  _timestamp:= LEConvertInt64From(17, aPacket);

  if (Assigned(alarmCallback)) then begin
    alarmCallback(self, _year, _month, _day, _hour, _minute, _second, _centisecond, _weekday, _timestamp);
  end;
end;

end.
