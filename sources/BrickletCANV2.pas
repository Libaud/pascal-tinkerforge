{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickletCANV2;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, TinkerforgeCommon, ThreadedDevice, IPConnection, LEConverter;

{$I BrickletCANV2.inc}

type
  TArray0To14OfUInt8 = array [0..14] of byte;
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To31OfBoolean = array [0..31] of boolean;
  TArray0To31OfInt8 = array [0..31] of shortint;
  TArray0To63OfUInt8 = array [0..63] of byte;
  TArrayOfBoolean = array of boolean;
  TArrayOfInt8 = array of shortint;
  TArrayOfUInt8 = array of byte;

  TFrameReadHighLevelCallbackState = record
    data: TArrayOfUInt8;
    length: byte;
  end;

  TBrickletCANV2 = class;
  TBrickletCANV2NotifyFrameReadLowLevel = procedure(aSender: TBrickletCANV2; const aFrameType: byte;
                                                    const aIdentifier: longword; const aDataLength: byte;
                                                    const aData: TArray0To14OfUInt8) of object;
  TBrickletCANV2NotifyFrameRead = procedure(aSender: TBrickletCANV2; const aFrameType: byte; const aIdentifier: longword;
                                            const aData: TArrayOfUInt8) of object;

  /// <summary>
  ///  Communicates with CAN bus devices
  /// </summary>
  TBrickletCANV2 = class(TThreadedDevice)
  private
    frameReadHighLevelCallbackState: TFrameReadHighLevelCallbackState;
    frameReadLowLevelCallback: TBrickletCANV2NotifyFrameReadLowLevel;
    frameReadCallback: TBrickletCANV2NotifyFrameRead;
    procedure CallbackWrapperFrameReadLowLevel(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    constructor Create(aOwner: TComponent); override;

    /// <summary>
    ///  Writes a data or remote frame to the write queue to be transmitted over the
    ///  CAN transceiver.
    ///  
    ///  The Bricklet supports the standard 11-bit (CAN 2.0A) and the additional extended
    ///  29-bit (CAN 2.0B) identifiers. For standard frames the Bricklet uses bit 0 to 10
    ///  from the ``identifier`` parameter as standard 11-bit identifier. For extended
    ///  frames the Bricklet uses bit 0 to 28 from the ``identifier`` parameter as
    ///  extended 29-bit identifier.
    ///  
    ///  The ``data`` parameter can be up to 15 bytes long. For data frames up to 8 bytes
    ///  will be used as the actual data. The length (DLC) field in the data or remote
    ///  frame will be set to the actual length of the ``data`` parameter. This allows
    ///  to transmit data and remote frames with excess length. For remote frames only
    ///  the length of the ``data`` parameter is used. The actual ``data`` bytes are
    ///  ignored.
    ///  
    ///  Returns *true* if the frame was successfully added to the write queue. Returns
    ///  *false* if the frame could not be added because write queue is already full or
    ///  because the write buffer or the write backlog are configured with a size of
    ///  zero (see <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  
    ///  The write queue can overflow if frames are written to it at a higher rate
    ///  than the Bricklet can transmitted them over the CAN transceiver. This may
    ///  happen if the CAN transceiver is configured as read-only or is using a low baud
    ///  rate (see <see cref="BrickletCANV2.TBrickletCANV2.SetTransceiverConfiguration"/>). It can also happen if the CAN
    ///  bus is congested and the frame cannot be transmitted because it constantly loses
    ///  arbitration or because the CAN transceiver is currently disabled due to a high
    ///  write error level (see <see cref="BrickletCANV2.TBrickletCANV2.GetErrorLog"/>).
    /// </summary>
    function WriteFrameLowLevel(const aFrameType: byte; const aIdentifier: longword;
                                const aDataLength: byte; const aData: TArray0To14OfUInt8): boolean; virtual;

    /// <summary>
    ///  Writes a data or remote frame to the write queue to be transmitted over the
    ///  CAN transceiver.
    ///  
    ///  The Bricklet supports the standard 11-bit (CAN 2.0A) and the additional extended
    ///  29-bit (CAN 2.0B) identifiers. For standard frames the Bricklet uses bit 0 to 10
    ///  from the ``identifier`` parameter as standard 11-bit identifier. For extended
    ///  frames ther Bricklet uses bit 0 to 28 from the ``identifier`` parameter as
    ///  extended 29-bit identifier.
    ///  
    ///  The ``data`` parameter can be up to 15 bytes long. For data frames up to 8 bytes
    ///  will be used as the actual data. The length (DLC) field in the data or remote
    ///  frame will be set to the actual length of the ``data`` parameter. This allows
    ///  to transmit data and remote frames with excess length. For remote frames only
    ///  the length of the ``data`` parameter is used. The actual ``data`` bytes are
    ///  ignored.
    ///  
    ///  Returns *true* if the frame was successfully added to the write queue. Returns
    ///  *false* if the frame could not be added because write queue is already full or
    ///  because thre write buffer or the write backlog are configured with a size of
    ///  zero (see <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  
    ///  The write queue can overflow if frames are written to it at a higher rate
    ///  than the Bricklet can transmitted them over the CAN transceiver. This may
    ///  happen if the CAN transceiver is configured as read-only or is using a low baud
    ///  rate (see <see cref="BrickletCANV2.TBrickletCANV2.SetTransceiverConfiguration"/>). It can also happen if the CAN
    ///  bus is congested and the frame cannot be transmitted because it constantly loses
    ///  arbitration or because the CAN transceiver is currently disabled due to a high
    ///  write error level (see <see cref="BrickletCANV2.TBrickletCANV2.GetErrorLog"/>).
    /// </summary>
    function WriteFrame(const aFrameType: byte; const aIdentifier: longword; const aData: array of byte): boolean; virtual;

    /// <summary>
    ///  Tries to read the next data or remote frame from the read queue and returns it.
    ///  If a frame was successfully read, then the ``success`` return value is set to
    ///  *true* and the other return values contain the frame. If the read queue is
    ///  empty and no frame could be read, then the ``success`` return value is set to
    ///  *false* and the other return values contain invalid data.
    ///  
    ///  The ``identifier`` return value follows the identifier format described for
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/>.
    ///  
    ///  The ``data`` return value can be up to 15 bytes long. For data frames up to the
    ///  first 8 bytes are the actual received data. All bytes after the 8th byte are
    ///  always zero and only there to indicate the length of a data or remote frame
    ///  with excess length. For remote frames the length of the ``data`` return value
    ///  represents the _requested length. The actual ``data`` bytes are always zero.
    ///  
    ///  A configurable read filter can be used to define which frames should be
    ///  received by the CAN transceiver and put into the read queue (see
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>).
    ///  
    ///  Instead of polling with this function, you can also use callbacks. See the
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetFrameReadCallbackConfiguration"/> function and the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/>
    ///  callback.
    /// </summary>
    procedure ReadFrameLowLevel(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword;
                                out aDataLength: byte; out aData: TArray0To14OfUInt8); virtual;

    /// <summary>
    ///  Tries to read the next data or remote frame from the read queue and returns it.
    ///  If a frame was successfully read, then the ``success`` return value is set to
    ///  *true* and the other return values contain the frame. If the read queue is
    ///  empty and no frame could be read, then the ``success`` return value is set to
    ///  *false* and the other return values contain invalid data.
    ///  
    ///  The ``identifier`` return value follows the identifier format described for
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/>.
    ///  
    ///  The ``data`` return value can be up to 15 bytes long. For data frames up to the
    ///  first 8 bytes are the actual received data. All bytes after the 8th byte are
    ///  always zero and only there to indicate the length of a data or remote frame
    ///  with excess length. For remote frames the length of the ``data`` return value
    ///  represents the _requested length. The actual ``data`` bytes are always zero.
    ///  
    ///  A configurable read filter can be used to define which frames should be
    ///  received by the CAN transceiver and put into the read queue (see
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>).
    ///  
    ///  Instead of polling with this function, you can also use callbacks. See the
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetFrameReadCallbackConfiguration"/> function and the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/>
    ///  callback.
    /// </summary>
    procedure ReadFrame(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword; out aData: TArrayOfUInt8); virtual;

    /// <summary>
    ///  Enables and disables the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/> callback.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure SetFrameReadCallbackConfiguration(const aEnabled: boolean); virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/> callback is enabled, *false* otherwise.
    /// </summary>
    function GetFrameReadCallbackConfiguration: boolean; virtual;

    /// <summary>
    ///  Sets the transceiver configuration for the CAN bus communication.
    ///  
    ///  The CAN transceiver has three different modes:
    ///  
    ///  * Normal: Reads from and writes to the CAN bus and performs active bus
    ///    error detection and acknowledgement.
    ///  * Loopback: All reads and writes are performed internally. The transceiver
    ///    is disconnected from the actual CAN bus.
    ///  * Read-Only: Only reads from the CAN bus, but does neither active bus error
    ///    detection nor acknowledgement. Only the receiving part of the transceiver
    ///    is connected to the CAN bus.
    /// </summary>
    procedure SetTransceiverConfiguration(const aBaudRate: longword; const aSamplePoint: word; const aTransceiverMode: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetTransceiverConfiguration"/>.
    /// </summary>
    procedure GetTransceiverConfiguration(out aBaudRate: longword; out aSamplePoint: word; out aTransceiverMode: byte); virtual;

    /// <summary>
    ///  Sets the write and read queue configuration.
    ///  
    ///  The CAN transceiver has 32 buffers in total in hardware for transmitting and
    ///  receiving frames. Additionally, the Bricklet has a backlog for 768 frames in
    ///  total in software. The buffers and the backlog can be freely assigned to the
    ///  write and read queues.
    ///  
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/> writes a frame into the write backlog. The Bricklet moves
    ///  the frame from the backlog into a free write buffer. The CAN transceiver then
    ///  transmits the frame from the write buffer to the CAN bus. If there are no
    ///  write buffers (``write_buffer_size`` is zero) or there is no write backlog
    ///  (``write_backlog_size`` is zero) then no frames can be transmitted and
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/> returns always *false*.
    ///  
    ///  The CAN transceiver receives a frame from the CAN bus and stores it into a
    ///  free read buffer. The Bricklet moves the frame from the read buffer into the
    ///  read backlog. <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/> reads the frame from the read backlog and
    ///  returns it. If there are no read buffers (``read_buffer_sizes`` is empty) or
    ///  there is no read backlog (``read_backlog_size`` is zero) then no frames can be
    ///  received and <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/> returns always *false*.
    ///  
    ///  There can be multiple read buffers, because the CAN transceiver cannot receive
    ///  data and remote frames into the same read buffer. A positive read buffer size
    ///  represents a data frame read buffer and a negative read buffer size represents
    ///  a remote frame read buffer. A read buffer size of zero is not allowed. By
    ///  default the first read buffer is configured for data frames and the second read
    ///  buffer is configured for remote frame. There can be up to 32 different read
    ///  buffers, assuming that no write buffer is used. Each read buffer has its own
    ///  filter configuration (see <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>).
    ///  
    ///  A valid queue configuration fulfills these conditions::
    ///  
    ///   write_buffer_size + abs(read_buffer_size_0) + abs(read_buffer_size_1) + ... + abs(read_buffer_size_31) &lt;= 32
    ///   write_backlog_size + read_backlog_size &lt;= 768
    ///  
    ///  The write buffer timeout has three different modes that define how a failed
    ///  frame transmission should be handled:
    ///  
    ///  * Single-Shot (&lt; 0): Only one transmission attempt will be made. If the
    ///    transmission fails then the frame is discarded.
    ///  * Infinite (= 0): Infinite transmission attempts will be made. The frame will
    ///    never be discarded.
    ///  * Milliseconds (&gt; 0): A limited number of transmission attempts will be made.
    ///    If the frame could not be transmitted successfully after the configured
    ///    number of milliseconds then the frame is discarded.
    ///  
    ///  The current content of the queues is lost when this function is called.
    /// </summary>
    procedure SetQueueConfigurationLowLevel(const aWriteBufferSize: byte; const aWriteBufferTimeout: longint;
                                            const aWriteBacklogSize: word; const aReadBufferSizesLength: byte;
                                            const aReadBufferSizesData: TArray0To31OfInt8; const aReadBacklogSize: word); virtual;

    /// <summary>
    ///  Sets the write and read queue configuration.
    ///  
    ///  The CAN transceiver has 32 buffers in total in hardware for transmitting and
    ///  receiving frames. Additionally, the Bricklet has a backlog for 768 frames in
    ///  total in software. The buffers and the backlog can be freely assigned to the
    ///  write and read queues.
    ///  
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/> writes a frame into the write backlog. The Bricklet moves
    ///  the frame from the backlog into a free write buffer. The CAN transceiver then
    ///  transmits the frame from the write buffer to the CAN bus. If there are no
    ///  write buffers (``write_buffer_size`` is zero) or there is no write backlog
    ///  (``write_backlog_size`` is zero) then no frames can be transmitted and
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/> returns always *false*.
    ///  
    ///  The CAN transceiver receives a frame from the CAN bus and stores it into a
    ///  free read buffer. The Bricklet moves the frame from the read buffer into the
    ///  read backlog. <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/> reads the frame from the read backlog and
    ///  returns it. If there are no read buffers (``read_buffer_sizes`` is empty) or
    ///  there is no read backlog (``read_backlog_size`` is zero) then no frames can be
    ///  received and <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/> returns always *false*.
    ///  
    ///  There can be multiple read buffers, because the CAN transceiver cannot receive
    ///  data and remote frames into the same read buffer. A positive read buffer size
    ///  represents a data frame read buffer and a negative read buffer size represents
    ///  a remote frame read buffer. A read buffer size of zero is not allowed. By
    ///  default the first read buffer is configured for data frames and the second read
    ///  buffer is configured for remote frame. There can be up to 32 different read
    ///  buffers, assuming that no write buffer is used. Each read buffer has its own
    ///  filter configuration (see <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>).
    ///  
    ///  A valid queue configuration fulfills these conditions::
    ///  
    ///   write_buffer_size + abs(read_buffer_size_0) + abs(read_buffer_size_1) + ... + abs(read_buffer_size_31) &lt;= 32
    ///   write_backlog_size + read_backlog_size &lt;= 768
    ///  
    ///  The write buffer timeout has three different modes that define how a failed
    ///  frame transmission should be handled:
    ///  
    ///  * Single-Shot (&lt; 0): Only one transmission attempt will be made. If the
    ///    transmission fails then the frame is discarded.
    ///  * Infinite (= 0): Infinite transmission attempts will be made. The frame will
    ///    never be discarded.
    ///  * Milliseconds (&gt; 0): A limited number of transmission attempts will be made.
    ///    If the frame could not be transmitted successfully after the configured
    ///    number of milliseconds then the frame is discarded.
    ///  
    ///  The current content of the queues is lost when this function is called.
    /// </summary>
    procedure SetQueueConfiguration(const aWriteBufferSize: byte; const aWriteBufferTimeout: longint;
                                    const aWriteBacklogSize: word; const aReadBufferSizes: array of shortint;
                                    const aReadBacklogSize: word); virtual;

    /// <summary>
    ///  Returns the queue configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>.
    /// </summary>
    procedure GetQueueConfigurationLowLevel(out aWriteBufferSize: byte; out aWriteBufferTimeout: longint;
                                            out aWriteBacklogSize: word; out aReadBufferSizesLength: byte;
                                            out aReadBufferSizesData: TArray0To31OfInt8; out aReadBacklogSize: word); virtual;

    /// <summary>
    ///  Returns the queue configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>.
    /// </summary>
    procedure GetQueueConfiguration(out aWriteBufferSize: byte; out aWriteBufferTimeout: longint;
                                    out aWriteBacklogSize: word; out aReadBufferSizes: TArrayOfInt8;
                                    out aReadBacklogSize: word); virtual;

    /// <summary>
    ///  Set the read filter configuration for the given read buffer index. This can be
    ///  used to define which frames should be received by the CAN transceiver and put
    ///  into the read buffer.
    ///  
    ///  The read filter has four different modes that define if and how the filter mask
    ///  and the filter identifier are applied:
    ///  
    ///  * Accept-All: All frames are received.
    ///  * Match-Standard-Only: Only standard frames with a matching identifier are
    ///    received.
    ///  * Match-Extended-Only: Only extended frames with a matching identifier are
    ///    received.
    ///  * Match-Standard-And-Extended: Standard and extended frames with a matching
    ///    identifier are received.
    ///  
    ///  The filter mask and filter identifier are used as bit masks. Their usage
    ///  depends on the mode:
    ///  
    ///  * Accept-All: Mask and identifier are ignored.
    ///  * Match-Standard-Only: Bit 0 to 10 (11 bits) of filter mask and filter
    ///    identifier are used to match the 11-bit identifier of standard frames.
    ///  * Match-Extended-Only: Bit 0 to 28 (29 bits) of filter mask and filter
    ///    identifier are used to match the 29-bit identifier of extended frames.
    ///  * Match-Standard-And-Extended: Bit 18 to 28 (11 bits) of filter mask and filter
    ///    identifier are used to match the 11-bit identifier of standard frames, bit 0
    ///    to 17 (18 bits) are ignored in this case. Bit 0 to 28 (29 bits) of filter
    ///    mask and filter identifier are used to match the 29-bit identifier of extended
    ///    frames.
    ///  
    ///  The filter mask and filter identifier are applied in this way: The filter mask
    ///  is used to select the frame identifier bits that should be compared to the
    ///  corresponding filter identifier bits. All unselected bits are automatically
    ///  accepted. All selected bits have to match the filter identifier to be accepted.
    ///  If all bits for the selected mode are accepted then the frame is accepted and
    ///  is added to the read buffer.
    ///  
    ///  <code>
    ///   "Filter Mask Bit", "Filter Identifier Bit", "Frame Identifier Bit", "Result"
    ///  
    ///   0, X, X, Accept
    ///   1, 0, 0, Accept
    ///   1, 0, 1, Reject
    ///   1, 1, 0, Reject
    ///   1, 1, 1, Accept
    ///  </code>
    ///  
    ///  For example, to receive standard frames with identifier 0x123 only, the mode
    ///  can be set to Match-Standard-Only with 0x7FF as mask and 0x123 as identifier.
    ///  The mask of 0x7FF selects all 11 identifier bits for matching so that the
    ///  identifier has to be exactly 0x123 to be accepted.
    ///  
    ///  To accept identifier 0x123 and identifier 0x456 at the same time, just set
    ///  filter 2 to 0x456 and keep mask and filter 1 unchanged.
    ///  
    ///  There can be up to 32 different read filters configured at the same time,
    ///  because there can be up to 32 read buffer (see <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  
    ///  The default mode is accept-all for all read buffers.
    /// </summary>
    procedure SetReadFilterConfiguration(const aBufferIndex: byte; const aFilterMode: byte;
                                         const aFilterMask: longword; const aFilterIdentifier: longword); virtual;

    /// <summary>
    ///  Returns the read filter configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>.
    /// </summary>
    procedure GetReadFilterConfiguration(const aBufferIndex: byte; out aFilterMode: byte;
                                         out aFilterMask: longword; out aFilterIdentifier: longword); virtual;

    /// <summary>
    ///  Returns information about different kinds of errors.
    ///  
    ///  The write and read error levels indicate the current level of stuffing, form,
    ///  acknowledgement, bit and checksum errors during CAN bus write and read
    ///  operations. For each of this error kinds there is also an individual counter.
    ///  
    ///  When the write error level extends 255 then the CAN transceiver gets disabled
    ///  and no frames can be transmitted or received anymore. The CAN transceiver will
    ///  automatically be activated again after the CAN bus is idle for a while.
    ///  
    ///  The write buffer timeout, read buffer and backlog overflow counts represents the
    ///  number of these errors:
    ///  
    ///  * A write buffer timeout occurs if a frame could not be transmitted before the
    ///    configured write buffer timeout expired (see <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  * A read buffer overflow occurs if a read buffer of the CAN transceiver
    ///    still contains the last received frame when the next frame arrives. In this
    ///    case the last received frame is lost. This happens if the CAN transceiver
    ///    receives more frames than the Bricklet can handle. Using the read filter
    ///    (see <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>) can help to reduce the amount of
    ///    received frames. This count is not exact, but a lower bound, because the
    ///    Bricklet might not able detect all overflows if they occur in rapid succession.
    ///  * A read backlog overflow occurs if the read backlog of the Bricklet is already
    ///    full when the next frame should be read from a read buffer of the CAN
    ///    transceiver. In this case the frame in the read buffer is lost. This
    ///    happens if the CAN transceiver receives more frames to be added to the read
    ///    backlog than are removed from the read backlog using the <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/>
    ///    function. Using the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/> callback ensures that the read backlog
    ///    can not overflow.
    ///  
    ///  The read buffer overflow counter counts the overflows of all configured read
    ///  buffers. Which read buffer exactly suffered from an overflow can be figured
    ///  out from the read buffer overflow occurrence list
    ///  (``read_buffer_overflow_error_occurred``).
    /// </summary>
    procedure GetErrorLogLowLevel(out transceiverState: byte; out transceiverWriteErrorLevel: byte;
                                  out transceiverReadErrorLevel: byte; out transceiverStuffingErrorCount: longword;
                                  out transceiverFormatErrorCount: longword; out transceiverACKErrorCount: longword;
                                  out transceiverBit1ErrorCount: longword; out transceiverBit0ErrorCount: longword;
                                  out transceiverCRCErrorCount: longword; out writeBufferTimeoutErrorCount: longword;
                                  out readBufferOverflowErrorCount: longword; out readBufferOverflowErrorOccurredLength: byte;
                                  out readBufferOverflowErrorOccurredData: TArray0To31OfBoolean;
                                  out readBacklogOverflowErrorCount: longword); virtual;

    /// <summary>
    ///  Returns information about different kinds of errors.
    ///  
    ///  The write and read error levels indicate the current level of stuffing, form,
    ///  acknowledgement, bit and checksum errors during CAN bus write and read
    ///  operations. For each of this error kinds there is also an individual counter.
    ///  
    ///  When the write error level extends 255 then the CAN transceiver gets disabled
    ///  and no frames can be transmitted or received anymore. The CAN transceiver will
    ///  automatically be activated again after the CAN bus is idle for a while.
    ///  
    ///  The write buffer timeout, read buffer and backlog overflow counts represents the
    ///  number of these errors:
    ///  
    ///  * A write buffer timeout occurs if a frame could not be transmitted before the
    ///    configured write buffer timeout expired (see <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  * A read buffer overflow occurs if a read buffer of the CAN transceiver
    ///    still contains the last received frame when the next frame arrives. In this
    ///    case the last received frame is lost. This happens if the CAN transceiver
    ///    receives more frames than the Bricklet can handle. Using the read filter
    ///    (see <see cref="BrickletCANV2.TBrickletCANV2.SetReadFilterConfiguration"/>) can help to reduce the amount of
    ///    received frames. This count is not exact, but a lower bound, because the
    ///    Bricklet might not able detect all overflows if they occur in rapid succession.
    ///  * A read backlog overflow occurs if the read backlog of the Bricklet is already
    ///    full when the next frame should be read from a read buffer of the CAN
    ///    transceiver. In this case the frame in the read buffer is lost. This
    ///    happens if the CAN transceiver receives more frames to be added to the read
    ///    backlog than are removed from the read backlog using the <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/>
    ///    function. Using the <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/> callback ensures that the read backlog
    ///    can not overflow.
    ///  
    ///  The read buffer overflow counter counts the overflows of all configured read
    ///  buffers. Which read buffer exactly suffered from an overflow can be figured
    ///  out from the read buffer overflow occurrence list
    ///  (``read_buffer_overflow_error_occurred``).
    /// </summary>
    procedure GetErrorLog(out aTransceiverState: byte; out aTransceiverWriteErrorLevel: byte; out aTransceiverReadErrorLevel: byte;
                          out aTransceiverStuffingErrorCount: longword; out aTransceiverFormatErrorCount: longword;
                          out aTransceiverACKErrorCount: longword; out aTransceiverBit1ErrorCount: longword;
                          out aTransceiverBit0ErrorCount: longword; out aTransceiverCRCErrorCount: longword;
                          out aWriteBufferTimeoutErrorCount: longword; out aReadBufferOverflowErrorCount: longword;
                          out aReadBufferOverflowErrorOccurred: TArrayOfBoolean; out aReadBacklogOverflowErrorCount: longword); virtual;

    /// <summary>
    ///  Sets the communication LED configuration. By default the LED shows
    ///  CAN-Bus traffic, it flickers once for every 40 transmitted or received frames.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetCommunicationLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetCommunicationLEDConfig"/>
    /// </summary>
    function GetCommunicationLEDConfig: byte; virtual;

    /// <summary>
    ///  Sets the error LED configuration.
    ///  
    ///  By default (show-transceiver-state) the error LED turns on if the CAN
    ///  transceiver is passive or disabled state (see <see cref="BrickletCANV2.TBrickletCANV2.GetErrorLog"/>). If
    ///  the CAN transceiver is in active state the LED turns off.
    ///  
    ///  If the LED is configured as show-error then the error LED turns on if any error
    ///  occurs. If you call this function with the show-error option again, the LED will
    ///  turn off until the next error occurs.
    ///  
    ///  You can also turn the LED permanently on/off or show a heartbeat.
    ///  
    ///  If the Bricklet is in bootloader mode, the LED is off.
    /// </summary>
    procedure SetErrorLEDConfig(const aConfig: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetErrorLEDConfig"/>.
    /// </summary>
    function GetErrorLEDConfig: byte; virtual;

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
    ///  Returns the current bootloader mode, see <see cref="BrickletCANV2.TBrickletCANV2.SetBootloaderMode"/>.
    /// </summary>
    function GetBootloaderMode: byte; virtual;

    /// <summary>
    ///  Sets the firmware pointer for <see cref="BrickletCANV2.TBrickletCANV2.WriteFirmware"/>. The pointer has
    ///  to be increased by chunks of size 64. The data is written to flash
    ///  every 4 chunks (which equals to one page of size 256).
    ///  
    ///  This function is used by Brick Viewer during flashing. It should not be
    ///  necessary to call it in a normal user program.
    /// </summary>
    procedure SetWriteFirmwarePointer(const aPointer: longword); virtual;

    /// <summary>
    ///  Writes 64 Bytes of firmware at the position as written by
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetWriteFirmwarePointer"/> before. The firmware is written
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
    ///  Returns the configuration as set by <see cref="BrickletCANV2.TBrickletCANV2.SetStatusLEDConfig"/>
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
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char;
                          out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber;
                          out aDeviceIdentifier: word); override;

    /// <summary>
    ///  <see cref="BrickletCANV2.TBrickletCANV2.OnFrameRead"/>
    /// </summary>
    property OnFrameReadLowLevel: TBrickletCANV2NotifyFrameReadLowLevel read frameReadLowLevelCallback write frameReadLowLevelCallback;

    /// <summary>
    ///  This callback is triggered if a data or remote frame was received by the CAN
    ///  transceiver.
    ///  
    ///  The ``identifier`` return value follows the identifier format described for
    ///  <see cref="BrickletCANV2.TBrickletCANV2.WriteFrame"/>.
    ///  
    ///  For details on the ``data`` return value see <see cref="BrickletCANV2.TBrickletCANV2.ReadFrame"/>.
    ///  
    ///  A configurable read filter can be used to define which frames should be
    ///  received by the CAN transceiver and put into the read queue (see
    ///  <see cref="BrickletCANV2.TBrickletCANV2.SetQueueConfiguration"/>).
    ///  
    ///  To enable this callback, use <see cref="BrickletCANV2.TBrickletCANV2.SetFrameReadCallbackConfiguration"/>.
    ///  
    ///  <note>
    ///   If reconstructing the value fails, the callback is triggered with nil for data.
    ///  </note>
    /// </summary>
    property OnFrameRead: TBrickletCANV2NotifyFrameRead read frameReadCallback write frameReadCallback;
  end;

implementation

uses
  Math, TinkerforgeExceptions;

constructor TBrickletCANV2.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
  SetLength(frameReadHighLevelCallbackState.data, 0);
  frameReadHighLevelCallbackState.data:= nil;
  frameReadHighLevelCallbackState.length:= 0;
end;

procedure TBrickletCANV2.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickletCANV2.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_WRITE_FRAME_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_READ_FRAME_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_FRAME_READ_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_FRAME_READ_CALLBACK_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_TRANSCEIVER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_TRANSCEIVER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_QUEUE_CONFIGURATION_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_QUEUE_CONFIGURATION_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_READ_FILTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_READ_FILTER_CONFIGURATION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LOG_LOW_LEVEL]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_COMMUNICATION_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_SPITFP_ERROR_COUNT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_BOOTLOADER_MODE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_WRITE_FIRMWARE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_SET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_STATUS_LED_CONFIG]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_CHIP_TEMPERATURE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_RESET]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_WRITE_UID]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_READ_UID]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICKLET_CAN_V2_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickletCANV2.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICKLET_CAN_V2_CALLBACK_FRAME_READ_LOW_LEVEL]:= {$ifdef FPC}@{$endif}CallbackWrapperFrameReadLowLevel;
end;

