{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletEnergyMonitor;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletEnergyMonitor.inc}

type
  TArray0To29OfInt16 = array [0..29] of smallint;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfInt16 = array of smallint;

  TBrickletEnergyMonitor = class;
  TBrickletEnergyMonitorNotifyEnergyData = procedure(aSender: TBrickletEnergyMonitor; const voltage: longint; const current: longint; const energy: longint; const realPower: longint; const apparentPower: longint; const reactivePower: longint; const powerFactor: word; const frequency: word) of object;

  /// <summary>
  ///  Measures Voltage, Current, Energy, Real/Apparent/Reactive Power, Power Factor and Frequency
  /// </summary>
  TBrickletEnergyMonitor = class(TThreadedDevice)
  private
    fEnergyDataCallback: TBrickletEnergyMonitorNotifyEnergyData;
    procedure CallbackWrapperEnergyData(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public

    /// <summary>
    ///  Returns all of the measurements that are done by the Energy Monitor Bricklet.
    ///  
    ///  * Voltage RMS
    ///  * Current RMS
    ///  * Energy (integrated over time)
    ///  * Real Power
    ///  * Apparent Power
    ///  * Reactive Power
    ///  * Power Factor
    ///  * Frequency (AC Frequency of the mains voltage)
    ///  
    ///  The frequency is recalculated every 6 seconds.
    ///  
    ///  All other values are integrated over 10 zero-crossings of the voltage sine wave.
    ///  With a standard AC mains voltage frequency of 50Hz this results in a 5 measurements
    ///  per second (or an integration time of 200ms per measurement).
    ///  
    ///  If no voltage transformer is connected, the Bricklet will use the current waveform
    ///  to calculate the frequency and it will use an integration time of
    ///  10 zero-crossings of the current waveform.
    /// </summary>
    procedure GetEnergyData(out voltage: longint; out current: longint; out energy: longint; out realPower: longint; out apparentPower: longint; out reactivePower: longint; out powerFactor: word; out frequency: word); virtual;

    /// <summary>
    ///  Sets the energy value (see <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.GetEnergyData"/>) back to 0Wh.
    /// </summary>
    procedure ResetEnergy; virtual;

    /// <summary>
    ///  Returns a snapshot of the voltage and current waveform. The values
    ///  in the returned array alternate between voltage and current. The data from
    ///  one getter call contains 768 data points for voltage and current, which
    ///  correspond to about 3 full sine waves.
    ///  
    ///  The voltage is given with a resolution of 100mV and the current is given
    ///  with a resolution of 10mA.
    ///  
    ///  This data is meant to be used for a non-realtime graphical representation of
    ///  the voltage and current waveforms.
    /// </summary>
    procedure GetWaveformLowLevel(out waveformChunkOffset: word; out waveformChunkData: TArray0To29OfInt16); virtual;

    /// <summary>
    ///  Returns a snapshot of the voltage and current waveform. The values
    ///  in the returned array alternate between voltage and current. The data from
    ///  one getter call contains 768 data points for voltage and current, which
    ///  correspond to about 3 full sine waves.
    ///  
    ///  The voltage is given with a resolution of 100mV and the current is given
    ///  with a resolution of 10mA.
    ///  
    ///  This data is meant to be used for a non-realtime graphical representation of
    ///  the voltage and current waveforms.
    /// </summary>
    function GetWaveform: TArrayOfInt16; virtual;

    /// <summary>
    ///  Returns *true* if a voltage/current transformer is connected to the Bricklet.
    /// </summary>
    procedure GetTransformerStatus(out voltageTransformerConnected: boolean; out currentTransformerConnected: boolean); virtual;

    /// <summary>
    ///  Sets the transformer ratio for the voltage and current transformer in 1/100 form.
    ///  
    ///  Example: If your mains voltage is 230V, you use 9V voltage transformer and a
    ///  1V:30A current clamp your voltage ratio is 230/9 = 25.56 and your current ratio
    ///  is 30/1 = 30.
    ///  
    ///  In this case you have to set the values 2556 and 3000 for voltage ratio and current
    ///  ratio.
    ///  
    ///  The calibration is saved in non-volatile memory, you only have to set it once.
    ///  
    ///  Set the phase shift to 0. It is for future use and currently not supported by the Bricklet.
    /// </summary>
    procedure SetTransformerCalibration(const voltageRatio: word; const currentRatio: word; const phaseShift: smallint); virtual;

    /// <summary>
    ///  Returns the transformer calibration as set by <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetTransformerCalibration"/>.
    /// </summary>
    procedure GetTransformerCalibration(out voltageRatio: word; out currentRatio: word; out phaseShift: smallint); virtual;

    /// <summary>
    ///  Calling this function will start an offset calibration. The offset calibration will
    ///  integrate the voltage and current waveform over a longer time period to find the 0
    ///  transition point in the sine wave.
    ///  
    ///  The Bricklet comes with a factory-calibrated offset value, you should not have to
    ///  call this function.
    ///  
    ///  If you want to re-calibrate the offset we recommend that you connect a load that
    ///  has a smooth sinusoidal voltage and current waveform. Alternatively you can also
    ///  short both inputs.
    ///  
    ///  The calibration is saved in non-volatile memory, you only have to set it once.
    /// </summary>
    procedure CalibrateOffset; virtual;

    /// <summary>
    ///  The period is the period with which the <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.OnEnergyData"/>
    ///  callback is triggered periodically. A value of 0 turns the callback off.
    ///  
    ///  If the `value has to change`-parameter is set to true, the callback is only
    ///  triggered after the value has changed. If the value didn't change within the
    ///  period, the callback is triggered immediately on change.
    ///  
    ///  If it is set to false, the callback is continuously triggered with the period,
    ///  independent of the value.
    /// </summary>
    procedure SetEnergyDataCallbackConfiguration(const period: longword; const valueHasToChange: boolean); virtual;

    /// <summary>
    ///  Returns the callback configuration as set by
    ///  <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetEnergyDataCallbackConfiguration"/>.
    /// </summary>
    procedure GetEnergyDataCallbackConfiguration(out period: longword; out valueHasToChange: boolean); virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetStatusLEDConfig"/>
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
    ///  <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.SetEnergyDataCallbackConfiguration"/>.
    ///  
    ///  The parameters are the same as <see cref="BrickletEnergyMonitor.TBrickletEnergyMonitor.GetEnergyData"/>.
    /// </summary>
    property OnEnergyData: TBrickletEnergyMonitorNotifyEnergyData read fEnergyDataCallback write fEnergyDataCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickletEnergyMonitor.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletEnergyMonitor.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_ENERGY_DATA]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_RESET_ENERGY]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_WAVEFORM_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_TRANSFORMER_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_SET_TRANSFORMER_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_TRANSFORMER_CALIBRATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_CALIBRATE_OFFSET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_SET_ENERGY_DATA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_ENERGY_DATA_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_ENERGY_MONITOR_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletEnergyMonitor.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_ENERGY_MONITOR_CALLBACK_ENERGY_DATA]:= {$ifdef FPC}@{$endif}CallbackWrapperEnergyData;
