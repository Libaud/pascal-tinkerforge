{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit tinkerforge;

{$warn 5023 off : no warning about unused units}
interface

uses
  Base58, BlockingQueue, BrickDaemon, BrickDC, BrickHAT, BrickHATZero, 
  BrickIMU, BrickIMUV2, BrickletAccelerometer, BrickletAccelerometerV2, 
  BrickletAirQuality, BrickletAmbientLight, BrickletAmbientLightV2, 
  BrickletAmbientLightV3, BrickletAnalogIn, BrickletAnalogInV2, 
  BrickletAnalogInV3, BrickletAnalogOut, BrickletAnalogOutV2, 
  BrickletAnalogOutV3, BrickletBarometer, BrickletBarometerV2, BrickletCAN, 
  BrickletCANV2, BrickletCO2, BrickletCO2V2, BrickletColor, BrickletColorV2, 
  BrickletCompass, BrickletCurrent12, BrickletCurrent25, BrickletDistanceIR, 
  BrickletDistanceIRV2, BrickletDistanceUS, BrickletDistanceUSV2, BrickletDMX, 
  BrickletDualButton, BrickletDualButtonV2, BrickletDualRelay, 
  BrickletDustDetector, BrickletEnergyMonitor, BrickletEPaper296x128, 
  BrickletGPS, BrickletGPSV2, BrickletHallEffect, BrickletHallEffectV2, 
  BrickletHumidity, BrickletHumidityV2, BrickletIndustrialAnalogOut, 
  BrickletIndustrialAnalogOutV2, BrickletIndustrialCounter, 
  BrickletIndustrialDigitalIn4, BrickletIndustrialDigitalIn4V2, 
  BrickletIndustrialDigitalOut4, BrickletIndustrialDigitalOut4V2, 
  BrickletIndustrialDual020mA, BrickletIndustrialDual020mAV2, 
  BrickletIndustrialDualAnalogIn, BrickletIndustrialDualAnalogInV2, 
  BrickletIndustrialDualRelay, BrickletIndustrialQuadRelay, 
  BrickletIndustrialQuadRelayV2, BrickletIO4, BrickletIO4V2, BrickletIO16, 
  BrickletIO16V2, BrickletIsolator, BrickletJoystick, BrickletJoystickV2, 
  BrickletLaserRangeFinder, BrickletLaserRangeFinderV2, BrickletLCD16x2, 
  BrickletLCD20x4, BrickletLCD128x64, BrickletLEDStrip, BrickletLEDStripV2, 
  BrickletLine, BrickletLinearPoti, BrickletLinearPotiV2, BrickletLoadCell, 
  BrickletLoadCellV2, BrickletMoisture, BrickletMotionDetector, 
  BrickletMotionDetectorV2, BrickletMotorizedLinearPoti, BrickletMultiTouch, 
  BrickletMultiTouchV2, BrickletNFC, BrickletNFCRFID, BrickletOLED64x48, 
  BrickletOLED128x64, BrickletOLED128x64V2, BrickletOneWire, 
  BrickletOutdoorWeather, BrickletParticulateMatter, BrickletPiezoBuzzer, 
  BrickletPiezoSpeaker, BrickletPiezoSpeakerV2, BrickletPTC, BrickletPTCV2, 
  BrickletRealTimeClock, BrickletRealTimeClockV2, BrickletRemoteSwitch, 
  BrickletRemoteSwitchV2, BrickletRGBLED, BrickletRGBLEDButton, 
  BrickletRGBLEDMatrix, BrickletRGBLEDV2, BrickletRotaryEncoder, 
  BrickletRotaryEncoderV2, BrickletRotaryPoti, BrickletRotaryPotiV2, 
  BrickletRS232, BrickletRS232V2, BrickletRS485, BrickletSegmentDisplay4x7, 
  BrickletSegmentDisplay4x7V2, BrickletSolidStateRelay, 
  BrickletSolidStateRelayV2, BrickletSoundIntensity, 
  BrickletSoundPressureLevel, BrickletTemperature, BrickletTemperatureIR, 
  BrickletTemperatureIRV2, BrickletTemperatureV2, BrickletThermalImaging, 
  BrickletThermocouple, BrickletThermocoupleV2, BrickletTilt, BrickletUVLight, 
  BrickletUVLightV2, BrickletVoltage, BrickletVoltageCurrent, 
  BrickletVoltageCurrentV2, BrickletXMC1400Breakout, BrickMaster, BrickRED, 
  BrickServo, BrickSilentStepper, BrickStepper, Device, DeviceAbstract, 
  DeviceBase, DeviceTable, IPConnection, LEConverter, SHAone, ThreadedDevice, 
  TimedSemaphore, TinkerforgeCommon, TinkerforgeExceptions, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('tinkerforge', @Register);
end.
