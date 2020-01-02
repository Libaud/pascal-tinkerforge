{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletThermalImaging;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I Tinkerforge.inc}
{$I BrickletThermalImaging.inc}

type
  TArray0To1OfBoolean = array [0..1] of boolean;
  TArray0To1OfUInt16 = array [0..1] of word;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To30OfUInt16 = array [0..30] of word;
  TArray0To3OfUInt16 = array [0..3] of word;
  TArray0To3OfUInt8 = array [0..3] of byte;
  TArray0To61OfUInt8 = array [0..61] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt16 = array of word;
  TArrayOfUInt8 = array of byte;

  THighContrastImageHighLevelCallbackState = record
    data: TArrayOfUInt8;
    length: word;
  end;

  TTemperatureImageHighLevelCallbackState = record
    data: TArrayOfUInt16;
    length: word;
  end;

  TBrickletThermalImaging = class;

  TBrickletThermalImagingNotifyHighContrastImageLowLevel = procedure(aSender: TBrickletThermalImaging; const aImageChunkOffset: word;
                                                                     const aImageChunkData: TArray0To61OfUInt8) of object;
  TBrickletThermalImagingNotifyHighContrastImage = procedure(aSender: TBrickletThermalImaging; const aImage: TArrayOfUInt8) of object;
  TBrickletThermalImagingNotifyTemperatureImageLowLevel = procedure(aSender: TBrickletThermalImaging; const aImageChunkOffset: word;
                                                                    const aImageChunkData: TArray0To30OfUInt16) of object;
  TBrickletThermalImagingNotifyTemperatureImage = procedure(aSender: TBrickletThermalImaging; const aImage: TArrayOfUInt16) of object;

  /// <summary>
  ///  80x60 pixel thermal imaging camera
  /// </summary>
  TBrickletThermalImaging = class(TThreadedDevice)
  private
    highContrastImageHighLevelCallbackState: THighContrastImageHighLevelCallbackState;
    temperatureImageHighLevelCallbackState: TTemperatureImageHighLevelCallbackState;
    highContrastImageLowLevelCallback: TBrickletThermalImagingNotifyHighContrastImageLowLevel;
    highContrastImageCallback: TBrickletThermalImagingNotifyHighContrastImage;
    temperatureImageLowLevelCallback: TBrickletThermalImagingNotifyTemperatureImageLowLevel;
    temperatureImageCallback: TBrickletThermalImagingNotifyTemperatureImage;
    procedure CallbackWrapperHighContrastImageLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperTemperatureImageLowLevel(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Returns the current high contrast image. See `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Thermal_Imaging.html#high-contrast-image-vs-temperature-image&gt;`__
    ///  for the difference between
    ///  High Contrast and Temperature Image. If you don't know what to use
    ///  the High Contrast Image is probably right for you.
    ///  
    ///  The data is organized as a 8-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 8-bit value represents one gray-scale image pixel that can directly be
    ///  shown to a user on a display.
    ///  
    ///  Before you can use this function you have to enable it with
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>.
    /// </summary>
    procedure GetHighContrastImageLowLevel(out aImageChunkOffset: word; out aImageChunkData: TArray0To61OfUInt8); virtual;

    /// <summary>
    ///  Returns the current high contrast image. See `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Thermal_Imaging.html#high-contrast-image-vs-temperature-image&gt;`__
    ///  for the difference between
    ///  High Contrast and Temperature Image. If you don't know what to use
    ///  the High Contrast Image is probably right for you.
    ///  
    ///  The data is organized as a 8-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 8-bit value represents one gray-scale image pixel that can directly be
    ///  shown to a user on a display.
    ///  
    ///  Before you can use this function you have to enable it with
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>.
    /// </summary>
    function GetHighContrastImage: TArrayOfUInt8; virtual;

    /// <summary>
    ///  Returns the current temperature image. See `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Thermal_Imaging.html#high-contrast-image-vs-temperature-image&gt;`__
    ///  for the difference between High Contrast and Temperature Image.
    ///  If you don't know what to use the High Contrast Image is probably right for you.
    ///  
    ///  The data is organized as a 16-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 16-bit value represents one temperature measurement in either
    ///  Kelvin/10 or Kelvin/100 (depending on the resolution set with <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetResolution"/>).
    ///  
    ///  Before you can use this function you have to enable it with
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>.
    /// </summary>
    procedure GetTemperatureImageLowLevel(out aImageChunkOffset: word; out aImageChunkData: TArray0To30OfUInt16); virtual;

    /// <summary>
    ///  Returns the current temperature image. See `here &lt;https://www.tinkerforge.com/en/doc/Hardware/Bricklets/Thermal_Imaging.html#high-contrast-image-vs-temperature-image&gt;`__
    ///  for the difference between High Contrast and Temperature Image.
    ///  If you don't know what to use the High Contrast Image is probably right for you.
    ///  
    ///  The data is organized as a 16-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 16-bit value represents one temperature measurement in either
    ///  Kelvin/10 or Kelvin/100 (depending on the resolution set with <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetResolution"/>).
    ///  
    ///  Before you can use this function you have to enable it with
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>.
    /// </summary>
    function GetTemperatureImage: TArrayOfUInt16; virtual;

    /// <summary>
    ///  Returns the spotmeter statistics, various temperatures, current resolution and status bits.
    ///  
    ///  The spotmeter statistics are:
    ///  
    ///  * Index 0: Mean Temperature.
    ///  * Index 1: Maximum Temperature.
    ///  * Index 2: Minimum Temperature.
    ///  * Index 3: Pixel Count of spotmeter region of interest.
    ///  
    ///  The temperatures are:
    ///  
    ///  * Index 0: Focal Plain Array temperature.
    ///  * Index 1: Focal Plain Array temperature at last FFC (Flat Field Correction).
    ///  * Index 2: Housing temperature.
    ///  * Index 3: Housing temperature at last FFC.
    ///  
    ///  The resolution is either `0 to 6553 Kelvin` or `0 to 655 Kelvin`. If the resolution is the former,
    ///  the temperatures are in Kelvin/10, if it is the latter the temperatures are in Kelvin/100.
    ///  
    ///  FFC (Flat Field Correction) Status:
    ///  
    ///  * FFC Never Commanded: Only seen on startup before first FFC.
    ///  * FFC Imminent: This state is entered 2 seconds prior to initiating FFC.
    ///  * FFC In Progress: Flat field correction is started (shutter moves in front of lens and back). Takes about 1 second.
    ///  * FFC Complete: Shutter is in waiting position again, FFC done.
    ///  
    ///  Temperature warning bits:
    ///  
    ///  * Index 0: Shutter lockout (if true shutter is locked out because temperature is outside -10°C to +65°C)
    ///  * Index 1: Overtemperature shut down imminent (goes true 10 seconds before shutdown)
    /// </summary>
    procedure GetStatistics(out aSpotmeterStatistics: TArray0To3OfUInt16; out aTemperatures: TArray0To3OfUInt16; out aResolution: byte;
                            out affcStatus: byte; out aTemperatureWarning: TArray0To1OfBoolean); virtual;

    /// <summary>
    ///  Sets the resolution. The Thermal Imaging Bricklet can either measure
    ///  
    ///  * from 0 to 6553 Kelvin (-273.15°C to +6279.85°C) with 0.1°C resolution or
    ///  * from 0 to 655 Kelvin (-273.15°C to +381.85°C) with 0.01°C resolution.
    ///  
    ///  The accuracy is specified for -10°C to 450°C in the
    ///  first range and -10°C and 140°C in the second range.
    ///  
    ///  The default value is 0 to 655 Kelvin.
    /// </summary>
    procedure SetResolution(const aResolution: byte); virtual;

    /// <summary>
    ///  Returns the resolution as set by <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetResolution"/>.
    /// </summary>
    function GetResolution: byte; virtual;

    /// <summary>
    ///  Sets the spotmeter region of interest. The 4 values are
    ///  
    ///  * Index 0: Column start (has to be smaller then Column end).
    ///  * Index 1: Row start (has to be smaller then Row end).
    ///  * Index 2: Column end (has to be smaller then 80).
    ///  * Index 3: Row end (has to be smaller then 60).
    ///  
    ///  The spotmeter statistics can be read out with <see cref="BrickletThermalImaging.TBrickletThermalImaging.GetStatistics"/>.
    ///  
    ///  The default region of interest is (39, 29, 40, 30).
    /// </summary>
    procedure SetSpotmeterConfig(const aRegionOfInterest: array of byte); virtual;

    /// <summary>
    ///  Returns the spotmeter config as set by <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetSpotmeterConfig"/>.
    /// </summary>
    function GetSpotmeterConfig: TArray0To3OfUInt8; virtual;

    /// <summary>
    ///  Sets the high contrast region of interest, dampening factor, clip limit and empty counts.
    ///  This config is only used in high contrast mode (see <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>).
    ///  
    ///  The high contrast region of interest consists of four values:
    ///  
    ///  * Index 0: Column start (has to be smaller or equal then Column end).
    ///  * Index 1: Row start (has to be smaller then Row end).
    ///  * Index 2: Column end (has to be smaller then 80).
    ///  * Index 3: Row end (has to be smaller then 60).
    ///  
    ///  The algorithm to generate the high contrast image is applied to this region.
    ///  
    ///  Dampening Factor: This parameter is the amount of temporal dampening applied to the HEQ
    ///  (history equalization) transformation function. An IIR filter of the form::
    ///  
    ///   (N / 256) * previous + ((256 - N) / 256) * current
    ///  
    ///  is applied, and the HEQ dampening factor
    ///  represents the value N in the equation, i.e., a value that applies to the amount of
    ///  influence the previous HEQ transformation function has on the current function. The
    ///  lower the value of N the higher the influence of the current video frame whereas
    ///  the higher the value of N the more influence the previous damped transfer function has.
    ///  
    ///  Clip Limit Index 0 (AGC HEQ Clip Limit High): This parameter defines the maximum number of pixels allowed
    ///  to accumulate in any given histogram bin. Any additional pixels in a given bin are clipped.
    ///  The effect of this parameter is to limit the influence of highly-populated bins on the
    ///  resulting HEQ transformation function.
    ///  
    ///  Clip Limit Index 1 (AGC HEQ Clip Limit Low): This parameter defines an artificial population that is added to
    ///  every non-empty histogram bin. In other words, if the Clip Limit Low is set to L, a bin
    ///  with an actual population of X will have an effective population of L + X. Any empty bin
    ///  that is nearby a populated bin will be given an artificial population of L. The effect of
    ///  higher values is to provide a more linear transfer function; lower values provide a more
    ///  non-linear (equalized) transfer function.
    ///  
    ///  Empty Counts: This parameter specifies the maximum number of pixels in a bin that will be
    ///  interpreted as an empty bin. Histogram bins with this number of pixels or less will be
    ///  processed as an empty bin.
    ///  
    ///  The default values are
    ///  
    ///  * Region Of Interest = (0, 0, 79, 59),
    ///  * Dampening Factor = 64,
    ///  * Clip Limit = (4800, 512) and
    ///  * Empty Counts = 2.
    /// </summary>
    procedure SetHighContrastConfig(const aRegionOfInterest: array of byte; const aDampeningFactor: word; const aClipLimit: array of word; const aEmptyCounts: word); virtual;

    /// <summary>
    ///  Returns the high contrast config as set by <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetHighContrastConfig"/>.
    /// </summary>
    procedure GetHighContrastConfig(out aRegionOfInterest: TArray0To3OfUInt8; out aDampeningFactor: word; out aClipLimit: TArray0To1OfUInt16; out aEmptyCounts: word); virtual;

    /// <summary>
    ///  The necessary bandwidth of this Bricklet is too high to use getter/callback or
    ///  high contrast/temperature image at the same time. You have to configure the one
    ///  you want to use, the Bricklet will optimize the internal configuration accordingly.
    ///  
    ///  Corresponding functions:
    ///  
    ///  * Manual High Contrast Image: <see cref="BrickletThermalImaging.TBrickletThermalImaging.GetHighContrastImage"/>.
    ///  * Manual Temperature Image: <see cref="BrickletThermalImaging.TBrickletThermalImaging.GetTemperatureImage"/>.
    ///  * Callback High Contrast Image: <see cref="BrickletThermalImaging.TBrickletThermalImaging.OnHighContrastImage"/> callback.
    ///  * Callback Temperature Image: <see cref="BrickletThermalImaging.TBrickletThermalImaging.OnTemperatureImage"/> callback.
    ///  
    ///  The default is Manual High Contrast Image (0).
    /// </summary>
    procedure SetImageTransferConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the image transfer config, as set by <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>.
    /// </summary>
    function GetImageTransferConfig: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletThermalImaging.TBrickletThermalImaging.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.OnHighContrastImage"/>
    /// </summary>
    property OnHighContrastImageLowLevel: TBrickletThermalImagingNotifyHighContrastImageLowLevel read highContrastImageLowLevelCallback write highContrastImageLowLevelCallback;

    /// <summary>
    ///  This callback is triggered with every new high contrast image if the transfer image
    ///  config is configured for high contrast callback (see <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>).
    ///  
    ///  The data is organized as a 8-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 8-bit value represents one gray-scale image pixel that can directly be
    ///  shown to a user on a display.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for image.
    ///  </note>
    /// </summary>
    property OnHighContrastImage: TBrickletThermalImagingNotifyHighContrastImage read highContrastImageCallback write highContrastImageCallback;

    /// <summary>
    ///  <see cref="BrickletThermalImaging.TBrickletThermalImaging.OnTemperatureImage"/>
    /// </summary>
    property OnTemperatureImageLowLevel: TBrickletThermalImagingNotifyTemperatureImageLowLevel read temperatureImageLowLevelCallback write temperatureImageLowLevelCallback;

    /// <summary>
    ///  This callback is triggered with every new temperature image if the transfer image
    ///  config is configured for temperature callback (see <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetImageTransferConfig"/>).
    ///  
    ///  The data is organized as a 16-bit value 80x60 pixel matrix linearized in
    ///  a one-dimensional array. The data is arranged line by line from top left to
    ///  bottom right.
    ///  
    ///  Each 16-bit value represents one temperature measurement in either
    ///  Kelvin/10 or Kelvin/100 (depending on the resolution set with <see cref="BrickletThermalImaging.TBrickletThermalImaging.SetResolution"/>).
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for image.
    ///  </note>
    /// </summary>
    property OnTemperatureImage: TBrickletThermalImagingNotifyTemperatureImage read temperatureImageCallback write temperatureImageCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

constructor TBrickletThermalImaging.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(highContrastImageHighLevelCallbackState.data, 0);
  highContrastImageHighLevelCallbackState.data:= nil;
  highContrastImageHighLevelCallbackState.length:= 0;
  SetLength(temperatureImageHighLevelCallbackState.data, 0);
  temperatureImageHighLevelCallbackState.data:= nil;
  temperatureImageHighLevelCallbackState.length:= 0;
end;

procedure TBrickletThermalImaging.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletThermalImaging.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_HIGH_CONTRAST_IMAGE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_TEMPERATURE_IMAGE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_STATISTICS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_RESOLUTION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_RESOLUTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_SPOTMETER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_SPOTMETER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_HIGH_CONTRAST_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_HIGH_CONTRAST_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_IMAGE_TRANSFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_IMAGE_TRANSFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_THERMAL_IMAGING_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletThermalImaging.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_THERMAL_IMAGING_CALLBACK_HIGH_CONTRAST_IMAGE_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperHighContrastImageLowLevel;
  aCallBacks[BRICKLET_THERMAL_IMAGING_CALLBACK_TEMPERATURE_IMAGE_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperTemperatureImageLowLevel;
end;

procedure TBrickletThermalImaging.GetHighContrastImageLowLevel(out aImageChunkOffset: word; out aImageChunkData: TArray0To61OfUInt8);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_HIGH_CONTRAST_IMAGE_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aImageChunkOffset:= LEConvertUInt16From(8, _response);
  for _i:= 0 to 61 do aImageChunkData[_i]:= LEConvertUInt8From(10 + (_i * 1), _response);
end;

function TBrickletThermalImaging.GetHighContrastImage: TArrayOfUInt8;
var
  _image: TArrayOfUInt8;
  _imageCurrentLength: word;
  _imageLength: word;
  _imageChunkOffset: word;
  _imageChunkData: TArray0To61OfUInt8;
  _imageOutOfSync: boolean;
  _imageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_image, 0);
  streamMutex.Acquire;
  try
    _imageLength:= 4800;
    GetHighContrastImageLowLevel(_imageChunkOffset, _imageChunkData);
    SetLength(_image, _imageLength);

    if (_imageChunkOffset = ((1 shl 16) - 1)) then begin { Maximum chunk offset -> stream has no data }
      SetLength(_image, 0);
      exit;
    end;

    _imageOutOfSync:= (_imageChunkOffset <> 0);

    if ((not _imageOutOfSync) and (_imageLength > 0)) then begin
      _imageChunkLength:= _imageLength - _imageChunkOffset;
      if (_imageChunkLength > 62) then _imageChunkLength:= 62;
      Move(_imageChunkData, _image[0], SizeOf(byte) * _imageChunkLength);
      _imageCurrentLength:= _imageChunkLength;

      while ((not _imageOutOfSync) and (_imageCurrentLength < _imageLength)) do begin
        GetHighContrastImageLowLevel(_imageChunkOffset, _imageChunkData);
        _imageOutOfSync:= _imageChunkOffset <> _imageCurrentLength;
        _imageChunkLength:= _imageLength - _imageChunkOffset;
        if (_imageChunkLength > 62) then _imageChunkLength:= 62;
        Move(_imageChunkData, _image[_imageCurrentLength], SizeOf(byte) * _imageChunkLength);
        Inc(_imageCurrentLength, _imageChunkLength);
      end;
    end;

    if (_imageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_imageChunkOffset + 62 < _imageLength) do begin
        GetHighContrastImageLowLevel(_imageChunkOffset, _imageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Image stream out-of-sync');
    end;
  finally
    streamMutex.Release;
  end;
  Result:= _image;
end;

procedure TBrickletThermalImaging.GetTemperatureImageLowLevel(out aImageChunkOffset: word; out aImageChunkData: TArray0To30OfUInt16);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_TEMPERATURE_IMAGE_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aImageChunkOffset:= LEConvertUInt16From(8, _response);
  for _i:= 0 to 30 do aImageChunkData[_i]:= LEConvertUInt16From(10 + (_i * 2), _response);
end;

function TBrickletThermalImaging.GetTemperatureImage: TArrayOfUInt16;
var
  _image: TArrayOfUInt16;
  _imageCurrentLength: word;
  _imageLength: word;
  _imageChunkOffset: word;
  _imageChunkData: TArray0To30OfUInt16;
  _imageOutOfSync: boolean;
  _imageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_image, 0);
  streamMutex.Acquire;
  try
    _imageLength:= 4800;
    GetTemperatureImageLowLevel(_imageChunkOffset, _imageChunkData);
    SetLength(_image, _imageLength);

    if (_imageChunkOffset = ((1 shl 16) - 1)) then begin { Maximum chunk offset -> stream has no data }
      SetLength(_image, 0);
      exit;
    end;

    _imageOutOfSync:= (_imageChunkOffset <> 0);

    if ((not _imageOutOfSync) and (_imageLength > 0)) then begin
      _imageChunkLength:= _imageLength - _imageChunkOffset;
      if (_imageChunkLength > 31) then _imageChunkLength:= 31;
      Move(_imageChunkData, _image[0], SizeOf(word) * _imageChunkLength);
      _imageCurrentLength:= _imageChunkLength;

      while ((not _imageOutOfSync) and (_imageCurrentLength < _imageLength)) do begin
        GetTemperatureImageLowLevel(_imageChunkOffset, _imageChunkData);
        _imageOutOfSync:= _imageChunkOffset <> _imageCurrentLength;
        _imageChunkLength:= _imageLength - _imageChunkOffset;
        if (_imageChunkLength > 31) then _imageChunkLength:= 31;
        Move(_imageChunkData, _image[_imageCurrentLength], SizeOf(word) * _imageChunkLength);
        Inc(_imageCurrentLength, _imageChunkLength);
      end;
    end;

    if (_imageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_imageChunkOffset + 31 < _imageLength) do begin
        GetTemperatureImageLowLevel(_imageChunkOffset, _imageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Image stream out-of-sync');
    end;
  finally
    streamMutex.Release;
  end;
  Result:= _image;
end;

procedure TBrickletThermalImaging.GetStatistics(out aSpotmeterStatistics: TArray0To3OfUInt16; out aTemperatures: TArray0To3OfUInt16; out aResolution: byte; out affcStatus: byte; out aTemperatureWarning: TArray0To1OfBoolean);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _temperatureWarningBits: array [0..0] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_STATISTICS, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do aSpotmeterStatistics[_i]:= LEConvertUInt16From(8 + (_i * 2), _response);
  for _i:= 0 to 3 do aTemperatures[_i]:= LEConvertUInt16From(16 + (_i * 2), _response);
  aResolution:= LEConvertUInt8From(24, _response);
  affcStatus:= LEConvertUInt8From(25, _response);
  FillChar(_temperatureWarningBits[0], Length(_temperatureWarningBits) * SizeOf(_temperatureWarningBits[0]), 0);
  for _i:= 0 to 0 do _temperatureWarningBits[_i]:= LEConvertUInt8From(26 + (_i * 1), _response);
  for _i:= 0 to 1 do aTemperatureWarning[_i]:= ((_temperatureWarningBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
end;

procedure TBrickletThermalImaging.SetResolution(const aResolution: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_RESOLUTION, 9);
  LEConvertUInt8To(aResolution, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.GetResolution: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_RESOLUTION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermalImaging.SetSpotmeterConfig(const aRegionOfInterest: array of byte);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_SPOTMETER_CONFIG, 12);
  if (Length(aRegionOfInterest) <> 4) then raise EInvalidParameterException.Create('Region Of Interest has to be exactly 4 items long');
  for _i:= 0 to Length(aRegionOfInterest) - 1 do LEConvertUInt8To(aRegionOfInterest[_i], 8 + (_i * 1), _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.GetSpotmeterConfig: TArray0To3OfUInt8;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_SPOTMETER_CONFIG, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do Result[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
end;

procedure TBrickletThermalImaging.SetHighContrastConfig(const aRegionOfInterest: array of byte; const aDampeningFactor: word; const aClipLimit: array of word; const aEmptyCounts: word);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_HIGH_CONTRAST_CONFIG, 20);
  if (Length(aRegionOfInterest) <> 4) then raise EInvalidParameterException.Create('Region Of Interest has to be exactly 4 items long');
  for _i:= 0 to Length(aRegionOfInterest) - 1 do LEConvertUInt8To(aRegionOfInterest[_i], 8 + (_i * 1), _request);
  LEConvertUInt16To(aDampeningFactor, 12, _request);
  if (Length(aClipLimit) <> 2) then raise EInvalidParameterException.Create('Clip Limit has to be exactly 2 items long');
  for _i:= 0 to Length(aClipLimit) - 1 do LEConvertUInt16To(aClipLimit[_i], 14 + (_i * 2), _request);
  LEConvertUInt16To(aEmptyCounts, 18, _request);
  SendRequest(_request);
end;

procedure TBrickletThermalImaging.GetHighContrastConfig(out aRegionOfInterest: TArray0To3OfUInt8; out aDampeningFactor: word; out aClipLimit: TArray0To1OfUInt16; out aEmptyCounts: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_HIGH_CONTRAST_CONFIG, 8);
  _response:= SendRequest(_request);
  for _i:= 0 to 3 do aRegionOfInterest[_i]:= LEConvertUInt8From(8 + (_i * 1), _response);
  aDampeningFactor:= LEConvertUInt16From(12, _response);
  for _i:= 0 to 1 do aClipLimit[_i]:= LEConvertUInt16From(14 + (_i * 2), _response);
  aEmptyCounts:= LEConvertUInt16From(18, _response);
end;

procedure TBrickletThermalImaging.SetImageTransferConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_IMAGE_TRANSFER_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.GetImageTransferConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_IMAGE_TRANSFER_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermalImaging.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletThermalImaging.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletThermalImaging.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermalImaging.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletThermalImaging.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletThermalImaging.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletThermalImaging.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletThermalImaging.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletThermalImaging.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletThermalImaging.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_THERMAL_IMAGING_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletThermalImaging.CallbackWrapperHighContrastImageLowLevel(const aPacket: TDynamicByteArray);
var
  _imageChunkOffset: word;
  _imageChunkData: TArray0To61OfUInt8;
  _imageChunkLength: word;
  _i: longint;
begin
  _imageChunkOffset:= LEConvertUInt16From(8, aPacket);
  for _i:= 0 to 61 do _imageChunkData[_i]:= LEConvertUInt8From(10 + (_i * 1), aPacket);

  _imageChunkLength:= 4800 - _imageChunkOffset;
  if (_imageChunkLength > 62) then begin
    _imageChunkLength:= 62;
  end;
  if (highContrastImageHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_imageChunkOffset = 0) then begin { Stream starts }
      SetLength(highContrastImageHighLevelCallbackState.data, 4800);
      Move(_imageChunkData[0], highContrastImageHighLevelCallbackState.data[0], SizeOf(byte) * _imageChunkLength);
      highContrastImageHighLevelCallbackState.length:= _imageChunkLength;

      if (highContrastImageHighLevelCallbackState.length >= 4800) then begin { Stream complete }
        if (Assigned(highContrastImageCallback)) then begin
          highContrastImageCallback(self, highContrastImageHighLevelCallbackState.data);
        end;
        SetLength(highContrastImageHighLevelCallbackState.data, 0);
        highContrastImageHighLevelCallbackState.data:= nil;
        highContrastImageHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_imageChunkOffset <> highContrastImageHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(highContrastImageHighLevelCallbackState.data, 0);
      highContrastImageHighLevelCallbackState.data:= nil;
      highContrastImageHighLevelCallbackState.length:= 0;
      if (Assigned(highContrastImageCallback)) then begin
        highContrastImageCallback(self, highContrastImageHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_imageChunkData[0], highContrastImageHighLevelCallbackState.data[highContrastImageHighLevelCallbackState.length], SizeOf(byte) * _imageChunkLength);
      Inc(highContrastImageHighLevelCallbackState.length, _imageChunkLength);

      if highContrastImageHighLevelCallbackState.length >= 4800 then begin { Stream complete }
        if (Assigned(highContrastImageCallback)) then begin
          highContrastImageCallback(self, highContrastImageHighLevelCallbackState.data);
        end;
        SetLength(highContrastImageHighLevelCallbackState.data, 0);
        highContrastImageHighLevelCallbackState.data:= nil;
        highContrastImageHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(highContrastImageLowLevelCallback)) then begin
    highContrastImageLowLevelCallback(self, _imageChunkOffset, _imageChunkData);
  end;
end;

procedure TBrickletThermalImaging.CallbackWrapperTemperatureImageLowLevel(const aPacket: TDynamicByteArray);
var
  _imageChunkOffset: word;
  _imageChunkData: TArray0To30OfUInt16;
  _imageChunkLength: word;
  _i: longint;
begin
  _imageChunkOffset:= LEConvertUInt16From(8, aPacket);
  for _i:= 0 to 30 do _imageChunkData[_i]:= LEConvertUInt16From(10 + (_i * 2), aPacket);

  _imageChunkLength:= 4800 - _imageChunkOffset;
  if (_imageChunkLength > 31) then begin
    _imageChunkLength:= 31;
  end;
  if (temperatureImageHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_imageChunkOffset = 0) then begin { Stream starts }
      SetLength(temperatureImageHighLevelCallbackState.data, 4800);
      Move(_imageChunkData[0], temperatureImageHighLevelCallbackState.data[0], SizeOf(word) * _imageChunkLength);
      temperatureImageHighLevelCallbackState.length:= _imageChunkLength;

      if (temperatureImageHighLevelCallbackState.length >= 4800) then begin { Stream complete }
        if (Assigned(temperatureImageCallback)) then begin
          temperatureImageCallback(self, temperatureImageHighLevelCallbackState.data);
        end;
        SetLength(temperatureImageHighLevelCallbackState.data, 0);
        temperatureImageHighLevelCallbackState.data:= nil;
        temperatureImageHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_imageChunkOffset <> temperatureImageHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(temperatureImageHighLevelCallbackState.data, 0);
      temperatureImageHighLevelCallbackState.data:= nil;
      temperatureImageHighLevelCallbackState.length:= 0;
      if (Assigned(temperatureImageCallback)) then begin
        temperatureImageCallback(self, temperatureImageHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_imageChunkData[0], temperatureImageHighLevelCallbackState.data[temperatureImageHighLevelCallbackState.length], SizeOf(word) * _imageChunkLength);
      Inc(temperatureImageHighLevelCallbackState.length, _imageChunkLength);

      if temperatureImageHighLevelCallbackState.length >= 4800 then begin { Stream complete }
        if (Assigned(temperatureImageCallback)) then begin
          temperatureImageCallback(self, temperatureImageHighLevelCallbackState.data);
        end;
        SetLength(temperatureImageHighLevelCallbackState.data, 0);
        temperatureImageHighLevelCallbackState.data:= nil;
        temperatureImageHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(temperatureImageLowLevelCallback)) then begin
    temperatureImageLowLevelCallback(self, _imageChunkOffset, _imageChunkData);
  end;
end;

end.