end;

procedure TBrickletEnergyMonitor.GetEnergyData(out voltage: longint; out current: longint; out energy: longint; out realPower: longint; out apparentPower: longint; out reactivePower: longint; out powerFactor: word; out frequency: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_ENERGY_DATA, 8);
  _response:= SendRequest(_request);
  voltage:= LEConvertInt32From(8, _response);
  current:= LEConvertInt32From(12, _response);
  energy:= LEConvertInt32From(16, _response);
  realPower:= LEConvertInt32From(20, _response);
  apparentPower:= LEConvertInt32From(24, _response);
  reactivePower:= LEConvertInt32From(28, _response);
  powerFactor:= LEConvertUInt16From(32, _response);
  frequency:= LEConvertUInt16From(34, _response);
end;

procedure TBrickletEnergyMonitor.ResetEnergy;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_RESET_ENERGY, 8);
  SendRequest(_request);
end;

procedure TBrickletEnergyMonitor.GetWaveformLowLevel(out waveformChunkOffset: word; out waveformChunkData: TArray0To29OfInt16);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_WAVEFORM_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  waveformChunkOffset:= LEConvertUInt16From(8, _response);
  for _i:= 0 to 29 do waveformChunkData[_i]:= LEConvertInt16From(10 + (_i * 2), _response);
end;

