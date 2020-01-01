{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletGPS;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletGPS.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletGPS = class;
  TBrickletGPSNotifyCoordinates = procedure(aSender: TBrickletGPS; const aLatitude: longword; const aNS: char; const aLongitude: longword;
                                            const aEW: char; const aPDop: word; const aHDop: word; const aVDop: word; const aEPE: word) of object;
  TBrickletGPSNotifyStatus = procedure(aSender: TBrickletGPS; const aFix: byte; const aSatellitesView: byte; const aSatellitesUsed: byte) of object;
  TBrickletGPSNotifyAltitude = procedure(aSender: TBrickletGPS; const aAltitude: longint; const aGeoidalSeparation: longint) of object;
  TBrickletGPSNotifyMotion = procedure(aSender: TBrickletGPS; const aCourse: longword; const aSpeed: longword) of object;
  TBrickletGPSNotifyDateTime = procedure(aSender: TBrickletGPS; const aDate: longword; const aTime: longword) of object;

  /// <summary>
  ///  Determine position, velocity and altitude using GPS
  /// </summary>
  TBrickletGPS = class(TDevice)
  private
    fCoordinatesCallback: TBrickletGPSNotifyCoordinates;
    fStatusCallback: TBrickletGPSNotifyStatus;
    fAltitudeCallback: TBrickletGPSNotifyAltitude;
    fMotionCallback: TBrickletGPSNotifyMotion;
    fDateTimeCallback: TBrickletGPSNotifyDateTime;
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
    ///  PDOP, HDOP and VDOP are the dilution of precision (DOP) values. They specify
    ///  the additional multiplicative effect of GPS satellite geometry on GPS
    ///  precision. See
    ///  `here &lt;https://en.wikipedia.org/wiki/Dilution_of_precision_(GPS)&gt;`__
    ///  for more information.
    ///  
    ///  EPE is the "Estimated Position Error". This is not the
    ///  absolute maximum error, it is the error with a specific confidence. See
    ///  `here &lt;https://www.nps.gov/gis/gps/WhatisEPE.html&gt;`__ for more information.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    procedure GetCoordinates(out aLatitude: longword; out aNS: char; out aLongitude: longword; out aEW: char;
                             out aPDop: word; out aHDop: word; out aVDop: word; out aEPE: word); virtual;

    /// <summary>
    ///  Returns the current fix status, the number of satellites that are in view and
    ///  the number of satellites that are currently used.
    ///  
    ///  Possible fix status values can be:
    ///  
    ///  <code>
    ///   "Value", "Description"
    ///  
    ///   "1", "No Fix, <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/>, <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/> and <see cref="BrickletGPS.TBrickletGPS.GetMotion"/> return invalid data"
    ///   "2", "2D Fix, only <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/> and <see cref="BrickletGPS.TBrickletGPS.GetMotion"/> return valid data"
    ///   "3", "3D Fix, <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/>, <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/> and <see cref="BrickletGPS.TBrickletGPS.GetMotion"/> return valid data"
    ///  </code>
    ///  
    ///  There is also a :ref:`blue LED &lt;gps_bricklet_fix_led&gt;` on the Bricklet that
    ///  indicates the fix status.
    /// </summary>
    procedure GetStatus(out AFix: byte; out aSatellitesView: byte; out aSatellitesUsed: byte); virtual;

    /// <summary>
    ///  Returns the current altitude and corresponding geoidal separation.
    ///  
    ///  This data is only valid if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
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
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
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
    ///  Sets the period with which the <see cref="BrickletGPS.TBrickletGPS.OnCoordinates"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnCoordinates"/> callback is only triggered if the coordinates changed
    ///  since the last triggering.
    /// </summary>
    procedure SetCoordinatesCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetCoordinatesCallbackPeriod"/>.
    /// </summary>
    function GetCoordinatesCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPS.TBrickletGPS.OnStatus"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnStatus"/> callback is only triggered if the status changed since the
    ///  last triggering.
    /// </summary>
    procedure SetStatusCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetStatusCallbackPeriod"/>.
    /// </summary>
    function GetStatusCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPS.TBrickletGPS.OnAltitude"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnAltitude"/> callback is only triggered if the altitude changed since
    ///  the last triggering.
    /// </summary>
    procedure SetAltitudeCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetAltitudeCallbackPeriod"/>.
    /// </summary>
    function GetAltitudeCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPS.TBrickletGPS.OnMotion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnMotion"/> callback is only triggered if the motion changed since the
    ///  last triggering.
    /// </summary>
    procedure SetMotionCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetMotionCallbackPeriod"/>.
    /// </summary>
    function GetMotionCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period with which the <see cref="BrickletGPS.TBrickletGPS.OnDateTime"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnDateTime"/> callback is only triggered if the date or time changed
    ///  since the last triggering.
    /// </summary>
    procedure SetDateTimeCallbackPeriod(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletGPS.TBrickletGPS.SetDateTimeCallbackPeriod"/>.
    /// </summary>
    function GetDateTimeCallbackPeriod: longword; virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetCoordinatesCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetCoordinates"/>.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnCoordinates"/> callback is only triggered if the coordinates changed
    ///  since the last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnCoordinates: TBrickletGPSNotifyCoordinates read fCoordinatesCallback write fCoordinatesCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetStatusCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnStatus"/> callback is only triggered if the status changed since the
    ///  last triggering.
    /// </summary>
    property OnStatus: TBrickletGPSNotifyStatus read fStatusCallback write fStatusCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetAltitudeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetAltitude"/>.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnAltitude"/> callback is only triggered if the altitude changed since
    ///  the last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnAltitude: TBrickletGPSNotifyAltitude read fAltitudeCallback write fAltitudeCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetMotionCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetMotion"/>.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnMotion"/> callback is only triggered if the motion changed since the
    ///  last triggering and if there is currently a fix as indicated by
    ///  <see cref="BrickletGPS.TBrickletGPS.GetStatus"/>.
    /// </summary>
    property OnMotion: TBrickletGPSNotifyMotion read fMotionCallback write fMotionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletGPS.TBrickletGPS.SetDateTimeCallbackPeriod"/>. The parameters are the same
    ///  as for <see cref="BrickletGPS.TBrickletGPS.GetDateTime"/>.
    ///  
    ///  The <see cref="BrickletGPS.TBrickletGPS.OnDateTime"/> callback is only triggered if the date or time changed
    ///  since the last triggering.
    /// </summary>
    property OnDateTime: TBrickletGPSNotifyDateTime read fDateTimeCallback write fDateTimeCallback;
  end;

implementation

procedure TBrickletGPS.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 1;
end;

procedure TBrickletGPS.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_COORDINATES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_ALTITUDE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_MOTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_DATE_TIME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_RESTART]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_SET_STATUS_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_STATUS_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_SET_MOTION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_MOTION_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_GPS_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletGPS.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_GPS_CALLBACK_COORDINATES]:= {$ifdef FPC}@{$endif}CallbackWrapperCoordinates;
  aCallBacks[BRICKLET_GPS_CALLBACK_STATUS]:= {$ifdef FPC}@{$endif}CallbackWrapperStatus;
  aCallBacks[BRICKLET_GPS_CALLBACK_ALTITUDE]:= {$ifdef FPC}@{$endif}CallbackWrapperAltitude;
  aCallBacks[BRICKLET_GPS_CALLBACK_MOTION]:= {$ifdef FPC}@{$endif}CallbackWrapperMotion;
  aCallBacks[BRICKLET_GPS_CALLBACK_DATE_TIME]:= {$ifdef FPC}@{$endif}CallbackWrapperDateTime;
