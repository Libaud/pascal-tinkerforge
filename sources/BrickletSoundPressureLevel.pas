{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletSoundPressureLevel;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletSoundPressureLevel.inc}

type
  TArray0To29OfUInt16 = array [0..29] of word;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfUInt16 = array of word;

  TSpectrumHighLevelCallbackState = record
    data: TArrayOfUInt16;
    length: word;
  end;

  TBrickletSoundPressureLevel = class;
  TBrickletSoundPressureLevelNotifyDecibel = procedure(aSender: TBrickletSoundPressureLevel; const aDecibel: word) of object;
  TBrickletSoundPressureLevelNotifySpectrumLowLevel = procedure(aSender: TBrickletSoundPressureLevel; const aSpectrumLength: word; const aSpectrumChunkOffset: word;
                                                                const aSpectrumChunkData: TArray0To29OfUInt16) of object;
  TBrickletSoundPressureLevelNotifySpectrum = procedure(aSender: TBrickletSoundPressureLevel; const aSpectrum: TArrayOfUInt16) of object;

  /// <summary>
  ///  Measures Sound Pressure Level in dB(A/B/C/D/Z)
  /// </summary>
  TBrickletSoundPressureLevel = class(TThreadedDevice)
  private
    fSpectrumHighLevelCallbackState: TSpectrumHighLevelCallbackState;
    fDecibelCallback: TBrickletSoundPressureLevelNotifyDecibel;
    fSpectrumLowLevelCallback: TBrickletSoundPressureLevelNotifySpectrumLowLevel;
    fSpectrumCallback: TBrickletSoundPressureLevelNotifySpectrum;
    procedure CallbackWrapperDecibel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperSpectrumLowLevel(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Returns the measured sound pressure in decibels. The values are given in
    ///  dB/10 (tenths dB).
    ///  
    ///  The Bricklet supports the weighting standards dB(A), dB(B), dB(C), dB(D),
    ///  dB(Z) and ITU-R 468. You can configure the weighting with <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/>.
    ///  
    ///  By default dB(A) will be used.
    ///  
    ///  
    ///  If you want to get the value periodically, it is recommended to use the
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.OnDecibel"/> callback. You can set the callback configuration
    ///  with <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetDecibelCallbackConfiguration"/>.
    /// </summary>
    function GetDecibel: word; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.OnDecibel"/> callback is triggered
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
    ///  The `option`-parameter together with min/max sets a threshold for the <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.OnDecibel"/> callback.
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
    procedure SetDecibelCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetDecibelCallbackConfiguration"/>.
    /// </summary>
    procedure GetDecibelCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word); virtual;

    /// <summary>
    ///  Returns the frequency spectrum. The length of the spectrum is between
    ///  512 (FFT size 1024) and 64 (FFT size 128). See <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/>.
    ///

    ///  Each array element is one bin of the FFT. The first bin is always the
    ///  DC offset and the other bins have a size between 40Hz (FFT size 1024) and
    ///  320Hz (FFT size 128).
    ///  
    ///  In sum the frequency of the spectrum always has a range from 0 to
    ///  20480Hz (the FFT is applied to samples with a frequency of 40960Hz).
    ///  
    ///  The returned data is already equalized, which means that the microphone
    ///  frequency _response is compensated and the weighting function is applied
    ///  (see <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/> for the available weighting standards). Use
    ///  dB(Z) if you need the unaltered spectrum.
    ///  
    ///  The values are not in dB form yet. If you want a proper dB scale of the
    ///  spectrum you have to apply the formula f(x) = 20*log10(max(1, x/sqrt(2)))
    ///  on each value.
    /// </summary>
    procedure GetSpectrumLowLevel(out aSpectrumLength: word; out aSpectrumChunkOffset: word; out aSpectrumChunkData: TArray0To29OfUInt16); virtual;

    /// <summary>
    ///  Returns the frequency spectrum. The length of the spectrum is between
    ///  512 (FFT size 1024) and 64 (FFT size 128). See <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/>.
    ///  
    ///  Each array element is one bin of the FFT. The first bin is always the
    ///  DC offset and the other bins have a size between 40Hz (FFT size 1024) and
    ///  320Hz (FFT size 128).
    ///  
    ///  In sum the frequency of the spectrum always has a range from 0 to
    ///  20480Hz (the FFT is applied to samples with a frequency of 40960Hz).
    ///  
    ///  The returned data is already equalized, which means that the microphone
    ///  frequency _response is compensated and the weighting function is applied
    ///  (see <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/> for the available weighting standards). Use
    ///  dB(Z) if you need the unaltered spectrum.
    ///  
    ///  The values are not in dB form yet. If you want a proper dB scale of the
    ///  spectrum you have to apply the formula f(x) = 20*log10(max(1, x/sqrt(2)))
    ///  on each value.
    /// </summary>
    function GetSpectrum: TArrayOfUInt16; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.OnSpectrum"/> callback is
    ///  triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  Every new measured spectrum will be send at most once. Set the period to 1 to
    ///  make sure that you get every spectrum.
    /// </summary>
    procedure SetSpectrumCallbackConfiguration(const aPeriod: longword); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.GetSpectrumCallbackConfiguration"/>.
    /// </summary>
    function GetSpectrumCallbackConfiguration: longword; virtual;

    /// <summary>
    ///  Sets the Sound Pressure Level Bricklet configuration.
    ///

    ///  With different FFT sizes the Bricklet has a different
    ///  amount of samples per second and the size of the FFT bins
    ///  changes. The higher the FFT size the more precise is the Result
    ///  of the dB(X) calculation.
    ///  
    ///  Available FFT sizes are:
    ///  
    ///  * 1024: 512 bins, 10 samples per second, each bin has size 40Hz
    ///  * 512: 256 bins, 20 samples per second, each bin has size 80Hz
    ///  * 256: 128 bins, 40 samples per second, each bin has size 160Hz
    ///  * 128: 64 bins, 80 samples per second, each bin has size 320Hz
    ///  
    ///  The Bricklet supports different weighting functions. You can choose

    ///  between dB(A), dB(B), dB(C), dB(D), dB(Z) and ITU-R 468.
    ///  
    ///  dB(A/B/C/D) are the standard dB weighting curves. dB(A) is
    ///  often used to measure volumes at concerts etc. dB(Z) has a
    ///  flat _response, no weighting is applied. ITU-R 468 is an ITU
    ///  weighting standard mostly used in the UK and Europe.
    ///  
    ///  The defaults are FFT size 1024 and weighting standard dB(A).
    /// </summary>
    procedure SetConfiguration(const afftSize: byte; const aWeighting: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out afftSize: byte; out aWeighting: byte); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetStatusLEDConfig"/>
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
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetDecibelCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.GetDecibel"/>.
    /// </summary>
    property OnDecibel: TBrickletSoundPressureLevelNotifyDecibel read fDecibelCallback write fDecibelCallback;

    /// <summary>
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.OnSpectrum"/>
    /// </summary>
    property OnSpectrumLowLevel: TBrickletSoundPressureLevelNotifySpectrumLowLevel read fSpectrumLowLevelCallback write fSpectrumLowLevelCallback;

    /// <summary>
    ///  This callback is triggered periodically according to the configuration set by
    ///  <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.SetSpectrumCallbackConfiguration"/>.
    ///  
    ///  The parameter is the same as <see cref="BrickletSoundPressureLevel.TBrickletSoundPressureLevel.GetSpectrum"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for spectrum.
    ///  </note>
    /// </summary>
    property OnSpectrum: TBrickletSoundPressureLevelNotifySpectrum read fSpectrumCallback write fSpectrumCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

