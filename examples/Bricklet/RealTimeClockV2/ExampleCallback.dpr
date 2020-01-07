program ExampleCallback;

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
    procedure DateTimeCB(sender: TBrickletRealTimeClockV2; const year: word;
                         const month: byte; const day: byte; const hour: byte;
                         const minute: byte; const second: byte; const centisecond: byte;
                         const weekday: byte; const timestamp: int64);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Real-Time Clock Bricklet 2.0 }

var
  e: TExample;

{ Callback procedure for date and time callback }
procedure TExample.DateTimeCB(sender: TBrickletRealTimeClockV2; const year: word;
                              const month: byte; const day: byte; const hour: byte;
                              const minute: byte; const second: byte;
                              const centisecond: byte; const weekday: byte;
                              const timestamp: int64);
begin
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

  WriteLn(Format('Timestamp: %d', [timestamp]));
  WriteLn('');
end;

procedure TExample.Execute;
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

	  { Register date and time callback to procedure DateTimeCB }
	  oBricklet.OnDateTime := {$ifdef FPC}@{$endif}DateTimeCB;

	  { Set period for date and time callback to 5s (5000ms) }
	  oBricklet.SetDateTimeCallbackConfiguration(5000);

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
