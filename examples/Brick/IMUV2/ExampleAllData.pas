program ExampleAllData;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickIMUV2;

type
  TExample = class
  private
    ipcon: TIPConnection;
    imu: TBrickIMUV2;
  public
    procedure AllDataCB(sender: TBrickIMUV2; const acceleration: TArray0To2OfInt16;
                        const magneticField: TArray0To2OfInt16;
                        const angularVelocity: TArray0To2OfInt16;
                        const eulerAngle: TArray0To2OfInt16;
                        const quaternion: TArray0To3OfInt16;
                        const linearAcceleration: TArray0To2OfInt16;
                        const gravityVector: TArray0To2OfInt16;
                        const temperature: shortint; const calibrationStatus: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XXYYZZ'; { Change XXYYZZ to the UID of your IMU Brick 2.0 }

var
  e: TExample;

{ Callback procedure for all data callback }
procedure TExample.AllDataCB(sender: TBrickIMUV2; const acceleration: TArray0To2OfInt16;
                             const magneticField: TArray0To2OfInt16;
                             const angularVelocity: TArray0To2OfInt16;
                             const eulerAngle: TArray0To2OfInt16;
                             const quaternion: TArray0To3OfInt16;
                             const linearAcceleration: TArray0To2OfInt16;
                             const gravityVector: TArray0To2OfInt16;
                             const temperature: shortint; const calibrationStatus: byte);
begin
  WriteLn(Format('Acceleration [X]: %f m/s²', [acceleration[0]/100.0]));
  WriteLn(Format('Acceleration [Y]: %f m/s²', [acceleration[1]/100.0]));
  WriteLn(Format('Acceleration [Z]: %f m/s²', [acceleration[2]/100.0]));
  WriteLn(Format('Magnetic Field [X]: %f µT', [magneticField[0]/16.0]));
  WriteLn(Format('Magnetic Field [Y]: %f µT', [magneticField[1]/16.0]));
  WriteLn(Format('Magnetic Field [Z]: %f µT', [magneticField[2]/16.0]));
  WriteLn(Format('Angular Velocity [X]: %f °/s', [angularVelocity[0]/16.0]));
  WriteLn(Format('Angular Velocity [Y]: %f °/s', [angularVelocity[1]/16.0]));
  WriteLn(Format('Angular Velocity [Z]: %f °/s', [angularVelocity[2]/16.0]));
  WriteLn(Format('Euler Angle [X]: %f °', [eulerAngle[0]/16.0]));
  WriteLn(Format('Euler Angle [Y]: %f °', [eulerAngle[1]/16.0]));
  WriteLn(Format('Euler Angle [Z]: %f °', [eulerAngle[2]/16.0]));
  WriteLn(Format('Quaternion [W]: %f', [quaternion[0]/16383.0]));
  WriteLn(Format('Quaternion [X]: %f', [quaternion[1]/16383.0]));
  WriteLn(Format('Quaternion [Y]: %f', [quaternion[2]/16383.0]));
  WriteLn(Format('Quaternion [Z]: %f', [quaternion[3]/16383.0]));
  WriteLn(Format('Linear Acceleration [X]: %f m/s²', [linearAcceleration[0]/100.0]));
  WriteLn(Format('Linear Acceleration [Y]: %f m/s²', [linearAcceleration[1]/100.0]));
  WriteLn(Format('Linear Acceleration [Z]: %f m/s²', [linearAcceleration[2]/100.0]));
  WriteLn(Format('Gravity Vector [X]: %f m/s²', [gravityVector[0]/100.0]));
  WriteLn(Format('Gravity Vector [Y]: %f m/s²', [gravityVector[1]/100.0]));
  WriteLn(Format('Gravity Vector [Z]: %f m/s²', [gravityVector[2]/100.0]));
  WriteLn(Format('Temperature: %d °C', [temperature]));
  WriteLn(Format('Calibration Status: %d', [calibrationStatus]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  imu := TBrickIMUV2.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register all data callback to procedure AllDataCB }
  imu.OnAllData := {$ifdef FPC}@{$endif}AllDataCB;

  { Set period for all data callback to 0.1s (100ms) }
  imu.SetAllDataPeriod(100);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