constructor TBrickletSoundPressureLevel.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(fSpectrumHighLevelCallbackState.data, 0);
  fSpectrumHighLevelCallbackState.data:= nil;
  fSpectrumHighLevelCallbackState.length:= 0;
end;

procedure TBrickletSoundPressureLevel.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletSoundPressureLevel.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_DECIBEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_DECIBEL_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_DECIBEL_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPECTRUM_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_SPECTRUM_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPECTRUM_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletSoundPressureLevel.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_SOUND_PRESSURE_LEVEL_CALLBACK_DECIBEL]:= {$ifdef FPC}@{$endif}CallbackWrapperDecibel;
  aCallBacks[BRICKLET_SOUND_PRESSURE_LEVEL_CALLBACK_SPECTRUM_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperSpectrumLowLevel;
end;

function TBrickletSoundPressureLevel.GetDecibel: word;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_DECIBEL, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt16From(8, _response);
end;

procedure TBrickletSoundPressureLevel.SetDecibelCallbackConfiguration(const aPeriod: longword; const aValueHasToChange: boolean; const aOption: char; const aMin: word; const aMax: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_DECIBEL_CALLBACK_CONFIGURATION, 18);
  LEConvertUInt32To(aPeriod, 8, _request);
  LEConvertBooleanTo(aValueHasToChange, 12, _request);
  LEConvertCharTo(aOption, 13, _request);
  LEConvertUInt16To(aMin, 14, _request);
  LEConvertUInt16To(aMax, 16, _request);
  SendRequest(_request);
end;

procedure TBrickletSoundPressureLevel.GetDecibelCallbackConfiguration(out aPeriod: longword; out aValueHasToChange: boolean; out aOption: char; out aMin: word; out aMax: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_DECIBEL_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aPeriod:= LEConvertUInt32From(8, _response);
  aValueHasToChange:= LEConvertBooleanFrom(12, _response);
  aOption:= LEConvertCharFrom(13, _response);
  aMin:= LEConvertUInt16From(14, _response);
  aMax:= LEConvertUInt16From(16, _response);
end;

procedure TBrickletSoundPressureLevel.GetSpectrumLowLevel(out aSpectrumLength: word; out aSpectrumChunkOffset: word; out aSpectrumChunkData: TArray0To29OfUInt16);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPECTRUM_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aSpectrumLength:= LEConvertUInt16From(8, _response);
  aSpectrumChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 29 do aSpectrumChunkData[_i]:= LEConvertUInt16From(12 + (_i * 2), _response);
end;

function TBrickletSoundPressureLevel.GetSpectrum: TArrayOfUInt16;
var
  _spectrum: TArrayOfUInt16;
  _spectrumCurrentLength: word;
  _spectrumLength: word;
  _spectrumChunkOffset: word;
  _spectrumChunkData: TArray0To29OfUInt16;
  _spectrumOutOfSync: boolean;
  _spectrumChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_spectrum, 0);
  StreamMutex.Acquire;
  try
    _spectrumLength:= 0;
    GetSpectrumLowLevel(_spectrumLength, _spectrumChunkOffset, _spectrumChunkData);
    SetLength(_spectrum, _spectrumLength);
    _spectrumOutOfSync:= (_spectrumChunkOffset <> 0);

    if ((not _spectrumOutOfSync) and (_spectrumLength > 0)) then begin
      _spectrumChunkLength:= _spectrumLength - _spectrumChunkOffset;
      if (_spectrumChunkLength > 30) then _spectrumChunkLength:= 30;
      Move(_spectrumChunkData, _spectrum[0], SizeOf(word) * _spectrumChunkLength);
      _spectrumCurrentLength:= _spectrumChunkLength;

      while ((not _spectrumOutOfSync) and (_spectrumCurrentLength < _spectrumLength)) do begin
        GetSpectrumLowLevel(_spectrumLength, _spectrumChunkOffset, _spectrumChunkData);
        _spectrumOutOfSync:= _spectrumChunkOffset <> _spectrumCurrentLength;
        _spectrumChunkLength:= _spectrumLength - _spectrumChunkOffset;
        if (_spectrumChunkLength > 30) then _spectrumChunkLength:= 30;
        Move(_spectrumChunkData, _spectrum[_spectrumCurrentLength], SizeOf(word) * _spectrumChunkLength);
        Inc(_spectrumCurrentLength, _spectrumChunkLength);
      end;
    end;

    if (_spectrumOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_spectrumChunkOffset + 30 < _spectrumLength) do begin
        GetSpectrumLowLevel(_spectrumLength, _spectrumChunkOffset, _spectrumChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Spectrum stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _spectrum;
end;

procedure TBrickletSoundPressureLevel.SetSpectrumCallbackConfiguration(const aPeriod: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_SPECTRUM_CALLBACK_CONFIGURATION, 12);
  LEConvertUInt32To(aPeriod, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundPressureLevel.GetSpectrumCallbackConfiguration: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPECTRUM_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletSoundPressureLevel.SetConfiguration(const afftSize: byte; const aWeighting: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(afftSize, 8, _request);
  LEConvertUInt8To(aWeighting, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletSoundPressureLevel.GetConfiguration(out afftSize: byte; out aWeighting: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  afftSize:= LEConvertUInt8From(8, _response);
  aWeighting:= LEConvertUInt8From(9, _response);
end;

procedure TBrickletSoundPressureLevel.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletSoundPressureLevel.SetBootloaderMode(const aMode: byte): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletSoundPressureLevel.GetBootloaderMode: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletSoundPressureLevel.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundPressureLevel.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletSoundPressureLevel.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundPressureLevel.GetStatusLEDConfig: byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletSoundPressureLevel.GetChipTemperature: smallint;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletSoundPressureLevel.Reset;
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletSoundPressureLevel.WriteUID(const aUID: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletSoundPressureLevel.ReadUID: longword;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletSoundPressureLevel.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_SOUND_PRESSURE_LEVEL_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletSoundPressureLevel.CallbackWrapperDecibel(const aPacket: TDynamicByteArray);
var
  _decibel: word;
begin
  _decibel:= LEConvertUInt16From(8, aPacket);

  if (Assigned(fDecibelCallback)) then begin
    fDecibelCallback(self, _decibel);
  end;
end;

procedure TBrickletSoundPressureLevel.CallbackWrapperSpectrumLowLevel(const aPacket: TDynamicByteArray);
var
  _spectrumLength: word;
  _spectrumChunkOffset: word;
  _spectrumChunkData: TArray0To29OfUInt16;
  _spectrumChunkLength: word;
  _i: longint;
begin
  _spectrumLength:= LEConvertUInt16From(8, aPacket);
  _spectrumChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 29 do _spectrumChunkData[_i]:= LEConvertUInt16From(12 + (_i * 2), aPacket);

  _spectrumChunkLength:= _spectrumLength - _spectrumChunkOffset;
  if (_spectrumChunkLength > 30) then begin
    _spectrumChunkLength:= 30;
  end;
  if (fSpectrumHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_spectrumChunkOffset = 0) then begin { Stream starts }
      SetLength(fSpectrumHighLevelCallbackState.data, _spectrumLength);
      Move(_spectrumChunkData[0], fSpectrumHighLevelCallbackState.data[0], SizeOf(word) * _spectrumChunkLength);
      fSpectrumHighLevelCallbackState.length:= _spectrumChunkLength;

      if (fSpectrumHighLevelCallbackState.length >= _spectrumLength) then begin { Stream complete }
        if (Assigned(fSpectrumCallback)) then begin
          fSpectrumCallback(self, fSpectrumHighLevelCallbackState.data);
        end;
        SetLength(fSpectrumHighLevelCallbackState.data, 0);
        fSpectrumHighLevelCallbackState.data:= nil;
        fSpectrumHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_spectrumChunkOffset <> fSpectrumHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fSpectrumHighLevelCallbackState.data, 0);
      fSpectrumHighLevelCallbackState.data:= nil;
      fSpectrumHighLevelCallbackState.length:= 0;
      if (Assigned(fSpectrumCallback)) then begin
        fSpectrumCallback(self, fSpectrumHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_spectrumChunkData[0], fSpectrumHighLevelCallbackState.data[fSpectrumHighLevelCallbackState.length], SizeOf(word) * _spectrumChunkLength);
      Inc(fSpectrumHighLevelCallbackState.length, _spectrumChunkLength);

      if fSpectrumHighLevelCallbackState.length >= _spectrumLength then begin { Stream complete }
        if (Assigned(fSpectrumCallback)) then begin
          fSpectrumCallback(self, fSpectrumHighLevelCallbackState.data);
        end;
        SetLength(fSpectrumHighLevelCallbackState.data, 0);
        fSpectrumHighLevelCallbackState.data:= nil;
        fSpectrumHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fSpectrumLowLevelCallback)) then begin
    fSpectrumLowLevelCallback(self, _spectrumLength, _spectrumChunkOffset, _spectrumChunkData);
  end;
end;

end.
