{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCompass;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickletCompass.inc}

type
  TArray0To2OfInt16 = array [0..2] of smallint;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletCompass = class;
  TBrickletCompassNotifyHeading = procedure(aSender: TBrickletCompass; const heading: smallint) of object;
  TBrickletCompassNotifyMagneticFluxDensity = procedure(aSender: TBrickletCompass; const x: longint; const y: longint; const z: longint) of object;

  /// <summary>
  ///  3-axis compass with 0.1mG (milli Gauss) and 0.1° resolution
  /// </summary>
  TBrickletCompass = class(TDevice)
  private
    fHeadingCallback: TBrickletCompassNotifyHeading;
    fMagneticFluxDensityCallback: TBrickletCompassNotifyMagneticFluxDensity;
    procedure CallbackWrapperHeading(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperMagneticFluxDensity(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the heading (north = 0 degree, east = 90 degree).
    ///  
    ///  Alternatively you can use <see cref="BrickletCompass.TBrickletCompass.GetMagneticFluxDensity"/> and calculate the
    ///  heading with ``heading = atan2(y, x) * 180 / PI``.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletCompass.TBrickletCompass.OnHeading"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCompass.TBrickletCompass.SetHeadingCallbackConfiguration"/>.
    /// </summary>
    function GetHeading: smallint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCompass.TBrickletCompass.OnHeading"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change
    ///  within the period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    ///  
    ///  It is furthermore possible to constrain the callback with thresholds.
    ///  
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletCompass.TBrickletCompass.OnHeading"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Threshold is turned off"
    ///   "'o'",    "Threshold is triggered when the value is *outside* the min and max values"
    ///   "'i'",    "Threshold is triggered when the value is *inside* or equal to the min and max values"
    ///   "'&lt;'",    "Threshold is triggered when the value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Threshold is triggered when the value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  If the option is set to 'x' (threshold turned off) the callback is triggered with the fixed period.
    /// </summary>
    procedure SetHeadingCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletCompass.TBrickletCompass.SetHeadingCallbackConfiguration"/>.
    /// </summary>
    procedure GetHeadingCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Returns the `magnetic flux density (magnetic induction) &lt;https://en.wikipedia.org/wiki/Magnetic_flux&gt;`__
    ///  for all three axis.
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletCompass.TBrickletCompass.OnMagneticFluxDensity"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletCompass.TBrickletCompass.SetMagneticFluxDensityCallbackConfiguration"/>.
    /// </summary>
    procedure GetMagneticFluxDensity(out x: longint; out y: longint; out z: longint); virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletCompass.TBrickletCompass.OnMagneticFluxDensity"/> callback
    ///  is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetMagneticFluxDensityCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletCompass.TBrickletCompass.SetMagneticFluxDensityCallbackConfiguration"/>.
    /// </summary>
    procedure GetMagneticFluxDensityCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Configures the data rate and background calibration.
    ///  
    ///  * Data Rate: Sets the data rate that is used by the magnetometer.
    ///    The lower the data rate, the lower is the noise on the data.
    ///  * Background Calibration: Set to *true* to enable the background
    ///    calibration and *false* to turn it off. If the background calibration
    ///    is enabled the sensing polarity is flipped once per second to automatically
    ///    calculate and remove offset that is caused by temperature changes.
    ///    This polarity flipping takes about 20ms. This means that once a second
    ///    you will not get new data for a period of 20ms. We highly recommend that
    ///    you keep the background calibration enabled and only disable it if the 20ms
    ///    off-time is a problem in your application.
    /// </summary>
    procedure SetConfiguration(const dataRate: byte; const backgroundCalibration: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCompass.TBrickletCompass.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out dataRate: byte; out backgroundCalibration: boolean); virtual;

    /// <summary>
    ///  Sets offset and gain for each of the three axes.
    ///  
    ///  The Bricklet is factory calibrated. If you want to re-calibrate the
    ///  Bricklet we recommend that you do the calibration through Brick Viewer.
    ///  
    ///  The calibration is saved in non-volatile memory and only has to be
    ///  done once.
    /// </summary>
    procedure SetCalibration(const offset: array of smallint; const gain: array of smallint); virtual;

    /// <summary>
    ///  Returns the calibration parameters as set by <see cref="BrickletCompass.TBrickletCompass.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out offset: TArray0To2OfInt16; out gain: TArray0To2OfInt16); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletCompass.TBrickletCompass.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletCompass.TBrickletCompass.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletCompass.TBrickletCompass.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletCompass.TBrickletCompass.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletCompass.TBrickletCompass.SetHeadingCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletCompass.TBrickletCompass.GetHeading"/>.
    /// </summary>
    property OnHeading: TBrickletCompassNotifyHeading read fHeadingCallback write fHeadingCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletCompass.TBrickletCompass.SetMagneticFluxDensityCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletCompass.TBrickletCompass.GetMagneticFluxDensity"/>.
    /// </summary>
    property OnMagneticFluxDensity: TBrickletCompassNotifyMagneticFluxDensity read fMagneticFluxDensityCallback write fMagneticFluxDensityCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletCompass.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCompass.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_HEADING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_HEADING_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_HEADING_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_MAGNETIC_FLUX_DENSITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_COMPASS_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCompass.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_COMPASS_CALLBACK_HEADING]:= {$ifdef FPC}@{$endif}CallbackWrapperHeading;
  aCallBacks[BRICKLET_COMPASS_CALLBACK_MAGNETIC_FLUX_DENSITY]:= {$ifdef FPC}@{$endif}CallbackWrapperMagneticFluxDensity;
end;

function TBrickletCompass.GetHeading: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_HEADING, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCompass.SetHeadingCallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: smallint; const max: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_HEADING_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt16To(min, 14, _request);
  LEConvertInt16To(max, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletCompass.GetHeadingCallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: smallint; out max: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_HEADING_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt16From(14, _response);
  max:= LEConvertInt16From(16, _response);
end;

procedure TBrickletCompass.GetMagneticFluxDensity(out x: longint; out y: longint; out z: longint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_MAGNETIC_FLUX_DENSITY, 8);
  _response:= SendRequest(_request);
  x:= LEConvertInt32From(8, _response);
  y:= LEConvertInt32From(12, _response);
  z:= LEConvertInt32From(16, _response);
end;

procedure TBrickletCompass.SetMagneticFluxDensityCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletCompass.GetMagneticFluxDensityCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_MAGNETIC_FLUX_DENSITY_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletCompass.SetConfiguration(const dataRate: byte; const backgroundCalibration: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(dataRate, 8, _request);
  LEConvertBooleanTo(backgroundCalibration, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletCompass.GetConfiguration(out dataRate: byte; out backgroundCalibration: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  dataRate:= LEConvertUInt8From(8, _response);
  backgroundCalibration:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletCompass.SetCalibration(const offset: array of smallint; const gain: array of smallint);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_CALIBRATION, 20);
  if (Length(offset) <> 3) then raise EInvalidParameterException.Create('Offset has to be exactly 3 items long');
  for _i:= 0 to Length(offset) - 1 do LEConvertInt16To(offset[_i], 8 + (_i * 2), _request);
  if (Length(gain) <> 3) then raise EInvalidParameterException.Create('Gain has to be exactly 3 items long');
  for _i:= 0 to Length(gain) - 1 do LEConvertInt16To(gain[_i], 14 + (_i * 2), _request);
  SendRequest(_request);
end;

procedure TBrickletCompass.GetCalibration(out offset: TArray0To2OfInt16; out gain: TArray0To2OfInt16);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_CALIBRATION, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 2 do offset[_i]:= LEConvertInt16From(8 + (_i * 2), _response);
  for _i:= 0 to 2 do gain[_i]:= LEConvertInt16From(14 + (_i * 2), _response);
end;

procedure TBrickletCompass.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletCompass.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCompass.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCompass.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletCompass.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCompass.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletCompass.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCompass.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCompass.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletCompass.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletCompass.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCompass.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_COMPASS_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCompass.CallbackWrapperHeading(const aPacket: TDynamicByteArray);
var heading: smallint;
begin
  heading:= LEConvertInt16From(8, aPacket);

  if (Assigned(fHeadingCallback)) then begin
    fHeadingCallback(self, heading);
  end;
end;

procedure TBrickletCompass.CallbackWrapperMagneticFluxDensity(const aPacket: TDynamicByteArray);
var x: longint; y: longint; z: longint;
begin
  x:= LEConvertInt32From(8, aPacket);
  y:= LEConvertInt32From(12, aPacket);
  z:= LEConvertInt32From(16, aPacket);

  if (Assigned(fMagneticFluxDensityCallback)) then begin
    fMagneticFluxDensityCallback(self, x, y, z);
  end;
end;

end.
