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

  TReadHighLevelCallbackState = record
    data: TArrayOfChar;
    length: word;
  end;

  TModbusMasterReadCoils_responseHighLevelCallbackState = record
    data: TArrayOfBoolean;
    length: word;
  end;

  TModbusMasterReadHoldingRegisters_responseHighLevelCallbackState = record
    data: TArrayOfUInt16;
    length: word;
  end;

  TModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState = record
    data: TArrayOfBoolean;
    length: word;
  end;

  TModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState = record
    data: TArrayOfUInt16;
    length: word;
  end;

  TModbusMasterReadDiscreteInputs_responseHighLevelCallbackState = record
    data: TArrayOfBoolean;
    length: word;
  end;

  TModbusMasterReadInputRegisters_responseHighLevelCallbackState = record
    data: TArrayOfUInt16;
    length: word;
  end;

  TBrickletRS485 = class;

  TBrickletRS485NotifyReadLowLevel = procedure(aSender: TBrickletRS485; const aMessageLength: word; const aMessageChunkOffset: word;
                                               const aMessageChunkData: TArray0To59OfChar) of object;
  TBrickletRS485NotifyRead = procedure(aSender: TBrickletRS485; const aMessage: TArrayOfChar) of object;
  TBrickletRS485NotifyErrorCount = procedure(aSender: TBrickletRS485; const aOverrunErrorCount: longword; const aParityErrorCount: longword) of object;
  TBrickletRS485NotifyModbusSlaveReadCoils_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aStartingAddress: longword;
                                                               const aCount: word) of object;
  TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                         const aCoilsLength: word; const aCoilsChunkOffset: word;
                                                                         const aCoilsChunkData: TArray0To463OfBoolean) of object;
  TBrickletRS485NotifyModbusMasterReadCoils_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                 const aCoils: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aStartingAddress: longword;
                                                                          const aCount: word) of object;
  TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                                    const aHoldingRegistersLength: word; const aHoldingRegistersChunkOffset: word;
                                                                                    const aHoldingRegistersChunkData: TArray0To28OfUInt16) of object;
  TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                            const holdingRegisters: TArrayOfUInt16) of object;
  TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aCoilAddress: longword;
                                                                     const aCoilValue: boolean) of object;
  TBrickletRS485NotifyModbusMasterWriteSingleCoil_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aRegisterAddress: longword;
                                                                         const aRegisterValue: word) of object;
  TBrickletRS485NotifyModbusMasterWriteSingleRegister_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte;
                                                                                const aStartingAddress: longword; const aCoilsLength: word;
                                                                                const aCoilsChunkOffset: word; const coilsChunkData: TArray0To439OfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aStartingAddress: longword;
                                                                        const aCoils: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aStartingAddress: longword;
                                                                                    const aRegistersLength: word; const aRegistersChunkOffset: word;
                                                                                    const aRegistersChunkData: TArray0To26OfUInt16) of object;
  TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request = procedure(aSender: TBrickletRS485; const aRequestID: byte;
                                                                            const aStartingAddress: longword; const aRegisters: TArrayOfUInt16) of object;
  TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint) of object;
  TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request = procedure(aSender: TBrickletRS485; const aRequestID: byte;
                                                                        const aStartingAddress: longword; const aCount: word) of object;
  TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                                  const aDiscreteInputsLength: word; const aDiscreteInputsChunkOffset: word;
                                                                                  const aDiscreteInputsChunkData: TArray0To463OfBoolean) of object;
  TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                         const discreteInputs: TArrayOfBoolean) of object;
  TBrickletRS485NotifyModbusSlaveReadInputRegisters_request = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aStartingAddress: longword;
                                                                        const aCount: word) of object;
  TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                                  const aInputRegistersLength: word; const aInputRegistersChunkOffset: word;
                                                                                  const aInputRegistersChunkData: TArray0To28OfUInt16) of object;
  TBrickletRS485NotifyModbusMasterReadInputRegisters_response = procedure(aSender: TBrickletRS485; const aRequestID: byte; const aExceptionCode: shortint;
                                                                         const aInputRegisters: TArrayOfUInt16) of object;

  /// <summary>
  ///  Communicates with RS485/Modbus devices with full- or half-duplex
  /// </summary>
  TBrickletRS485 = class(TThreadedDevice)
  private
    fReadHighLevelCallbackState: TReadHighLevelCallbackState;
    fModbusMasterReadCoils_responseHighLevelCallbackState: TModbusMasterReadCoils_responseHighLevelCallbackState;
    fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState: TModbusMasterReadHoldingRegisters_responseHighLevelCallbackState;
    fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState: TModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState;
    fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState: TModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState;
    fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState: TModbusMasterReadDiscreteInputs_responseHighLevelCallbackState;
    fModbusMasterReadInputRegisters_responseHighLevelCallbackState: TModbusMasterReadInputRegisters_responseHighLevelCallbackState;
    fReadLowLevelCallback: TBrickletRS485NotifyReadLowLevel;
    fReadCallback: TBrickletRS485NotifyRead;
    fErrorCountCallback: TBrickletRS485NotifyErrorCount;
    fModbusSlaveReadCoils_requestCallback: TBrickletRS485NotifyModbusSlaveReadCoils_request;
    fModbusMasterReadCoils_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel;
    fModbusMasterReadCoils_responseCallback: TBrickletRS485NotifyModbusMasterReadCoils_response;
    fModbusSlaveReadHoldingRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request;
    fModbusMasterReadHoldingRegisters_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel;
    fModbusMasterReadHoldingRegisters_responseCallback: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response;
    fModbusSlaveWriteSingleCoil_requestCallback: TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request;
    fModbusMasterWriteSingleCoil_responseCallback: TBrickletRS485NotifyModbusMasterWriteSingleCoil_response;
    fModbusSlaveWriteSingleRegister_requestCallback: TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request;
    fModbusMasterWriteSingleRegister_responseCallback: TBrickletRS485NotifyModbusMasterWriteSingleRegister_response;
    fModbusSlaveWriteMultipleCoils_requestLowLevelCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel;
    fModbusSlaveWriteMultipleCoils_requestCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request;
    fModbusMasterWriteMultipleCoils_responseCallback: TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response;
    fModbusSlaveWriteMultipleRegisters_requestLowLevelCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel;
    fModbusSlaveWriteMultipleRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request;
    fModbusMasterWriteMultipleRegisters_responseCallback: TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response;
    fModbusSlaveReadDiscreteInputs_requestCallback: TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request;
    fModbusMasterReadDiscreteInputs_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel;
    fModbusMasterReadDiscreteInputs_responseCallback: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response;
    fModbusSlaveReadInputRegisters_requestCallback: TBrickletRS485NotifyModbusSlaveReadInputRegisters_request;
    fModbusMasterReadInputRegisters_responseLowLevelCallback: TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel;
    fModbusMasterReadInputRegisters_responseCallback: TBrickletRS485NotifyModbusMasterReadInputRegisters_response;
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
    function WriteLowLevel(const aMessageLength: word; const aMessageChunkOffset: word; const aMessageChunkData: TArray0To59OfChar): byte; virtual;

    /// <summary>
    ///  Writes characters to the RS485 interface. The characters can be binary data,
    ///  ASCII or similar is not necessary.
    ///  
    ///  The return value is the number of characters that were written.
    ///  
    ///  See <see cref="BrickletRS485.TBrickletRS485.SetRS485Configuration"/> for configuration possibilities
    ///  regarding baudrate, parity and so on.
    /// </summary>
    function Write(const aMessage: array of char): word; virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/> and <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    /// </summary>
    procedure ReadLowLevel(const aLength: word; out aMessageLength: word; out aMessageChunkOffset: word; out aMessageChunkData: TArray0To59OfChar); virtual;

    /// <summary>
    ///  Returns up to *length* characters from receive buffer.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. But note that this function will return available
    ///  data only when the read callback is disabled.
    ///  See <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/> and <see cref="BrickletRS485.TBrickletRS485.OnRead"/> callback.
    /// </summary>
    function Read(const aLength: word): TArrayOfChar; virtual;

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
    procedure SetRS485Configuration(const aBaudrate: longword; const aParity: byte; const aStopbits: byte; const aWordlength: byte; const aDuplex: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetRS485Configuration"/>.
    /// </summary>
    procedure GetRS485Configuration(out aBaudrate: longword; out aParity: byte; out aStopbits: byte; out aWordlength: byte; out aDuplex: byte); virtual;

    /// <summary>
    ///  Sets the configuration for the RS485 Modbus communication. Available options:
    ///  
    ///  * Slave Address: Address to be used as the Modbus slave address in Modbus slave mode. Valid Modbus slave address range is 1 to 247.
    ///  * Master _request Timeout: Specifies how long the master should wait for a _response from a slave in milliseconds when in Modbus master mode.
    ///  
    ///  The default is: Slave Address = 1 and Master _request Timeout = 1000 milliseconds (1 second).
    /// </summary>
    procedure SetModbusConfiguration(const aSlaveAddress: byte; const aMasterRequestTimeout: longword); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetModbusConfiguration"/>.
    /// </summary>
    procedure GetModbusConfiguration(out aSlaveAddress: byte; out aMasterRequestTimeout: longword); virtual;

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
    procedure SetCommunicationLEDConfig(const aConfig: byte); virtual;

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
    procedure SetErrorLEDConfig(const aConfig: byte); virtual;

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
    procedure SetBufferConfig(const aSendBufferSize: word; const aReceiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the buffer configuration as set by <see cref="BrickletRS485.TBrickletRS485.SetBufferConfig"/>.
    /// </summary>
    procedure GetBufferConfig(out aSendBufferSize: word; out aReceiveBufferSize: word); virtual;

    /// <summary>
    ///  Returns the currently used bytes for the send and received buffer.
    ///  
    ///  See <see cref="BrickletRS485.TBrickletRS485.SetBufferConfig"/> for buffer size configuration.
    /// </summary>
    procedure GetBufferStatus(out aSendBufferUsed: word; out aReceiveBufferUsed: word); virtual;

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
    procedure GetErrorCount(out aOverrunErrorCount: longword; out aParityErrorCount: longword); virtual;

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
    procedure GetModbusCommonErrorCount(out aTimeoutErrorCount: longword; out aChecksumErrorCount: longword; out aFrameTooBigErrorCount: longword;
                                        out aIllegalFunctionErrorCount: longword; out aIllegalDataAddressErrorCount: longword;
                                        out aIllegalDataValueErrorCount: longword; out aSlaveDeviceFailureErrorCount: longword); virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to report a Modbus exception for
    ///  a Modbus master _request.
    ///  
    ///  * _request ID: _request ID of the _request received by the slave.
    ///  * Exception Code: Modbus exception code to report to the Modbus master.
    /// </summary>
    procedure ModbusSlaveReportException(const aRequestID: byte; const aExceptionCode: shortint); virtual;

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
    procedure ModbusSlaveAnswerReadCoils_requestLowLevel(const aRequestID: byte; const aCoilsLength: word; const aCoilsChunkOffset: word;
                                                         const aCoilsChunkData: TArray0To471OfBoolean); virtual;

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
    procedure ModbusSlaveAnswerReadCoils_request(const aRequestID: byte; const aCoils: array of boolean); virtual;

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
    function ModbusMasterReadCoils(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte; virtual;

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
    procedure ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(const aRequestID: byte; const aHoldingRegistersLength: word;
                                                                    const aHoldingRegistersChunkOffset: word; const aHoldingRegistersChunkData: TArray0To28OfUInt16); virtual;

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
    procedure ModbusSlaveAnswerReadHoldingRegisters_request(const aRequestID: byte; const aHoldingRegisters: array of word); virtual;

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
    function ModbusMasterReadHoldingRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write a single coil.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteSingleCoil_request"/>
    ///  callback with the _request ID as provided by the arguments of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteSingleCoil_request(const aRequestID: byte); virtual;

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
    function ModbusMasterWriteSingleCoil(const aSlaveAddress: byte; const aCoilAddress: longword; const aCoilValue: boolean): byte; virtual;

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
    procedure ModbusSlaveAnswerWriteSingleRegister_request(const aRequestID: byte); virtual;

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
    function ModbusMasterWriteSingleRegister(const aSlaveAddress: byte; const aRegisterAddress: longword; const aRegisterValue: word): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write multiple coils.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleCoils_request"/>
    ///  callback with the _request ID of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteMultipleCoils_request(const aRequestID: byte); virtual;

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
    function ModbusMasterWriteMultipleCoilsLowLevel(const aSlaveAddress: byte; const StartingAddress: longword; const aCoilsLength: word;
                                                    const aCoilsChunkOffset: word; const aCoilsChunkData: TArray0To439OfBoolean): byte; virtual;

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
    function ModbusMasterWriteMultipleCoils(const aSlaveAddress: byte; const aStartingAddress: longword; const aCoils: array of boolean): byte; virtual;

    /// <summary>
    ///  In Modbus slave mode this function can be used to answer a master _request to
    ///  write multiple registers.
    ///  
    ///  * _request ID: _request ID of the corresponding _request that is being answered.
    ///  
    ///  This function must be called from the <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleRegisters_request"/>
    ///  callback with the _request ID of the callback.
    /// </summary>
    procedure ModbusSlaveAnswerWriteMultipleRegisters_request(const aRequestID: byte); virtual;

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
    function ModbusMasterWriteMultipleRegistersLowLevel(const aSlaveAddress: byte; const aStartingAddress: longword; const aRegistersLength: word;
                                                        const aRegistersChunkOffset: word; const aRegistersChunkData: TArray0To26OfUInt16): byte; virtual;

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
    function ModbusMasterWriteMultipleRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aRegisters: array of word): byte; virtual;

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
    procedure ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(const aRequestID: byte; const aDiscreteInputsLength: word; const aDiscreteInputsChunkOffset: word;
                                                                  const aDiscreteInputsChunkData: TArray0To471OfBoolean); virtual;

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
    procedure ModbusSlaveAnswerReadDiscreteInputs_request(const aRequestID: byte; const aDiscreteInputs: array of boolean); virtual;

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
    function ModbusMasterReadDiscreteInputs(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte; virtual;

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
    procedure ModbusSlaveAnswerReadInputRegisters_requestLowLevel(const aRequestID: byte; const aInputRegistersLength: word; const aInputRegistersChunkOffset: word;
                                                                  const aInputRegistersChunkData: TArray0To28OfUInt16); virtual;

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
    procedure ModbusSlaveAnswerReadInputRegisters_request(const aRequestID: byte; const aInputRegisters: array of word); virtual;

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
    function ModbusMasterReadInputRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte; virtual;

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
    procedure GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword;
                                  out aErrorCountFrame: longword; out aErrorCountOverflow: longword); virtual;

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
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

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
    function WriteFirmware(const aData: array of byte): byte; virtual;

    /// <summary>
    ///  Sets the status LED configuration. By default the LED shows
    ///  communication traffic between Brick and Bricklet, it flickers once
    ///  for every 10 received data packets.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is will show heartbeat by default.
    /// </summary>
    procedure SetStatusLEDConfig(const aConfig: byte); virtual;

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
    procedure GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber;
                          out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnRead"/>
    /// </summary>
    property OnReadLowLevel: TBrickletRS485NotifyReadLowLevel read fReadLowLevelCallback write fReadLowLevelCallback;

    /// <summary>
    ///  This callback is called if new data is available.
    ///  
    ///  To enable this callback, use <see cref="BrickletRS485.TBrickletRS485.EnableReadCallback"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for message_.
    ///  </note>
    /// </summary>
    property OnRead: TBrickletRS485NotifyRead read fReadCallback write fReadCallback;

    /// <summary>
    ///  This callback is called if a new error occurs. It returns
    ///  the current overrun and parity error count.
    /// </summary>
    property OnErrorCount: TBrickletRS485NotifyErrorCount read fErrorCountCallback write fErrorCountCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read coils. The parameters are
    ///  _request ID of the _request, the number of the first coil to be read and the number of coils to
    ///  be read as received by the _request. The number of the first coil is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadCoils_request"/>.
    /// </summary>
    property OnModbusSlaveReadCoils_request: TBrickletRS485NotifyModbusSlaveReadCoils_request read fModbusSlaveReadCoils_requestCallback write fModbusSlaveReadCoils_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadCoils_response"/>
    /// </summary>
    property OnModbusMasterReadCoils_responseLowLevel: TBrickletRS485NotifyModbusMasterReadCoils_responseLowLevel read fModbusMasterReadCoils_responseLowLevelCallback write fModbusMasterReadCoils_responseLowLevelCallback;

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
    property OnModbusMasterReadCoils_response: TBrickletRS485NotifyModbusMasterReadCoils_response read fModbusMasterReadCoils_responseCallback write fModbusMasterReadCoils_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read holding registers. The parameters
    ///  are _request ID of the _request, the number of the first holding register to be read and the number of holding
    ///  registers to be read as received by the _request. The number of the first holding register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_request"/>.
    /// </summary>
    property OnModbusSlaveReadHoldingRegisters_request: TBrickletRS485NotifyModbusSlaveReadHoldingRegisters_request read fModbusSlaveReadHoldingRegisters_requestCallback write fModbusSlaveReadHoldingRegisters_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadHoldingRegisters_response"/>
    /// </summary>
    property OnModbusMasterReadHoldingRegisters_responseLowLevel: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_responseLowLevel read fModbusMasterReadHoldingRegisters_responseLowLevelCallback write fModbusMasterReadHoldingRegisters_responseLowLevelCallback;

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
    property OnModbusMasterReadHoldingRegisters_response: TBrickletRS485NotifyModbusMasterReadHoldingRegisters_response read fModbusMasterReadHoldingRegisters_responseCallback write fModbusMasterReadHoldingRegisters_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write a single coil. The parameters
    ///  are _request ID of the _request, the number of the coil and the value of coil to be
    ///  written as received by the _request. The number of the coil is called coil address for backwards compatibility reasons.
    ///  It is not an address, but instead a coil number in the range of 1 to 65536.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteSingleCoil_request"/>.
    /// </summary>
    property OnModbusSlaveWriteSingleCoil_request: TBrickletRS485NotifyModbusSlaveWriteSingleCoil_request read fModbusSlaveWriteSingleCoil_requestCallback write fModbusSlaveWriteSingleCoil_requestCallback;

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
    property OnModbusMasterWriteSingleCoil_response: TBrickletRS485NotifyModbusMasterWriteSingleCoil_response read fModbusMasterWriteSingleCoil_responseCallback write fModbusMasterWriteSingleCoil_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to write a single holding register. The parameters
    ///  are _request ID of the _request, the number of the holding register and the register value to
    ///  be written as received by the _request. The number of the holding register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a holding register number in the range of 1 to 65536. The prefix digit 4 (for holding register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerWriteSingleRegister_request"/>.
    /// </summary>
    property OnModbusSlaveWriteSingleRegister_request: TBrickletRS485NotifyModbusSlaveWriteSingleRegister_request read fModbusSlaveWriteSingleRegister_requestCallback write fModbusSlaveWriteSingleRegister_requestCallback;

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
    property OnModbusMasterWriteSingleRegister_response: TBrickletRS485NotifyModbusMasterWriteSingleRegister_response read fModbusMasterWriteSingleRegister_responseCallback write fModbusMasterWriteSingleRegister_responseCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleCoils_request"/>
    /// </summary>
    property OnModbusSlaveWriteMultipleCoils_requestLowLevel: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_requestLowLevel read fModbusSlaveWriteMultipleCoils_requestLowLevelCallback write fModbusSlaveWriteMultipleCoils_requestLowLevelCallback;

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
    property OnModbusSlaveWriteMultipleCoils_request: TBrickletRS485NotifyModbusSlaveWriteMultipleCoils_request read fModbusSlaveWriteMultipleCoils_requestCallback write fModbusSlaveWriteMultipleCoils_requestCallback;

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
    property OnModbusMasterWriteMultipleCoils_response: TBrickletRS485NotifyModbusMasterWriteMultipleCoils_response read fModbusMasterWriteMultipleCoils_responseCallback write fModbusMasterWriteMultipleCoils_responseCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusSlaveWriteMultipleRegisters_request"/>
    /// </summary>
    property OnModbusSlaveWriteMultipleRegisters_requestLowLevel: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_requestLowLevel read fModbusSlaveWriteMultipleRegisters_requestLowLevelCallback write fModbusSlaveWriteMultipleRegisters_requestLowLevelCallback;

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
    property OnModbusSlaveWriteMultipleRegisters_request: TBrickletRS485NotifyModbusSlaveWriteMultipleRegisters_request read fModbusSlaveWriteMultipleRegisters_requestCallback write fModbusSlaveWriteMultipleRegisters_requestCallback;

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
    property OnModbusMasterWriteMultipleRegisters_response: TBrickletRS485NotifyModbusMasterWriteMultipleRegisters_response read fModbusMasterWriteMultipleRegisters_responseCallback write fModbusMasterWriteMultipleRegisters_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read discrete inputs. The parameters
    ///  are _request ID of the _request, the number of the first discrete input and the number of discrete
    ///  inputs to be read as received by the _request. The number of the first discrete input is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a discrete input number in the range of 1 to 65536. The prefix digit 1 (for discrete input) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_request"/>.
    /// </summary>
    property OnModbusSlaveReadDiscreteInputs_request: TBrickletRS485NotifyModbusSlaveReadDiscreteInputs_request read fModbusSlaveReadDiscreteInputs_requestCallback write fModbusSlaveReadDiscreteInputs_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadDiscreteInputs_response"/>
    /// </summary>
    property OnModbusMasterReadDiscreteInputs_responseLowLevel: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_responseLowLevel read fModbusMasterReadDiscreteInputs_responseLowLevelCallback write fModbusMasterReadDiscreteInputs_responseLowLevelCallback;

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
    property OnModbusMasterReadDiscreteInputs_response: TBrickletRS485NotifyModbusMasterReadDiscreteInputs_response read fModbusMasterReadDiscreteInputs_responseCallback write fModbusMasterReadDiscreteInputs_responseCallback;

    /// <summary>
    ///  This callback is called only in Modbus slave mode when the slave receives a
    ///  valid _request from a Modbus master to read input registers. The parameters
    ///  are _request ID of the _request, the number of the first input register and the number of input
    ///  registers to be read as received by the _request. The number of the first input register is called starting address for backwards compatibility reasons.
    ///  It is not an address, but instead a input register number in the range of 1 to 65536. The prefix digit 3 (for input register) is omitted.
    ///  
    ///  To send a _response of this _request use <see cref="BrickletRS485.TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_request"/>.
    /// </summary>
    property OnModbusSlaveReadInputRegisters_request: TBrickletRS485NotifyModbusSlaveReadInputRegisters_request read fModbusSlaveReadInputRegisters_requestCallback write fModbusSlaveReadInputRegisters_requestCallback;

    /// <summary>
    ///  <see cref="BrickletRS485.TBrickletRS485.OnModbusMasterReadInputRegisters_response"/>
    /// </summary>
    property OnModbusMasterReadInputRegisters_responseLowLevel: TBrickletRS485NotifyModbusMasterReadInputRegisters_responseLowLevel read fModbusMasterReadInputRegisters_responseLowLevelCallback write fModbusMasterReadInputRegisters_responseLowLevelCallback;

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
    property OnModbusMasterReadInputRegisters_response: TBrickletRS485NotifyModbusMasterReadInputRegisters_response read fModbusMasterReadInputRegisters_responseCallback write fModbusMasterReadInputRegisters_responseCallback;
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
  SetLength(fModbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
  fModbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
  fModbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
  SetLength(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
  fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
  fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
  SetLength(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
  fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
  fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
  SetLength(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
  fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
  fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
  SetLength(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
  fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
  fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
  SetLength(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
  fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
  fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
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

function TBrickletRS485.WriteLowLevel(const aMessageLength: word; const aMessageChunkOffset: word; const aMessageChunkData: TArray0To59OfChar): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_WRITE_LOW_LEVEL, 72);
  LEConvertUInt16To(aMessageLength, 8, _request);
  LEConvertUInt16To(aMessageChunkOffset, 10, _request);
  for _i:= 0 to Length(aMessageChunkData) - 1 do LEConvertCharTo(aMessageChunkData[_i], 12 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.Write(const aMessage: array of char): word;
var
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkLength: word;
  _messageChunkData: TArray0To59OfChar;
  _messageChunkWritten: byte;
begin
  if (Length(aMessage) > 65535) then begin
    raise EInvalidParameterException.Create('Message can be at most 65535 items long');
  end;

  _messageLength:= Length(aMessage);
  _messageChunkOffset:= 0;
  Result:= 0;

  if (_messageLength = 0) then begin
    FillChar(_messageChunkData[0], SizeOf(char) * 60, 0);
    Result:= WriteLowLevel(_messageLength, _messageChunkOffset, _messageChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_messageChunkOffset < _messageLength) do begin
        _messageChunkLength:= _messageLength - _messageChunkOffset;

        if (_messageChunkLength > 60) then _messageChunkLength:= 60;

        FillChar(_messageChunkData[0], SizeOf(char) * 60, 0);
        Move(aMessage[_messageChunkOffset], _messageChunkData[0], SizeOf(char) * _messageChunkLength);

        _messageChunkWritten:= WriteLowLevel(_messageLength, _messageChunkOffset, _messageChunkData);
        Inc(Result, _messageChunkWritten);

        if (_messageChunkWritten < 60) then break; { Either last chunk or short write }

        Inc(_messageChunkOffset, 60);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ReadLowLevel(const aLength: word; out aMessageLength: word; out aMessageChunkOffset: word; out aMessageChunkData: TArray0To59OfChar);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_READ_LOW_LEVEL, 10);
  LEConvertUInt16To(aLength, 8, _request);
  _response:= SendRequest(_request);
  aMessageLength:= LEConvertUInt16From(8, _response);
  aMessageChunkOffset:= LEConvertUInt16From(10, _response);
  for _i:= 0 to 59 do aMessageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), _response);
end;

function TBrickletRS485.Read(const aLength: word): TArrayOfChar;
var
  _message: TArrayOfChar;
  _messageCurrentLength: word;
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkData: TArray0To59OfChar;
  _messageOutOfSync: boolean;
  _messageChunkLength: word;
begin
  SetLength(Result, 0);
  SetLength(_message, 0);
  StreamMutex.Acquire;
  try
    _messageLength:= 0;
    ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
    SetLength(_message, _messageLength);
    _messageOutOfSync:= (_messageChunkOffset <> 0);

    if ((not _messageOutOfSync) and (_messageLength > 0)) then begin
      _messageChunkLength:= _messageLength - _messageChunkOffset;
      if (_messageChunkLength > 60) then _messageChunkLength:= 60;
      Move(_messageChunkData, _message[0], SizeOf(char) * _messageChunkLength);
      _messageCurrentLength:= _messageChunkLength;

      while ((not _messageOutOfSync) and (_messageCurrentLength < _messageLength)) do begin
        ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
        _messageOutOfSync:= _messageChunkOffset <> _messageCurrentLength;
        _messageChunkLength:= _messageLength - _messageChunkOffset;
        if (_messageChunkLength > 60) then _messageChunkLength:= 60;
        Move(_messageChunkData, _message[_messageCurrentLength], SizeOf(char) * _messageChunkLength);
        Inc(_messageCurrentLength, _messageChunkLength);
      end;
    end;

    if (_messageOutOfSync) then begin
      { Discard remaining stream to bring it back in-sync }
      while (_messageChunkOffset + 60 < _messageLength) do begin
        ReadLowLevel(aLength, _messageLength, _messageChunkOffset, _messageChunkData);
      end;

      raise EStreamOutOfSyncException.Create('Message stream out-of-sync');
    end;
  finally
    StreamMutex.Release;
  end;
  Result:= _message;
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

procedure TBrickletRS485.SetRS485Configuration(const aBaudrate: longword; const aParity: byte; const aStopbits: byte; const aWordlength: byte; const aDuplex: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_RS485_CONFIGURATION, 16);
  LEConvertUInt32To(aBaudrate, 8, _request);
  LEConvertUInt8To(aParity, 12, _request);
  LEConvertUInt8To(aStopbits, 13, _request);
  LEConvertUInt8To(aWordlength, 14, _request);
  LEConvertUInt8To(aDuplex, 15, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetRS485Configuration(out aBaudrate: longword; out aParity: byte; out aStopbits: byte; out aWordlength: byte; out aDuplex: byte);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_RS485_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aBaudrate:= LEConvertUInt32From(8, _response);
  aParity:= LEConvertUInt8From(12, _response);
  aStopbits:= LEConvertUInt8From(13, _response);
  aWordlength:= LEConvertUInt8From(14, _response);
  aDuplex:= LEConvertUInt8From(15, _response);
end;

procedure TBrickletRS485.SetModbusConfiguration(const aSlaveAddress: byte; const aMasterRequestTimeout: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_MODBUS_CONFIGURATION, 13);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aMasterRequestTimeout, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetModbusConfiguration(out aSlaveAddress: byte; out aMasterRequestTimeout: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_MODBUS_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aSlaveAddress:= LEConvertUInt8From(8, _response);
  aMasterRequestTimeout:= LEConvertUInt32From(9, _response);
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

procedure TBrickletRS485.SetCommunicationLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_COMMUNICATION_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletRS485.SetErrorLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_ERROR_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletRS485.SetBufferConfig(const aSendBufferSize: word; const aReceiveBufferSize: word);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_BUFFER_CONFIG, 12);
  LEConvertUInt16To(aSendBufferSize, 8, _request);
  LEConvertUInt16To(aReceiveBufferSize, 10, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.GetBufferConfig(out aSendBufferSize: word; out aReceiveBufferSize: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_BUFFER_CONFIG, 8);
  _response:= SendRequest(_request);
  aSendBufferSize:= LEConvertUInt16From(8, _response);
  aReceiveBufferSize:= LEConvertUInt16From(10, _response);
end;

procedure TBrickletRS485.GetBufferStatus(out aSendBufferUsed: word; out aReceiveBufferUsed: word);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_BUFFER_STATUS, 8);
  _response:= SendRequest(_request);
  aSendBufferUsed:= LEConvertUInt16From(8, _response);
  aReceiveBufferUsed:= LEConvertUInt16From(10, _response);
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

procedure TBrickletRS485.GetErrorCount(out aOverrunErrorCount: longword; out aParityErrorCount: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aOverrunErrorCount:= LEConvertUInt32From(8, _response);
  aParityErrorCount:= LEConvertUInt32From(12, _response);
end;

procedure TBrickletRS485.GetModbusCommonErrorCount(out aTimeoutErrorCount: longword; out aChecksumErrorCount: longword; out aFrameTooBigErrorCount: longword; out aIllegalFunctionErrorCount: longword; out aIllegalDataAddressErrorCount: longword; out aIllegalDataValueErrorCount: longword; out aSlaveDeviceFailureErrorCount: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_MODBUS_COMMON_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aTimeoutErrorCount:= LEConvertUInt32From(8, _response);
  aChecksumErrorCount:= LEConvertUInt32From(12, _response);
  aFrameTooBigErrorCount:= LEConvertUInt32From(16, _response);
  aIllegalFunctionErrorCount:= LEConvertUInt32From(20, _response);
  aIllegalDataAddressErrorCount:= LEConvertUInt32From(24, _response);
  aIllegalDataValueErrorCount:= LEConvertUInt32From(28, _response);
  aSlaveDeviceFailureErrorCount:= LEConvertUInt32From(32, _response);
end;

procedure TBrickletRS485.ModbusSlaveReportException(const aRequestID: byte; const aExceptionCode: shortint);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_REPORT_EXCEPTION, 10);
  LEConvertUInt8To(aRequestID, 8, _request);
  LEConvertInt8To(aExceptionCode, 9, _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadCoils_requestLowLevel(const aRequestID: byte; const aCoilsLength: word; const aCoilsChunkOffset: word; const aCoilsChunkData: TArray0To471OfBoolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _coilsChunkDataBits: array [0..58] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_COILS_REQUEST_LOW_LEVEL, 72);
  LEConvertUInt8To(aRequestID, 8, _request);
  LEConvertUInt16To(aCoilsLength, 9, _request);
  LEConvertUInt16To(aCoilsChunkOffset, 11, _request);
  FillChar(_coilsChunkDataBits[0], Length(_coilsChunkDataBits) * SizeOf(_coilsChunkDataBits[0]), 0);
  for _i:= 0 to 471 do if aCoilsChunkData[_i] then _coilsChunkDataBits[Floor(_i / 8)]:= _coilsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 58 do LEConvertUInt8To(_coilsChunkDataBits[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadCoils_request(const aRequestID: byte; const aCoils: array of boolean);
var
  _coilsChunkOffset: word;
  _coilsChunkData: TArray0To471OfBoolean;
  _coilsChunkLength: word;
  _coilsLength: word;
begin
  if (Length(aCoils) > 65535) then begin
    raise EInvalidParameterException.Create('Coils can be at most 65535 items long');
  end;

  _coilsLength:= Length(aCoils);
  _coilsChunkOffset:= 0;

  if (_coilsLength = 0) then begin
    FillChar(_coilsChunkData[0], SizeOf(boolean) * 472, 0);
    ModbusSlaveAnswerReadCoils_requestLowLevel(aRequestID, _coilsLength, _coilsChunkOffset, _coilsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_coilsChunkOffset < _coilsLength) do begin
        _coilsChunkLength:= _coilsLength - _coilsChunkOffset;

        if (_coilsChunkLength > 472) then _coilsChunkLength:= 472;

        FillChar(_coilsChunkData[0], SizeOf(boolean) * 472, 0);
        Move(aCoils[_coilsChunkOffset], _coilsChunkData[0], SizeOf(boolean) * _coilsChunkLength);

        ModbusSlaveAnswerReadCoils_requestLowLevel(aRequestID, _coilsLength, _coilsChunkOffset, _coilsChunkData);
        Inc(_coilsChunkOffset, 472);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadCoils(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_COILS, 15);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aStartingAddress, 9, _request);
  LEConvertUInt16To(aCount, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(const aRequestID: byte; const aHoldingRegistersLength: word; const aHoldingRegistersChunkOffset: word; const aHoldingRegistersChunkData: TArray0To28OfUInt16);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_HOLDING_REGISTERS_REQUEST_LOW_LEVEL, 71);
  LEConvertUInt8To(aRequestID, 8, _request);
  LEConvertUInt16To(aHoldingRegistersLength, 9, _request);
  LEConvertUInt16To(aHoldingRegistersChunkOffset, 11, _request);
  for _i:= 0 to Length(aHoldingRegistersChunkData) - 1 do LEConvertUInt16To(aHoldingRegistersChunkData[_i], 13 + (_i * 2), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadHoldingRegisters_request(const aRequestID: byte; const aHoldingRegisters: array of word);
var
  _holdingRegistersChunkOffset: word;
  _holdingRegistersChunkData: TArray0To28OfUInt16;
  _holdingRegistersChunkLength: word;
  _holdingRegistersLength: word;
begin
  if (Length(aHoldingRegisters) > 65535) then begin
    raise EInvalidParameterException.Create('Holding Registers can be at most 65535 items long');
  end;

  _holdingRegistersLength:= Length(aHoldingRegisters);
  _holdingRegistersChunkOffset:= 0;

  if (_holdingRegistersLength = 0) then begin
    FillChar(_holdingRegistersChunkData[0], SizeOf(word) * 29, 0);
    ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(aRequestID, _holdingRegistersLength, _holdingRegistersChunkOffset, _holdingRegistersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_holdingRegistersChunkOffset < _holdingRegistersLength) do begin
        _holdingRegistersChunkLength:= _holdingRegistersLength - _holdingRegistersChunkOffset;

        if (_holdingRegistersChunkLength > 29) then _holdingRegistersChunkLength:= 29;

        FillChar(_holdingRegistersChunkData[0], SizeOf(word) * 29, 0);
        Move(aHoldingRegisters[_holdingRegistersChunkOffset], _holdingRegistersChunkData[0], SizeOf(word) * _holdingRegistersChunkLength);

        ModbusSlaveAnswerReadHoldingRegisters_requestLowLevel(aRequestID, _holdingRegistersLength, _holdingRegistersChunkOffset, _holdingRegistersChunkData);
        Inc(_holdingRegistersChunkOffset, 29);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadHoldingRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_HOLDING_REGISTERS, 15);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aStartingAddress, 9, _request);
  LEConvertUInt16To(aCount, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteSingleCoil_request(const aRequestID: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_COIL_request, 9);
  LEConvertUInt8To(aRequestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteSingleCoil(const aSlaveAddress: byte; const aCoilAddress: longword; const aCoilValue: boolean): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_COIL, 14);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aCoilAddress, 9, _request);
  LEConvertBooleanTo(aCoilValue, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteSingleRegister_request(const aRequestID: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_SINGLE_REGISTER_request, 9);
  LEConvertUInt8To(aRequestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteSingleRegister(const aSlaveAddress: byte; const aRegisterAddress: longword; const aRegisterValue: word): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_SINGLE_REGISTER, 15);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aRegisterAddress, 9, _request);
  LEConvertUInt16To(aRegisterValue, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteMultipleCoils_request(const aRequestID: byte);
var 
_request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_COILS_request, 9);
  LEConvertUInt8To(aRequestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteMultipleCoilsLowLevel(const aSlaveAddress: byte; const StartingAddress: longword; const aCoilsLength: word; const aCoilsChunkOffset: word; const aCoilsChunkData: TArray0To439OfBoolean): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
  _coilsChunkDataBits: array [0..54] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_COILS_LOW_LEVEL, 72);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(StartingAddress, 9, _request);
  LEConvertUInt16To(aCoilsLength, 13, _request);
  LEConvertUInt16To(aCoilsChunkOffset, 15, _request);
  FillChar(_coilsChunkDataBits[0], Length(_coilsChunkDataBits) * SizeOf(_coilsChunkDataBits[0]), 0);
  for _i:= 0 to 439 do if aCoilsChunkData[_i] then _coilsChunkDataBits[Floor(_i / 8)]:= _coilsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 54 do LEConvertUInt8To(_coilsChunkDataBits[_i], 17 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.ModbusMasterWriteMultipleCoils(const aSlaveAddress: byte; const aStartingAddress: longword; const aCoils: array of boolean): byte;
var
  _coilsChunkOffset: word;
  _coilsChunkData: TArray0To439OfBoolean;
  _coilsChunkLength: word;
  _coilsLength: word;
begin
  if (Length(aCoils) > 65535) then begin
    raise EInvalidParameterException.Create('Coils can be at most 65535 items long');
  end;

  _coilsLength:= Length(aCoils);
  _coilsChunkOffset:= 0;

  if (_coilsLength = 0) then begin
    FillChar(_coilsChunkData[0], SizeOf(boolean) * 440, 0);
    Result:= ModbusMasterWriteMultipleCoilsLowLevel(aSlaveAddress, aStartingAddress, _coilsLength, _coilsChunkOffset, _coilsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_coilsChunkOffset < _coilsLength) do begin
        _coilsChunkLength:= _coilsLength - _coilsChunkOffset;

        if (_coilsChunkLength > 440) then _coilsChunkLength:= 440;

        FillChar(_coilsChunkData[0], SizeOf(boolean) * 440, 0);
        Move(aCoils[_coilsChunkOffset], _coilsChunkData[0], SizeOf(boolean) * _coilsChunkLength);

        Result:= ModbusMasterWriteMultipleCoilsLowLevel(aSlaveAddress, aStartingAddress, _coilsLength, _coilsChunkOffset, _coilsChunkData);
        Inc(_coilsChunkOffset, 440);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ModbusSlaveAnswerWriteMultipleRegisters_request(const aRequestID: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_WRITE_MULTIPLE_REGISTERS_request, 9);
  LEConvertUInt8To(aRequestID, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.ModbusMasterWriteMultipleRegistersLowLevel(const aSlaveAddress: byte; const aStartingAddress: longword; const aRegistersLength: word; const aRegistersChunkOffset: word; const aRegistersChunkData: TArray0To26OfUInt16): byte;
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_WRITE_MULTIPLE_REGISTERS_LOW_LEVEL, 71);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aStartingAddress, 9, _request);
  LEConvertUInt16To(aRegistersLength, 13, _request);
  LEConvertUInt16To(aRegistersChunkOffset, 15, _request);
  for _i:= 0 to Length(aRegistersChunkData) - 1 do LEConvertUInt16To(aRegistersChunkData[_i], 17 + (_i * 2), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletRS485.ModbusMasterWriteMultipleRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aRegisters: array of word): byte;
var
  _registersChunkOffset: word;
  _registersChunkData: TArray0To26OfUInt16;
  _registersChunkLength: word;
  _registersLength: word;
begin
  if (Length(aRegisters) > 65535) then begin
    raise EInvalidParameterException.Create('Registers can be at most 65535 items long');
  end;

  _registersLength:= Length(aRegisters);
  _registersChunkOffset:= 0;

  if (_registersLength = 0) then begin
    FillChar(_registersChunkData[0], SizeOf(word) * 27, 0);
    Result:= ModbusMasterWriteMultipleRegistersLowLevel(aSlaveAddress, aStartingAddress, _registersLength, _registersChunkOffset, _registersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_registersChunkOffset < _registersLength) do begin
        _registersChunkLength:= _registersLength - _registersChunkOffset;

        if (_registersChunkLength > 27) then _registersChunkLength:= 27;

        FillChar(_registersChunkData[0], SizeOf(word) * 27, 0);
        Move(aRegisters[_registersChunkOffset], _registersChunkData[0], SizeOf(word) * _registersChunkLength);

        Result:= ModbusMasterWriteMultipleRegistersLowLevel(aSlaveAddress, aStartingAddress, _registersLength, _registersChunkOffset, _registersChunkData);
        Inc(_registersChunkOffset, 27);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(const aRequestID: byte; const aDiscreteInputsLength: word; const aDiscreteInputsChunkOffset: word; const aDiscreteInputsChunkData: TArray0To471OfBoolean);
var 
  _request: TDynamicByteArray;
  _i: longint;
  _discreteInputsChunkDataBits: array [0..58] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_DISCRETE_INPUTS_REQUEST_LOW_LEVEL, 72);
  LEConvertUInt8To(aRequestID, 8, _request);
  LEConvertUInt16To(aDiscreteInputsLength, 9, _request);
  LEConvertUInt16To(aDiscreteInputsChunkOffset, 11, _request);
  FillChar(_discreteInputsChunkDataBits[0], Length(_discreteInputsChunkDataBits) * SizeOf(_discreteInputsChunkDataBits[0]), 0);
  for _i:= 0 to 471 do if aDiscreteInputsChunkData[_i] then _discreteInputsChunkDataBits[Floor(_i / 8)]:= _discreteInputsChunkDataBits[Floor(_i / 8)] or (1 shl (_i mod 8));
  for _i:= 0 to 58 do LEConvertUInt8To(_discreteInputsChunkDataBits[_i], 13 + (_i * 1), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadDiscreteInputs_request(const aRequestID: byte; const aDiscreteInputs: array of boolean);
var
  _discreteInputsChunkOffset: word;
  _discreteInputsChunkData: TArray0To471OfBoolean;
  _discreteInputsChunkLength: word;
  _discreteInputsLength: word;
begin
  if (Length(aDiscreteInputs) > 65535) then begin
    raise EInvalidParameterException.Create('Discrete Inputs can be at most 65535 items long');
  end;

  _discreteInputsLength:= Length(aDiscreteInputs);
  _discreteInputsChunkOffset:= 0;

  if (_discreteInputsLength = 0) then begin
    FillChar(_discreteInputsChunkData[0], SizeOf(boolean) * 472, 0);
    ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(aRequestID, _discreteInputsLength, _discreteInputsChunkOffset, _discreteInputsChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_discreteInputsChunkOffset < _discreteInputsLength) do begin
        _discreteInputsChunkLength:= _discreteInputsLength - _discreteInputsChunkOffset;

        if (_discreteInputsChunkLength > 472) then _discreteInputsChunkLength:= 472;

        FillChar(_discreteInputsChunkData[0], SizeOf(boolean) * 472, 0);
        Move(aDiscreteInputs[_discreteInputsChunkOffset], _discreteInputsChunkData[0], SizeOf(boolean) * _discreteInputsChunkLength);

        ModbusSlaveAnswerReadDiscreteInputs_requestLowLevel(aRequestID, _discreteInputsLength, _discreteInputsChunkOffset, _discreteInputsChunkData);
        Inc(_discreteInputsChunkOffset, 472);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadDiscreteInputs(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_DISCRETE_INPUTS, 15);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aStartingAddress, 9, _request);
  LEConvertUInt16To(aCount, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_requestLowLevel(const aRequestID: byte; const aInputRegistersLength: word; const aInputRegistersChunkOffset: word; const aInputRegistersChunkData: TArray0To28OfUInt16);
var 
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_SLAVE_ANSWER_READ_INPUT_REGISTERS_REQUEST_LOW_LEVEL, 71);
  LEConvertUInt8To(aRequestID, 8, _request);
  LEConvertUInt16To(aInputRegistersLength, 9, _request);
  LEConvertUInt16To(aInputRegistersChunkOffset, 11, _request);
  for _i:= 0 to Length(aInputRegistersChunkData) - 1 do LEConvertUInt16To(aInputRegistersChunkData[_i], 13 + (_i * 2), _request);
  SendRequest(_request);
end;

procedure TBrickletRS485.ModbusSlaveAnswerReadInputRegisters_request(const aRequestID: byte; const aInputRegisters: array of word);
var
  _inputRegistersChunkOffset: word;
  _inputRegistersChunkData: TArray0To28OfUInt16;
  _inputRegistersChunkLength: word;
  _inputRegistersLength: word;
begin
  if (Length(aInputRegisters) > 65535) then begin
    raise EInvalidParameterException.Create('Input Registers can be at most 65535 items long');
  end;

  _inputRegistersLength:= Length(aInputRegisters);
  _inputRegistersChunkOffset:= 0;

  if (_inputRegistersLength = 0) then begin
    FillChar(_inputRegistersChunkData[0], SizeOf(word) * 29, 0);
    ModbusSlaveAnswerReadInputRegisters_requestLowLevel(aRequestID, _inputRegistersLength, _inputRegistersChunkOffset, _inputRegistersChunkData);
  end
  else begin
    StreamMutex.Acquire;
    try
      while (_inputRegistersChunkOffset < _inputRegistersLength) do begin
        _inputRegistersChunkLength:= _inputRegistersLength - _inputRegistersChunkOffset;

        if (_inputRegistersChunkLength > 29) then _inputRegistersChunkLength:= 29;

        FillChar(_inputRegistersChunkData[0], SizeOf(word) * 29, 0);
        Move(aInputRegisters[_inputRegistersChunkOffset], _inputRegistersChunkData[0], SizeOf(word) * _inputRegistersChunkLength);

        ModbusSlaveAnswerReadInputRegisters_requestLowLevel(aRequestID, _inputRegistersLength, _inputRegistersChunkOffset, _inputRegistersChunkData);
        Inc(_inputRegistersChunkOffset, 29);
      end;
    finally
      StreamMutex.Release;
    end;
  end;
end;

function TBrickletRS485.ModbusMasterReadInputRegisters(const aSlaveAddress: byte; const aStartingAddress: longword; const aCount: word): byte;
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_MODBUS_MASTER_READ_INPUT_REGISTERS, 15);
  LEConvertUInt8To(aSlaveAddress, 8, _request);
  LEConvertUInt32To(aStartingAddress, 9, _request);
  LEConvertUInt16To(aCount, 13, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var 
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
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

procedure TBrickletRS485.SetWriteFirmwarePointer(const aPointer: longword);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletRS485.WriteFirmware(const aData: array of byte): byte;
var 
  _request, _response: TDynamicByteArray; _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletRS485.SetStatusLEDConfig(const aConfig: byte);
var 
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
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

procedure TBrickletRS485.GetIdentity(out aUID: string; out aConnectedUID: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var 
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_RS485_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUID:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletRS485.CallbackWrapperReadLowLevel(const aPacket: TDynamicByteArray);
var
  _messageLength: word;
  _messageChunkOffset: word;
  _messageChunkData: TArray0To59OfChar;
  _messageChunkLength: word;
  _i: longint;
begin
  _messageLength:= LEConvertUInt16From(8, aPacket);
  _messageChunkOffset:= LEConvertUInt16From(10, aPacket);
  for _i:= 0 to 59 do _messageChunkData[_i]:= LEConvertCharFrom(12 + (_i * 1), aPacket);

  _messageChunkLength:= _messageLength - _messageChunkOffset;
  if (_messageChunkLength > 60) then begin
    _messageChunkLength:= 60;
  end;
  if (fReadHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_messageChunkOffset = 0) then begin { Stream starts }
      SetLength(fReadHighLevelCallbackState.data, _messageLength);
      Move(_messageChunkData[0], fReadHighLevelCallbackState.data[0], SizeOf(char) * _messageChunkLength);
      fReadHighLevelCallbackState.length:= _messageChunkLength;

      if (fReadHighLevelCallbackState.length >= _messageLength) then begin { Stream complete }
        if (Assigned(fReadCallback)) then begin
          fReadCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_messageChunkOffset <> fReadHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fReadHighLevelCallbackState.data, 0);
      fReadHighLevelCallbackState.data:= nil;
      fReadHighLevelCallbackState.length:= 0;
      if (Assigned(fReadCallback)) then begin
        fReadCallback(self, fReadHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_messageChunkData[0], fReadHighLevelCallbackState.data[fReadHighLevelCallbackState.length], SizeOf(char) * _messageChunkLength);
      Inc(fReadHighLevelCallbackState.length, _messageChunkLength);

      if fReadHighLevelCallbackState.length >= _messageLength then begin { Stream complete }
        if (Assigned(fReadCallback)) then begin
          fReadCallback(self, fReadHighLevelCallbackState.data);
        end;
        SetLength(fReadHighLevelCallbackState.data, 0);
        fReadHighLevelCallbackState.data:= nil;
        fReadHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fReadLowLevelCallback)) then begin
    fReadLowLevelCallback(self, _messageLength, _messageChunkOffset, _messageChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperErrorCount(const aPacket: TDynamicByteArray);
var
  _overrunErrorCount: longword;
  _parityErrorCount: longword;
begin
  _overrunErrorCount:= LEConvertUInt32From(8, aPacket);
  _parityErrorCount:= LEConvertUInt32From(12, aPacket);

  if (Assigned(fErrorCountCallback)) then begin
    fErrorCountCallback(self, _overrunErrorCount, _parityErrorCount);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadCoils_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(fModbusSlaveReadCoils_requestCallback)) then begin
    fModbusSlaveReadCoils_requestCallback(self, _requestID, _startingAddress, _count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadCoils_responseLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
  _coilsLength: word;
  _coilsChunkOffset: word;
  _coilsChunkData: TArray0To463OfBoolean;
  _coilsChunkLength: word;
  _i: longint;
  _coilsChunkDataBits: array [0..57] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);
  _coilsLength:= LEConvertUInt16From(10, aPacket);
  _coilsChunkOffset:= LEConvertUInt16From(12, aPacket);
  FillChar(_coilsChunkDataBits[0], Length(_coilsChunkDataBits) * SizeOf(_coilsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do _coilsChunkDataBits[_i]:= LEConvertUInt8From(14 + (_i * 1), aPacket);
  for _i:= 0 to 463 do _coilsChunkData[_i]:= ((_coilsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  _coilsChunkLength:= _coilsLength - _coilsChunkOffset;
  if (_coilsChunkLength > 464) then begin
    _coilsChunkLength:= 464;
  end;
  if (fModbusMasterReadCoils_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_coilsChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusMasterReadCoils_responseHighLevelCallbackState.data, _coilsLength);
      Move(_coilsChunkData[0], fModbusMasterReadCoils_responseHighLevelCallbackState.data[0], SizeOf(boolean) * _coilsChunkLength);
      fModbusMasterReadCoils_responseHighLevelCallbackState.length:= _coilsChunkLength;

      if (fModbusMasterReadCoils_responseHighLevelCallbackState.length >= _coilsLength) then begin { Stream complete }
        if (Assigned(fModbusMasterReadCoils_responseCallback)) then begin
          fModbusMasterReadCoils_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadCoils_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_coilsChunkOffset <> fModbusMasterReadCoils_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
      fModbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
      fModbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusMasterReadCoils_responseCallback)) then begin
        fModbusMasterReadCoils_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadCoils_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_coilsChunkData[0], fModbusMasterReadCoils_responseHighLevelCallbackState.data[fModbusMasterReadCoils_responseHighLevelCallbackState.length], SizeOf(boolean) * _coilsChunkLength);
      Inc(fModbusMasterReadCoils_responseHighLevelCallbackState.length, _coilsChunkLength);

      if fModbusMasterReadCoils_responseHighLevelCallbackState.length >= _coilsLength then begin { Stream complete }
        if (Assigned(fModbusMasterReadCoils_responseCallback)) then begin
          fModbusMasterReadCoils_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadCoils_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadCoils_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadCoils_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadCoils_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusMasterReadCoils_responseLowLevelCallback)) then begin
    fModbusMasterReadCoils_responseLowLevelCallback(self, _requestID, _exceptionCode, _coilsLength, _coilsChunkOffset, _coilsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadHoldingRegisters_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(fModbusSlaveReadHoldingRegisters_requestCallback)) then begin
    fModbusSlaveReadHoldingRegisters_requestCallback(self, _requestID, _startingAddress, _count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadHoldingRegisters_responseLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
  _holdingRegistersLength: word;
  _holdingRegistersChunkOffset: word;
  _holdingRegistersChunkData: TArray0To28OfUInt16;
  _holdingRegistersChunkLength: word;
  _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);
  _holdingRegistersLength:= LEConvertUInt16From(10, aPacket);
  _holdingRegistersChunkOffset:= LEConvertUInt16From(12, aPacket);
  for _i:= 0 to 28 do _holdingRegistersChunkData[_i]:= LEConvertUInt16From(14 + (_i * 2), aPacket);

  _holdingRegistersChunkLength:= _holdingRegistersLength - _holdingRegistersChunkOffset;
  if (_holdingRegistersChunkLength > 29) then begin
    _holdingRegistersChunkLength:= 29;
  end;
  if (fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_holdingRegistersChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, _holdingRegistersLength);
      Move(_holdingRegistersChunkData[0], fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data[0], SizeOf(word) * _holdingRegistersChunkLength);
      fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= _holdingRegistersChunkLength;

      if (fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length >= _holdingRegistersLength) then begin { Stream complete }
        if (Assigned(fModbusMasterReadHoldingRegisters_responseCallback)) then begin
          fModbusMasterReadHoldingRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_holdingRegistersChunkOffset <> fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
      fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
      fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusMasterReadHoldingRegisters_responseCallback)) then begin
        fModbusMasterReadHoldingRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_holdingRegistersChunkData[0], fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data[fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length], SizeOf(word) * _holdingRegistersChunkLength);
      Inc(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length, _holdingRegistersChunkLength);

      if fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length >= _holdingRegistersLength then begin { Stream complete }
        if (Assigned(fModbusMasterReadHoldingRegisters_responseCallback)) then begin
          fModbusMasterReadHoldingRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadHoldingRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusMasterReadHoldingRegisters_responseLowLevelCallback)) then begin
    fModbusMasterReadHoldingRegisters_responseLowLevelCallback(self, _requestID, _exceptionCode, _holdingRegistersLength, _holdingRegistersChunkOffset, _holdingRegistersChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteSingleCoil_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _coilAddress: longword;
  _coilValue: boolean;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _coilAddress:= LEConvertUInt32From(9, aPacket);
  _coilValue:= LEConvertBooleanFrom(13, aPacket);

  if (Assigned(fModbusSlaveWriteSingleCoil_requestCallback)) then begin
    fModbusSlaveWriteSingleCoil_requestCallback(self, _requestID, _coilAddress, _coilValue);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteSingleCoil_response(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(fModbusMasterWriteSingleCoil_responseCallback)) then begin
    fModbusMasterWriteSingleCoil_responseCallback(self, _requestID, _exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteSingleRegister_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _registerAddress: longword;
  _registerValue: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _registerAddress:= LEConvertUInt32From(9, aPacket);
  _registerValue:= LEConvertUInt16From(13, aPacket);

  if (Assigned(fModbusSlaveWriteSingleRegister_requestCallback)) then begin
    fModbusSlaveWriteSingleRegister_requestCallback(self, _requestID, _registerAddress, _registerValue);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteSingleRegister_response(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(fModbusMasterWriteSingleRegister_responseCallback)) then begin
    fModbusMasterWriteSingleRegister_responseCallback(self, _requestID, _exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteMultipleCoils_requestLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _coilsLength: word;
  _coilsChunkOffset: word;
  _coilsChunkData: TArray0To439OfBoolean;
  _coilsChunkLength: word;
  _i: longint;
  _coilsChunkDataBits: array [0..54] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _coilsLength:= LEConvertUInt16From(13, aPacket);
  _coilsChunkOffset:= LEConvertUInt16From(15, aPacket);
  FillChar(_coilsChunkDataBits[0], Length(_coilsChunkDataBits) * SizeOf(_coilsChunkDataBits[0]), 0);
  for _i:= 0 to 54 do _coilsChunkDataBits[_i]:= LEConvertUInt8From(17 + (_i * 1), aPacket);
  for _i:= 0 to 439 do _coilsChunkData[_i]:= ((_coilsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  _coilsChunkLength:= _coilsLength - _coilsChunkOffset;
  if (_coilsChunkLength > 440) then begin
    _coilsChunkLength:= 440;
  end;
  if (fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_coilsChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, _coilsLength);
      Move(_coilsChunkData[0], fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data[0], SizeOf(boolean) * _coilsChunkLength);
      fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= _coilsChunkLength;

      if (fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length >= _coilsLength) then begin { Stream complete }
        if (Assigned(fModbusSlaveWriteMultipleCoils_requestCallback)) then begin
          fModbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
        end;
        SetLength(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
        fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
        fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_coilsChunkOffset <> fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
      fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
      fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusSlaveWriteMultipleCoils_requestCallback)) then begin
        fModbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_coilsChunkData[0], fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data[fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length], SizeOf(boolean) * _coilsChunkLength);
      Inc(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length, _coilsChunkLength);

      if fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length >= _coilsLength then begin { Stream complete }
        if (Assigned(fModbusSlaveWriteMultipleCoils_requestCallback)) then begin
          fModbusSlaveWriteMultipleCoils_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data);
        end;
        SetLength(fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data, 0);
        fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.data:= nil;
        fModbusSlaveWriteMultipleCoils_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusSlaveWriteMultipleCoils_requestLowLevelCallback)) then begin
    fModbusSlaveWriteMultipleCoils_requestLowLevelCallback(self, _requestID, _startingAddress, _coilsLength, _coilsChunkOffset, _coilsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteMultipleCoils_response(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(fModbusMasterWriteMultipleCoils_responseCallback)) then begin
    fModbusMasterWriteMultipleCoils_responseCallback(self, _requestID, _exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveWriteMultipleRegisters_requestLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _registersLength: word;
  _registersChunkOffset: word;
  _registersChunkData: TArray0To26OfUInt16;
  _registersChunkLength: word;
  _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _registersLength:= LEConvertUInt16From(13, aPacket);
  _registersChunkOffset:= LEConvertUInt16From(15, aPacket);
  for _i:= 0 to 26 do _registersChunkData[_i]:= LEConvertUInt16From(17 + (_i * 2), aPacket);

  _registersChunkLength:= _registersLength - _registersChunkOffset;
  if (_registersChunkLength > 27) then begin
    _registersChunkLength:= 27;
  end;
  if (fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_registersChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, _registersLength);
      Move(_registersChunkData[0], fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data[0], SizeOf(word) * _registersChunkLength);
      fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= _registersChunkLength;

      if (fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length >= _registersLength) then begin { Stream complete }
        if (Assigned(fModbusSlaveWriteMultipleRegisters_requestCallback)) then begin
          fModbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
        end;
        SetLength(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
        fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
        fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_registersChunkOffset <> fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
      fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
      fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusSlaveWriteMultipleRegisters_requestCallback)) then begin
        fModbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_registersChunkData[0], fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data[fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length], SizeOf(word) * _registersChunkLength);
      Inc(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length, _registersChunkLength);

      if fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length >= _registersLength then begin { Stream complete }
        if (Assigned(fModbusSlaveWriteMultipleRegisters_requestCallback)) then begin
          fModbusSlaveWriteMultipleRegisters_requestCallback(self, _requestID, _startingAddress, fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data);
        end;
        SetLength(fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data, 0);
        fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.data:= nil;
        fModbusSlaveWriteMultipleRegisters_requestHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusSlaveWriteMultipleRegisters_requestLowLevelCallback)) then begin
    fModbusSlaveWriteMultipleRegisters_requestLowLevelCallback(self, _requestID, _startingAddress, _registersLength, _registersChunkOffset, _registersChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterWriteMultipleRegisters_response(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);

  if (Assigned(fModbusMasterWriteMultipleRegisters_responseCallback)) then begin
    fModbusMasterWriteMultipleRegisters_responseCallback(self, _requestID, _exceptionCode);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadDiscreteInputs_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(fModbusSlaveReadDiscreteInputs_requestCallback)) then begin
    fModbusSlaveReadDiscreteInputs_requestCallback(self, _requestID, _startingAddress, _count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadDiscreteInputs_responseLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
  _discreteInputsLength: word;
  _discreteInputsChunkOffset: word;
  _discreteInputsChunkData: TArray0To463OfBoolean;
  _discreteInputsChunkLength: word;
  _i: longint;
  _discreteInputsChunkDataBits: array [0..57] of byte;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);
  _discreteInputsLength:= LEConvertUInt16From(10, aPacket);
  _discreteInputsChunkOffset:= LEConvertUInt16From(12, aPacket);
  FillChar(_discreteInputsChunkDataBits[0], Length(_discreteInputsChunkDataBits) * SizeOf(_discreteInputsChunkDataBits[0]), 0);
  for _i:= 0 to 57 do _discreteInputsChunkDataBits[_i]:= LEConvertUInt8From(14 + (_i * 1), aPacket);
  for _i:= 0 to 463 do _discreteInputsChunkData[_i]:= ((_discreteInputsChunkDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);

  _discreteInputsChunkLength:= _discreteInputsLength - _discreteInputsChunkOffset;
  if (_discreteInputsChunkLength > 464) then begin
    _discreteInputsChunkLength:= 464;
  end;
  if (fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_discreteInputsChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, _discreteInputsLength);
      Move(_discreteInputsChunkData[0], fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data[0], SizeOf(boolean) * _discreteInputsChunkLength);
      fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= _discreteInputsChunkLength;

      if (fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length >= _discreteInputsLength) then begin { Stream complete }
        if (Assigned(fModbusMasterReadDiscreteInputs_responseCallback)) then begin
          fModbusMasterReadDiscreteInputs_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_discreteInputsChunkOffset <> fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
      fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
      fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusMasterReadDiscreteInputs_responseCallback)) then begin
        fModbusMasterReadDiscreteInputs_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_discreteInputsChunkData[0], fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data[fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length], SizeOf(boolean) * _discreteInputsChunkLength);
      Inc(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length, _discreteInputsChunkLength);

      if fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length >= _discreteInputsLength then begin { Stream complete }
        if (Assigned(fModbusMasterReadDiscreteInputs_responseCallback)) then begin
          fModbusMasterReadDiscreteInputs_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadDiscreteInputs_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusMasterReadDiscreteInputs_responseLowLevelCallback)) then begin
    fModbusMasterReadDiscreteInputs_responseLowLevelCallback(self, _requestID, _exceptionCode, _discreteInputsLength, _discreteInputsChunkOffset, _discreteInputsChunkData);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusSlaveReadInputRegisters_request(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _startingAddress: longword;
  _count: word;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _startingAddress:= LEConvertUInt32From(9, aPacket);
  _count:= LEConvertUInt16From(13, aPacket);

  if (Assigned(fModbusSlaveReadInputRegisters_requestCallback)) then begin
    fModbusSlaveReadInputRegisters_requestCallback(self, _requestID, _startingAddress, _count);
  end;
end;

procedure TBrickletRS485.CallbackWrapperModbusMasterReadInputRegisters_responseLowLevel(const aPacket: TDynamicByteArray);
var 
  _requestID: byte;
  _exceptionCode: shortint;
  _inputRegistersLength: word;
  _inputRegistersChunkOffset: word;
  _inputRegistersChunkData: TArray0To28OfUInt16;
  _inputRegistersChunkLength: word;
  _i: longint;
begin
  _requestID:= LEConvertUInt8From(8, aPacket);
  _exceptionCode:= LEConvertInt8From(9, aPacket);
  _inputRegistersLength:= LEConvertUInt16From(10, aPacket);
  _inputRegistersChunkOffset:= LEConvertUInt16From(12, aPacket);
  for _i:= 0 to 28 do _inputRegistersChunkData[_i]:= LEConvertUInt16From(14 + (_i * 2), aPacket);

  _inputRegistersChunkLength:= _inputRegistersLength - _inputRegistersChunkOffset;
  if (_inputRegistersChunkLength > 29) then begin
    _inputRegistersChunkLength:= 29;
  end;
  if (fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data = nil) then begin { No stream in-progress }
    if (_inputRegistersChunkOffset = 0) then begin { Stream starts }
      SetLength(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data, _inputRegistersLength);
      Move(_inputRegistersChunkData[0], fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data[0], SizeOf(word) * _inputRegistersChunkLength);
      fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= _inputRegistersChunkLength;

      if (fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length >= _inputRegistersLength) then begin { Stream complete }
        if (Assigned(fModbusMasterReadInputRegisters_responseCallback)) then begin
          fModbusMasterReadInputRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end
  else begin { Stream in-progress }
    if (_inputRegistersChunkOffset <> fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length) then begin { Stream out-of-sync }
      SetLength(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
      fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
      fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      if (Assigned(fModbusMasterReadInputRegisters_responseCallback)) then begin
        fModbusMasterReadInputRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
      end;
    end
    else begin { Stream in-sync }
      Move(_inputRegistersChunkData[0], fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data[fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length], SizeOf(word) * _inputRegistersChunkLength);
      Inc(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length, _inputRegistersChunkLength);

      if fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length >= _inputRegistersLength then begin { Stream complete }
        if (Assigned(fModbusMasterReadInputRegisters_responseCallback)) then begin
          fModbusMasterReadInputRegisters_responseCallback(self, _requestID, _exceptionCode, fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data);
        end;
        SetLength(fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data, 0);
        fModbusMasterReadInputRegisters_responseHighLevelCallbackState.data:= nil;
        fModbusMasterReadInputRegisters_responseHighLevelCallbackState.length:= 0;
      end;
    end;
  end;

  if (Assigned(fModbusMasterReadInputRegisters_responseLowLevelCallback)) then begin
    fModbusMasterReadInputRegisters_responseLowLevelCallback(self, _requestID, _exceptionCode, _inputRegistersLength, _inputRegistersChunkOffset, _inputRegistersChunkData);
  end;
end;

end.
