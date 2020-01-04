program ExampleThreshold;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletDistanceUS;

type
  TExample = class
  private
    ipcon: TIPConnection;
    dus: TBrickletDistanceUS;
  public
    procedure DistanceReachedCB(sender: TBrickletDistanceUS; const distance: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your Distance US Bricklet }

var
  e: TExample;

{ Callback procedure for distance value reached callback }
procedure TExample.DistanceReachedCB(sender: TBrickletDistanceUS; const distance: word);
begin
  WriteLn(Format('Distance Value: %d', [distance]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Createnil;

  { Create device object }
  dus := TBrickletDistanceUS.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Get threshold callbacks with a debounce time of 10 seconds (10000ms) }
  dus.SetDebouncePeriod(10000);

  { Register distance value reached callback to procedure DistanceReachedCB }
  dus.OnDistanceReached := {$ifdef FPC}@{$endif}DistanceReachedCB;

  { Configure threshold for distance value "smaller than 200" }
  dus.SetDistanceCallbackThreshold('<', 200, 0);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
