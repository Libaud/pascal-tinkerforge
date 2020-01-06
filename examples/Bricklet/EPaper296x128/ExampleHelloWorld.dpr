program ExampleHelloWorld;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletEPaper296x128;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    oBricklet: TBrickletEPaper296x128;
  public
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your E-Paper 296x128 Bricklet }

var
  e: TExample;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection := TIPConnection.Create(nil);

  { Create device object }
  oBricklet := TBrickletEPaper296x128.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Use black background }
  oBricklet.FillDisplay(BRICKLET_E_PAPER_296X128_COLOR_BLACK);

  { Write big white "Hello World" in the middle of the screen }
  oBricklet.DrawText(16, 48, BRICKLET_E_PAPER_296X128_FONT_24X32,
              BRICKLET_E_PAPER_296X128_COLOR_WHITE,
              BRICKLET_E_PAPER_296X128_ORIENTATION_HORIZONTAL, 'Hello World');
  oBricklet.Draw;

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