function TBrickletCANV2.WriteFrameLowLevel(const aFrameType: byte; const aIdentifier: longword; const aDataLength: byte; const aData: TArray0To14OfUInt8): boolean;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_WRITE_FRAME_LOW_LEVEL, 29);
  LEConvertUInt8To(aFrameType, 8, _request);
  LEConvertUInt32To(aIdentifier, 9, _request);
  LEConvertUInt8To(aDataLength, 13, _request);
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 14 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

function TBrickletCANV2.WriteFrame(const aFrameType: byte; const aIdentifier: longword; const aData: array of byte): boolean;
var
  _dataLength: byte;
  _Data: TArray0To14OfUInt8;
begin
  if (Length(aData) > 15) then begin
    raise EInvalidParameterException.Create('Data can be at most 15 items long');
  end;

  _dataLength:= Length(aData);

  FillChar(_Data[0], SizeOf(byte) * 15, 0);
  Move(aData[0], _Data[0], SizeOf(byte) * _dataLength);

  Result:= WriteFrameLowLevel(aFrameType, aIdentifier, _dataLength, _Data);
end;

procedure TBrickletCANV2.ReadFrameLowLevel(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword; out aDataLength: byte; out aData: TArray0To14OfUInt8);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_READ_FRAME_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aSuccess:= LEConvertBooleanFrom(8, _response);
  aFrameType:= LEConvertUInt8From(9, _response);
  aIdentifier:= LEConvertUInt32From(10, _response);
  aDataLength:= LEConvertUInt8From(14, _response);
  for _i:= 0 to 14 do aData[_i]:= LEConvertUInt8From(15 + (_i * 1), _response);
