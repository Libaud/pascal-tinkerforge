{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletRS485;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletRS485.inc}

type
  TArray0To26OfUInt16 = array [0..26] of word;
  TArray0To28OfUInt16 = array [0..28] of word;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To439OfBoolean = array [0..439] of boolean;
  TArray0To463OfBoolean = array [0..463] of boolean;
  TArray0To471OfBoolean = array [0..471] of boolean;
  TArray0To59OfChar = array [0..59] of char;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfBoolean = array of boolean;
  TArrayOfChar = array of char;
  TArrayOfUInt16 = array of word;

  TReadHighLevelCallbackState = record data: TArrayOfChar; length: word; end;
  TModbusMasterReadCoils_responseHighLevelCallbackState = record data: TArrayOfBoolean; length: word; end;
  TModbusMasterReadHoldingRegisters_responseHighLevelCallbackState = record data: TArrayOfUInt16; length: word; end;
  TModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState = record data: TArrayOfBoolean; length: word; end;
  TModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState = record data: TArrayOfUInt16; length: word; end;
  TModbusMasterReadDiscreteInputs_responseHighLevelCallbackState = record data: TArrayOfBoolean; length: word; end;
  TModbusMasterReadInputRegisters_responseHighLevelCallbackState = record data: TArrayOfUInt16; length: word; end;

  TBrickletRS485 = class;
  TBrickletRS485NotifyReadLowLevel = procedure(aSender: TBrickletRS485; const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar) of object;
  TBrickletRS485NotifyRead = procedure(aSender: TBrickletRS485; const message: TArrayOfChar) of object;
  TBrickletRS485NotifyErrorCount = procedure(aSender: TBrickletRS485; const overrunErrorCount: longword; const parityErrorCount: longword) of object;
  TBrickletRS485NotifyModbusSlaveReadCoils_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const count: word) of object;
  TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To463OfBoolean) of object;
  TBrickletRS485NotifyModbusMasterReadCoils_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const coils: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const count: word) of object;
  TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const holdingRegistersLength: word; const holdingRegistersChunkOffset: word; const holdingRegistersChunkData: TArray0To28OfUInt16) of object;
  TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const holdingRegisters: TArrayOfUInt16) of object;
  TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const coilAddress: longword; const coilValue: boolean) of object;
  TBrickletRS485NotifyModbusMasterWriteSingleCoil_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const registerAddress: longword; const registerValue: word) of object;
  TBrickletRS485NotifyModbusMasterWriteSingleRegister_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To439OfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const coils: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const registersLength: word; const registersChunkOffset: word; const registersChunkData: TArray0To26OfUInt16) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const registers: TArrayOfUInt16) of object;
  TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const count: word) of object;
  TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const discreteInputsLength: word; const discreteInputsChunkOffset: word; const discreteInputsChunkData: TArray0To463OfBoolean) of object;
  TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const discreteInputs: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveReadInputRegisters_request = procedure(aSender: TBrickletRS485; const _requestID: byte; const startingAddress: longword; const count: word) of object;
  TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const inputRegistersLength: word; const inputRegistersChunkOffset: word; const inputRegistersChunkData: TArray0To28OfUInt16) of object;
  TBrickletRS485NotifyModbusMasterReadInputRegisters_response = procedure(aSender: TBrickletRS485; const _requestID: byte; const exceptionCode: shortint; const inputRegisters: TArrayOfUInt16) of object;

  /// <summary>
  ///  Communicates with RS485/Modbus devices with full- or half-duplex
  /// </summary>
  TBrickletRS485 = class(TThreadedDevice)
  private
    fReadHighLevelCallbackState: TReadHighLevelCallbackState;
    modbusMasterReadCoils_responseHighLevelCallbackState: TModbusMasterReadCoils_responseHighLevelCallbackState;
    modbusMasterReadHoldingRegisters_responseHighLevelCallbackState: TModbusMasterReadHoldingRegisters_responseHighLevelCallbackState;
    modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState: TModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState;
    modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState: TModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState;
    modbusMasterReadDiscreteInputs_responseHighLevelCallbackState: TModbusMasterReadDiscreteInputs_responseHighLevelCallbackState;
    modbusMasterReadInputRegisters_responseHighLevelCallbackState: TModbusMasterReadInputRegisters_responseHighLevelCallbackState;
    readLowLevelCallback: TBrickletRS485NotifyReadLowLevel;
    readCallback: TBrickletRS485NotifyRead;
    errorCountCallback: TBrickletRS485NotifyErrorCount;
    modbusSlaveReadCoils_requestCallback: TBrickletRS485NotifyModbusSlaveReadCoils_request;
    modbusMasterReadCoils_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel;
    modbusMasterReadCoils_responseCallback: TBrickletRS485NotifyModbusMasterReadCoils_response;
    modbusSlaveReadHoldingRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request;
    modbusMasterReadHoldingRegisters_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel;
    modbusMasterReadHoldingRegisters_responseCallback: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response;
    modbusSlaveWriteSingleCoil_requestCallback: TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request;
    modbusMasterWriteSingleCoil_responseCallback: TBrickletRS485NotifyModbusMasterWriteSingleCoil_response;
    modbusSlaveWriteSingleRegister_requestCallback: TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request;
    modbusMasterWriteSingleRegister_responseCallback: TBrickletRS485NotifyModbusMasterWriteSingleRegister_response;
    modbusSlaveWriteMultipleCoils_requestLowLevelCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel;
    modbusSlaveWriteMultipleCoils_requestCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request;
    modbusMasterWriteMultipleCoils_responseCallback: TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response;
    modbusSlaveWriteMultipleRegisters_requestLowLevelCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel;
    modbusSlaveWriteMultipleRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request;
    modbusMasterWriteMultipleRegisters_responseCallback: TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response;
    modbusSlaveReadDiscreteInputs_requestCallback: TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request;
    modbusMasterReadDiscreteInputs_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel;
    modbusMasterReadDiscreteInputs_responseCallback: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response;
    modbusSlaveReadInputRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveReadInputRegisters_request;
    modbusMasterReadInputRegisters_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel;
    modbusMasterReadInputRegisters_responseCallback: TBrickletRS485NotifyModbusMasterReadInputRegisters_response;
    procedure CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperErrorCount(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveReadCoils_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterReadCoils_responseLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveReadHoldingRegisters_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterReadHoldingRegisters_responseLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveWriteSingleCoil_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterWriteSingleCoil_response(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveWriteSingleRegister_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterWriteSingleRegister_response(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveWriteMultipleCoils_requestLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterWriteMultipleCoils_response(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveWriteMultipleRegisters_requestLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterWriteMultipleRegisters_response(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveReadDiscreteInputs_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterReadDiscreteInputs_responseLowLevel(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusSlaveReadInputRegisters_request(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperModbusMasterReadInputRegisters_responseLowLevel(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Writes characters to the RS485 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS485.TBrickletRS485.SetRS485Configuration"/> for configuration possibilities
    ///  regarding baudrate, parity and so on.
    /// </summary>
    function WriteLowLevel(const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar): byte; virtual;

    /// <summary>
    ///  Writes characters to the RS485 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS485.TBrickletRS485.SetRS485Configuration"/> for configuration possibilities
    ///  regarding baudrate, parity and so on.
    /// </summary>
    function Write(const message: array of char): word; virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/> and <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    /// </summary>
    procedure ReadLowLevel(const length_: word; out messageLength: word; out messageChunkOffset: word; out messageChunkData: TArray0To59OfChar); virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/> and <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    /// </summary>
    function Read(const length_: word): TArrayOfChar; virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableReadCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableReadCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback is enabled,
    ///  *false* otherwise.
    /// </summary>
    function IsReadCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the configuration for the RS485 communication. Available options:
    ///  
    ///  * Baudrate between 100 and 2000000 baud.
    ///  * Parity of none, odd or even.
    ///  * Stopbits can be 1 or 2.
    ///  * Word length of 5 to 8.
    ///  * Half- or Full-Duplex.
    ///  
    ///  The default is: 115200 baud, parity none, 1 stop bit, word length 8, half duplex.
    /// </summary>
    procedure SetRS485Configuration(const baudrate: longword; const parity: byte; const stopbits: byte; const wordlength: byte; const duplex: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetRS485Configuration"/>.
    /// </summary>
    procedure GetRS485Configuration(out baudrate: longword; out parity: byte; out stopbits: byte; out wordlength: byte; out duplex: byte); virtual;

    /// <summary>
    ///  Sets the configuration for the RS485 Modbus communication. Available options:
    ///  
    ///  * Slave Address: Address to be used as the Modbus slave address in Modbus slave mode. Valid Modbus slave address range is 1 to 247.
    ///  * Master _request Timeout: Specifies how long the master should wait for a _response from a slave in milliseconds when in Modbus master mode.
    ///  
    ///  The default is: Slave Address = 1 and Master _request Timeout = 1000 milliseconds (1 second).
    /// </summary>
    procedure SetModbusConfiguration(const slaveAddress: byte; const master_requestTimeout: longword); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    procedure GetModbusConfiguration(out slaveAddress: byte; out master_requestTimeout: longword); virtual;

    /// <summary>
    ///  Sets the mode of the Bricklet in which it operates. Available options are
    ///  
    ///  * RS485,
    ///  * Modbus Master RTU and
    ///  * Modbus Slave RTU.
    ///  
    ///  The default is: RS485 mode.
    /// </summary>
    procedure SetMode(const aMode: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetMode"/>.
    /// </summary>
    function GetMode: byte; virtual;

    /// <summary>
    ///  Sets the communication LED configuration. By default the LED shows RS485
    ///  communication traffic by flickering.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetCommunicationLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetCommunicationLEDConfig"/>
    /// </summary>
    function GetCommunicationLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the error LED configuration.
    ///  
    ///  By default the error LED turns on if there is any error (see <see cref="BrickletRS485.TBrickletRS485.OnErrorCount"/>
    ///  callback). If you call this function with the SHOW ERROR option again, the LED
    ///  will turn off until the next error occurs.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetErrorLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetErrorLEDConfig"/>.
    /// </summary>
    function GetErrorLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the send and receive buffer size in byte. In sum there is
    ///  10240 byte (10kb) buffer available and the minimum buffer size
    ///  is 1024 byte (1kb) for both.
    ///  
    ///  The current buffer content is lost if this function is called.
    ///  
    ///  The send buffer holds data that was given by <see cref="BrickletRS485.TBrickletRS485.Write"/> and
    ///  could not be written yet. The receive buffer holds data that is
    ///  received through RS485 but could not yet be send to the
    ///  user, either by <see cref="BrickletRS485.TBrickletRS485.Read"/> or through <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    ///  
    ///  The default configuration is 5120 byte (5kb) per buffer.
    /// </summary>
    procedure SetBufferConfig(const sendBufferSize: word; const receiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the buffer configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetBufferConfig"/>.
    /// </summary>
    procedure GetBufferConfig(out sendBufferSize: word; out receiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the currently used bytes for the send and received buffer.
    ///  
    ///  See <see cref="BrickletRS485.TBrickletRS485.SetBufferConfig"/> for buffer size configuration.
    /// </summary>
    procedure GetBufferStatus(out sendBufferUsed: word; out receiveBufferUsed: word); virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletRS485.TBrickletRS485.OnErrorCount"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableErrorCountCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletRS485.TBrickletRS485.OnErrorCount"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableErrorCountCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletRS485.TBrickletRS485.OnErrorCount"/> callback is enabled,
    ///  *false* otherwise.
    /// </summary>
    function IsErrorCountCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the current number of overrun and parity errors.
    /// </summary>
    procedure GetErrorCount(out overrunErrorCount: longword; out parityErrorCount: longword); virtual;

    /// <summary>
    ///  Returns the current number of errors occurred in Modbus mode.
    ///  
    ///  * Timeout Error Count: Number of timeouts occurred.
    ///  * Checksum Error Count: Number of failures due to Modbus frame CRC16 checksum mismatch.
    ///  * Frame Too Big Error Count: Number of times frames were rejected because they exceeded maximum Modbus frame size which is 256 bytes.
    ///  * Illegal Function Error Count: Number of errors when an unimplemented or illegal function is _requested. This corresponds to Modbus exception code 1.
    ///  * Illegal Data Address Error Count: Number of errors due to invalid data address. This corresponds to Modbus exception code 2.
    ///  * Illegal Data Value Error Count: Number of errors due to invalid data value. This corresponds to Modbus exception code 3.
    ///  * Slave Device Failure Error Count: Number of errors occurred on the slave device which were unrecoverable. This corresponds to Modbus exception code 4.
    /// </summary>
    procedure GetModbusCommonErrorCount(out timeoutErrorCount: longword; out checksumErrorCount: longword; out frameTooBigErrorCount: longword; out illegalFunctionErrorCount: longword; out illegalDataAddressErrorCount: longword; out illegalDataValueErrorCount: longword; out slaveDeviceFailureErrorCount: longword); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to report a Modbus exception for
    ///  a Modbus master _request.
    ///  
    ///  * _request ID: _request ID of the _request received by the slave.
    ///  * Exception Code: Modbus exception code to report to the Modbus master.
    /// </summary>
    procedure ModbusSlaveReportException(const _requestID: byte; const exceptionCode: shortint); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read coils.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Coils: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadCoils_request"/> callback
    ///  with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadCoils_requestLowLevel(const _requestID: byte; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To471OfBoolean); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read coils.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Coils: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadCoils_request"/> callback
    ///  with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadCoils_request(const _requestID: byte; const coils: array of boolean); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to read coils from a slave. This
    ///  function creates a Modbus function code 1 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first coil to read. For backwards compatibility reasons this parameter is called Starting Address. It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  * Count: Number of coils to read.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadCoils_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be
    ///  matched with the _request ID returned from this function to verify that the callback
    ///  is indeed for a particular _request.
    /// </summary>
    function ModbusMasterReadCoils(const slaveAddress: byte; const startingAddress: longword; const count: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read holding registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Holding Registers: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadHoldingRegisters_request"/>
    ///  callback with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(const _requestID: byte; const holdingRegistersLength: word; const holdingRegistersChunkOffset: word; const holdingRegistersChunkData: TArray0To28OfUInt16); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read holding registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Holding Registers: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadHoldingRegisters_request"/>
    ///  callback with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadHoldingRegisters_request(const _requestID: byte; const holdingRegisters: array of word); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to read holding registers from a slave.
    ///  This function creates a Modbus function code 3 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first holding register to read. For backwards compatibility reasons this parameter is called Starting Address. It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is implicit and must be omitted.
    ///  * Count: Number of holding registers to read.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadHoldingRegisters_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterReadHoldingRegisters(const slaveAddress: byte; const startingAddress: longword; const count: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write a single coil.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteSingleCoil_request"/>
    ///  callback with the _request ID as provided by the arguments of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteSingleCoil_request(const _requestID: byte); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write a single coil of a slave.
    ///  This function creates a Modbus function code 5 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Coil Address: Number of the coil to be written. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  * Coil Value: Value to be written.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteSingleCoil_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteSingleCoil(const slaveAddress: byte; const coilAddress: longword; const coilValue: boolean): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write a single register.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteSingleRegister_request"/>
    ///  callback with the _request ID, Register Address and Register Value as provided by
    ///  the arguments of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteSingleRegister_request(const _requestID: byte); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write a single holding register of a
    ///  slave. This function creates a Modbus function code 6 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Register Address: Number of the holding register to be written. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is implicit and must be omitted.
    ///  * Register Value: Value to be written.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteSingleRegister_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteSingleRegister(const slaveAddress: byte; const registerAddress: longword; const registerValue: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write multiple coils.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleCoils_request"/>
    ///  callback with the _request ID of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteMultipleCoils_request(const _requestID: byte); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write multiple coils of a slave.
    ///  This function creates a Modbus function code 15 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first coil to write. For backwards compatibility reasons, this parameter is called Starting Address.It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteMultipleCoils_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteMultipleCoilsLowLevel(const slaveAddress: byte; const startingAddress: longword; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To439OfBoolean): byte; virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write multiple coils of a slave.
    ///  This function creates a Modbus function code 15 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first coil to write. For backwards compatibility reasons, this parameter is called Starting Address.It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteMultipleCoils_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteMultipleCoils(const slaveAddress: byte; const startingAddress: longword; const coils: array of boolean): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write multiple registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleRegisters_request"/>
    ///  callback with the _request ID of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteMultipleRegisters_request(const _requestID: byte); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write multiple registers of a slave.
    ///  This function creates a Modbus function code 16 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first holding register to write. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is implicit and must be omitted.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteMultipleRegisters_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteMultipleRegistersLowLevel(const slaveAddress: byte; const startingAddress: longword; const registersLength: word; const registersChunkOffset: word; const registersChunkData: TArray0To26OfUInt16): byte; virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to write multiple registers of a slave.
    ///  This function creates a Modbus function code 16 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first holding register to write. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is implicit and must be omitted.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterWriteMultipleRegisters_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterWriteMultipleRegisters(const slaveAddress: byte; const startingAddress: longword; const registers: array of word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read discrete inputs.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Discrete Inputs: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadDiscreteInputs_request"/>
    ///  callback with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(const _requestID: byte; const discreteInputsLength: word; const discreteInputsChunkOffset: word; const discreteInputsChunkData: TArray0To471OfBoolean); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read discrete inputs.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Discrete Inputs: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadDiscreteInputs_request"/>
    ///  callback with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadDiscreteInputs_request(const _requestID: byte; const discreteInputs: array of boolean); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to read discrete inputs from a slave.
    ///  This function creates a Modbus function code 2 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first discrete input to read. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead a discrete input number in the range of 1 to 65536. The prefix digit 1 (for discrete input) is implicit and must be omitted.
    ///  * Count: Number of discrete inputs to read.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadDiscreteInputs_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterReadDiscreteInputs(const slaveAddress: byte; const startingAddress: longword; const count: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read input registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Input Registers: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadInputRegisters_request"/> callback
    ///  with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadInputRegisters_requestLowLevel(const _requestID: byte; const inputRegistersLength: word; const inputRegistersChunkOffset: word; const inputRegistersChunkData: TArray0To28OfUInt16); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  read input registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  * Input Registers: Data that is to be sent to the Modbus master for the corresponding _request.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveReadInputRegisters_request"/> callback
    ///  with the _request ID as provided by the argument of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerReadInputRegisters_request(const _requestID: byte; const inputRegisters: array of word); virtual;

    /// <summary>
    ///  In Modbus master mode this function can be used to read input registers from a slave.
    ///  This function creates a Modbus function code 4 _request.
    ///  
    ///  * Slave Address: Address of the target Modbus slave.
    ///  * Starting Address: Number of the first input register to read. For backwards compatibility reasons, this parameter is called Starting Address. It is not an address, but instead an input register number in the range of 1 to 65536. The prefix digit 3 (for input register) is implicit and must be omitted.
    ///  * Count: Number of input registers to read.
    ///  
    ///  Upon success the function will return a non-zero _request ID which will represent
    ///  the current _request initiated by the Modbus master. In case of failure the returned
    ///  _request ID will be 0.
    ///  
    ///  When successful this function will also invoke the <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadInputRegisters_response"/>
    ///  callback. In this callback the _request ID provided by the callback argument must be matched
    ///  with the _request ID returned from this function to verify that the callback is indeed for a
    ///  particular _request.
    /// </summary>
    function ModbusMasterReadInputRegisters(const slaveAddress: byte; const startingAddress: longword; const count: word): byte; virtual;

    /// <summary>
    ///  Returns the error count for the communication between Brick and Bricklet.
    ///  
    ///  The errors are divided into
    ///  
    ///  * ACK checksum errors,
    ///  * message checksum errors,
    ///  * framing errors and
    ///  * overflow errors.
    ///  
    ///  The errors counts are for errors that occur on the Bricklet side. All
    ///  Bricks have a similar function that returns the errors on the Brick side.
    /// </summary>
    procedure GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword); virtual;

    /// <summary>
    ///  Sets the bootloader mode and returns the status after the _requested
    ///  mode change was instigated.
    ///  
    ///  You can change from bootloader mode to firmware mode and vice versa. A change
    ///  from bootloader mode to firmware mode will only take place if the entry function,
    ///  device identifier and CRC are present and correct.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function SetBootloaderMode(const aMode: byte): byte; virtual;

    /// <summary>
    ///  Returns the current bootloader mode, see <see cref="BrickletRS485.TBrickletRS485.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletRS485.TBrickletRS485.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const pointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletRS485.TBrickletRS485.SetWriteFirmwarePointer"/> before. The firmware is written
    ///  to flash every 4 chunks.
    ///  
    ///  You can only write firmware in bootloader mode.
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    function WriteFirmware(const data: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const config: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetStatusLEDConfig"/>
    /// </summary>
    function GetStatusLEDConfig: byte; virtual;

    /// <summary>
    ///  Returns the temperature in °C as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has bad
    ///  accuracy. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Bricklet. All configurations
    ///  will be lost.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will Result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Writes a new UID into flash. If you want to set a new UID
    ///  you have to decode the Base58 encoded UID string into an
    ///  integer first.
    ///  
    ///  We recommend that you use Brick Viewer to change the UID.
    /// </summary>
    procedure WriteUID(const aUID: longword); virtual;

    /// <summary>
    ///  Returns the current UID as an integer. Encode as
    ///  Base58 to get the usual string version.
    /// </summary>
    function ReadUID: longword; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnRead"/>
    /// </summary>
    property OnReadLowLevel: TBrickletRS485NotifyReadLowLevel read readLowLevelCallback write readLowLevelCallback;

    /// <summary>
    ///  This callback is called if new data is available.
    ///  
    ///  To enable this callback, use <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for message_.
    ///  </note>
    /// </summary>
    property OnRead: TBrickletRS485NotifyRead read readCallback write readCallback;

    /// <summary>
    ///  This callback is called if a new error occurs. It returns
    ///  the current overrun and parity error count.
    /// </summary>
    property OnErrorCount: TBrickletRS485NotifyErrorCount read errorCountCallback write errorCountCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read coils. The parameters are
    ///  _request ID of the _request, the number of the first coil to be read and the number of coils to
    ///  be read as received by the _request. The number of the first coil is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadCoils_request"/>.
    /// </summary>
    property OnModbusSlaveReadCoils_request: TBrickletRS485NotifyModbusSlaveReadCoils_request read modbusSlaveReadCoils_requestCallback write modbusSlaveReadCoils_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadCoils_response"/>
    /// </summary>
    property OnModbusMasterReadCoils_responseLowLevel: TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel read modbusMasterReadCoils_responseLowLevelCallback write modbusMasterReadCoils_responseLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to read coils.
    ///  
    ///  The parameters are _request ID
    ///  of the _request, exception code of the _response and the data as received by the
    ///  _response.
    ///  
    ///  Any non-zero exception code indicates a problem. If the exception code
    ///  is greater than 0 then the number represents a Modbus exception code. If it is
    ///  less than 0 then it represents other errors. For example, -1 indicates that
    ///  the _request timed out or that the master did not receive any valid _response of the
    ///  _request within the master _request timeout period as set by
    ///  <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for coils.
    ///  </note>
    /// </summary>
    property OnModbusMasterReadCoils_response: TBrickletRS485NotifyModbusMasterReadCoils_response read modbusMasterReadCoils_responseCallback write modbusMasterReadCoils_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read holding registers. The parameters
    ///  are _request ID of the _request, the number of the first holding register to be read and the number of holding
    ///  registers to be read as received by the _request. The number of the first holding register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_request"/>.
    /// </summary>
    property OnModbusSlaveReadHoldingRegisters_request: TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request read modbusSlaveReadHoldingRegisters_requestCallback write modbusSlaveReadHoldingRegisters_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadHoldingRegisters_response"/>
    /// </summary>
    property OnModbusMasterReadHoldingRegisters_responseLowLevel: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel read modbusMasterReadHoldingRegisters_responseLowLevelCallback write modbusMasterReadHoldingRegisters_responseLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to read holding registers.
    ///  
    ///  The parameters are
    ///  _request ID of the _request, exception code of the _response and the data as received
    ///  by the _response.
    ///  
    ///  Any non-zero exception code indicates a problem. If the exception
    ///  code is greater than 0 then the number represents a Modbus exception code. If
    ///  it is less than 0 then it represents other errors. For example, -1 indicates that
    ///  the _request timed out or that the master did not receive any valid _response of the
    ///  _request within the master _request timeout period as set by
    ///  <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for holdingRegisters.
    ///  </note>
    /// </summary>
    property OnModbusMasterReadHoldingRegisters_response: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response read modbusMasterReadHoldingRegisters_responseCallback write modbusMasterReadHoldingRegisters_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write a single coil. The parameters
    ///  are _request ID of the _request, the number of the coil and the value of coil to be
    ///  written as received by the _request. The number of the coil is called coil address for backwards compatibility reasons.
    ///  It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteSingleCoil_request"/>.
    /// </summary>
    property OnModbusSlaveWriteSingleCoil_request: TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request read modbusSlaveWriteSingleCoil_requestCallback write modbusSlaveWriteSingleCoil_requestCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to write a single coil.
    ///  
    ///  The parameters are
    ///  _request ID of the _request and exception code of the _response.
    ///  
    ///  Any non-zero exception code indicates a problem.
    ///  If the exception code is greater than 0 then the number represents a Modbus
    ///  exception code. If it is less than 0 then it represents other errors. For
    ///  example, -1 indicates that the _request timed out or that the master did not receive
    ///  any valid _response of the _request within the master _request timeout period as set
    ///  by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    property OnModbusMasterWriteSingleCoil_response: TBrickletRS485NotifyModbusMasterWriteSingleCoil_response read modbusMasterWriteSingleCoil_responseCallback write modbusMasterWriteSingleCoil_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write a single holding register. The parameters
    ///  are _request ID of the _request, the number of the holding register and the register value to
    ///  be written as received by the _request. The number of the holding register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteSingleRegister_request"/>.
    /// </summary>
    property OnModbusSlaveWriteSingleRegister_request: TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request read modbusSlaveWriteSingleRegister_requestCallback write modbusSlaveWriteSingleRegister_requestCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to write a single register.
    ///  
    ///  The parameters are
    ///  _request ID of the _request and exception code of the _response.
    ///  
    ///  Any non-zero exception code
    ///  indicates a problem. If the exception code is greater than 0 then the number
    ///  represents a Modbus exception code. If it is less than 0 then it represents
    ///  other errors. For example, -1 indicates that the _request timed out or that the
    ///  master did not receive any valid _response of the _request within the master _request
    ///  timeout period as set by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    property OnModbusMasterWriteSingleRegister_response: TBrickletRS485NotifyModbusMasterWriteSingleRegister_response read modbusMasterWriteSingleRegister_responseCallback write modbusMasterWriteSingleRegister_responseCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleCoils_request"/>
    /// </summary>
    property OnModbusSlaveWriteMultipleCoils_requestLowLevel: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel read modbusSlaveWriteMultipleCoils_requestLowLevelCallback write modbusSlaveWriteMultipleCoils_requestLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write multiple coils. The parameters
    ///  are _request ID of the _request, the number of the first coil and the data to be written as
    ///  received by the _request. The number of the first coil is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteMultipleCoils_request"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for coils.
    ///  </note>
    /// </summary>
    property OnModbusSlaveWriteMultipleCoils_request: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request read modbusSlaveWriteMultipleCoils_requestCallback write modbusSlaveWriteMultipleCoils_requestCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to read coils.
    ///  
    ///  The parameters are
    ///  _request ID of the _request and exception code of the _response.
    ///  
    ///  Any non-zero exception code
    ///  indicates a problem. If the exception code is greater than 0 then the number
    ///  represents a Modbus exception code. If it is less than 0 then it represents
    ///  other errors. For example, -1 indicates that the _request timedout or that the
    ///  master did not receive any valid _response of the _request within the master _request
    ///  timeout period as set by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    property OnModbusMasterWriteMultipleCoils_response: TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response read modbusMasterWriteMultipleCoils_responseCallback write modbusMasterWriteMultipleCoils_responseCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleRegisters_request"/>
    /// </summary>
    property OnModbusSlaveWriteMultipleRegisters_requestLowLevel: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel read modbusSlaveWriteMultipleRegisters_requestLowLevelCallback write modbusSlaveWriteMultipleRegisters_requestLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write multiple holding registers. The parameters
    ///  are _request ID of the _request, the number of the first holding register and the data to be written as
    ///  received by the _request. The number of the first holding register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteMultipleRegisters_request"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for registers.
    ///  </note>
    /// </summary>
    property OnModbusSlaveWriteMultipleRegisters_request: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request read modbusSlaveWriteMultipleRegisters_requestCallback write modbusSlaveWriteMultipleRegisters_requestCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to write multiple registers.
    ///  
    ///  The parameters
    ///  are _request ID of the _request and exception code of the _response.
    ///  
    ///  Any non-zero
    ///  exception code indicates a problem. If the exception code is greater than 0 then
    ///  the number represents a Modbus exception code. If it is less than 0 then it
    ///  represents other errors. For example, -1 indicates that the _request timedout or
    ///  that the master did not receive any valid _response of the _request within the master
    ///  _request timeout period as set by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    property OnModbusMasterWriteMultipleRegisters_response: TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response read modbusMasterWriteMultipleRegisters_responseCallback write modbusMasterWriteMultipleRegisters_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read discrete inputs. The parameters
    ///  are _request ID of the _request, the number of the first discrete input and the number of discrete
    ///  inputs to be read as received by the _request. The number of the first discrete input is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a discrete input number in the range of 1 to 65536. The prefix digit 1 (for discrete input) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_request"/>.
    /// </summary>
    property OnModbusSlaveReadDiscreteInputs_request: TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request read modbusSlaveReadDiscreteInputs_requestCallback write modbusSlaveReadDiscreteInputs_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadDiscreteInputs_response"/>
    /// </summary>
    property OnModbusMasterReadDiscreteInputs_responseLowLevel: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel read modbusMasterReadDiscreteInputs_responseLowLevelCallback write modbusMasterReadDiscreteInputs_responseLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to read discrete inputs.
    ///  
    ///  The parameters are
    ///  _request ID of the _request, exception code of the _response and the data as received
    ///  by the _response.
    ///  
    ///  Any non-zero exception code indicates a problem. If the exception
    ///  code is greater than 0 then the number represents a Modbus exception code. If
    ///  it is less than 0 then it represents other errors. For example, -1 indicates that
    ///  the _request timedout or that the master did not receive any valid _response of the
    ///  _request within the master _request timeout period as set by
    ///  <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for discreteInputs.
    ///  </note>
    /// </summary>
    property OnModbusMasterReadDiscreteInputs_response: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response read modbusMasterReadDiscreteInputs_responseCallback write modbusMasterReadDiscreteInputs_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read input registers. The parameters
    ///  are _request ID of the _request, the number of the first input register and the number of input
    ///  registers to be read as received by the _request. The number of the first input register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a input register number in the range of 1 to 65536. The prefix digit 3 (for input register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_request"/>.
    /// </summary>
    property OnModbusSlaveReadInputRegisters_request: TBrickletRS485NotifyModbusSlaveReadInputRegisters_request read modbusSlaveReadInputRegisters_requestCallback write modbusSlaveReadInputRegisters_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadInputRegisters_response"/>
    /// </summary>
    property OnModbusMasterReadInputRegisters_responseLowLevel: TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel read modbusMasterReadInputRegisters_responseLowLevelCallback write modbusMasterReadInputRegisters_responseLowLevelCallback;

    /// <summary>
    ///  This callback is called only in Modbus master mode when the master receives a
    ///  valid _response of a _request to read input registers.
    ///  
    ///  The parameters are
    ///  _request ID of the _request, exception code of the _response and the data as received
    ///  by the _response.
    ///  
    ///  Any non-zero exception code indicates a problem. If the exception
    ///  code is greater than 0 then the number represents a Modbus exception code. If
    ///  it is less than 0 then it represents other errors. For example, -1 indicates that
    ///  the _request timedout or that the master did not receive any valid _response of the
    ///  _request within the master _request timeout period as set by
    ///  <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for inputRegisters.
    ///  </note>
    /// </summary>
    property OnModbusMasterReadInputRegisters_response: TBrickletRS485NotifyModbusMasterReadInputRegisters_response read modbusMasterReadInputRegisters_responseCallback write modbusMasterReadInputRegisters_responseCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

constructor TBrickletRS485.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(fReadHighLevelCallbackState.data, 0);
  fReadHighLevelCallbackState.data:= nil;
  fReadHighLevelCallbackState.length:= 0;
  SetLength(modbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
  modbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
  modbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
  SetLength(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
  modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
  modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
  SetLength(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
  modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
  modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
  SetLength(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
  modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
  modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
  SetLength(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
  modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
  modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
  SetLength(modbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
  modbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
  modbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
end;

procedure TBrickletRS485.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletRS485.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_RS485_FUNCTION_WRITE_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_READ_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_ENABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_DISABLE_READ_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_IS_READ_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_RS485_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_RS485_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_MODBUS_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_MODBUS_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_MODE]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_BUFFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_BUFFER_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_BUFFER_STATUS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_ENABLE_ERROR_COUNT_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_DISABLE_ERROR_COUNT_CALLBACK]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_IS_ERROR_COUNT_CALLBACK_ENABLED]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_MODBUS_COMMON_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_REPORT_EXCEPTION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_COILS_REQUEST_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_COILS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_HOLDING_REGISTERS_REQUEST_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_HOLDING_REGISTERS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_COIL_request]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_COIL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_REGISTER_request]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_REGISTER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_COILS_request]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_COILS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_REGISTERS_request]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_REGISTERS_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_DISCRETE_INPUTS_REQUEST_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_DISCRETE_INPUTS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_INPUT_REGISTERS_REQUEST_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_INPUT_REGISTERS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_RS485_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletRS485.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_RS485_CALLBACK_READ_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperReadLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_ERROR_COUNT]:= {$ifdef FPC}@{$endif}CallbackWrapperErrorCount;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_READ_COILS_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveReadCoils_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_READ_COILS_response_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterReadCoils_responseLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_READ_HOLDING_REGISTERS_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveReadHoldingRegisters_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_READ_HOLDING_REGISTERS_response_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterReadHoldingRegisters_responseLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_WRITE_SINGLE_COIL_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveWriteSingleCoil_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_WRITE_SINGLE_COIL_response]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterWriteSingleCoil_response;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_WRITE_SINGLE_REGISTER_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveWriteSingleRegister_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_WRITE_SINGLE_REGISTER_response]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterWriteSingleRegister_response;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_WRITE_MULTIPLE_COILS_REQUEST_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveWriteMultipleCoils_requestLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_WRITE_MULTIPLE_COILS_response]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterWriteMultipleCoils_response;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_WRITE_MULTIPLE_REGISTERS_REQUEST_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveWriteMultipleRegisters_requestLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_WRITE_MULTIPLE_REGISTERS_response]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterWriteMultipleRegisters_response;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_READ_DISCRETE_INPUTS_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveReadDiscreteInputs_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_READ_DISCRETE_INPUTS_response_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterReadDiscreteInputs_responseLowLevel;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_SLAVE_READ_INPUT_REGISTERS_request]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusSlaveReadInputRegisters_request;
  aCallBacks[BRICKLET_RS485_CALLBACK_MODBUS_MASTER_READ_INPUT_REGISTERS_response_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperModbusMasterReadInputRegisters_responseLowLevel;
end;

function TBrickletRS485.WriteLowLevel(const messageLength: word; const messageChunkOffset: word; const messageChunkData: TArray0To59OfChar): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_WRITE_LOW_LEVEL, 72);
  LEConvertUInt16To(messageLength, 8, _request);
  LEConvertUInt16To(messageChunkOffset, 10, _request);
  for _i:= 0 to Length(messageChunkData) - 1 do LEConvertCharTo(messageChunkData[_i], 12 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.Write(const message: array of char): word;
var
  messageLength: word;
  messageChunkOffset: word;
  messageChunkLength: word;
  messageChunkData: TArray0To59OfChar;
  messageChunkWritten: byte;
begin
  if (Length(message) > 65535) then begin
    raise EInvalidParameterException.Create('Message can be at most 65535 items long');
  end;

  messageLength:= Length(message);
  messageChunkOffset:= 0;
  Result:= 0;

  if (messageLength = 0) then begin
    FillChar(messageChunkData[0], SizeOf(char) * 60, 0);
    Result:= WriteLowLevel(messageLength, messageChunkOffset, messageChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (messageChunkOffset < messageLength) do begin
        messageChunkLength:= messageLength - messageChunkOffset;

        if (messageChunkLength > 60) then messageChunkLength:= 60;

        FillChar(messageChunkData[0], SizeOf(char) * 60, 0);
        Move(message[messageChunkOffset], messageChunkData[0], SizeOf(char) * messageChunkLength);

        messageChunkWritten:= WriteLowLevel(messageLength, messageChunkOffset, messageChunkData);
        Inc(Result, messageChunkWritten);

        if (messageChunkWritten < 60) then break; { Either last chunk or short write }

        Inc(messageChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ReadLowLevel(const length_: word; out messageLength: word; out messageChunkOffset: word; out messageChunkData: TArray0To59OfChar);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_READ_LOW_LEVEL, 10);
  LEConvertUInt16To(length_, 8, _request);
  _response:= SendRequest(_request);
  messageLength:= LEConvertUInt16From(8, _response);
  messageChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), _response);
end;

function TBrickletRS485.Read(const length_: word): TArrayOfChar;
var
  message: TArrayOfChar;
  messageCurrentLength: word;
  messageLength: word;
  messageChunkOffset: word;
  messageChunkData: TArray0To59OfChar;
  messageOutOfSync: boolean;
  messageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(message, 0);
  StreamMutex.Acquire;
  try
    messageLength:= 0;
    ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
    SetLength(message, messageLength);
    messageOutOfSync:= (messageChunkOffset <> 0);

    if ((not messageOutOfSync) and (messageLength > 0)) then begin
      messageChunkLength:= messageLength - messageChunkOffset;
      if (messageChunkLength > 60) then messageChunkLength:= 60;
      Move(messageChunkData, message[0], SizeOf(char) * messageChunkLength);
      messageCurrentLength:= messageChunkLength;

      while ((not messageOutOfSync) and (messageCurrentLength < messageLength)) do begin
        ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
        messageOutOfSync:= messageChunkOffset <> messageCurrentLength;
        messageChunkLength:= messageLength - messageChunkOffset;
        if (messageChunkLength > 60) then messageChunkLength:= 60;
        Move(messageChunkData, message[messageCurrentLength], SizeOf(char) * messageChunkLength);
        Inc(messageCurrentLength, messageChunkLength);
      end;
    end;

    if (messageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (messageChunkOffset + 60 < messageLength) do begin
        ReadLowLevel(length_, messageLength, messageChunkOffset, messageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Message stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= message;
end;

procedure TBrickletRS485.EnableReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_ENABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletRS485.DisableReadCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_DISABLE_READ_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletRS485.IsReadCallbackEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_IS_READ_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletRS485.SetRS485Configuration(const baudrate: longword; const parity: byte; const stopbits: byte; const wordlength: byte; const duplex: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_RS485_CONFIGURATION, 16);
  LEConvertUInt32To(baudrate, 8, _request);
  LEConvertUInt8To(parity, 12, _request);
  LEConvertUInt8To(stopbits, 13, _request);
  LEConvertUInt8To(wordlength, 14, _request);
  LEConvertUInt8To(duplex, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetRS485Configuration(out baudrate: longword; out parity: byte; out stopbits: byte; out wordlength: byte; out duplex: byte);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_RS485_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  baudrate:= LEConvertUInt32From(8, _response);
  parity:= LEConvertUInt8From(12, _response);
  stopbits:= LEConvertUInt8From(13, _response);
  wordlength:= LEConvertUInt8From(14, _response);
  duplex:= LEConvertUInt8From(15, _response);
end;

procedure TBrickletRS485.SetModbusConfiguration(const slaveAddress: byte; const master_requestTimeout: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_MODBUS_CONFIGURATION, 13);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(master_requestTimeout, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetModbusConfiguration(out slaveAddress: byte; out master_requestTimeout: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_MODBUS_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  slaveAddress:= LEConvertUInt8From(8, _response);
  master_requestTimeout:= LEConvertUInt32From(9, _response);
end;

procedure TBrickletRS485.SetMode(const aMode: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.GetMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetCommunicationLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_COMMUNICATION_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.GetCommunicationLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_COMMUNICATION_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetErrorLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_ERROR_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.GetErrorLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_ERROR_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetBufferConfig(const sendBufferSize: word; const receiveBufferSize: word);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_BUFFER_CONFIG, 12);
  LEConvertUInt16To(sendBufferSize, 8, _request);
  LEConvertUInt16To(receiveBufferSize, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetBufferConfig(out sendBufferSize: word; out receiveBufferSize: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_BUFFER_CONFIG, 8);
  _response:= SendRequest(_request);
  sendBufferSize:= LEConvertUInt16From(8, _response);
  receiveBufferSize:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS485.GetBufferStatus(out sendBufferUsed: word; out receiveBufferUsed: word);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_BUFFER_STATUS, 8);
  _response:= SendRequest(_request);
  sendBufferUsed:= LEConvertUInt16From(8, _response);
  receiveBufferUsed:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS485.EnableErrorCountCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_ENABLE_ERROR_COUNT_CALLBACK, 8);
  SendRequest(_request);
end;

procedure TBrickletRS485.DisableErrorCountCallback;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_DISABLE_ERROR_COUNT_CALLBACK, 8);
  SendRequest(_request);
end;

function TBrickletRS485.IsErrorCountCallbackEnabled: boolean;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_IS_ERROR_COUNT_CALLBACK_ENABLED, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletRS485.GetErrorCount(out overrunErrorCount: longword; out parityErrorCount: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  overrunErrorCount:= LEConvertUInt32From(8, _response);
  parityErrorCount:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletRS485.GetModbusCommonErrorCount(out timeoutErrorCount: longword; out checksumErrorCount: longword; out frameTooBigErrorCount: longword; out illegalFunctionErrorCount: longword; out illegalDataAddressErrorCount: longword; out illegalDataValueErrorCount: longword; out slaveDeviceFailureErrorCount: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_MODBUS_COMMON_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  timeoutErrorCount:= LEConvertUInt32From(8, _response);
  checksumErrorCount:= LEConvertUInt32From(12, _response);
  frameTooBigErrorCount:= LEConvertUInt32From(16, _response);
  illegalFunctionErrorCount:= LEConvertUInt32From(20, _response);
  illegalDataAddressErrorCount:= LEConvertUInt32From(24, _response);
  illegalDataValueErrorCount:= LEConvertUInt32From(28, _response);
  slaveDeviceFailureErrorCount:= LEConvertUInt32From(32, _response);
end;

procedure TBrickletRS485.ModbusSlaveReportException(const _requestID: byte; const exceptionCode: shortint);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_REPORT_EXCEPTION, 10);
  LEConvertUInt8To(_requestID, 8, _request);
  LEConvertInt8To(exceptionCode, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadCoils_requestLowLevel(const _requestID: byte; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To471OfBoolean);
var 
_request: TDynamicByteArray; _i: longint; coilsChunkDataBits: array [0..58] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_COILS_REQUEST_LOW_LEVEL, 72);
  LEConvertUInt8To(_requestID, 8, _request);
  LEConvertUInt16To(coilsLength, 9, _request);
  LEConvertUInt16To(coilsChunkOffset, 11, _request);
  FillChar(coilsChunkDataBits[0], Length(coilsChunkDataBits) * SizeOf(coilsChunkDataBits[0]), 0);
  for _i:= 0 to 471 do if coilsChunkData[_i] then coilsChunkDataBits[Floor(_i / 8)]:= coilsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 58 do LEConvertUInt8To(coilsChunkDataBits[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadCoils_request(const _requestID: byte; const coils: array of boolean);
var
  coilsChunkOffset: word;
  coilsChunkData: TArray0To471OfBoolean;
  coilsChunkLength: word;
  coilsLength: word;
begin
  if (Length(coils) > 65535) then begin
    raise EInvalidParameterException.Create('Coils can be at most 65535 items long');
  end;

  coilsLength:= Length(coils);
  coilsChunkOffset:= 0;

  if (coilsLength = 0) then begin
    FillChar(coilsChunkData[0], SizeOf(boolean) * 472, 0);
    ModbusSlaveAnswerReadCoils_requestLowLevel(_requestID, coilsLength, coilsChunkOffset, coilsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (coilsChunkOffset < coilsLength) do begin
        coilsChunkLength:= coilsLength - coilsChunkOffset;

        if (coilsChunkLength > 472) then coilsChunkLength:= 472;

        FillChar(coilsChunkData[0], SizeOf(boolean) * 472, 0);
        Move(coils[coilsChunkOffset], coilsChunkData[0], SizeOf(boolean) * coilsChunkLength);

        ModbusSlaveAnswerReadCoils_requestLowLevel(_requestID, coilsLength, coilsChunkOffset, coilsChunkData);
        Inc(coilsChunkOffset, 472);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadCoils(const slaveAddress: byte; const startingAddress: longword; const count: word): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_COILS, 15);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(count, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(const _requestID: byte; const holdingRegistersLength: word; const holdingRegistersChunkOffset: word; const holdingRegistersChunkData: TArray0To28OfUInt16);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_HOLDING_REGISTERS_REQUEST_LOW_LEVEL, 71);
  LEConvertUInt8To(_requestID, 8, _request);
  LEConvertUInt16To(holdingRegistersLength, 9, _request);
  LEConvertUInt16To(holdingRegistersChunkOffset, 11, _request);
  for _i:= 0 to Length(holdingRegistersChunkData) - 1 do LEConvertUInt16To(holdingRegistersChunkData[_i], 13 + (_i * 2), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_request(const _requestID: byte; const holdingRegisters: array of word);
var
  holdingRegistersChunkOffset: word;
  holdingRegistersChunkData: TArray0To28OfUInt16;
  holdingRegistersChunkLength: word;
  holdingRegistersLength: word;
begin
  if (Length(holdingRegisters) > 65535) then begin
    raise EInvalidParameterException.Create('Holding Registers can be at most 65535 items long');
  end;

  holdingRegistersLength:= Length(holdingRegisters);
  holdingRegistersChunkOffset:= 0;

  if (holdingRegistersLength = 0) then begin
    FillChar(holdingRegistersChunkData[0], SizeOf(word) * 29, 0);
    ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(_requestID, holdingRegistersLength, holdingRegistersChunkOffset, holdingRegistersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (holdingRegistersChunkOffset < holdingRegistersLength) do begin
        holdingRegistersChunkLength:= holdingRegistersLength - holdingRegistersChunkOffset;

        if (holdingRegistersChunkLength > 29) then holdingRegistersChunkLength:= 29;

        FillChar(holdingRegistersChunkData[0], SizeOf(word) * 29, 0);
        Move(holdingRegisters[holdingRegistersChunkOffset], holdingRegistersChunkData[0], SizeOf(word) * holdingRegistersChunkLength);

        ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(_requestID, holdingRegistersLength, holdingRegistersChunkOffset, holdingRegistersChunkData);
        Inc(holdingRegistersChunkOffset, 29);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadHoldingRegisters(const slaveAddress: byte; const startingAddress: longword; const count: word): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_HOLDING_REGISTERS, 15);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(count, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteSingleCoil_request(const _requestID: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_COIL_request, 9);
  LEConvertUInt8To(_requestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteSingleCoil(const slaveAddress: byte; const coilAddress: longword; const coilValue: boolean): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_COIL, 14);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(coilAddress, 9, _request);
  LEConvertBooleanTo(coilValue, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteSingleRegister_request(const _requestID: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_REGISTER_request, 9);
  LEConvertUInt8To(_requestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteSingleRegister(const slaveAddress: byte; const registerAddress: longword; const registerValue: word): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_REGISTER, 15);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(registerAddress, 9, _request);
  LEConvertUInt16To(registerValue, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteMultipleCoils_request(const _requestID: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_COILS_request, 9);
  LEConvertUInt8To(_requestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteMultipleCoilsLowLevel(const slaveAddress: byte; const startingAddress: longword; const coilsLength: word; const coilsChunkOffset: word; const coilsChunkData: TArray0To439OfBoolean): byte;
var 
_request, _response: TDynamicByteArray; _i: longint; coilsChunkDataBits: array [0..54] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_COILS_LOW_LEVEL, 72);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(coilsLength, 13, _request);
  LEConvertUInt16To(coilsChunkOffset, 15, _request);
  FillChar(coilsChunkDataBits[0], Length(coilsChunkDataBits) * SizeOf(coilsChunkDataBits[0]), 0);
  for _i:= 0 to 439 do if coilsChunkData[_i] then coilsChunkDataBits[Floor(_i / 8)]:= coilsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 54 do LEConvertUInt8To(coilsChunkDataBits[_i], 17 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.ModbusMasterWriteMultipleCoils(const slaveAddress: byte; const startingAddress: longword; const coils: array of boolean): byte;
var
  coilsChunkOffset: word;
  coilsChunkData: TArray0To439OfBoolean;
  coilsChunkLength: word;
  coilsLength: word;
begin
  if (Length(coils) > 65535) then begin
    raise EInvalidParameterException.Create('Coils can be at most 65535 items long');
  end;

  coilsLength:= Length(coils);
  coilsChunkOffset:= 0;

  if (coilsLength = 0) then begin
    FillChar(coilsChunkData[0], SizeOf(boolean) * 440, 0);
    Result:= ModbusMasterWriteMultipleCoilsLowLevel(slaveAddress, startingAddress, coilsLength, coilsChunkOffset, coilsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (coilsChunkOffset < coilsLength) do begin
        coilsChunkLength:= coilsLength - coilsChunkOffset;

        if (coilsChunkLength > 440) then coilsChunkLength:= 440;

        FillChar(coilsChunkData[0], SizeOf(boolean) * 440, 0);
        Move(coils[coilsChunkOffset], coilsChunkData[0], SizeOf(boolean) * coilsChunkLength);

        Result:= ModbusMasterWriteMultipleCoilsLowLevel(slaveAddress, startingAddress, coilsLength, coilsChunkOffset, coilsChunkData);
        Inc(coilsChunkOffset, 440);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteMultipleRegisters_request(const _requestID: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_REGISTERS_request, 9);
  LEConvertUInt8To(_requestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteMultipleRegistersLowLevel(const slaveAddress: byte; const startingAddress: longword; const registersLength: word; const registersChunkOffset: word; const registersChunkData: TArray0To26OfUInt16): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_REGISTERS_LOW_LEVEL, 71);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(registersLength, 13, _request);
  LEConvertUInt16To(registersChunkOffset, 15, _request);
  for _i:= 0 to Length(registersChunkData) - 1 do LEConvertUInt16To(registersChunkData[_i], 17 + (_i * 2), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.ModbusMasterWriteMultipleRegisters(const slaveAddress: byte; const startingAddress: longword; const registers: array of word): byte;
var
  registersChunkOffset: word;
  registersChunkData: TArray0To26OfUInt16;
  registersChunkLength: word;
  registersLength: word;
begin
  if (Length(registers) > 65535) then begin
    raise EInvalidParameterException.Create('Registers can be at most 65535 items long');
  end;

  registersLength:= Length(registers);
  registersChunkOffset:= 0;

  if (registersLength = 0) then begin
    FillChar(registersChunkData[0], SizeOf(word) * 27, 0);
    Result:= ModbusMasterWriteMultipleRegistersLowLevel(slaveAddress, startingAddress, registersLength, registersChunkOffset, registersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (registersChunkOffset < registersLength) do begin
        registersChunkLength:= registersLength - registersChunkOffset;

        if (registersChunkLength > 27) then registersChunkLength:= 27;

        FillChar(registersChunkData[0], SizeOf(word) * 27, 0);
        Move(registers[registersChunkOffset], registersChunkData[0], SizeOf(word) * registersChunkLength);

        Result:= ModbusMasterWriteMultipleRegistersLowLevel(slaveAddress, startingAddress, registersLength, registersChunkOffset, registersChunkData);
        Inc(registersChunkOffset, 27);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(const _requestID: byte; const discreteInputsLength: word; const discreteInputsChunkOffset: word; const discreteInputsChunkData: TArray0To471OfBoolean);
var 
_request: TDynamicByteArray; _i: longint; discreteInputsChunkDataBits: array [0..58] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_DISCRETE_INPUTS_REQUEST_LOW_LEVEL, 72);
  LEConvertUInt8To(_requestID, 8, _request);
  LEConvertUInt16To(discreteInputsLength, 9, _request);
  LEConvertUInt16To(discreteInputsChunkOffset, 11, _request);
  FillChar(discreteInputsChunkDataBits[0], Length(discreteInputsChunkDataBits) * SizeOf(discreteInputsChunkDataBits[0]), 0);
  for _i:= 0 to 471 do if discreteInputsChunkData[_i] then discreteInputsChunkDataBits[Floor(_i / 8)]:= discreteInputsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 58 do LEConvertUInt8To(discreteInputsChunkDataBits[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_request(const _requestID: byte; const discreteInputs: array of boolean);
var
  discreteInputsChunkOffset: word;
  discreteInputsChunkData: TArray0To471OfBoolean;
  discreteInputsChunkLength: word;
  discreteInputsLength: word;
begin
  if (Length(discreteInputs) > 65535) then begin
    raise EInvalidParameterException.Create('Discrete Inputs can be at most 65535 items long');
  end;

  discreteInputsLength:= Length(discreteInputs);
  discreteInputsChunkOffset:= 0;

  if (discreteInputsLength = 0) then begin
    FillChar(discreteInputsChunkData[0], SizeOf(boolean) * 472, 0);
    ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(_requestID, discreteInputsLength, discreteInputsChunkOffset, discreteInputsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (discreteInputsChunkOffset < discreteInputsLength) do begin
        discreteInputsChunkLength:= discreteInputsLength - discreteInputsChunkOffset;

        if (discreteInputsChunkLength > 472) then discreteInputsChunkLength:= 472;

        FillChar(discreteInputsChunkData[0], SizeOf(boolean) * 472, 0);
        Move(discreteInputs[discreteInputsChunkOffset], discreteInputsChunkData[0], SizeOf(boolean) * discreteInputsChunkLength);

        ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(_requestID, discreteInputsLength, discreteInputsChunkOffset, discreteInputsChunkData);
        Inc(discreteInputsChunkOffset, 472);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadDiscreteInputs(const slaveAddress: byte; const startingAddress: longword; const count: word): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_DISCRETE_INPUTS, 15);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(count, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_requestLowLevel(const _requestID: byte; const inputRegistersLength: word; const inputRegistersChunkOffset: word; const inputRegistersChunkData: TArray0To28OfUInt16);
var 
_request: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_INPUT_REGISTERS_REQUEST_LOW_LEVEL, 71);
  LEConvertUInt8To(_requestID, 8, _request);
  LEConvertUInt16To(inputRegistersLength, 9, _request);
  LEConvertUInt16To(inputRegistersChunkOffset, 11, _request);
  for _i:= 0 to Length(inputRegistersChunkData) - 1 do LEConvertUInt16To(inputRegistersChunkData[_i], 13 + (_i * 2), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_request(const _requestID: byte; const inputRegisters: array of word);
var
  inputRegistersChunkOffset: word;
  inputRegistersChunkData: TArray0To28OfUInt16;
  inputRegistersChunkLength: word;
  inputRegistersLength: word;
begin
  if (Length(inputRegisters) > 65535) then begin
    raise EInvalidParameterException.Create('Input Registers can be at most 65535 items long');
  end;

  inputRegistersLength:= Length(inputRegisters);
  inputRegistersChunkOffset:= 0;

  if (inputRegistersLength = 0) then begin
    FillChar(inputRegistersChunkData[0], SizeOf(word) * 29, 0);
    ModbusSlaveAnswerReadInputRegisters_requestLowLevel(_requestID, inputRegistersLength, inputRegistersChunkOffset, inputRegistersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (inputRegistersChunkOffset < inputRegistersLength) do begin
        inputRegistersChunkLength:= inputRegistersLength - inputRegistersChunkOffset;

        if (inputRegistersChunkLength > 29) then inputRegistersChunkLength:= 29;

        FillChar(inputRegistersChunkData[0], SizeOf(word) * 29, 0);
        Move(inputRegisters[inputRegistersChunkOffset], inputRegistersChunkData[0], SizeOf(word) * inputRegistersChunkLength);

        ModbusSlaveAnswerReadInputRegisters_requestLowLevel(_requestID, inputRegistersLength, inputRegistersChunkOffset, inputRegistersChunkData);
        Inc(inputRegistersChunkOffset, 29);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadInputRegisters(const slaveAddress: byte; const startingAddress: longword; const count: word): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_INPUT_REGISTERS, 15);
  LEConvertUInt8To(slaveAddress, 8, _request);
  LEConvertUInt32To(startingAddress, 9, _request);
  LEConvertUInt16To(count, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.GetSPITFPErrorCount(out errorCountAckChecksum: longword; out errorCountMessageChecksum: longword; out errorCountFrame: longword; out errorCountOverflow: longword);
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  errorCountAckChecksum:= LEConvertUInt32From(8, _response);
  errorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  errorCountFrame:= LEConvertUInt32From(16, _response);
  errorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletRS485.SetBootloaderMode(const aMode: byte): byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.GetBootloaderMode: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetWriteFirmwarePointer(const pointer: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(pointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.WriteFirmware(const data: array of byte): byte;
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(data) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(data) - 1 do LEConvertUInt8To(data[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetStatusLEDConfig(const config: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(config, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.GetStatusLEDConfig: byte;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.GetChipTemperature: smallint;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletRS485.Reset;
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletRS485.WriteUID(const aUID: longword);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(uid, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ReadUID: longword;
var 
_request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletRS485.GetIdentity(out aUID: string; out connectedUid: string; out position: char; out hardwareVersion: TTFVersionNumber; out firmwareVersion: TTFVersionNumber; out deviceIdentifier: word);
var 
_request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  connectedUID:= LEConvertStringFrom(16, 8, _response);
  position:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do hardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do firmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  deviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRS485.CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray);
var messageLength: word; messageChunkOffset: word; messageChunkData: TArray0To59OfChar; messageChunkLength: word; _i: longint;
begin
  messageLength:= LEConvertUInt16From(8, aPacket);
  messageChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 59 do messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), aPacket);

  messageChunkLength:= messageLength - messageChunkOffset;
  if (messageChunkLength > 60) then begin
    messageChunkLength:= 60;
  end;
  if (fReadHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (messageChunkOffset = 0) then begin { Stream starts }
      SetLength(fReadHighLevelCallbackState.data, messageLength);
      Move(messageChunkData[0], fReadHighLevelCallbackState.data[0], SizeOf(char) * messageChunkLength);
      fReadHighLevelCallbackState.length:= messageChunkLength;

      if (fReadHighLevelCallbackState.length >= messageLength) then begin { Stream complete }
        if (Assigned(readCallback)) then begin
          readCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (messageChunkOffset <> fReadHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fReadHighLevelCallbackState.data, 0);
      fReadHighLevelCallbackState.data:= nil;
      fReadHighLevelCallbackState.length:= 0;
      if (Assigned(readCallback)) then begin
        readCallback(self, fReadHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(messageChunkData[0], fReadHighLevelCallbackState.data[fReadHighLevelCallbackState.length], SizeOf(char) * messageChunkLength);
      Inc(fReadHighLevelCallbackState.length, messageChunkLength);

      if fReadHighLevelCallbackState.length >= messageLength then begin { Stream complete }
        if (Assigned(readCallback)) then begin
          readCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(readLowLevelCallback)) then begin
    readLowLevelCallback(self, messageLength, messageChunkOffset, messageChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperErrorCount(const aPacket: TDynamicByteArray);
var overrunErrorCount: longword; parityErrorCount: longword;
begin
  overrunErrorCount:= LEConvertUInt32From(8, aPacket);
  parityErrorCount:= LEConvertUInt32From(12, aPacket);

  if (Assigned(errorCountCallback)) then begin
    errorCountCallback(self, overrunErrorCount, parityErrorCount);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadCoils_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(modbusSlaveReadCoils_requestCallback)) then begin
    modbusSlaveReadCoils_requestCallback(self, _requestID, startingAddress, count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadCoils_responseLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint; coilsLength: word; coilsChunkOffset: word; coilsChunkData: TArray0To463OfBoolean; coilsChunkLength: word; _i: longint; coilsChunkDataBits: array [0..57] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);
  coilsLength:= LEConvertUInt16From(10, aPacket);
  coilsChunkOffset:= LEConvertUInt16From(12, aPacket);
  FillChar(coilsChunkDataBits[0], Length(coilsChunkDataBits) * SizeOf(coilsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do coilsChunkDataBits[_i]:= LEConvertUInt8From(14 + (_i * 1), aPacket);
  for _i:= 0 to 463 do coilsChunkData[_i]:= ((coilsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  coilsChunkLength:= coilsLength - coilsChunkOffset;
  if (coilsChunkLength > 464) then begin
    coilsChunkLength:= 464;
  end;
  if (modbusMasterReadCoils_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (coilsChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusMasterReadCoils_responseHighLevelCallbackState.data, coilsLength);
      Move(coilsChunkData[0], modbusMasterReadCoils_responseHighLevelCallbackState.data[0], SizeOf(boolean) * coilsChunkLength);
      modbusMasterReadCoils_responseHighLevelCallbackState.length:= coilsChunkLength;

      if (modbusMasterReadCoils_responseHighLevelCallbackState.length >= coilsLength) then begin { Stream complete }
        if (Assigned(modbusMasterReadCoils_responseCallback)) then begin
          modbusMasterReadCoils_responseCallback(self, _requestID, exceptionCode, modbusMasterReadCoils_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
        modbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (coilsChunkOffset <> modbusMasterReadCoils_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
      modbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
      modbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      if (Assigned(modbusMasterReadCoils_responseCallback)) then begin
        modbusMasterReadCoils_responseCallback(self, _requestID, exceptionCode, modbusMasterReadCoils_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(coilsChunkData[0], modbusMasterReadCoils_responseHighLevelCallbackState.data[modbusMasterReadCoils_responseHighLevelCallbackState.length], SizeOf(boolean) * coilsChunkLength);
      Inc(modbusMasterReadCoils_responseHighLevelCallbackState.length, coilsChunkLength);

      if modbusMasterReadCoils_responseHighLevelCallbackState.length >= coilsLength then begin { Stream complete }
        if (Assigned(modbusMasterReadCoils_responseCallback)) then begin
          modbusMasterReadCoils_responseCallback(self, _requestID, exceptionCode, modbusMasterReadCoils_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
        modbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusMasterReadCoils_responseLowLevelCallback)) then begin
    modbusMasterReadCoils_responseLowLevelCallback(self, _requestID, exceptionCode, coilsLength, coilsChunkOffset, coilsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadHoldingRegisters_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(modbusSlaveReadHoldingRegisters_requestCallback)) then begin
    modbusSlaveReadHoldingRegisters_requestCallback(self, _requestID, startingAddress, count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadHoldingRegisters_responseLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint; holdingRegistersLength: word; holdingRegistersChunkOffset: word; holdingRegistersChunkData: TArray0To28OfUInt16; holdingRegistersChunkLength: word; _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);
  holdingRegistersLength:= LEConvertUInt16From(10, aPacket);
  holdingRegistersChunkOffset:= LEConvertUInt16From(12, aPacket);
  for _i:= 0 to 28 do holdingRegistersChunkData[_i]:= LEConvertUInt16From(14 + (_i * 2), aPacket);

  holdingRegistersChunkLength:= holdingRegistersLength - holdingRegistersChunkOffset;
  if (holdingRegistersChunkLength > 29) then begin
    holdingRegistersChunkLength:= 29;
  end;
  if (modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (holdingRegistersChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, holdingRegistersLength);
      Move(holdingRegistersChunkData[0], modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data[0], SizeOf(word) * holdingRegistersChunkLength);
      modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= holdingRegistersChunkLength;

      if (modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length >= holdingRegistersLength) then begin { Stream complete }
        if (Assigned(modbusMasterReadHoldingRegisters_responseCallback)) then begin
          modbusMasterReadHoldingRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
        modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (holdingRegistersChunkOffset <> modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
      modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
      modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      if (Assigned(modbusMasterReadHoldingRegisters_responseCallback)) then begin
        modbusMasterReadHoldingRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(holdingRegistersChunkData[0], modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data[modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length], SizeOf(word) * holdingRegistersChunkLength);
      Inc(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length, holdingRegistersChunkLength);

      if modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length >= holdingRegistersLength then begin { Stream complete }
        if (Assigned(modbusMasterReadHoldingRegisters_responseCallback)) then begin
          modbusMasterReadHoldingRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
        modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusMasterReadHoldingRegisters_responseLowLevelCallback)) then begin
    modbusMasterReadHoldingRegisters_responseLowLevelCallback(self, _requestID, exceptionCode, holdingRegistersLength, holdingRegistersChunkOffset, holdingRegistersChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteSingleCoil_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; coilAddress: longword; coilValue: boolean;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  coilAddress:= LEConvertUInt32From(9, aPacket);
  coilValue:= LEConvertBooleanFrom(13, aPacket);

  if (Assigned(modbusSlaveWriteSingleCoil_requestCallback)) then begin
    modbusSlaveWriteSingleCoil_requestCallback(self, _requestID, coilAddress, coilValue);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteSingleCoil_response(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(modbusMasterWriteSingleCoil_responseCallback)) then begin
    modbusMasterWriteSingleCoil_responseCallback(self, _requestID, exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteSingleRegister_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; registerAddress: longword; registerValue: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  registerAddress:= LEConvertUInt32From(9, aPacket);
  registerValue:= LEConvertUInt16From(13, aPacket);

  if (Assigned(modbusSlaveWriteSingleRegister_requestCallback)) then begin
    modbusSlaveWriteSingleRegister_requestCallback(self, _requestID, registerAddress, registerValue);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteSingleRegister_response(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(modbusMasterWriteSingleRegister_responseCallback)) then begin
    modbusMasterWriteSingleRegister_responseCallback(self, _requestID, exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteMultipleCoils_requestLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; coilsLength: word; coilsChunkOffset: word; coilsChunkData: TArray0To439OfBoolean; coilsChunkLength: word; _i: longint; coilsChunkDataBits: array [0..54] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  coilsLength:= LEConvertUInt16From(13, aPacket);
  coilsChunkOffset:= LEConvertUInt16From(15, aPacket);
  FillChar(coilsChunkDataBits[0], Length(coilsChunkDataBits) * SizeOf(coilsChunkDataBits[0]), 0);
  for _i:= 0 to 54 do coilsChunkDataBits[_i]:= LEConvertUInt8From(17 + (_i * 1), aPacket);
  for _i:= 0 to 439 do coilsChunkData[_i]:= ((coilsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  coilsChunkLength:= coilsLength - coilsChunkOffset;
  if (coilsChunkLength > 440) then begin
    coilsChunkLength:= 440;
  end;
  if (modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (coilsChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, coilsLength);
      Move(coilsChunkData[0], modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data[0], SizeOf(boolean) * coilsChunkLength);
      modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= coilsChunkLength;

      if (modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length >= coilsLength) then begin { Stream complete }
        if (Assigned(modbusSlaveWriteMultipleCoils_requestCallback)) then begin
          modbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
        end;
        SetLength(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
        modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
        modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (coilsChunkOffset <> modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
      modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
      modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      if (Assigned(modbusSlaveWriteMultipleCoils_requestCallback)) then begin
        modbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(coilsChunkData[0], modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data[modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length], SizeOf(boolean) * coilsChunkLength);
      Inc(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length, coilsChunkLength);

      if modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length >= coilsLength then begin { Stream complete }
        if (Assigned(modbusSlaveWriteMultipleCoils_requestCallback)) then begin
          modbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
        end;
        SetLength(modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
        modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
        modbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusSlaveWriteMultipleCoils_requestLowLevelCallback)) then begin
    modbusSlaveWriteMultipleCoils_requestLowLevelCallback(self, _requestID, startingAddress, coilsLength, coilsChunkOffset, coilsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteMultipleCoils_response(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(modbusMasterWriteMultipleCoils_responseCallback)) then begin
    modbusMasterWriteMultipleCoils_responseCallback(self, _requestID, exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteMultipleRegisters_requestLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; registersLength: word; registersChunkOffset: word; registersChunkData: TArray0To26OfUInt16; registersChunkLength: word; _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  registersLength:= LEConvertUInt16From(13, aPacket);
  registersChunkOffset:= LEConvertUInt16From(15, aPacket);
  for _i:= 0 to 26 do registersChunkData[_i]:= LEConvertUInt16From(17 + (_i * 2), aPacket);

  registersChunkLength:= registersLength - registersChunkOffset;
  if (registersChunkLength > 27) then begin
    registersChunkLength:= 27;
  end;
  if (modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (registersChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, registersLength);
      Move(registersChunkData[0], modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data[0], SizeOf(word) * registersChunkLength);
      modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= registersChunkLength;

      if (modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length >= registersLength) then begin { Stream complete }
        if (Assigned(modbusSlaveWriteMultipleRegisters_requestCallback)) then begin
          modbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
        end;
        SetLength(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
        modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
        modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (registersChunkOffset <> modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
      modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
      modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      if (Assigned(modbusSlaveWriteMultipleRegisters_requestCallback)) then begin
        modbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(registersChunkData[0], modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data[modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length], SizeOf(word) * registersChunkLength);
      Inc(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length, registersChunkLength);

      if modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length >= registersLength then begin { Stream complete }
        if (Assigned(modbusSlaveWriteMultipleRegisters_requestCallback)) then begin
          modbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, startingAddress, modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
        end;
        SetLength(modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
        modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
        modbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusSlaveWriteMultipleRegisters_requestLowLevelCallback)) then begin
    modbusSlaveWriteMultipleRegisters_requestLowLevelCallback(self, _requestID, startingAddress, registersLength, registersChunkOffset, registersChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteMultipleRegisters_response(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(modbusMasterWriteMultipleRegisters_responseCallback)) then begin
    modbusMasterWriteMultipleRegisters_responseCallback(self, _requestID, exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadDiscreteInputs_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(modbusSlaveReadDiscreteInputs_requestCallback)) then begin
    modbusSlaveReadDiscreteInputs_requestCallback(self, _requestID, startingAddress, count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadDiscreteInputs_responseLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint; discreteInputsLength: word; discreteInputsChunkOffset: word; discreteInputsChunkData: TArray0To463OfBoolean; discreteInputsChunkLength: word; _i: longint; discreteInputsChunkDataBits: array [0..57] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);
  discreteInputsLength:= LEConvertUInt16From(10, aPacket);
  discreteInputsChunkOffset:= LEConvertUInt16From(12, aPacket);
  FillChar(discreteInputsChunkDataBits[0], Length(discreteInputsChunkDataBits) * SizeOf(discreteInputsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do discreteInputsChunkDataBits[_i]:= LEConvertUInt8From(14 + (_i * 1), aPacket);
  for _i:= 0 to 463 do discreteInputsChunkData[_i]:= ((discreteInputsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  discreteInputsChunkLength:= discreteInputsLength - discreteInputsChunkOffset;
  if (discreteInputsChunkLength > 464) then begin
    discreteInputsChunkLength:= 464;
  end;
  if (modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (discreteInputsChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, discreteInputsLength);
      Move(discreteInputsChunkData[0], modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data[0], SizeOf(boolean) * discreteInputsChunkLength);
      modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= discreteInputsChunkLength;

      if (modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length >= discreteInputsLength) then begin { Stream complete }
        if (Assigned(modbusMasterReadDiscreteInputs_responseCallback)) then begin
          modbusMasterReadDiscreteInputs_responseCallback(self, _requestID, exceptionCode, modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
        modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (discreteInputsChunkOffset <> modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
      modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
      modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      if (Assigned(modbusMasterReadDiscreteInputs_responseCallback)) then begin
        modbusMasterReadDiscreteInputs_responseCallback(self, _requestID, exceptionCode, modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(discreteInputsChunkData[0], modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data[modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length], SizeOf(boolean) * discreteInputsChunkLength);
      Inc(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length, discreteInputsChunkLength);

      if modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length >= discreteInputsLength then begin { Stream complete }
        if (Assigned(modbusMasterReadDiscreteInputs_responseCallback)) then begin
          modbusMasterReadDiscreteInputs_responseCallback(self, _requestID, exceptionCode, modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
        modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusMasterReadDiscreteInputs_responseLowLevelCallback)) then begin
    modbusMasterReadDiscreteInputs_responseLowLevelCallback(self, _requestID, exceptionCode, discreteInputsLength, discreteInputsChunkOffset, discreteInputsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadInputRegisters_request(const aPacket: TDynamicByteArray);
var 
_requestID: byte; startingAddress: longword; count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  startingAddress:= LEConvertUInt32From(9, aPacket);
  count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(modbusSlaveReadInputRegisters_requestCallback)) then begin
    modbusSlaveReadInputRegisters_requestCallback(self, _requestID, startingAddress, count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadInputRegisters_responseLowLevel(const aPacket: TDynamicByteArray);
var 
_requestID: byte; exceptionCode: shortint; inputRegistersLength: word; inputRegistersChunkOffset: word; inputRegistersChunkData: TArray0To28OfUInt16; inputRegistersChunkLength: word; _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  exceptionCode:= LEConvertInt8From(9, aPacket);
  inputRegistersLength:= LEConvertUInt16From(10, aPacket);
  inputRegistersChunkOffset:= LEConvertUInt16From(12, aPacket);
  for _i:= 0 to 28 do inputRegistersChunkData[_i]:= LEConvertUInt16From(14 + (_i * 2), aPacket);

  inputRegistersChunkLength:= inputRegistersLength - inputRegistersChunkOffset;
  if (inputRegistersChunkLength > 29) then begin
    inputRegistersChunkLength:= 29;
  end;
  if (modbusMasterReadInputRegisters_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (inputRegistersChunkOffset = 0) then begin { Stream starts }
      SetLength(modbusMasterReadInputRegisters_responseHighLevelCallbackState.data, inputRegistersLength);
      Move(inputRegistersChunkData[0], modbusMasterReadInputRegisters_responseHighLevelCallbackState.data[0], SizeOf(word) * inputRegistersChunkLength);
      modbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= inputRegistersChunkLength;

      if (modbusMasterReadInputRegisters_responseHighLevelCallbackState.length >= inputRegistersLength) then begin { Stream complete }
        if (Assigned(modbusMasterReadInputRegisters_responseCallback)) then begin
          modbusMasterReadInputRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
        modbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (inputRegistersChunkOffset <> modbusMasterReadInputRegisters_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(modbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
      modbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
      modbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      if (Assigned(modbusMasterReadInputRegisters_responseCallback)) then begin
        modbusMasterReadInputRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(inputRegistersChunkData[0], modbusMasterReadInputRegisters_responseHighLevelCallbackState.data[modbusMasterReadInputRegisters_responseHighLevelCallbackState.length], SizeOf(word) * inputRegistersChunkLength);
      Inc(modbusMasterReadInputRegisters_responseHighLevelCallbackState.length, inputRegistersChunkLength);

      if modbusMasterReadInputRegisters_responseHighLevelCallbackState.length >= inputRegistersLength then begin { Stream complete }
        if (Assigned(modbusMasterReadInputRegisters_responseCallback)) then begin
          modbusMasterReadInputRegisters_responseCallback(self, _requestID, exceptionCode, modbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(modbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
        modbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
        modbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(modbusMasterReadInputRegisters_responseLowLevelCallback)) then begin
    modbusMasterReadInputRegisters_responseLowLevelCallback(self, _requestID, exceptionCode, inputRegistersLength, inputRegistersChunkOffset, inputRegistersChunkData);
  end;
end;

end.
