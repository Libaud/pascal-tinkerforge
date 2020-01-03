program ExampleModbusSlave;

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
    procedure ModbusSlaveWriteSingleRegisterRequestCB(sender: TBrickletRS485;
                                                      const requestID: byte;
                                                      const registerAddress: longword;
                                                      const registerValue: word);
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your RS485 Bricklet }

var
  e: TExample;

{ Callback procedure for Modbus slave write single register request callback }
procedure TExample.ModbusSlaveWriteSingleRegisterRequestCB(sender: TBrickletRS485;
                                                           const requestID: byte;
                                                           const registerAddress: longword;
                                                           const registerValue: word);
begin
  WriteLn(Format('Request ID: %d', [requestID]));
  WriteLn(Format('Register Address: %d', [registerAddress]));
  WriteLn(Format('Register Value: %d', [registerValue]));

  if (registerAddress <> 42) then begin
    WriteLn('Error: Invalid register address');
    sender.ModbusSlaveReportException(requestID, BRICKLET_RS485_EXCEPTION_CODE_ILLEGAL_DATA_ADDRESS);
  end
  else begin
    sender.ModbusSlaveAnswerWriteSingleRegisterRequest(requestID);
  end
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

  { Set operating mode to Modbus RTU slave }
  rs485.SetMode(BRICKLET_RS485_MODE_MODBUS_SLAVE_RTU);

  { Modbus specific configuration:
    - slave address = 17
    - master request timeout = 0ms (unused in slave mode) }
  rs485.SetModbusConfiguration(17, 0);

  { Register Modbus slave write single register request callback to procedure
    ModbusSlaveWriteSingleRegisterRequestCB }
  rs485.OnModbusSlaveWriteSingleRegisterRequest := {$ifdef FPC}@{$endif}ModbusSlaveWriteSingleRegisterRequestCB;

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
