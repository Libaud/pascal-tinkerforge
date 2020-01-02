{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletOutdoorWeather;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletOutdoorWeather.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt8 = array of byte;

  TBrickletOutdoorWeather = class;
  TBrickletOutdoorWeatherNotifyStationData = procedure(aSender: TBrickletOutdoorWeather; const aIdentifier: byte; const aTemperature: smallint;
                                                       const aHumidity: byte; const aWindSpeed: longword; const aGustSpeed: longword;
                                                       const rain: longword; const windDirection: byte; const batteryLow: boolean) of object;
  TBrickletOutdoorWeatherNotifySensorData = procedure(aSender: TBrickletOutdoorWeather; const identifier: byte; const temperature: smallint; const humidity: byte) of object;

  /// <summary>
  ///  433MHz receiver for outdoor weather station
  /// </summary>
  TBrickletOutdoorWeather = class(TThreadedDevice)
  private
    fStationDataCallback: TBrickletOutdoorWeatherNotifyStationData;
    fSensorDataCallback: TBrickletOutdoorWeatherNotifySensorData;
    procedure CallbackWrapperStationData(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperSensorData(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the identifiers (number between 0 and 255) of all `stations
    ///  &lt;https://www.tinkerforge.com/en/shop/accessories/sensors/outdoor-weather-station-ws-6147.html&gt;`__
    ///  that have been seen since the startup of the Bricklet.
    ///  
    ///  Each station gives itself a random identifier on first startup.
    ///  
    ///  Since firmware version 2.0.2 a station is removed from the list if no data was received for
    ///  12 hours.
    /// </summary>
    procedure GetStationIdentifiersLowLevel(out aIdentifiersLength: word; out aIdentifiersChunkOffset: word; out aIdentifiersChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns the identifiers (number between 0 and 255) of all `stations
    ///  &lt;https://www.tinkerforge.com/en/shop/accessories/sensors/outdoor-weather-station-ws-6147.html&gt;`__
    ///  that have been seen since the startup of the Bricklet.
    ///  
    ///  Each station gives itself a random identifier on first startup.
    ///  
    ///  Since firmware version 2.0.2 a station is removed from the list if no data was received for
    ///  12 hours.
    /// </summary>
    function GetStationIdentifiers: TArrayOfUInt8; virtual;

    /// <summary>
    ///  Returns the identifiers (number between 0 and 255) of all `sensors
    ///  &lt;https://www.tinkerforge.com/en/shop/accessories/sensors/temperature-humidity-sensor-th-6148.html&gt;`__
    ///  that have been seen since the startup of the Bricklet.
    ///  
    ///  Each sensor gives itself a random identifier on first startup.
    ///  
    ///  Since firmware version 2.0.2 a sensor is removed from the list if no data was received for
    ///  12 hours.
    /// </summary>
    procedure GetSensorIdentifiersLowLevel(out aIdentifiersLength: word; out aIdentifiersChunkOffset: word; out aIdentifiersChunkData: TArray0To59OfUInt8); virtual;

    /// <summary>
    ///  Returns the identifiers (number between 0 and 255) of all `sensors
    ///  &lt;https://www.tinkerforge.com/en/shop/accessories/sensors/temperature-humidity-sensor-th-6148.html&gt;`__
    ///  that have been seen since the startup of the Bricklet.
    ///  
    ///  Each sensor gives itself a random identifier on first startup.
    ///  
    ///  Since firmware version 2.0.2 a sensor is removed from the list if no data was received for
    ///  12 hours.
    /// </summary>
    function GetSensorIdentifiers: TArrayOfUInt8; virtual;

    /// <summary>
    ///  Returns the last received data for a station with the given identifier.
    ///  Call <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.GetStationIdentifiers"/> for a list of all available identifiers.
    ///  
    ///  The return values are:
    ///  
    ///  * Temperature,
    ///  * Humidity,
    ///  * Wind Speed,
    ///  * Gust Speed,
    ///  * Rain Fall,
    ///  * Wind Direction,
    ///  * Battery Low (true if battery is low) and
    ///  * Last Change (seconds since the reception of this data).
    /// </summary>
    procedure GetStationData(const aIdentifier: byte; out aTemperature: smallint; out aHumidity: byte; out aWindSpeed: longword;
                             out aGustSpeed: longword; out aRain: longword; out aWindDirection: byte; out aBatteryLow: boolean; out aLastChange: word); virtual;

    /// <summary>
    ///  Returns the last measured data for a sensor with the given identifier.
    ///  Call <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.GetSensorIdentifiers"/> for a list of all available identifiers.
    ///  
    ///  The return values are:
    ///  
    ///  * Temperature,
    ///  * Humidity and
    ///  * Last Change (seconds since the last reception of data).
    /// </summary>
    procedure GetSensorData(const aIdentifier: byte; out aTemperature: smallint; out aHumidity: byte; out aLastChange: word); virtual;

    /// <summary>
    ///  Turns callback for station data on or off.
    /// </summary>
    procedure SetStationCallbackConfiguration(const aEnableCallback: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetStationCallbackConfiguration"/>.
    /// </summary>
    function GetStationCallbackConfiguration: boolean; virtual;

    /// <summary>
    ///  Turns callback for sensor data on or off.
    /// </summary>
    procedure SetSensorCallbackConfiguration(const aEnableCallback: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetSensorCallbackConfiguration"/>.
    /// </summary>
    function GetSensorCallbackConfiguration: boolean; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetStatusLEDConfig"/>
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

    /// <summary>                            // Inherited method's

    ///  Reports the station data every time a new data aPacket is received.
    ///  See <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.GetStationData"/> for information about the data.
    ///  
    ///  For each station the callback will be triggered about every 45 seconds.
    ///  
    ///  Turn the callback on/off with <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetStationCallbackConfiguration"/>
    ///  (by default it is turned off).
    /// </summary>
    property OnStationData: TBrickletOutdoorWeatherNotifyStationData read fStationDataCallback write fStationDataCallback;

    /// <summary>
    ///  Reports the sensor data every time a new data aPacket is received.
    ///  See <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.GetSensorData"/> for information about the data.
    ///  
    ///  For each sensor the callback will be called about every 45 seconds.
    ///  
    ///  Turn the callback on/off with <see cref="BrickletOutdoorWeather.TBrickletOutdoorWeather.SetSensorCallbackConfiguration"/>
    ///  (by default it is turned off).
    /// </summary>
    property OnSensorData: TBrickletOutdoorWeatherNotifySensorData read fSensorDataCallback write fSensorDataCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletOutdoorWeather.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletOutdoorWeather.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_IDENTIFIERS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_IDENTIFIERS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_STATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_SENSOR_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletOutdoorWeather.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_OUTDOOR_WEATHER_CALLBACK_STATION_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperStationData;
  aCallBacks[BRICKLET_OUTDOOR_WEATHER_CALLBACK_SENSOR_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperSensorData;
end;

procedure TBrickletOutdoorWeather.GetStationIdentifiersLowLevel(out aIdentifiersLength: word; out aIdentifiersChunkOffset: word; out aIdentifiersChunkData: TArray0To59OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_IDENTIFIERS_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aIdentifiersLength:= LEConvertUInt16From(8, _response);
  aIdentifiersChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aIdentifiersChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletOutdoorWeather.GetStationIdentifiers: TArrayOfUInt8;
var
  _identifiers: TArrayOfUInt8;
  _identifiersCurrentLength: word;
  _identifiersLength: word;
  _identifiersChunkOffset: word;
  _identifiersChunkData: TArray0To59OfUInt8;
  _identifiersOutOfSync: boolean;
  _identifiersChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_identifiers, 0);
  StreamMutex.Acquire;
  try
    _identifiersLength:= 0;
    GetStationIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
    SetLength(_identifiers, _identifiersLength);
    _identifiersOutOfSync:= (_identifiersChunkOffset <> 0);

    if ((not _identifiersOutOfSync) and (_identifiersLength > 0)) then begin
      _identifiersChunkLength:= _identifiersLength - _identifiersChunkOffset;
      if (_identifiersChunkLength > 60) then _identifiersChunkLength:= 60;
      Move(_identifiersChunkData, _identifiers[0], SizeOf(byte) * _identifiersChunkLength);
      _identifiersCurrentLength:= _identifiersChunkLength;

      while ((not _identifiersOutOfSync) and (_identifiersCurrentLength < _identifiersLength)) do begin
        GetStationIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
        _identifiersOutOfSync:= _identifiersChunkOffset <> _identifiersCurrentLength;
        _identifiersChunkLength:= _identifiersLength - _identifiersChunkOffset;
        if (_identifiersChunkLength > 60) then _identifiersChunkLength:= 60;
        Move(_identifiersChunkData, _identifiers[_identifiersCurrentLength], SizeOf(byte) * _identifiersChunkLength);
        Inc(_identifiersCurrentLength, _identifiersChunkLength);
      end;
    end;

    if (_identifiersOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_identifiersChunkOffset + 60 < _identifiersLength) do begin
        GetStationIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Identifiers stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _identifiers;
end;

procedure TBrickletOutdoorWeather.GetSensorIdentifiersLowLevel(out aIdentifiersLength: word; out aIdentifiersChunkOffset: word; out aIdentifiersChunkData: TArray0To59OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_IDENTIFIERS_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aIdentifiersLength:= LEConvertUInt16From(8, _response);
  aIdentifiersChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aIdentifiersChunkData[_i]:= LEConvertUInt8From(12 + (_i * 1), _response);
end;

function TBrickletOutdoorWeather.GetSensorIdentifiers: TArrayOfUInt8;
var
  _identifiers: TArrayOfUInt8;
  _identifiersCurrentLength: word;
  _identifiersLength: word;
  _identifiersChunkOffset: word;
  _identifiersChunkData: TArray0To59OfUInt8;
  _identifiersOutOfSync: boolean;
  _identifiersChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_identifiers, 0);
  StreamMutex.Acquire;
  try
    _identifiersLength:= 0;
    GetSensorIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
    SetLength(_identifiers, _identifiersLength);
    _identifiersOutOfSync:= (_identifiersChunkOffset <> 0);

    if ((not _identifiersOutOfSync) and (_identifiersLength > 0)) then begin
      _identifiersChunkLength:= _identifiersLength - _identifiersChunkOffset;
      if (_identifiersChunkLength > 60) then _identifiersChunkLength:= 60;
      Move(_identifiersChunkData, _identifiers[0], SizeOf(byte) * _identifiersChunkLength);
      _identifiersCurrentLength:= _identifiersChunkLength;

      while ((not _identifiersOutOfSync) and (_identifiersCurrentLength < _identifiersLength)) do begin
        GetSensorIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
        _identifiersOutOfSync:= _identifiersChunkOffset <> _identifiersCurrentLength;
        _identifiersChunkLength:= _identifiersLength - _identifiersChunkOffset;
        if (_identifiersChunkLength > 60) then _identifiersChunkLength:= 60;
        Move(_identifiersChunkData, _identifiers[_identifiersCurrentLength], SizeOf(byte) * _identifiersChunkLength);
        Inc(_identifiersCurrentLength, _identifiersChunkLength);
      end;
    end;

    if (_identifiersOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_identifiersChunkOffset + 60 < _identifiersLength) do begin
        GetSensorIdentifiersLowLevel(_identifiersLength, _identifiersChunkOffset, _identifiersChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Identifiers stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _identifiers;
end;

procedure TBrickletOutdoorWeather.GetStationData(const aIdentifier: byte; out aTemperature: smallint; out aHumidity: byte; out aWindSpeed: longword; out aGustSpeed: longword; out aRain: longword; out aWindDirection: byte; out aBatteryLow: boolean; out aLastChange: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_DATA, 9);
  LEConvertUInt8To(aIdentifier, 8, _request);
  _response:= SendRequest(_request);
  aTemperature:= LEConvertInt16From(8, _response);
  aHumidity:= LEConvertUInt8From(10, _response);
  aWindSpeed:= LEConvertUInt32From(11, _response);
  aGustSpeed:= LEConvertUInt32From(15, _response);
  aRain:= LEConvertUInt32From(19, _response);
  aWindDirection:= LEConvertUInt8From(23, _response);
  aBatteryLow:= LEConvertBooleanFrom(24, _response);
  aLastChange:= LEConvertUInt16From(25, _response);
end;

procedure TBrickletOutdoorWeather.GetSensorData(const aIdentifier: byte; out aTemperature: smallint; out aHumidity: byte; out aLastChange: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_DATA, 9);
  LEConvertUInt8To(aIdentifier, 8, _request);
  _response:= SendRequest(_request);
  aTemperature:= LEConvertInt16From(8, _response);
  aHumidity:= LEConvertUInt8From(10, _response);
  aLastChange:= LEConvertUInt16From(11, _response);
end;

procedure TBrickletOutdoorWeather.SetStationCallbackConfiguration(const aEnableCallback: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_STATION_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnableCallback, 8, _request);
  SendRequest(_request);
end;

function TBrickletOutdoorWeather.GetStationCallbackConfiguration: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATION_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletOutdoorWeather.SetSensorCallbackConfiguration(const aEnableCallback: boolean);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_SENSOR_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnableCallback, 8, _request);
  SendRequest(_request);
end;

function TBrickletOutdoorWeather.GetSensorCallbackConfiguration: boolean;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SENSOR_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletOutdoorWeather.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletOutdoorWeather.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOutdoorWeather.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOutdoorWeather.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletOutdoorWeather.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletOutdoorWeather.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletOutdoorWeather.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletOutdoorWeather.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletOutdoorWeather.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletOutdoorWeather.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletOutdoorWeather.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletOutdoorWeather.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_OUTDOOR_WEATHER_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletOutdoorWeather.CallbackWrapperStationData(const aPacket: TDynamicByteArray);
var
  _identifier: byte;
  _temperature: smallint;
  _humidity: byte;
  _windSpeed: longword;
  _gustSpeed: longword;
  _rain: longword;
  _windDirection: byte;
  _batteryLow: boolean;
begin
  _identifier:= LEConvertUInt8From(8, aPacket);
  _temperature:= LEConvertInt16From(9, aPacket);
  _humidity:= LEConvertUInt8From(11, aPacket);
  _windSpeed:= LEConvertUInt32From(12, aPacket);
  _gustSpeed:= LEConvertUInt32From(16, aPacket);
  _rain:= LEConvertUInt32From(20, aPacket);
  _windDirection:= LEConvertUInt8From(24, aPacket);
  _batteryLow:= LEConvertBooleanFrom(25, aPacket);

  if (Assigned(fStationDataCallback)) then begin
    fStationDataCallback(self, _identifier, _temperature, _humidity, _windSpeed, _gustSpeed, _rain, _windDirection, _batteryLow);
  end;
end;

procedure TBrickletOutdoorWeather.CallbackWrapperSensorData(const aPacket: TDynamicByteArray);
var
  _identifier: byte;
  _temperature: smallint;
  _humidity: byte;
begin
  _identifier:= LEConvertUInt8From(8, aPacket);
  _temperature:= LEConvertInt16From(9, aPacket);
  _humidity:= LEConvertUInt8From(11, aPacket);

  if (Assigned(fSensorDataCallback)) then begin
    fSensorDataCallback(self, _identifier, _temperature, _humidity);
  end;
end;

end.
