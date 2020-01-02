{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletUVLightV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletUVLightV2.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  TBrickletUVLightV2 = class;
  TBrickletUVLightV2NotifyUVA = procedure(aSender: TBrickletUVLightV2; const aUVA: longint) of object;
  TBrickletUVLightV2NotifyUVB = procedure(aSender: TBrickletUVLightV2; const aUVB: longint) of object;
  TBrickletUVLightV2NotifyUVI = procedure(aSender: TBrickletUVLightV2; const aUVI: longint) of object;

  /// <summary>
  ///  Measures UV-A, UV-B and UV index
  /// </summary>
  TBrickletUVLightV2 = class(TDevice)
  private
    fUVACallback: TBrickletUVLightV2NotifyUVA;
    fUVBCallback: TBrickletUVLightV2NotifyUVB;
    fUVICallback: TBrickletUVLightV2NotifyUVI;
    procedure CallbackWrapperUVA(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperUVB(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperUVI(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns the UVA intensity of the sensor, the intensity is given
    ///  in 1/10 mW/m². The sensor has not weighted the intensity with the erythemal
    ///  action spectrum to get the skin-affecting irradiation. Therefore, you cannot
    ///  just divide the value by 250 to get the UVA index. To get the UV index use
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.GetUVI"/>.
    ///  
    ///  If the sensor is saturated, then -1 is returned, see <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetConfiguration"/>.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVA"/> callback and set the period with
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVACallbackConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVA"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVACallbackConfiguration"/>.
    /// </summary>
    function GetUVA: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVA"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVA"/> callback.
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
    procedure SetUVACallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVACallbackConfiguration"/>.
    /// </summary>
    procedure GetUVACallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the UVB intensity of the sensor, the intensity is given
    ///  in 1/10 mW/m². The sensor has not weighted the intensity with the erythemal
    ///  action spectrum to get the skin-affecting irradiation. Therefore, you cannot
    ///  just divide the value by 250 to get the UVB index. To get the UV index use
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.GetUVI"/>.
    ///  
    ///  If the sensor is saturated, then -1 is returned, see <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetConfiguration"/>.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVB"/> callback and set the period with
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVBCallbackConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVB"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVBCallbackConfiguration"/>.
    /// </summary>
    function GetUVB: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVB"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVB"/> callback.
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
    procedure SetUVBCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVBCallbackConfiguration"/>.
    /// </summary>
    procedure GetUVBCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Returns the UV index of the sensor, the index is given in 1/10.
    ///  
    ///  If the sensor is saturated, then -1 is returned, see <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetConfiguration"/>.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVI"/> callback and set the period with
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVICallbackConfiguration"/>.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVI"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVICallbackConfiguration"/>.
    /// </summary>
    function GetUVI: longint; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVI"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletUVLightV2.TBrickletUVLightV2.OnUVI"/> callback.
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
    procedure SetUVICallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVICallbackConfiguration"/>.
    /// </summary>
    procedure GetUVICallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint); virtual;

    /// <summary>
    ///  Sets the configuration of the sensor. The integration time can be configured
    ///  between 50 and 800 ms. With a shorter integration time the sensor reading updates
    ///  more often but contains more noise. With a longer integration the sensor reading
    ///  contains less noise but updates less often.
    ///  
    ///  With a longer integration time (especially 800 ms) and a higher UV intensity the
    ///  sensor can be saturated. If this happens the UVA/UVB/UVI readings are all -1.
    ///  In this case you need to choose a shorter integration time.
    ///  
    ///  Default value: 400 ms.
    /// </summary>
    procedure SetConfiguration(const aIntegrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetConfiguration"/>.
    /// </summary>
    function GetConfiguration: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletUVLightV2.TBrickletUVLightV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVACallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletUVLightV2.TBrickletUVLightV2.GetUVA"/>.
    /// </summary>
    property OnUVA: TBrickletUVLightV2NotifyUVA read fUVACallback write fUVACallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVBCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletUVLightV2.TBrickletUVLightV2.GetUVB"/>.
    /// </summary>
    property OnUVB: TBrickletUVLightV2NotifyUVB read fUVBCallback write fUVBCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletUVLightV2.TBrickletUVLightV2.SetUVICallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletUVLightV2.TBrickletUVLightV2.GetUVI"/>.
    /// </summary>
    property OnUVI: TBrickletUVLightV2NotifyUVI read fUVICallback write fUVICallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletUVLightV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletUVLightV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVB]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVB_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVB_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVI]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVI_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVI_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_UV_LIGHT_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletUVLightV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_UV_LIGHT_V2_CALLBACK_UVA]:= {$ifdef FPC}@{$endif}CallbackWrapperUVA;
  aCallBacks[BRICKLET_UV_LIGHT_V2_CALLBACK_UVB]:= {$ifdef FPC}@{$endif}CallbackWrapperUVB;
  aCallBacks[BRICKLET_UV_LIGHT_V2_CALLBACK_UVI]:= {$ifdef FPC}@{$endif}CallbackWrapperUVI;
end;

function TBrickletUVLightV2.GetUVA: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVA, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletUVLightV2.SetUVACallbackConfiguration(const period: longword; const valueHasToChange: boolean; const option: char; const min: longint; const max: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVA_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  LEConvertCharTo(option, 13, _request);
  LEConvertInt32To(min, 14, _request);
  LEConvertInt32To(max, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletUVLightV2.GetUVACallbackConfiguration(out period: longword; out valueHasToChange: boolean; out option: char; out min: longint; out max: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVA_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
  option:= LEConvertCharFrom(13, _response);
  min:= LEConvertInt32From(14, _response);
  max:= LEConvertInt32From(18, _response);
end;

function TBrickletUVLightV2.GetUVB: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVB, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletUVLightV2.SetUVBCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVB_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletUVLightV2.GetUVBCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVB_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

function TBrickletUVLightV2.GetUVI: longint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVI, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt32From(8, _response);
end;

procedure TBrickletUVLightV2.SetUVICallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: longint; const aMax: longint);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_UVI_CALLBACK_CONFIGURATION, 22);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertInt32To(aMin, 14, _request);
  LEConvertInt32To(aMax, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletUVLightV2.GetUVICallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: longint; out aMax: longint);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_UVI_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertInt32From(14, _response);
  aMax:= LEConvertInt32From(18, _response);
end;

procedure TBrickletUVLightV2.SetConfiguration(const aIntegrationTime: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_CONFIGURATION, 9);
  LEConvertUInt8To(aIntegrationTime, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLightV2.GetConfiguration: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletUVLightV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletUVLightV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletUVLightV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletUVLightV2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLightV2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletUVLightV2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLightV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletUVLightV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletUVLightV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletUVLightV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletUVLightV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletUVLightV2.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_UV_LIGHT_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletUVLightV2.CallbackWrapperUVA(const aPacket: TDynamicByteArray);
var
  _uva: longint;
begin
  _uva:= LEConvertInt32From(8, aPacket);

  if (Assigned(fUVACallback)) then begin
    fUVACallback(self, _uva);
  end;
end;

procedure TBrickletUVLightV2.CallbackWrapperUVB(const aPacket: TDynamicByteArray);
var
  _uvb: longint;
begin
  _uvb:= LEConvertInt32From(8, aPacket);

  if (Assigned(fUVBCallback)) then begin
    fUVBCallback(self, _uvb);
  end;
end;

procedure TBrickletUVLightV2.CallbackWrapperUVI(const aPacket: TDynamicByteArray);
var
  _uvi: longint;
begin
  _uvi:= LEConvertInt32From(8, aPacket);

  if (Assigned(fUVICallback)) then begin
    fUVICallback(self, _uvi);
  end;
end;

end.
