unit RegisterTinkerforgePackage;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, BrickDC, BrickHAT, BrickHATZero, BrickIMU,
  BrickIMUV2, BrickletAccelerometer, BrickletAccelerometerV2,
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
  BrickServo, BrickSilentStepper, BrickStepper, IPConnection
  {$ifdef TYPHON}, TyphonPackageIntf{$endif};

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Tinkerforge', [TIPConnection, TBrickletVoltage, TBrickletLCD16x2, TBrickletLEDStripV2, TBrickletRotaryEncoderV2,
                                     TBrickletMoisture, TBrickletAnalogOutV2, TBrickletCANV2, TBrickletDMX, TBrickletRemoteSwitch,
                                     TBrickletCurrent25, TBrickletLCD128x64, TBrickletJoystick, TBrickletUVLightV2,
                                     TBrickletSegmentDisplay4x7V2, TBrickletGPS, TBrickletBarometerV2, TBrickletVoltageCurrent,
                                     TBrickletMultiTouch, TBrickletPiezoSpeaker, TBrickStepper, TBrickletHumidityV2,
                                     TBrickletThermocoupleV2, TBrickletAnalogOut, TBrickletLCD20x4, TBrickletAmbientLightV2,
                                     TBrickletColorV2, TBrickletPTC, TBrickletCAN, TBrickletIndustrialDualRelay,
                                     TBrickletDistanceIRV2, TBrickletLEDStrip, TBrickletThermalImaging, TBrickletIndustrialDigitalIn4V2,
                                     TBrickletEnergyMonitor, TBrickletSoundPressureLevel, TBrickletDistanceUSV2, TBrickletAnalogInV2,
                                     TBrickIMU, TBrickletNFC, TBrickletLine, TBrickletIndustrialDualAnalogInV2, TBrickRED, TBrickDC,
                                     TBrickletRGBLEDButton, TBrickletParticulateMatter, TBrickServo, TBrickletMotorizedLinearPoti,
                                     TBrickletRealTimeClock, TBrickletDistanceIR, TBrickletAmbientLightV3, TBrickletRGBLED,
                                     TBrickletDustDetector, TBrickletSoundIntensity, TBrickletBarometer, TBrickletTemperatureV2,
                                     TBrickletAnalogIn, TBrickletRGBLEDV2, TBrickletSolidStateRelay, TBrickletRotaryEncoder,
                                     TBrickSilentStepper, TBrickletIO4, TBrickletCurrent12, TBrickletMotionDetector,
                                     TBrickletNFCRFID, TBrickletXMC1400Breakout, TBrickletCompass, TBrickletTemperatureIR,
                                     TBrickletIndustrialAnalogOutV2, TBrickletVoltageCurrentV2, TBrickletPiezoSpeakerV2,
                                     TBrickHATZero, TBrickletUVLight, TBrickletRotaryPotiV2, TBrickletDualButton,
                                     TBrickletHallEffectV2, TBrickletIndustrialQuadRelayV2, TBrickletPiezoBuzzer,
                                     TBrickletIndustrialDigitalOut4V2, TBrickletIO16, TBrickletAnalogInV3,
                                     TBrickletIndustrialDual020mAV2, TBrickletThermocouple, TBrickletIO4V2,
                                     TBrickletHumidity, TBrickletRotaryPoti, TBrickletOutdoorWeather,
                                     TBrickletRS485, TBrickletTilt, TBrickletGPSV2, TBrickletAirQuality,
                                     TBrickletHallEffect, TBrickletLaserRangeFinder, TBrickletAccelerometerV2,
                                     TBrickletMultiTouchV2, TBrickletIndustrialQuadRelay, TBrickletLinearPoti,
                                     TBrickletIndustrialAnalogOut, TBrickIMUV2, TBrickMaster, TBrickletIndustrialCounter,
                                     TBrickletSegmentDisplay4x7, TBrickletDistanceUS, TBrickletLinearPotiV2, TBrickletIndustrialDigitalIn4,
                                     TBrickletColor, TBrickletPTCV2, TBrickletRGBLEDMatrix, TBrickletCO2V2, TBrickletLoadCell,
                                     TBrickletIO16V2, TBrickletCO2, TBrickletSolidStateRelayV2, TBrickletRS232V2,
                                     TBrickletRemoteSwitchV2, TBrickletMotionDetectorV2, TBrickletRS232, TBrickletDualRelay,
                                     TBrickletDualButtonV2, TBrickletLaserRangeFinderV2, TBrickletIndustrialDual020mA,
                                     TBrickletIndustrialDualAnalogIn, TBrickletRealTimeClockV2, TBrickletOneWire,
                                     TBrickletIndustrialDigitalOut4, TBrickletJoystickV2, TBrickletAnalogOutV3,
                                     TBrickletAccelerometer, TBrickletOLED64x48, TBrickletTemperature, TBrickletOLED128x64V2,
                                     TBrickletEPaper296x128, TBrickHAT, TBrickletLoadCellV2, TBrickletAmbientLight,
                                     TBrickletOLED128x64, TBrickletTemperatureIRV2, TBrickletIsolator]);
end;

end.