end;

procedure TBrickletCANV2.ReadFrame(out aSuccess: boolean; out aFrameType: byte; out aIdentifier: longword; out aData: TArrayOfUInt8);
var
  _dataLength: byte;
  _Data: TArray0To14OfUInt8;
begin
  ReadFrameLowLevel(aSuccess, aFrameType, aIdentifier, _dataLength, _Data);
  SetLength(aData, _dataLength);
  Move(_Data, aData[0], SizeOf(byte) * _dataLength);
end;

procedure TBrickletCANV2.SetFrameReadCallbackConfiguration(const aEnabled: boolean);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_FRAME_READ_CALLBACK_CONFIGURATION, 9);
  LEConvertBooleanTo(aEnabled, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.GetFrameReadCallbackConfiguration: boolean;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_FRAME_READ_CALLBACK_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertBooleanFrom(8, _response);
end;

procedure TBrickletCANV2.SetTransceiverConfiguration(const aBaudRate: longword; const aSamplePoint: word; const aTransceiverMode: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_TRANSCEIVER_CONFIGURATION, 15);
  LEConvertUInt32To(aBaudRate, 8, _request);
  LEConvertUInt16To(aSamplePoint, 12, _request);
  LEConvertUInt8To(aTransceiverMode, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletCANV2.GetTransceiverConfiguration(out aBaudRate: longword; out aSamplePoint: word; out aTransceiverMode: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_TRANSCEIVER_CONFIGURATION, 8);
  _response:= SendRequest(_request);
  aBaudRate:= LEConvertUInt32From(8, _response);
  aSamplePoint:= LEConvertUInt16From(12, _response);
  aTransceiverMode:= LEConvertUInt8From(14, _response);
end;

procedure TBrickletCANV2.SetQueueConfigurationLowLevel(const aWriteBufferSize: byte; const aWriteBufferTimeout: longint; const aWriteBacklogSize: word; const aReadBufferSizesLength: byte; const aReadBufferSizesData: TArray0To31OfInt8; const aReadBacklogSize: word);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_QUEUE_CONFIGURATION_LOW_LEVEL, 50);
  LEConvertUInt8To(aWriteBufferSize, 8, _request);
  LEConvertInt32To(aWriteBufferTimeout, 9, _request);
  LEConvertUInt16To(aWriteBacklogSize, 13, _request);
  LEConvertUInt8To(aReadBufferSizesLength, 15, _request);
  for _i:= 0 to Length(aReadBufferSizesData) - 1 do LEConvertInt8To(aReadBufferSizesData[_i], 16 + (_i * 1), _request);
  LEConvertUInt16To(aReadBacklogSize, 48, _request);
  SendRequest(_request);
end;

procedure TBrickletCANV2.SetQueueConfiguration(const aWriteBufferSize: byte; const aWriteBufferTimeout: longint; const aWriteBacklogSize: word; const aReadBufferSizes: array of shortint; const aReadBacklogSize: word);
var
  _readBufferSizesLength: byte;
  _readBufferSizesData: TArray0To31OfInt8;
begin
  if (Length(aReadBufferSizes) > 32) then begin
    raise EInvalidParameterException.Create('Read Buffer Sizes can be at most 32 items long');
  end;

  _readBufferSizesLength:= Length(aReadBufferSizes);

  FillChar(_readBufferSizesData[0], SizeOf(shortint) * 32, 0);
  Move(aReadBufferSizes[0], _readBufferSizesData[0], SizeOf(shortint) * _readBufferSizesLength);

  SetQueueConfigurationLowLevel(aWriteBufferSize, aWriteBufferTimeout, aWriteBacklogSize, _readBufferSizesLength, _readBufferSizesData, aReadBacklogSize);
end;

procedure TBrickletCANV2.GetQueueConfigurationLowLevel(out aWriteBufferSize: byte; out aWriteBufferTimeout: longint; out aWriteBacklogSize: word; out aReadBufferSizesLength: byte; out aReadBufferSizesData: TArray0To31OfInt8; out aReadBacklogSize: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_QUEUE_CONFIGURATION_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  aWriteBufferSize:= LEConvertUInt8From(8, _response);
  aWriteBufferTimeout:= LEConvertInt32From(9, _response);
  aWriteBacklogSize:= LEConvertUInt16From(13, _response);
  aReadBufferSizesLength:= LEConvertUInt8From(15, _response);
  for _i:= 0 to 31 do aReadBufferSizesData[_i]:= LEConvertInt8From(16 + (_i * 1), _response);
  aReadBacklogSize:= LEConvertUInt16From(48, _response);
end;

procedure TBrickletCANV2.GetQueueConfiguration(out aWriteBufferSize: byte; out aWriteBufferTimeout: longint; out aWriteBacklogSize: word; out aReadBufferSizes: TArrayOfInt8; out aReadBacklogSize: word);
var
  readBufferSizesLength: byte;
  readBufferSizesData: TArray0To31OfInt8;
begin
  GetQueueConfigurationLowLevel(aWriteBufferSize, aWriteBufferTimeout, aWriteBacklogSize, readBufferSizesLength, readBufferSizesData, aReadBacklogSize);
  SetLength(aReadBufferSizes, readBufferSizesLength);
  Move(readBufferSizesData, aReadBufferSizes[0], SizeOf(shortint) * readBufferSizesLength);
end;

procedure TBrickletCANV2.SetReadFilterConfiguration(const aBufferIndex: byte; const aFilterMode: byte; const aFilterMask: longword; const aFilterIdentifier: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_READ_FILTER_CONFIGURATION, 18);
  LEConvertUInt8To(aBufferIndex, 8, _request);
  LEConvertUInt8To(aFilterMode, 9, _request);
  LEConvertUInt32To(aFilterMask, 10, _request);
  LEConvertUInt32To(aFilterIdentifier, 14, _request);
  SendRequest(_request);
end;

procedure TBrickletCANV2.GetReadFilterConfiguration(const aBufferIndex: byte; out aFilterMode: byte; out aFilterMask: longword; out aFilterIdentifier: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_READ_FILTER_CONFIGURATION, 9);
  LEConvertUInt8To(aBufferIndex, 8, _request);
  _response:= SendRequest(_request);
  aFilterMode:= LEConvertUInt8From(8, _response);
  aFilterMask:= LEConvertUInt32From(9, _response);
  aFilterIdentifier:= LEConvertUInt32From(13, _response);
end;

procedure TBrickletCANV2.GetErrorLogLowLevel(out transceiverState: byte; out transceiverWriteErrorLevel: byte; out transceiverReadErrorLevel: byte; out transceiverStuffingErrorCount: longword; out transceiverFormatErrorCount: longword; out transceiverACKErrorCount: longword; out transceiverBit1ErrorCount: longword; out transceiverBit0ErrorCount: longword; out transceiverCRCErrorCount: longword; out writeBufferTimeoutErrorCount: longword; out readBufferOverflowErrorCount: longword; out readBufferOverflowErrorOccurredLength: byte; out readBufferOverflowErrorOccurredData: TArray0To31OfBoolean; out readBacklogOverflowErrorCount: longword);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
  _readBufferOverflowErrorOccurredDataBits: array [0..3] of byte;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LOG_LOW_LEVEL, 8);
  _response:= SendRequest(_request);
  transceiverState:= LEConvertUInt8From(8, _response);
  transceiverWriteErrorLevel:= LEConvertUInt8From(9, _response);
  transceiverReadErrorLevel:= LEConvertUInt8From(10, _response);
  transceiverStuffingErrorCount:= LEConvertUInt32From(11, _response);
  transceiverFormatErrorCount:= LEConvertUInt32From(15, _response);
  transceiverACKErrorCount:= LEConvertUInt32From(19, _response);
  transceiverBit1ErrorCount:= LEConvertUInt32From(23, _response);
  transceiverBit0ErrorCount:= LEConvertUInt32From(27, _response);
  transceiverCRCErrorCount:= LEConvertUInt32From(31, _response);
  writeBufferTimeoutErrorCount:= LEConvertUInt32From(35, _response);
  readBufferOverflowErrorCount:= LEConvertUInt32From(39, _response);
  readBufferOverflowErrorOccurredLength:= LEConvertUInt8From(43, _response);
  FillChar(_readBufferOverflowErrorOccurredDataBits[0], Length(_readBufferOverflowErrorOccurredDataBits) * SizeOf(_readBufferOverflowErrorOccurredDataBits[0]), 0);
  for _i:= 0 to 3 do _readBufferOverflowErrorOccurredDataBits[_i]:= LEConvertUInt8From(44 + (_i * 1), _response);
  for _i:= 0 to 31 do readBufferOverflowErrorOccurredData[_i]:= ((_readBufferOverflowErrorOccurredDataBits[Floor(_i / 8)] and (1 shl (_i mod 8))) <> 0);
  readBacklogOverflowErrorCount:= LEConvertUInt32From(48, _response);
end;

procedure TBrickletCANV2.GetErrorLog(out aTransceiverState: byte; out aTransceiverWriteErrorLevel: byte; out aTransceiverReadErrorLevel: byte; out aTransceiverStuffingErrorCount: longword; out aTransceiverFormatErrorCount: longword; out aTransceiverACKErrorCount: longword; out aTransceiverBit1ErrorCount: longword; out aTransceiverBit0ErrorCount: longword; out aTransceiverCRCErrorCount: longword; out aWriteBufferTimeoutErrorCount: longword; out aReadBufferOverflowErrorCount: longword; out aReadBufferOverflowErrorOccurred: TArrayOfBoolean; out aReadBacklogOverflowErrorCount: longword);
var
  _readBufferOverflowErrorOccurredLength: byte;
  _readBufferOverflowErrorOccurredData: TArray0To31OfBoolean;
begin
  GetErrorLogLowLevel(aTransceiverState, aTransceiverWriteErrorLevel, aTransceiverReadErrorLevel, aTransceiverStuffingErrorCount, aTransceiverFormatErrorCount, aTransceiverACKErrorCount, aTransceiverBit1ErrorCount, aTransceiverBit0ErrorCount, aTransceiverCRCErrorCount, aWriteBufferTimeoutErrorCount, aReadBufferOverflowErrorCount, _readBufferOverflowErrorOccurredLength, _readBufferOverflowErrorOccurredData, aReadBacklogOverflowErrorCount);
  SetLength(aReadBufferOverflowErrorOccurred, _readBufferOverflowErrorOccurredLength);
  Move(_readBufferOverflowErrorOccurredData, aReadBufferOverflowErrorOccurred[0], SizeOf(boolean) * _readBufferOverflowErrorOccurredLength);
end;

procedure TBrickletCANV2.SetCommunicationLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_COMMUNICATION_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.GetCommunicationLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_COMMUNICATION_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCANV2.SetErrorLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_ERROR_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.GetErrorLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_ERROR_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCANV2.GetSPITFPErrorCount(out aErrorCountAckChecksum: longword; out aErrorCountMessageChecksum: longword; out aErrorCountFrame: longword; out aErrorCountOverflow: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_SPITFP_ERROR_COUNT, 8);
  _response:= SendRequest(_request);
  aErrorCountAckChecksum:= LEConvertUInt32From(8, _response);
  aErrorCountMessageChecksum:= LEConvertUInt32From(12, _response);
  aErrorCountFrame:= LEConvertUInt32From(16, _response);
  aErrorCountOverflow:= LEConvertUInt32From(20, _response);
end;

function TBrickletCANV2.SetBootloaderMode(const aMode: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_BOOTLOADER_MODE, 9);
  LEConvertUInt8To(aMode, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCANV2.GetBootloaderMode: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_BOOTLOADER_MODE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCANV2.SetWriteFirmwarePointer(const aPointer: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_WRITE_FIRMWARE_POINTER, 12);
  LEConvertUInt32To(aPointer, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.WriteFirmware(const aData: array of byte): byte;
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_WRITE_FIRMWARE, 72);
  if (Length(aData) <> 64) then raise EInvalidParameterException.Create('Data has to be exactly 64 items long');
  for _i:= 0 to Length(aData) - 1 do LEConvertUInt8To(aData[_i], 8 + (_i * 1), _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickletCANV2.SetStatusLEDConfig(const aConfig: byte);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_SET_STATUS_LED_CONFIG, 9);
  LEConvertUInt8To(aConfig, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.GetStatusLEDConfig: byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_STATUS_LED_CONFIG, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickletCANV2.GetChipTemperature: smallint;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertInt16From(8, _response);
end;

procedure TBrickletCANV2.Reset;
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_RESET, 8);
  SendRequest(_request);
end;

procedure TBrickletCANV2.WriteUID(const aUID: longword);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_WRITE_UID, 12);
  LEConvertUInt32To(aUID, 8, _request);
  SendRequest(_request);
end;

function TBrickletCANV2.ReadUID: longword;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_READ_UID, 8);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt32From(8, _response);
end;

