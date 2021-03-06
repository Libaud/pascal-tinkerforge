program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletOutdoorWeather;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletOutdoorWeather;
  public
    procedure StationDataCB(sender: TBrickletOutdoorWeather; const identifier: byte;
                            const temperature: smallint; const humidity: byte;
                            const windSpeed: longword; const gustSpeed: longword;
                            const rain: longword; const windDirection: byte;
                            const batteryLow: boolean);
    procedure SensorDataCB(sender: TBrickletOutdoorWeather; const identifier: byte;
                           const temperature: smallint; const humidity: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Outdoor Weather Bricklet }

var
  e: TExample;

{ Callback procedure for station data callback }
procedure TExample.StationDataCB(sender: TBrickletOutdoorWeather; const identifier: byte;
                                 const temperature: smallint; const humidity: byte;
                                 const windSpeed: longword; const gustSpeed: longword;
                                 const rain: longword; const windDirection: byte;
                                 const batteryLow: boolean);
begin
  WriteLn(Format('Identifier (Station): %d', [identifier]));
  WriteLn(Format('Temperature (Station): %f °C', [temperature/10.0]));
  WriteLn(Format('Humidity (Station): %d %%RH', [humidity]));
  WriteLn(Format('Wind Speed (Station): %f m/s', [windSpeed/10.0]));
  WriteLn(Format('Gust Speed (Station): %f m/s', [gustSpeed/10.0]));
  WriteLn(Format('Rain (Station): %f mm', [rain/10.0]));

  if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_N) then begin
    WriteLn('Wind Direction (Station): N');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_NNE) then begin
    WriteLn('Wind Direction (Station): NNE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_NE) then begin
    WriteLn('Wind Direction (Station): NE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_ENE) then begin
    WriteLn('Wind Direction (Station): ENE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_E) then begin
    WriteLn('Wind Direction (Station): E');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_ESE) then begin
    WriteLn('Wind Direction (Station): ESE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_SE) then begin
    WriteLn('Wind Direction (Station): SE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_SSE) then begin
    WriteLn('Wind Direction (Station): SSE');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_S) then begin
    WriteLn('Wind Direction (Station): S');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_SSW) then begin
    WriteLn('Wind Direction (Station): SSW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_SW) then begin
    WriteLn('Wind Direction (Station): SW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_WSW) then begin
    WriteLn('Wind Direction (Station): WSW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_W) then begin
    WriteLn('Wind Direction (Station): W');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_WNW) then begin
    WriteLn('Wind Direction (Station): WNW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_NW) then begin
    WriteLn('Wind Direction (Station): NW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_NNW) then begin
    WriteLn('Wind Direction (Station): NNW');
  end
  else if (windDirection = BRICKLET_OUTDOOR_WEATHER_WIND_DIRECTION_ERROR) then begin
    WriteLn('Wind Direction (Station): Error');
  end;

  WriteLn(Format('Battery Low (Station): %d', [batteryLow]));
  WriteLn('');
end;

{ Callback procedure for sensor data callback }
procedure TExample.SensorDataCB(sender: TBrickletOutdoorWeather; const identifier: byte;
                                const temperature: smallint; const humidity: byte);
begin
  WriteLn(Format('Identifier (Sensor): %d', [identifier]));
  WriteLn(Format('Temperature (Sensor): %f °C', [temperature/10.0]));
  WriteLn(Format('Humidity (Sensor): %d %%RH', [humidity]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  try
    { Create IP connection }
    oIPConnection:= TIPConnection.Create(nil);

    { Create device object }
    oBricklet:= TBrickletOutdoorWeather.Create(nil);

    { Connect to brickd }
    oIPConnection.Connect(HOST, PORT);
    { Don't use device before ipcon is connected }

    { Enable station data callbacks }
    oBricklet.SetStationCallbackConfiguration(true);

    { Enable sensor data callbacks }
    oBricklet.SetSensorCallbackConfiguration(true);

    { Register station data callback to procedure StationDataCB }
    oBricklet.OnStationData:= {$ifdef FPC}@{$endif}StationDataCB;

    { Register sensor data callback to procedure SensorDataCB }
    oBricklet.OnSensorData:= {$ifdef FPC}@{$endif}SensorDataCB;

    WriteLn('Press key to exit');
    ReadLn;
  finally
    oBricklet.Destroy;
    oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