function TBrickletEnergyMonitor.GetWaveform: TArrayOfInt16;
var
  waveform: TArrayOfInt16;
  waveformCurrentLength: word;
  waveformLength: word;
  waveformChunkOffset: word;
  waveformChunkData: TArray0To29OfInt16;
  waveformOutOfSync: boolean;
  waveformChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(waveform, 0);
  StreamMutex.Acquire;
  try
    waveformLength:= 1536;
    GetWaveformLowLevel(waveformChunkOffset, waveformChunkData);
    SetLength(waveform, waveformLength);

    if (waveformChunkOffset = ((1 shl 16) - 1)) then begin { Maximum chunk offset -> stream has no data }
      SetLength(waveform, 0);
      exit;
    end;

    waveformOutOfSync:= (waveformChunkOffset <> 0);

    if ((not waveformOutOfSync) and (waveformLength > 0)) then begin
      waveformChunkLength:= waveformLength - waveformChunkOffset;
      if (waveformChunkLength > 30) then waveformChunkLength:= 30;
      Move(waveformChunkData, waveform[0], SizeOf(smallint) * waveformChunkLength);
      waveformCurrentLength:= waveformChunkLength;

      while ((not waveformOutOfSync) and (waveformCurrentLength < waveformLength)) do begin
        GetWaveformLowLevel(waveformChunkOffset, waveformChunkData);
        waveformOutOfSync:= waveformChunkOffset <> waveformCurrentLength;
        waveformChunkLength:= waveformLength - waveformChunkOffset;
        if (waveformChunkLength > 30) then waveformChunkLength:= 30;
        Move(waveformChunkData, waveform[waveformCurrentLength], SizeOf(smallint) * waveformChunkLength);
        Inc(waveformCurrentLength, waveformChunkLength);
      end;
    end;

    if (waveformOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (waveformChunkOffset + 30 < waveformLength) do begin
        GetWaveformLowLevel(waveformChunkOffset, waveformChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Waveform stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= waveform;
end;

procedure TBrickletEnergyMonitor.GetTransformerStatus(out voltageTransformerConnected: boolean; out currentTransformerConnected: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_TRANSFORMER_STATUS, 8);
  _response:= SendRequest(_request);
  voltageTransformerConnected:= LEConvertBooleanFrom(8, _response);
  currentTransformerConnected:= LEConvertBooleanFrom(9, _response);
end;

procedure TBrickletEnergyMonitor.SetTransformerCalibration(const voltageRatio: word; const currentRatio: word; const phaseShift: smallint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_SET_TRANSFORMER_CALIBRATION, 14);
  LEConvertUInt16To(voltageRatio, 8, _request);
  LEConvertUInt16To(currentRatio, 10, _request);
  LEConvertInt16To(phaseShift, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletEnergyMonitor.GetTransformerCalibration(out voltageRatio: word; out currentRatio: word; out phaseShift: smallint);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_TRANSFORMER_CALIBRATION, 8);
  _response:= SendRequest(_request);
  voltageRatio:= LEConvertUInt16From(8, _response);
  currentRatio:= LEConvertUInt16From(10, _response);
  phaseShift:= LEConvertInt16From(12, _response);
end;

procedure TBrickletEnergyMonitor.CalibrateOffset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_CALIBRATE_OFFSET, 8);
  SendRequest(_request);
end;

procedure TBrickletEnergyMonitor.SetEnergyDataCallbackConfiguration(const period: longword; const valueHasToChange: boolean);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_SET_ENERGY_DATA_CALLBACK_CONFIGURATION, 13);
  LEConvertUInt32To(period, 8, _request);
  LEConvertBooleanTo(valueHasToChange, 12, _request);
  SendRequest(_request);
end;

procedure TBrickletEnergyMonitor.GetEnergyDataCallbackConfiguration(out period: longword; out valueHasToChange: boolean);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_ENERGY_DATA_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  period:= LEConvertUInt32From(8, _response);
  valueHasToChange:= LEConvertBooleanFrom(12, _response);
end;

procedure TBrickletEnergyMonitor.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletEnergyMonitor.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletEnergyMonitor.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEnergyMonitor.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletEnergyMonitor.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletEnergyMonitor.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletEnergyMonitor.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletEnergyMonitor.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletEnergyMonitor.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletEnergyMonitor.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletEnergyMonitor.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletEnergyMonitor.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_ENERGY_MONITOR_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletEnergyMonitor.CallbackWrapperEnergyData(const aPacket: TDynamicByteArray);
var voltage: longint; current: longint; energy: longint; realPower: longint; apparentPower: longint; reactivePower: longint; powerFactor: word; frequency: word;
begin
  voltage:= LEConvertInt32From(8, aPacket);
  current:= LEConvertInt32From(12, aPacket);
  energy:= LEConvertInt32From(16, aPacket);
  realPower:= LEConvertInt32From(20, aPacket);
  apparentPower:= LEConvertInt32From(24, aPacket);
  reactivePower:= LEConvertInt32From(28, aPacket);
  powerFactor:= LEConvertUInt16From(32, aPacket);
  frequency:= LEConvertUInt16From(34, aPacket);

  if (Assigned(fEnergyDataCallback)) then begin
    fEnergyDataCallback(self, voltage, current, energy, realPower, apparentPower, reactivePower, powerFactor, frequency);
  end;
end;

end.
