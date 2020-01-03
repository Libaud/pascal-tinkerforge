program ExampleModbusMaster;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletRS485;

type
  TExample = class
  private
    ipcon: TIPConnection;
    rs485: TBrickletRS485;
  public
    procedure ModbusMasterWriteSingleRegisterResponseCB(sender: TBrickletRS485;
                                                        const requestID: byte;
                                                        const exceptionCode: shortint);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS485 Bricklet }

var
  e: TExample;
  expectedRequestID: byte;

{ Callback procedure for Modbus master write single register response callback }
procedure TExample.ModbusMasterWriteSingleRegisterResponseCB(sender: TBrickletRS485;
                                                             const requestID: byte;
                                                             const exceptionCode: shortint);
begin
  WriteLn(Format('Request ID: %d', [requestID]));
  WriteLn(Format('Exception Code: %d', [exceptionCode]));

  if (requestID <> expectedRequestID) then begin
    WriteLn('Error: Unexpected request ID');
  end;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  rs485 := TBrickletRS485.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Set operating mode to Modbus RTU master }
  rs485.SetMode(BRICKLET_RS485_MODE_MODBUS_MASTER_RTU);

  { Modbus specific configuration:
    - slave address = 1 (unused in master mode)
    - master request timeout = 1000ms }
  rs485.SetModbusConfiguration(1, 1000);

  { Register Modbus master write single register response callback to procedure
    ModbusMasterWriteSingleRegisterResponseCB }
  rs485.OnModbusMasterWriteSingleRegisterResponse := {$ifdef FPC}@{$endif}ModbusMasterWriteSingleRegisterResponseCB;

  { Write 65535 to register 42 of slave 17 }
  expectedRequestID := rs485.ModbusMasterWriteSingleRegister(17, 42, 65535);

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
