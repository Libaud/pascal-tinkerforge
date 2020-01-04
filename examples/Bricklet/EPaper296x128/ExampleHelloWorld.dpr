program ExampleHelloWorld;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletEPaper296x128;

type
  TExample = class
  private
    ipcon: TIPConnection;
    ep: TBrickletEPaper296x128;
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
  ipcon := TIPConnection.Createnil;

  { Create device object }
  ep := TBrickletEPaper296x128.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Use black background }
  ep.FillDisplay(BRICKLET_E_PAPER_296X128_COLOR_BLACK);

  { Write big white "Hello World" in the middle of the screen }
  ep.DrawText(16, 48, BRICKLET_E_PAPER_296X128_FONT_24X32,
              BRICKLET_E_PAPER_296X128_COLOR_WHITE,
              BRICKLET_E_PAPER_296X128_ORIENTATION_HORIZONTAL, 'Hello World');
  ep.Draw;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
