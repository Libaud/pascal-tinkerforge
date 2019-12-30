{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRealTimeClock;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletRealTimeClock.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletRealTimeClock = class;
  TBrickletRealTimeClockNotifyDateTime = procedure(aSender: TBrickletRealTimeClock; const year: word; const month: byte; const day: byte; const hour: byte; const minute: byte; const second: byte; const centisecond: byte; const weekday: byte; const timestamp: int64) of object;
  TBrickletRealTimeClockNotifyAlarm = procedure(aSender: TBrickletRealTimeClock; const year: word; const month: byte; const day: byte; const hour: byte; const minute: byte; const second: byte; const centisecond: byte; const weekday: byte; const timestamp: int64) of object;

  /// <summary>
  ///  Battery-backed real-time clock
  /// </summary>
  TBrickletRealTimeClock = class(TDevice)
  private
    fDateTimeCallback: TBrickletRealTimeClockNotifyDateTime;
    fAlarmCallback: TBrickletRealTimeClockNotifyAlarm;
    procedure CallbackWrapperDateTime(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAlarm(const aPacket: TDynamicByteArray); virtual;
  protected
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
    procedure SetDateTime(const year: word; const month: byte; const day: byte; const hour: byte; const minute: byte; const second: byte; const centisecond: byte; const weekday: byte); virtual;

    /// <summary>
    ///  Returns the current date (including weekday) and the current time of the
    ///  real-time clock with hundredths of a second resolution.
    /// </summary>
    procedure GetDateTime(out year: word; out month: byte; out day: byte; out hour: byte; out minute: byte; out second: byte; out centisecond: byte; out weekday: byte); virtual;

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
    procedure SetOffset(const offset: shortint); virtual;

    /// <summary>
    ///  Returns the offset as set by <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.SetOffset"/>.
    /// </summary>
    function GetOffset: shortint; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.OnDateTime"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.OnDateTime"/> Callback is only triggered if the date or time changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetDateTimeCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.SetDateTimeCallbackPeriod"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    function GetDateTimeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Configures a repeatable alarm. The <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.OnAlarm"/> callback is triggered if the
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
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure SetAlarm(const month: shortint; const day: shortint; const hour: shortint; const minute: shortint; const second: shortint; const weekday: shortint; const interval: longint); virtual;

    /// <summary>
    ///  Returns the alarm configuration as set by <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.SetAlarm"/>.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    procedure GetAlarm(out month: shortint; out day: shortint; out hour: shortint; out minute: shortint; out second: shortint; out weekday: shortint; out interval: longint); virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.SetDateTimeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.GetDateTime"/> and <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.GetTimestamp"/> combined.
    ///  
    ///  The <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.OnDateTime"/> callback is only triggered if the date or time changed
    ///  since the last triggering.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    property OnDateTime: TBrickletRealTimeClockNotifyDateTime read fDateTimeCallback write fDateTimeCallback;

    /// <summary>
    ///  This callback is triggered every time the current date and time matches the
    ///  configured alarm (see <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.SetAlarm"/>). The parameters are the same
    ///  as for <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.GetDateTime"/> and <see cref="BrickletRealTimeClock.TBrickletRealTimeClock.GetTimestamp"/> combined.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    property OnAlarm: TBrickletRealTimeClockNotifyAlarm read fAlarmCallback write fAlarmCallback;
  end;

implementation

procedure TBrickletRealTimeClock.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletRealTimeClock.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_TIMESTAMP]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_OFFSET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_OFFSET]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_ALARM]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_ALARM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRealTimeClock.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_REAL_TIME_CLOCK_CALLBACK_DATE_TIME]:= {$ifdef FPC}@{$endif}CallbackWrapperDateTime;
  aCallBacks[BRICKLET_REAL_TIME_CLOCK_CALLBACK_ALARM]:= {$ifdef FPC}@{$endif}CallbackWrapperAlarm;
end;