procedure TBrickletCANV2.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICKLET_CAN_V2_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickletCANV2.CallbackWrapperFrameReadLowLevel(const aPacket: TDynamicByteArray);
var
  _frameType: byte;
  _identifier: longword;
  _dataLength: byte;
  _Data: TArray0To14OfUInt8;
  _i: longint;
begin
  _frameType:= LEConvertUInt8From(8, aPacket);
  _identifier:= LEConvertUInt32From(9, aPacket);
  _dataLength:= LEConvertUInt8From(13, aPacket);
  for _i:= 0 to 14 do _Data[_i]:= LEConvertUInt8From(14 + (_i * 1), aPacket);

  SetLength(frameReadHighLevelCallbackState.data, _dataLength);
  Move(_Data[0], frameReadHighLevelCallbackState.data[0], SizeOf(byte) * _dataLength);
  if (Assigned(frameReadCallback)) then begin
    frameReadCallback(self, _frameType, _identifier, frameReadHighLevelCallbackState.data);
  end;
  SetLength(frameReadHighLevelCallbackState.data, 0);
  frameReadHighLevelCallbackState.data:= nil;
  frameReadHighLevelCallbackState.length:= 0;

  if (Assigned(frameReadLowLevelCallback)) then begin
    frameReadLowLevelCallback(self, _frameType, _identifier, _dataLength, _Data);
  end;
end;

end.