end;

procedure TBrickletGPS.GetCoordinates(out aLatitude: longword; out aNS: char; out aLongitude: longword; out aEW: char; out aPDop: word; out aHDop: word; out aVDop: word; out aEPE: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_COORDINATES, 8);
  _response:= SendRequest(_request);
  aLatitude:= LEConvertUInt32From(8, _response);
  aNS:= LEConvertCharFrom(12, _response);
  aLongitude:= LEConvertUInt32From(13, _response);
  aEW:= LEConvertCharFrom(17, _response);
  aPDop:= LEConvertUInt16From(18, _response);
  aHDop:= LEConvertUInt16From(20, _response);
  aVDop:= LEConvertUInt16From(22, _response);
  aEPE:= LEConvertUInt16From(24, _response);
end;

procedure TBrickletGPS.GetStatus(out AFix: byte; out aSatellitesView: byte; out aSatellitesUsed: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_STATUS, 8);
  _response:= SendRequest(_request);
  AFix:= LEConvertUInt8From(8, _response);
  aSatellitesView:= LEConvertUInt8From(9, _response);
  aSatellitesUsed:= LEConvertUInt8From(10, _response);
end;

procedure TBrickletGPS.GetAltitude(out aAltitude: longint; out aGeoidalSeparation: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_ALTITUDE, 8);
  _response:= SendRequest(_request);
  aAltitude:= LEConvertInt32From(8, _response);
  aGeoidalSeparation:= LEConvertInt32From(12, _response);
