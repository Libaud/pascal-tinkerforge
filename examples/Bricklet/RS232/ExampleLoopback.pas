program ExampleLoopback;

{ For this example connect the RX1 and TX pin to receive the send message }

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRS232;

type
  TExample = class
  private
    oIPConnection: TIPConnection;
    rs232: TBrickletRS232;
  public
    function StringToCharArray(const message_: string): TArray0To59OfChar;
    function CharArrayToString(const message_: TArray0To59OfChar; const length_: byte): string;
    procedure ReadCB(sender: TBrickletRS232; const message_: TArray0To59OfChar;
                     const length_: byte);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS232 Bricklet }

var
  e: TExample;

{ Convert string to char array with length 60, as needed by write }
function TExample.StringToCharArray(const message_: string): TArray0To59OfChar;
var i: longint;
begin
  FillChar(result, 60, 0);
  for i:= 1 to Length(message_) do begin
    result[i - 1]:= message_[i];
  end;
end;

{ Assume that the message consists of ASCII characters and convert it from
  an array of chars to a string }
function TExample.CharArrayToString(const message_: TArray0To59OfChar; const length_: byte): string;
begin
  SetString(result, PChar(@message_[0]), length_);
end;

{ Callback procedure for read callback }
procedure TExample.ReadCB(sender: TBrickletRS232; const message_: TArray0To59OfChar;
                          const length_: byte);
begin
  WriteLn(Format('Message (Length: %d): "%s"', [length_, CharArrayToString(message_, length_)]));
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  oIPConnection:= TIPConnection.Create(nil);

  { Create device object }
  rs232:= TBrickletRS232.Create(nil);

  { Connect to brickd }
  oIPConnection.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Register read callback to procedure ReadCB }
  rs232.OnRead:= {$ifdef FPC}@{$endif}ReadCB;

  { Enable read callback }
  rs232.EnableReadCallback;

  { Write "test" string }
  rs232.Write(StringToCharArray('test'), 4);

  WriteLn('Press key to exit');
  ReadLn;
  oIPConnection.Destroy; { Calls oIPConnection.Disconnect internally }
end;

begin
  e:= TExample.Create;
  e.Execute;
  e.Destroy;
end.