procedure TBrickletRealTimeClock.SetDateTime(const year: word; const month: byte; const day: byte; const hour: byte; const minute: byte; const second: byte; const centisecond: byte; const weekday: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_DATE_TIME, 17);
  LEConvertUInt16To(year, 8, _request);
  LEConvertUInt8To(month, 10, _request);
  LEConvertUInt8To(day, 11, _request);
  LEConvertUInt8To(hour, 12, _request);
  LEConvertUInt8To(minute, 13, _request);
  LEConvertUInt8To(second, 14, _request);
  LEConvertUInt8To(centisecond, 15, _request);
  LEConvertUInt8To(weekday, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletRealTimeClock.GetDateTime(out year: word; out month: byte; out day: byte; out hour: byte; out minute: byte; out second: byte; out centisecond: byte; out weekday: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_DATE_TIME, 8);
  _response:= SendRequest(_request);
  year:= LEConvertUInt16From(8, _response);
  month:= LEConvertUInt8From(10, _response);
  day:= LEConvertUInt8From(11, _response);
  hour:= LEConvertUInt8From(12, _response);
  minute:= LEConvertUInt8From(13, _response);
  second:= LEConvertUInt8From(14, _response);
  centisecond:= LEConvertUInt8From(15, _response);
  weekday:= LEConvertUInt8From(16, _response);
end;

function TBrickletRealTimeClock.GetTimestamp: int64;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_TIMESTAMP, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt64From(8, _response);
end;

procedure TBrickletRealTimeClock.SetOffset(const offset: shortint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_OFFSET, 9);
  LEConvertInt8To(offset, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClock.GetOffset: shortint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_OFFSET, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt8From(8, _response);
end;

procedure TBrickletRealTimeClock.SetDateTimeCallbackPeriod(const period: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletRealTimeClock.GetDateTimeCallbackPeriod: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRealTimeClock.SetAlarm(const month: shortint; const day: shortint; const hour: shortint; const minute: shortint; const second: shortint; const weekday: shortint; const interval: longint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_SET_ALARM, 18);
  LEConvertInt8To(month, 8, _request);
  LEConvertInt8To(day, 9, _request);
  LEConvertInt8To(hour, 10, _request);
  LEConvertInt8To(minute, 11, _request);
  LEConvertInt8To(second, 12, _request);
  LEConvertInt8To(weekday, 13, _request);
  LEConvertInt32To(interval, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletRealTimeClock.GetAlarm(out month: shortint; out day: shortint; out hour: shortint; out minute: shortint; out second: shortint; out weekday: shortint; out interval: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_ALARM, 8);
  _response:= SendRequest(_request);
  month:= LEConvertInt8From(8, _response);
  day:= LEConvertInt8From(9, _response);
  hour:= LEConvertInt8From(10, _response);
  minute:= LEConvertInt8From(11, _response);
  second:= LEConvertInt8From(12, _response);
  weekday:= LEConvertInt8From(13, _response);
  interval:= LEConvertInt32From(14, _response);
end;

procedure TBrickletRealTimeClock.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_REAL_TIME_CLOCK_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRealTimeClock.CallbackWrapperDateTime(const aPacket: TDynamicByteArray);
var year: word; month: byte; day: byte; hour: byte; minute: byte; second: byte; centisecond: byte; weekday: byte; timestamp: int64;
begin
  year:= LEConvertUInt16From(8, aPacket);
  month:= LEConvertUInt8From(10, aPacket);
  day:= LEConvertUInt8From(11, aPacket);
  hour:= LEConvertUInt8From(12, aPacket);
  minute:= LEConvertUInt8From(13, aPacket);
  second:= LEConvertUInt8From(14, aPacket);
  centisecond:= LEConvertUInt8From(15, aPacket);
  weekday:= LEConvertUInt8From(16, aPacket);
  timestamp:= LEConvertInt64From(17, aPacket);

  if (Assigned(fDateTimeCallback)) then begin
    fDateTimeCallback(self, year, month, day, hour, minute, second, centisecond, weekday, timestamp);
  end;
end;

procedure TBrickletRealTimeClock.CallbackWrapperAlarm(const aPacket: TDynamicByteArray);
var year: word; month: byte; day: byte; hour: byte; minute: byte; second: byte; centisecond: byte; weekday: byte; timestamp: int64;
begin
  year:= LEConvertUInt16From(8, aPacket);
  month:= LEConvertUInt8From(10, aPacket);
  day:= LEConvertUInt8From(11, aPacket);
  hour:= LEConvertUInt8From(12, aPacket);
  minute:= LEConvertUInt8From(13, aPacket);
  second:= LEConvertUInt8From(14, aPacket);
  centisecond:= LEConvertUInt8From(15, aPacket);
  weekday:= LEConvertUInt8From(16, aPacket);
  timestamp:= LEConvertInt64From(17, aPacket);

  if (Assigned(fAlarmCallback)) then begin
    fAlarmCallback(self, year, month, day, hour, minute, second, centisecond, weekday, timestamp);
  end;
end;

end.