end;

procedure TBrickletGPS.GetMotion(out aCourse: longword; out aSpeed: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_MOTION, 8);
  _response:= SendRequest(_request);
  aCourse:= LEConvertUInt32From(8, _response);
  aSpeed:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletGPS.GetDateTime(out aDate: longword; out aTime: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_DATE_TIME, 8);
  _response:= SendRequest(_request);
  aDate:= LEConvertUInt32From(8, _response);
  aTime:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletGPS.Restart(const aRestartType: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_RESTART, 9);
  LEConvertUInt8To(aRestartType, 8, _request);
  SendRequest(_request);
end;

procedure TBrickletGPS.SetCoordinatesCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_COORDINATES_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPS.GetCoordinatesCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_COORDINATES_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPS.SetStatusCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_STATUS_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPS.GetStatusCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_STATUS_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPS.SetAltitudeCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_ALTITUDE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPS.GetAltitudeCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_ALTITUDE_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPS.SetMotionCallbackPeriod(const period: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_MOTION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPS.GetMotionCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_MOTION_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPS.SetDateTimeCallbackPeriod(const aPeriod: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_SET_DATE_TIME_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletGPS.GetDateTimeCallbackPeriod: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_DATE_TIME_CALLBACK_PERIOD, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletGPS.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_GPS_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletGPS.CallbackWrapperCoordinates(const aPacket: TDynamicByteArray);
var
  _latitude: longword;
  _ns: char;
  _longitude: longword;
  _ew: char;
  _pdop: word;
  _hdop: word;
  _vdop: word;
  _epe: word;
begin
  _latitude:= LEConvertUInt32From(8, aPacket);
  _ns:= LEConvertCharFrom(12, aPacket);
  _longitude:= LEConvertUInt32From(13, aPacket);
  _ew:= LEConvertCharFrom(17, aPacket);
  _pdop:= LEConvertUInt16From(18, aPacket);
  _hdop:= LEConvertUInt16From(20, aPacket);
  _vdop:= LEConvertUInt16From(22, aPacket);
  _epe:= LEConvertUInt16From(24, aPacket);

  if (Assigned(fCoordinatesCallback)) then begin
    fCoordinatesCallback(self, _latitude, _ns, _longitude, _ew, _pdop, _hdop, _vdop, _epe);
  end;
end;

procedure TBrickletGPS.CallbackWrapperStatus(const aPacket: TDynamicByteArray);
var
  _fix: byte;
  _satellitesView: byte;
  _satellitesUsed: byte;
begin
  _fix:= LEConvertUInt8From(8, aPacket);
  _satellitesView:= LEConvertUInt8From(9, aPacket);
  _satellitesUsed:= LEConvertUInt8From(10, aPacket);

  if (Assigned(fStatusCallback)) then begin
    fStatusCallback(self, _fix, _satellitesView, _satellitesUsed);
  end;
end;

procedure TBrickletGPS.CallbackWrapperAltitude(const aPacket: TDynamicByteArray);
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

procedure TBrickletGPS.CallbackWrapperMotion(const aPacket: TDynamicByteArray);
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

procedure TBrickletGPS.CallbackWrapperDateTime(const aPacket: TDynamicByteArray);
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
