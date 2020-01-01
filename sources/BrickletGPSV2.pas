{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletGPSV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletGPSV2.inc}

type
  TArray0To11OfUInt8 = array [0..11] of byte;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt8 = array of byte;

  TBrickletGPSV2 = class;
  TBrickletGPSV2NotifyPulsePerSecond = procedure(aSender: TBrickletGPSV2) of object;
  TBrickletGPSV2NotifyCoordinates = procedure(aSender: TBrickletGPSV2; const aLatitude: longword; const aNS: char;
                                              const aLongitude: longword; const aEW: char) of object;
  TBrickletGPSV2NotifyStatus = procedure(aSender: TBrickletGPSV2; const aHasFix: boolean; const aSatellitesView: byte) of object;
  TBrickletGPSV2NotifyAltitude = procedure(aSender: TBrickletGPSV2; const aAltitude: longint; const aGeoidalSeparation: longint) of object;
  TBrickletGPSV2NotifyMotion = procedure(aSender: TBrickletGPSV2; const aCourse: longword; const aSpeed: longword) of object;
  TBrickletGPSV2NotifyDateTime = procedure(aSender: TBrickletGPSV2; const aDate: longword; const aTime: longword) of object;

  /// <summary>
  ///  Determine position, velocity and altitude using GPS
  /// </summary>
  TBrickletGPSV2 = class(TThreadedDevice)
  private
    fPulsePerSecondCallback: TBrickletGPSV2NotifyPulsePerSecond;
    fCoordinatesCallback: TBrickletGPSV2NotifyCoordinates;
    fStatusCallback: TBrickletGPSV2NotifyStatus;
    fAltitudeCallback: TBrickletGPSV2NotifyAltitude;
    fMotionCallback: TBrickletGPSV2NotifyMotion;
    fDateTimeCallback: TBrickletGPSV2NotifyDateTime;
    procedure CallbackWrapperPulsePerSecond(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperCoordinates(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperStatus(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAltitude(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMotion(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperDateTime(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the GPS coordinates. Latitude and longitude are given in the
    ///  ``DD.dddddd°`` format, the value 57123468 means 57.123468°.
    ///  The parameter ``ns`` and ``ew`` are the cardinal directions for
    ///  latitude and longitude. Possible values for ``ns`` and ``ew`` are 'N', 'S', 'E'
    ///  and 'W' (north, south, east and west).
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    procedure GetCoordinates(out aLatitude: longword; out aNS: char; out aLongitude: longword; out aEW: char); virtual;

    /// <summary>
    ///  Returns if a fix is currently available as well as the, the number of
    ///  satellites that are in view.
    ///  
    ///  There is also a :ref:`green LED &lt;gps_v2_bricklet_fix_led&gt;` on the Bricklet that
    ///  indicates the fix status.
    /// </summary>
    procedure GetStatus(out aHasFix: boolean; out aSatellitesView: byte); virtual;

    /// <summary>
    ///  Returns the current altitude and corresponding geoidal separation.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    procedure GetAltitude(out aAltitude: longint; out aGeoidalSeparation: longint); virtual;

    /// <summary>
    ///  Returns the current course and speed. A course of 0° means the Bricklet is
    ///  traveling north bound and 90° means it is traveling east bound.
    ///  
    ///  Please note that this only returns useful values if an actual movement
    ///  is present.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    procedure GetMotion(out aCourse: longword; out aSpeed: longword); virtual;

    /// <summary>
    ///  Returns the current date and time. The date is
    ///  given in the format ``ddmmyy`` and the time is given
    ///  in the format ``hhmmss.sss``. For example, 140713 means
    ///  14.07.13 as date and 195923568 means 19:59:23.568 as time.
    /// </summary>
    procedure GetDateTime(out aDate: longword; out aTime: longword); virtual;

    /// <summary>
    ///  Restarts the GPS Bricklet, the following restart types are available:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "0", "Hot start (use all available data in the NV store)"
    ///   "1", "Warm start (don't use ephemeris at restart)"
    ///   "2", "Cold start (don't use time, position, almanacs and ephemeris at restart)"
    ///   "3", "Factory reset (clear all system/user configurations at restart)"
    ///  </code>
    /// </summary>
    procedure Restart(const aRestartType: byte); virtual;

    /// <summary>
    ///  Returns the
    ///  
    ///  * satellite numbers list (up to 12 items)
    ///  * fix value,
    ///  * PDOP value,
    ///  * HDOP value and
    ///  * VDOP value
    ///  
    ///  for a given satellite system. Currently GPS and GLONASS are supported, Galileo
    ///  is not yet supported.
    ///  
    ///  The GPS and GLONASS satellites have unique numbers and the satellite list gives
    ///  the numbers of the satellites that are currently utilized. The number 0 is not
    ///  a valid satellite number and can be ignored in the list.
    /// </summary>
    procedure GetSatelliteSystemStatusLowLevel(const aSatelliteSystem: byte; out aSatelliteNumbersLength: byte; out aSatelliteNumbersData: TArray0To11OfUInt8;
                                               out aFix: byte; out aPDop: word; out aHDop: word; out aVDop: word); virtual;

    /// <summary>
    ///  Returns the
    ///  
    ///  * satellite numbers list (up to 12 items)
    ///  * fix value,
    ///  * PDOP value,
    ///  * HDOP value and
    ///  * VDOP value
    ///  
    ///  for a given satellite system. Currently GPS and GLONASS are supported, Galileo
    ///  is not yet supported.
    ///  
    ///  The GPS and GLONASS satellites have unique numbers and the satellite list gives
    ///  the numbers of the satellites that are currently utilized. The number 0 is not
    ///  a valid satellite number and can be ignored in the list.
    /// </summary>
    procedure GetSatelliteSystemStatus(const aSatelliteSystem: byte; out aSatelliteNumbers: TArrayOfUInt8; out aFix: byte;
                                       out aPDop: word; out aHDop: word; out aVDop: word); virtual;

    /// <summary>
    ///  Returns the current elevation, azimuth and SNR
    ///  for a given satellite and satellite system.
    ///  
    ///  The satellite number here always goes from 1 to 32. For GLONASS it corresponds to
    ///  the satellites 65-96.
    ///  
    ///  Galileo is not yet supported.
    /// </summary>
    procedure GetSatelliteStatus(const aSatelliteSystem: byte; const aSatelliteNumber: byte; out aElevation: smallint;
                                 out aAzimuth: smallint; out aSNR: smallint); virtual;

    /// <summary>
    ///  Sets the fix LED configuration. By default the LED shows if
    ///  the Bricklet got a GPS fix yet. If a fix is established the LED turns on.
    ///  If there is no fix then the LED is turned off.
    ///  
    ///  You can also turn the LED permanently on/off, show a heartbeat or let it blink
    ///  in sync with the PPS (pulse per second) output of the GPS module.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetFixLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetFixLEDConfig"/>
    /// </summary>
    function GetFixLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPSV2.TBrickletGPSV2.OnCoordinates"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnCoordinates"/> callback is only triggered if the coordinates changed
    ///  since the last triggering.
    /// </summary>
    procedure SetCoordinatesCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetCoordinatesCallbackPeriod"/>.
    /// </summary>
    function GetCoordinatesCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPSV2.TBrickletGPSV2.OnStatus"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnStatus"/> callback is only triggered if the status changed since the
    ///  last triggering.
    /// </summary>
    procedure SetStatusCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetStatusCallbackPeriod"/>.
    /// </summary>
    function GetStatusCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPSV2.TBrickletGPSV2.OnAltitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnAltitude"/> callback is only triggered if the altitude changed since the
    ///  last triggering.
    /// </summary>
    procedure SetAltitudeCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitudeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPSV2.TBrickletGPSV2.OnMotion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnMotion"/> callback is only triggered if the motion changed since the
    ///  last triggering.
    /// </summary>
    procedure SetMotionCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetMotionCallbackPeriod"/>.
    /// </summary>
    function GetMotionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPSV2.TBrickletGPSV2.OnDateTime"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnDateTime"/> callback is only triggered if the date or time changed
    ///  since the last triggering.
    /// </summary>
    procedure SetDateTimeCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetDateTimeCallbackPeriod"/>.
    /// </summary>
    function GetDateTimeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  If `SBAS &lt;https://en.wikipedia.org/wiki/GNSS_augmentation#Satellite-based_augmentation_system&gt;`__ is enabled,
    ///  the position accuracy increases (if SBAS satellites are in view),
    ///  but the update rate is limited to 5Hz. With SBAS disabled the update rate is increased to 10Hz.
    ///  
    ///  By default SBAS is enabled and the update rate is 5Hz.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetSBASConfig(const aSBasConfig: byte); virtual;

    /// <summary>
    ///  Returns the SBAS configuration as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetSBASConfig"/>
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    function GetSBASConfig: byte; virtual;

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
    procedure GetSPITFPErrorCount(out aArrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
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
    ///  Returns the current bootloader mode, see <see cref="BrickletGPSV2.TBrickletGPSV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletGPSV2.TBrickletGPSV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletGPSV2.TBrickletGPSV2.SetStatusLEDConfig"/>
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
    ///  This callback is triggered precisely once per second,
    ///  see `PPS &lt;https://en.wikipedia.org/wiki/Pulse-per-second_signal&gt;`__.
    ///  
    ///  The precision of two subsequent pulses will be skewed because
    ///  of the latency in the USB/RS485/Ethernet connection. But in the
    ///  long run this will be very precise. For example a count of
    ///  3600 pulses will take exactly 1 hour.
    /// </summary>
    property OnPulsePerSecond: TBrickletGPSV2NotifyPulsePerSecond read fPulsePerSecondCallback write fPulsePerSecondCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetCoordinatesCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPSV2.TBrickletGPSV2.GetCoordinates"/>.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnCoordinates"/> callback is only triggered if the coordinates changed
    ///  since the last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    property OnCoordinates: TBrickletGPSV2NotifyCoordinates read fCoordinatesCallback write fCoordinatesCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetStatusCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnStatus"/> callback is only triggered if the status changed since the
    ///  last triggering.
    /// </summary>
    property OnStatus: TBrickletGPSV2NotifyStatus read fStatusCallback write fStatusCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetAltitudeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPSV2.TBrickletGPSV2.GetAltitude"/>.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnAltitude"/> callback is only triggered if the altitude changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    property OnAltitude: TBrickletGPSV2NotifyAltitude read fAltitudeCallback write fAltitudeCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetMotionCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPSV2.TBrickletGPSV2.GetMotion"/>.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnMotion"/> callback is only triggered if the motion changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.GetStatus"/>.
    /// </summary>
    property OnMotion: TBrickletGPSV2NotifyMotion read fMotionCallback write fMotionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPSV2.TBrickletGPSV2.SetDateTimeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPSV2.TBrickletGPSV2.GetDateTime"/>.
    ///  
    ///  The <see cref="BrickletGPSV2.TBrickletGPSV2.OnDateTime"/> callback is only triggered if the date or time changed
    ///  since the last triggering.
    /// </summary>
    property OnDateTime: TBrickletGPSV2NotifyDateTime read fDateTimeCallback write fDateTimeCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletGPSV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletGPSV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_COORDINATES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_ALTITUDE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_MOTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_RESTART]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_SATELLITE_SYSTEM_STATUS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_SATELLITE_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_FIX_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_FIX_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_STATUS_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_STATUS_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_MOTION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_MOTION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_SBAS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_SBAS_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletGPSV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_PULSE_PER_SECOND]:= {$ifdef FPC}@{$endif}CallbackWrapperPulsePerSecond;
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_COORDINATES]:= {$ifdef FPC}@{$endif}CallbackWrapperCoordinates;
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_STATUS]:= {$ifdef FPC}@{$endif}CallbackWrapperStatus;
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_ALTITUDE]:= {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_MOTION]:= {$ifdef FPC}@{$endif}CallbackWrapperMotion;
  aCallBacks[BRICKLET_GPS_V2_CALLBACK_DATE_TIME]:= {$ifdef FPC}@{$endif}CallbackWrapperDateTime;
end;

procedure TBrickletGPSV2.GetCoordinates(out aLatitude: longword; out aNS: char; out aLongitude: longword; out aEW: char);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_COORDINATES, 8);
  _response:= SendRequest(_request);
  aLatitude:= LEConvertUInt32From(8, _response);
  aNS:= LEConvertCharFrom(12, _response);
  aLongitude:= LEConvertUInt32From(13, _response);
  aEW:= LEConvertCharFrom(17, _response);
end;

procedure TBrickletGPSV2.GetStatus(out aHasFix: boolean; out aSatellitesView: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_STATUS, 8);
  _response:= SendRequest(_request);
  aHasFix:= LEConvertBooleanFrom(8, _response);
  aSatellitesView:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletGPSV2.GetAltitude(out aAltitude: longint; out aGeoidalSeparation: longint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_ALTITUDE, 8);
  _response:= SendRequest(_request);
  aAltitude:= LEConvertInt32From(8, _response);
  aGeoidalSeparation:= LEConvertInt32From(12, _response);
end;

procedure TBrickletGPSV2.GetMotion(out aCourse: longword; out aSpeed: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_MOTION, 8);
  _response:= SendRequest(_request);
  aCourse:= LEConvertUInt32From(8, _response);
  aSpeed:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletGPSV2.GetDateTime(out aDate: longword; out aTime: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_DATE_TIME, 8);
  _response:= SendRequest(_request);
  aDate:= LEConvertUInt32From(8, _response);
  aTime:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletGPSV2.Restart(const aRestartType: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_RESTART, 9);
  LEConvertUInt8To(aRestartType, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletGPSV2.GetSatelliteSystemStatusLowLevel(const aSatelliteSystem: byte; out aSatelliteNumbersLength: byte; out aSatelliteNumbersData: TArray0To11OfUInt8; out aFix: byte; out aPDop: word; out aHDop: word; out aVDop: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_SATELLITE_SYSTEM_STATUS_LOW_LEVEL, 9);
  LEConvertUInt8To(aSatelliteSystem, 8, _request);
  _response:= SendRequest(_request);
  aSatelliteNumbersLength:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 11 do aSatelliteNumbersData[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  aFix:= LEConvertUInt8From(21, _response);
  aPDop:= LEConvertUInt16From(22, _response);
  aHDop:= LEConvertUInt16From(24, _response);
  aVDop:= LEConvertUInt16From(26, _response);
end;

procedure TBrickletGPSV2.GetSatelliteSystemStatus(const aSatelliteSystem: byte; out aSatelliteNumbers: TArrayOfUInt8; out aFix: byte; out aPDop: word; out aHDop: word; out aVDop: word);
var
  _satelliteNumbersLength: byte;
  _satelliteNumbersData: TArray0To11OfUInt8;
begin
  GetSatelliteSystemStatusLowLevel(aSatelliteSystem, _satelliteNumbersLength, _satelliteNumbersData, aFix, aPDop, aHDop, aVDop);
  SetLength(aSatelliteNumbers, _satelliteNumbersLength);
  Move(_satelliteNumbersData, aSatelliteNumbers[0], SizeOf(byte) * _satelliteNumbersLength);
end;

procedure TBrickletGPSV2.GetSatelliteStatus(const aSatelliteSystem: byte; const aSatelliteNumber: byte; out aElevation: smallint; out aAzimuth: smallint; out aSNR: smallint);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_SATELLITE_STATUS, 10);
  LEConvertUInt8To(aSatelliteSystem, 8, _request);
  LEConvertUInt8To(aSatelliteNumber, 9, _request);
  _response:= SendRequest(_request);
  aElevation:= LEConvertInt16From(8, _response);
  aAzimuth:= LEConvertInt16From(10, _response);
  aSNR:= LEConvertInt16From(12, _response);
end;

procedure TBrickletGPSV2.SetFixLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_FIX_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetFixLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_FIX_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletGPSV2.SetCoordinatesCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetCoordinatesCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.SetStatusCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_STATUS_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetStatusCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_STATUS_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.SetAltitudeCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetAltitudeCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.SetMotionCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_MOTION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetMotionCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_MOTION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.SetDateTimeCallbackPeriod(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetDateTimeCallbackPeriod: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.SetSBASConfig(const aSBasConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_SBAS_CONFIG, 9);
  LEConvertUInt8To(aSBasConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetSBASConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_SBAS_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletGPSV2.GetSPITFPErrorCount(out aArrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aArrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletGPSV2.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletGPSV2.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletGPSV2.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletGPSV2.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletGPSV2.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletGPSV2.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletGPSV2.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPSV2.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPSV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletGPSV2.CallbackWrapperPulsePerSecond(const aPacket: TDynamicByteArray);
begin
  Assert(aPacket <> nil); { Avoid 'Parameter not used' warning }

  if (Assigned(fPulsePerSecondCallback)) then begin
    fPulsePerSecondCallback(self);
  end;
end;

procedure TBrickletGPSV2.CallbackWrapperCoordinates(const aPacket: TDynamicByteArray);
var
  _latitude: longword;
  _ns: char;
  _longitude: longword;
  _EW: char;
begin
  _latitude:= LEConvertUInt32From(8, aPacket);
  _ns:= LEConvertCharFrom(12, aPacket);
  _longitude:= LEConvertUInt32From(13, aPacket);
  _EW:= LEConvertCharFrom(17, aPacket);

  if (Assigned(fCoordinatesCallback)) then begin
    fCoordinatesCallback(self, _latitude, _ns, _longitude, _EW);
  end;
end;

procedure TBrickletGPSV2.CallbackWrapperStatus(const aPacket: TDynamicByteArray);
var
  _hasFix: boolean;
  _satellitesView: byte;
begin
  _hasFix:= LEConvertBooleanFrom(8, aPacket);
  _satellitesView:= LEConvertUInt8From(9, aPacket);

  if (Assigned(fStatusCallback)) then begin
    fStatusCallback(self, _hasFix, _satellitesView);
  end;
end;

procedure TBrickletGPSV2.CallbackWrapperAltitude(const aPacket: TDynamicByteArray);
var
  _altitude: longint;
  _geoidalSeparation: longint;
begin
  _altitude:= LEConvertInt32From(8, aPacket);
  _geoidalSeparation:= LEConvertInt32From(12, aPacket);

  if (Assigned(fAltitudeCallback)) then begin
    fAltitudeCallback(self, _altitude, _geoidalSeparation);
  end;
end;

procedure TBrickletGPSV2.CallbackWrapperMotion(const aPacket: TDynamicByteArray);
var
  _course: longword;
  _speed: longword;
begin
  _course:= LEConvertUInt32From(8, aPacket);
  _speed:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fMotionCallback)) then begin
    fMotionCallback(self, _course, _speed);
  end;
end;

procedure TBrickletGPSV2.CallbackWrapperDateTime(const aPacket: TDynamicByteArray);
var
  _date: longword;
  _time: longword;
begin
  _date:= LEConvertUInt32From(8, aPacket);
  _time:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fDateTimeCallback)) then begin
    fDateTimeCallback(self, _date, _time);
  end;
end;

end.
