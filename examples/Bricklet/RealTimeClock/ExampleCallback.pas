program ExampleCallback;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRealTimeClock;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    rtc: TBrickletRealTimeClock;
  public
    procedure DateTimeCB(sender: TBrickletRealTimeClock; const year: word;
                         const month: byte; const day: byte; const hour: byte;
                         const minute: byte; const second: byte; const centisecond: byte;
                         const weekday: byte; const timestamp: int64);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Real-Time Clock Bricklet }

var
  e: TExample;

{ Callback procedure for date and time callback }
procedure TExample.DateTimeCB(sender: TBrickletRealTimeClock; const year: word;
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

  if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_MONDAY) then begin
    WriteLn('Weekday: Monday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_TUESDAY) then begin
    WriteLn('Weekday: Tuesday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_WEDNESDAY) then begin
    WriteLn('Weekday: Wednesday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_THURSDAY) then begin
    WriteLn('Weekday: Thursday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_FRIDAY) then begin
    WriteLn('Weekday: Friday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_SATURDAY) then begin
    WriteLn('Weekday: Saturday');
  end
  else if (weekday = BRICKLET_REAL_TIME_CLOCK_WEEKDAY_SUNDAY) then begin
    WriteLn('Weekday: Sunday');
  end;

  WriteLn(Format('Timestamp: %d', [timestamp]));
  WriteLn('');
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  rtc:= TBrickletRealTimeClock.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register date and time callback to procedure DateTimeCB }
  rtc.OnDateTime:= {$ifdef FPC}@{$endif}DateTimeCB;

  { Set period for date and time callback to 5s (5000ms)
    Note: The date and time callback is only called every 5 seconds
          if the date and time has changed since the last call! }
  rtc.SetDateTimeCallbackPeriod(5000);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
