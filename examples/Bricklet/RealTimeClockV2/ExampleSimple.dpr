program ExampleSimple;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRealTimeClockV2;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletRealTimeClockV2;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Real-Time Clock Bricklet 2.0 }

var
  e: TExample;

procedure TExample.Execute;
var year: word; month, day, hour, minute, second, centisecond, weekday: byte;
    timestamp: int64;
begin
  try
	  { Create IP connection }
	  oIPConnection := TIPConnection.Create(nil);

	  { Create device object }
	  oBricklet := TBrickletRealTimeClockV2.Create(nil);
	  oBricklet.UIDString:= UID;
	  oBricklet.IPConnection:= oIPConnection;

	  { Connect to brickd }
	  oIPConnection.Connect(HOST, PORT);
	  { Don't use device before oIPConnection is connected }

	  { Get current date and time }
	  oBricklet.GetDateTime(year, month, day, hour, minute, second, centisecond, weekday,
					  timestamp);

	  WriteLn(Format('Year: %d', [year]));
	  WriteLn(Format('Month: %d', [month]));
	  WriteLn(Format('Day: %d', [day]));
	  WriteLn(Format('Hour: %d', [hour]));
	  WriteLn(Format('Minute: %d', [minute]));
	  WriteLn(Format('Second: %d', [second]));
	  WriteLn(Format('Centisecond: %d', [centisecond]));

	  if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_MONDAY) then begin
		WriteLn('Weekday: Monday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_TUESDAY) then begin
		WriteLn('Weekday: Tuesday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_WEDNESDAY) then begin
		WriteLn('Weekday: Wednesday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_THURSDAY) then begin
		WriteLn('Weekday: Thursday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_FRIDAY) then begin
		WriteLn('Weekday: Friday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_SATURDAY) then begin
		WriteLn('Weekday: Saturday');
	  end
	  else if (weekday = BRICKLET_REAL_TIME_CLOCK_V2_WEEKDAY_SUNDAY) then begin
		WriteLn('Weekday: Sunday');
	  end;

	  WriteLn(Format('Timestamp: %d ms', [timestamp]));

	  WriteLn('Press key to exit');
	  ReadLn;
  finally
	  oBricklet.Destroy;
	  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
  end;
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
