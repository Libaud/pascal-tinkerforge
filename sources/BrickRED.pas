{
  This file was automatically generated on 2019-11-25.

  Delphi/Lazarus Bindings Version 2.1.26

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generators git on tinkerforge.com
}

unit BrickRED;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  TinkerforgeCommon, Device, IPConnection, LEConverter;

{$I BrickRED.inc}

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfUInt8 = array [0..59] of byte;
  TArray0To60OfUInt8 = array [0..60] of byte;
  TArray0To61OfUInt8 = array [0..61] of byte;

  TBrickRED = class;
  TBrickREDNotifyAsyncFileRead = procedure(aSender: TBrickRED; const aFileId: word; const aErrorCode: byte;
                                           const aBuffer: TArray0To59OfUInt8; const aLengthRead: byte) of object;
  TBrickREDNotifyAsyncFileWrite = procedure(aSender: TBrickRED; const aFileId: word; const aErrorCode: byte; const aLengthWritten: byte) of object;
  TBrickREDNotifyFileEventsOccurred = procedure(aSender: TBrickRED; const aFileId: word; const aEvents: word) of object;
  TBrickREDNotifyProcessStateChanged = procedure(aSender: TBrickRED; const aProcessId: word; const aState: byte;
                                                 const aTimestamp: uint64; const aExitCode: byte) of object;
  TBrickREDNotifyProgramSchedulerStateChanged = procedure(aSender: TBrickRED; const aProgramId: word) of object;
  TBrickREDNotifyProgramProcessSpawned = procedure(aSender: TBrickRED; const aProgramId: word) of object;

  /// <summary>
  ///  Executes user programs and controls other Bricks/Bricklets standalone
  /// </summary>
  TBrickRED = class(TDevice)
  private
    asyncFileReadCallback: TBrickREDNotifyAsyncFileRead;
    asyncFileWriteCallback: TBrickREDNotifyAsyncFileWrite;
    fileEventsOccurredCallback: TBrickREDNotifyFileEventsOccurred;
    processStateChangedCallback: TBrickREDNotifyProcessStateChanged;
    programSchedulerStateChangedCallback: TBrickREDNotifyProgramSchedulerStateChanged;
    programProcessSpawnedCallback: TBrickREDNotifyProgramProcessSpawned;
    procedure CallbackWrapperAsyncFileRead(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperAsyncFileWrite(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperFileEventsOccurred(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperProcessStateChanged(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperProgramSchedulerStateChanged(const aPacket: TDynamicByteArray); virtual;
    procedure CallbackWrapperProgramProcessSpawned(const aPacket: TDynamicByteArray); virtual;
  protected
    // Inherited method's
    procedure InitializeVersion(var aVersion: TTFVersionNumber); override;
    procedure InitializeResponseExpected(var aResponseExpected: TTFResponseExpected); override;
    procedure InitializeCallbacks(var aCallBacks: TTFCallbackWrappers); override;
  public
    /// <summary>
    ///  
    /// </summary>
    procedure CreateSession(const aLifetime: longword; out aErrorCode: byte; out aSessionId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function ExpireSession(const aSessionId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure ExpireSessionUnchecked(const aSessionId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function KeepSessionAlive(const aSessionId: word; const aLifetime: longword): byte; virtual;

    /// <summary>
    ///  Decreases the reference count of an object by one and returns the resulting
    ///  error code. If the reference count reaches zero the object gets destroyed.
    /// </summary>
    function ReleaseObject(const aObjectId: word; const aSessionId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure ReleaseObjectUnchecked(const aObjectId: word; const aSessionId: word); virtual;

    /// <summary>
    ///  Allocates a new string object, reserves ``length_to_reserve`` bytes memory
    ///  for it and sets up to the first 60 bytes. Set ``length_to_reserve`` to the
    ///  length of the string that should be stored in the string object.
    ///  
    ///  Returns the object ID of the new string object and the resulting error code.
    /// </summary>
    procedure AllocateString(const aLengthToReserve: longword; const aBuffer: string; const aSessionId: word; out aErrorCode: byte; out aStringId: word); virtual;

    /// <summary>
    ///  Truncates a string object to ``length`` bytes and returns the resulting
    ///  error code.
    /// </summary>
    function TruncateString(const aStringId: word; const aLength: longword): byte; virtual;

    /// <summary>
    ///  Returns the length of a string object in bytes and the resulting error code.
    /// </summary>
    procedure GetStringLength(const aStringId: word; out aErrorCode: byte; out aLength: longword); virtual;

    /// <summary>
    ///  Sets a chunk of up to 58 bytes in a string object beginning at ``offset``.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function SetStringChunk(const aStringId: word; const aOffset: longword; const aBuffer: string): byte; virtual;

    /// <summary>
    ///  Returns a chunk up to 63 bytes from a string object beginning at ``offset`` and
    ///  returns the resulting error code.
    /// </summary>
    procedure GetStringChunk(const aStringId: word; const aOffset: longword; out aErrorCode: byte; out aBuffer: string); virtual;

    /// <summary>
    ///  Allocates a new list object and reserves memory for ``length_to_reserve``
    ///  items. Set ``length_to_reserve`` to the number of items that should be stored
    ///  in the list object.
    ///  
    ///  Returns the object ID of the new list object and the resulting error code.
    ///  
    ///  When a list object gets destroyed then the reference count of each object in
    ///  the list object is decreased by one.
    /// </summary>
    procedure AllocateList(const aLengthToReserve: word; const aSessionId: word; out aErrorCode: byte; out aListId: word); virtual;

    /// <summary>
    ///  Returns the length of a list object in items and the resulting error code.
    /// </summary>
    procedure GetListLength(const aListId: word; out aErrorCode: byte; out aLength: word); virtual;

    /// <summary>
    ///  Returns the object ID and type of the object stored at ``index`` in a list
    ///  object and returns the resulting error code.
    ///  
    ///  Possible object types are:
    ///  
    ///  * String = 0
    ///  * List = 1
    ///  * File = 2
    ///  * Directory = 3
    ///  * Process = 4
    ///  * Program = 5
    /// </summary>
    procedure GetListItem(const aListId: word; const aIndex: word; const aSessionId: word; out aErrorCode: byte; out aItemObjectId: word; out aType: byte); virtual;

    /// <summary>
    ///  Appends an object to a list object and increases the reference count of the
    ///  appended object by one.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function AppendToList(const aListId: word; const aItemObjectId: word): byte; virtual;

    /// <summary>
    ///  Removes the object stored at ``index`` from a list object and decreases the
    ///  reference count of the removed object by one.
    ///  
    ///  Returns the resulting error code.
    /// </summary>
    function RemoveFromList(const aListId: word; const aIndex: word): byte; virtual;

    /// <summary>
    ///  Opens an existing file or creates a new file and allocates a new file object
    ///  for it.
    ///  
    ///  FIXME: name has to be absolute
    ///  
    ///  The reference count of the name string object is increased by one. When the
    ///  file object gets destroyed then the reference count of the name string object is
    ///  decreased by one. Also the name string object is locked and cannot be modified
    ///  while the file object holds a reference to it.
    ///  
    ///  The ``flags`` parameter takes a ORed combination of the following possible file
    ///  flags (in hexadecimal notation):
    ///  
    ///  * ReadOnly = 0x0001 (O_RDONLY)
    ///  * WriteOnly = 0x0002 (O_WRONLY)
    ///  * ReadWrite = 0x0004 (O_RDWR)
    ///  * Append = 0x0008 (O_APPEND)
    ///  * Create = 0x0010 (O_CREAT)
    ///  * Exclusive = 0x0020 (O_EXCL)
    ///  * NonBlocking = 0x0040 (O_NONBLOCK)
    ///  * Truncate = 0x0080 (O_TRUNC)
    ///  * Temporary = 0x0100
    ///  * Replace = 0x0200
    ///  
    ///  FIXME: explain *Temporary* and *Replace* flag
    ///  
    ///  The ``permissions`` parameter takes a ORed combination of the following
    ///  possible file permissions (in octal notation) that match the common UNIX
    ///  permission bits:
    ///  
    ///  * UserRead = 00400
    ///  * UserWrite = 00200
    ///  * UserExecute = 00100
    ///  * GroupRead = 00040
    ///  * GroupWrite = 00020
    ///  * GroupExecute = 00010
    ///  * OthersRead = 00004
    ///  * OthersWrite = 00002
    ///  * OthersExecute = 00001
    ///  
    ///  Returns the object ID of the new file object and the resulting error code.
    /// </summary>
    procedure OpenFile(const aNameStringId: word; const aFlags: longword; const aPermissions: word; const aUID: longword; const aGID: longword; const aSessionId: word; out aErrorCode: byte; out aFileId: word); virtual;

    /// <summary>
    ///  Creates a new pipe and allocates a new file object for it.
    ///  
    ///  The ``flags`` parameter takes a ORed combination of the following possible
    ///  pipe flags (in hexadecimal notation):
    ///  
    ///  * NonBlockingRead = 0x0001
    ///  * NonBlockingWrite = 0x0002
    ///  
    ///  The length of the pipe buffer can be specified with the ``length`` parameter
    ///  in bytes. If length is set to zero, then the default pipe buffer length is used.
    ///  
    ///  Returns the object ID of the new file object and the resulting error code.
    /// </summary>
    procedure CreatePipe(const aFlags: longword; const aLength: uint64; const aSessionId: word; out aErrorCode: byte; out aFileId: word); virtual;

    /// <summary>
    ///  Returns various information about a file and the resulting error code.
    ///  
    ///  Possible file types are:
    ///  
    ///  * Unknown = 0
    ///  * Regular = 1
    ///  * Directory = 2
    ///  * Character = 3
    ///  * Block = 4
    ///  * FIFO = 5
    ///  * Symlink = 6
    ///  * Socket = 7
    ///  * Pipe = 8
    ///  
    ///  If the file type is *Pipe* then the returned name string object is invalid,
    ///  because a pipe has no name. Otherwise the returned name string object was used
    ///  to open or create the file object, as passed to <see cref="BrickRED.TBrickRED.OpenFile"/>.
    ///  
    ///  The returned flags were used to open or create the file object, as passed to
    ///  <see cref="BrickRED.TBrickRED.OpenFile"/> or <see cref="BrickRED.TBrickRED.CreatePipe"/>. See the respective function for a list
    ///  of possible file and pipe flags.
    ///  
    ///  FIXME: everything except flags and length is invalid if file type is *Pipe*
    /// </summary>
    procedure GetFileInfo(const aFileId: word; const aSessionId: word; out aErrorCode: byte; out aType: byte; out aNameStringId: word; out aFlags: longword; out aPermissions: word; out aUID: longword; out aGID: longword; out aLength: uint64; out aAccessTimestamp: uint64; out aModificationTimestamp: uint64; out aStatusChangeTimestamp: uint64); virtual;

    /// <summary>
    ///  Reads up to 62 bytes from a file object.
    ///  
    ///  Returns the bytes read, the actual number of bytes read and the resulting
    ///  error code.
    ///  
    ///  If there is not data to be read, either because the file position reached
    ///  end-of-file or because there is not data in the pipe, then zero bytes are
    ///  returned.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingRead* flag then the
    ///  error code *NotSupported* is returned.
    /// </summary>
    procedure ReadFile(const aFileId: word; const aLengthToRead: byte; out aErrorCode: byte; out aBuffer: TArray0To61OfUInt8; out aLengthRead: byte); virtual;

    /// <summary>
    ///  Reads up to 2\ :sup:`63`\  - 1 bytes from a file object asynchronously.
    ///  
    ///  Reports the bytes read (in 60 byte chunks), the actual number of bytes read and
    ///  the resulting error code via the <see cref="BrickRED.TBrickRED.OnAsyncFileRead"/> callback.
    ///  
    ///  If there is not data to be read, either because the file position reached
    ///  end-of-file or because there is not data in the pipe, then zero bytes are
    ///  reported.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingRead* flag then the error
    ///  code *NotSupported* is reported via the <see cref="BrickRED.TBrickRED.OnAsyncFileRead"/> callback.
    /// </summary>
    procedure ReadFileAsync(const aFileId: word; const aLengthToRead: uint64); virtual;

    /// <summary>
    ///  Aborts a <see cref="BrickRED.TBrickRED.ReadFileAsync"/> operation in progress.
    ///  
    ///  Returns the resulting error code.
    ///  
    ///  On success the <see cref="BrickRED.TBrickRED.OnAsyncFileRead"/> callback will report *OperationAborted*.
    /// </summary>
    function AbortAsyncFileRead(const aFileId: word): byte; virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Returns the actual number of bytes written and the resulting error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  error code *NotSupported* is returned.
    /// </summary>
    procedure WriteFile(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte; out aErrorCode: byte; out aLengthWritten: byte); virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Does neither report the actual number of bytes written nor the resulting error
    ///  code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  write operation will fail silently.
    /// </summary>
    procedure WriteFileUnchecked(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte); virtual;

    /// <summary>
    ///  Writes up to 61 bytes to a file object.
    ///  
    ///  Reports the actual number of bytes written and the resulting error code via the
    ///  <see cref="BrickRED.TBrickRED.OnAsyncFileWrite"/> callback.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.OpenFile"/> without the *NonBlocking*
    ///  flag or by <see cref="BrickRED.TBrickRED.CreatePipe"/> without the *NonBlockingWrite* flag then the
    ///  error code *NotSupported* is reported via the <see cref="BrickRED.TBrickRED.OnAsyncFileWrite"/> callback.
    /// </summary>
    procedure WriteFileAsync(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte); virtual;

    /// <summary>
    ///  Set the current seek position of a file object in bytes relative to ``origin``.
    ///  
    ///  Possible file origins are:
    ///  
    ///  * Beginning = 0
    ///  * Current = 1
    ///  * End = 2
    ///  
    ///  Returns the resulting absolute seek position and error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.CreatePipe"/> then it has no seek
    ///  position and the error code *InvalidSeek* is returned.
    /// </summary>
    procedure SetFilePosition(const aFileId: word; const aOffset: int64; const aOrigin: byte; out aErrorCode: byte; out aPosition: uint64); virtual;

    /// <summary>
    ///  Returns the current seek position of a file object in bytes and returns the
    ///  resulting error code.
    ///  
    ///  If the file object was created by <see cref="BrickRED.TBrickRED.CreatePipe"/> then it has no seek
    ///  position and the error code *InvalidSeek* is returned.
    /// </summary>
    procedure GetFilePosition(const aFileId: word; out aErrorCode: byte; out aPosition: uint64); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetFileEvents(const aFileId: word; const aEvents: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetFileEvents(const aFileId: word; out aErrorCode: byte; out aEvents: word); virtual;

    /// <summary>
    ///  Opens an existing directory and allocates a new directory object for it.
    ///  
    ///  FIXME: name has to be absolute
    ///  
    ///  The reference count of the name string object is increased by one. When the
    ///  directory object is destroyed then the reference count of the name string
    ///  object is decreased by one. Also the name string object is locked and cannot be
    ///  modified while the directory object holds a reference to it.
    ///  
    ///  Returns the object ID of the new directory object and the resulting error code.
    /// </summary>
    procedure OpenDirectory(const aNameStringId: word; const aSessionId: word; out aErrorCode: byte; out aDirectoryId: word); virtual;

    /// <summary>
    ///  Returns the name of a directory object, as passed to <see cref="BrickRED.TBrickRED.OpenDirectory"/>, and
    ///  the resulting error code.
    /// </summary>
    procedure GetDirectoryName(const aDirectoryId: word; const aSessionId: word; out aErrorCode: byte; out aNameStringId: word); virtual;

    /// <summary>
    ///  Returns the next entry in a directory object and the resulting error code.
    ///  
    ///  If there is not next entry then error code *NoMoreData* is returned. To rewind
    ///  a directory object call <see cref="BrickRED.TBrickRED.RewindDirectory"/>.
    ///  
    ///  Possible directory entry types are:
    ///  
    ///  * Unknown = 0
    ///  * Regular = 1
    ///  * Directory = 2
    ///  * Character = 3
    ///  * Block = 4
    ///  * FIFO = 5
    ///  * Symlink = 6
    ///  * Socket = 7
    /// </summary>
    procedure GetNextDirectoryEntry(const aDirectoryId: word; const aSessionId: word; out aErrorCode: byte; out aNameStringId: word; out aType: byte); virtual;

    /// <summary>
    ///  Rewinds a directory object and returns the resulting error code.
    /// </summary>
    function RewindDirectory(const aDirectoryId: word): byte; virtual;

    /// <summary>
    ///  FIXME: name has to be absolute
    /// </summary>
    function CreateDirectory(const aNameStringId: word; const aFlags: longword; const aPermissions: word; const aUID: longword; const aGID: longword): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProcesses(const aSessionId: word; out aErrorCode: byte; out aProcessesListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure SpawnProcess(const aExecutableStringId: word; const aArgumentsListId: word; const aEnvironmentListId: word; const aWorkingDirectoryStringId: word; const aUID: longword; const aGID: longword; const aStdInFileId: word; const aStdOutFileId: word; const aStdErrFileId: word; const aSessionId: word; out aErrorCode: byte; out aProcessId: word); virtual;

    /// <summary>
    ///  Sends a UNIX signal to a process object and returns the resulting error code.
    ///  
    ///  Possible UNIX signals are:
    ///  
    ///  * Interrupt = 2
    ///  * Quit = 3
    ///  * Abort = 6
    ///  * Kill = 9
    ///  * User1 = 10
    ///  * User2 = 12
    ///  * Terminate = 15
    ///  * Continue =  18
    ///  * Stop = 19
    /// </summary>
    function KillProcess(const aProcessId: word; const aSignal: byte): byte; virtual;

    /// <summary>
    ///  Returns the executable, arguments, environment and working directory used to
    ///  spawn a process object, as passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting
    ///  error code.
    /// </summary>
    procedure GetProcessCommand(const aProcessId: word; const aSessionId: word; out aErrorCode: byte; out aExecutableStringId: word; out aArgumentsListId: word; out aEnvironmentListId: word; out aWorkingDirectoryStringId: word); virtual;

    /// <summary>
    ///  Returns the process ID and the user and group ID used to spawn a process object,
    ///  as passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting error code.
    ///  
    ///  The process ID is only valid if the state is *Running* or *Stopped*, see
    ///  <see cref="BrickRED.TBrickRED.GetProcessState"/>.
    /// </summary>
    procedure GetProcessIdentity(const aProcessId: word; out aErrorCode: byte; out aPID: longword; out aUID: longword; out aGID: longword); virtual;

    /// <summary>
    ///  Returns the stdin, stdout and stderr files used to spawn a process object, as
    ///  passed to <see cref="BrickRED.TBrickRED.SpawnProcess"/>, and the resulting error code.
    /// </summary>
    procedure GetProcessStdio(const aProcessId: word; const aSessionId: word; out aErrorCode: byte; out aStdInFileId: word; out aStdOutFileId: word; out aStdErrFileId: word); virtual;

    /// <summary>
    ///  Returns the current state, timestamp and exit code of a process object, and
    ///  the resulting error code.
    ///  
    ///  Possible process states are:
    ///  
    ///  * Unknown = 0
    ///  * Running = 1
    ///  * Error = 2
    ///  * Exited = 3
    ///  * Killed = 4
    ///  * Stopped = 5
    ///  
    ///  The timestamp represents the UNIX time since when the process is in its current
    ///  state.
    ///  
    ///  The exit code is only valid if the state is *Error*, *Exited*, *Killed* or
    ///  *Stopped* and has different meanings depending on the state:
    ///  
    ///  * Error: error code for error occurred while spawning the process (see below)
    ///  * Exited: exit status of the process
    ///  * Killed: UNIX signal number used to kill the process
    ///  * Stopped: UNIX signal number used to stop the process
    ///  
    ///  Possible exit/error codes in *Error* state are:
    ///  
    ///  * InternalError = 125
    ///  * CannotExecute = 126
    ///  * DoesNotExist = 127
    ///  
    ///  The *CannotExecute* error can be caused by the executable being opened for
    ///  writing.
    /// </summary>
    procedure GetProcessState(const aProcessId: word; out aErrorCode: byte; out aState: byte; out aTimestamp: uint64; out aExitCode: byte); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetPrograms(const aSessionId: word; out aErrorCode: byte; out aProgramsListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure DefineProgram(const aIdentifierStringId: word; const aSessionId: word; out aErrorCode: byte; out aProgramId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function PurgeProgram(const aProgramId: word; const aCookie: longword): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProgramIdentifier(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aIdentifierStringId: word); virtual;

    /// <summary>
    ///  FIXME: root directory is absolute: &lt;home&gt;/programs/&lt;identifier&gt;
    /// </summary>
    procedure GetProgramRootDirectory(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aRootDirectoryStringId: word); virtual;

    /// <summary>
    ///  FIXME: working directory is relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    function SetProgramCommand(const aProgramId: word; const aExecutableStringId: word; const aArgumentsListId: word; const aEnvironmentListId: word; const aWorkingDirectoryStringId: word): byte; virtual;

    /// <summary>
    ///  FIXME: working directory is relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    procedure GetProgramCommand(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aExecutableStringId: word; out aArgumentsListId: word; out aEnvironmentListId: word; out aWorkingDirectoryStringId: word); virtual;

    /// <summary>
    ///  FIXME: stdio file names are relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    function SetProgramStdioRedirection(const aProgramId: word; const aStdInRedirection: byte; const aStdInFileNameStringId: word; const aStdOutRedirection: byte; const aStdOutFileNameStringId: word; const aStdErrRedirection: byte; const aStdErrFileNameStringId: word): byte; virtual;

    /// <summary>
    ///  FIXME: stdio file names are relative to &lt;home&gt;/programs/&lt;identifier&gt;/bin
    /// </summary>
    procedure GetProgramStdioRedirection(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aStdInRedirection: byte; out aStdInFileNameStringId: word; out aStdOutRedirection: byte; out aStdOutFileNameStringId: word; out aStdErrRedirection: byte; out aStdErrFileNameStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetProgramSchedule(const aProgramId: word; const aStartMode: byte; const aContinueAfterError: boolean; const aStartInterval: longword; const aStartFieldsStringId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetProgramSchedule(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aStartMode: byte; out aContinueAfterError: boolean; out aStartInterval: longword; out aStartFieldsStringId: word); virtual;

    /// <summary>
    ///  FIXME: message is currently valid in error-occurred state only
    /// </summary>
    procedure GetProgramSchedulerState(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aState: byte; out aTimestamp: uint64; out aMessageStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function ContinueProgramSchedule(const aProgramId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    function StartProgram(const aProgramId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetLastSpawnedProgramProcess(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aProcessId: word; out aTimestamp: uint64); virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetCustomProgramOptionNames(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aNamesListId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function SetCustomProgramOptionValue(const aProgramId: word; const aNameStringId: word; const aValueStringId: word): byte; virtual;

    /// <summary>
    ///  
    /// </summary>
    procedure GetCustomProgramOptionValue(const aProgramId: word; const aNameStringId: word; const aSessionId: word; out aErrorCode: byte; out aValueStringId: word); virtual;

    /// <summary>
    ///  
    /// </summary>
    function RemoveCustomProgramOption(const aProgramId: word; const aNameStringId: word): byte; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Brick is connected to,
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be '0'-'8' (stack position).
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word); override;

    /// <summary>
    ///  This callback reports the Result of a call to the <see cref="BrickRED.TBrickRED.ReadFileAsync"/>
    ///  function.
    /// </summary>
    property OnAsyncFileRead: TBrickREDNotifyAsyncFileRead read asyncFileReadCallback write asyncFileReadCallback;

    /// <summary>
    ///  This callback reports the Result of a call to the <see cref="BrickRED.TBrickRED.WriteFileAsync"/>
    ///  function.
    /// </summary>
    property OnAsyncFileWrite: TBrickREDNotifyAsyncFileWrite read asyncFileWriteCallback write asyncFileWriteCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnFileEventsOccurred: TBrickREDNotifyFileEventsOccurred read fileEventsOccurredCallback write fileEventsOccurredCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProcessStateChanged: TBrickREDNotifyProcessStateChanged read processStateChangedCallback write processStateChangedCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProgramSchedulerStateChanged: TBrickREDNotifyProgramSchedulerStateChanged read programSchedulerStateChangedCallback write programSchedulerStateChangedCallback;

    /// <summary>
    ///  
    /// </summary>
    property OnProgramProcessSpawned: TBrickREDNotifyProgramProcessSpawned read programProcessSpawnedCallback write programProcessSpawnedCallback;
  end;

implementation

uses
  TinkerforgeExceptions;

procedure TBrickRED.InitializeVersion(var aVersion: TTFVersionNumber);
begin
  aVersion[0]:= 2;
  aVersion[1]:= 0;
  aVersion[2]:= 0;
end;

procedure TBrickRED.InitializeResponseExpected(var aResponseExpected: TTFResponseExpected);
begin
  aResponseExpected[BRICK_RED_FUNCTION_CREATE_SESSION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_EXPIRE_SESSION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_EXPIRE_SESSION_UNCHECKED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_RED_FUNCTION_KEEP_SESSION_ALIVE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_RELEASE_OBJECT]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_RELEASE_OBJECT_UNCHECKED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_RED_FUNCTION_ALLOCATE_STRING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_TRUNCATE_STRING]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_STRING_LENGTH]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_STRING_CHUNK]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_STRING_CHUNK]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_ALLOCATE_LIST]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_LIST_LENGTH]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_LIST_ITEM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_APPEND_TO_LIST]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_REMOVE_FROM_LIST]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_OPEN_FILE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_CREATE_PIPE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_FILE_INFO]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_READ_FILE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_READ_FILE_ASYNC]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_RED_FUNCTION_ABORT_ASYNC_FILE_READ]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_WRITE_FILE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_WRITE_FILE_UNCHECKED]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_RED_FUNCTION_WRITE_FILE_ASYNC]:= DEVICE_RESPONSE_EXPECTED_FALSE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_FILE_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_FILE_POSITION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_FILE_EVENTS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_FILE_EVENTS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_OPEN_DIRECTORY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_DIRECTORY_NAME]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_NEXT_DIRECTORY_ENTRY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_REWIND_DIRECTORY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_CREATE_DIRECTORY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROCESSES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SPAWN_PROCESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_KILL_PROCESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROCESS_COMMAND]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROCESS_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROCESS_STDIO]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROCESS_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAMS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_DEFINE_PROGRAM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_PURGE_PROGRAM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_IDENTIFIER]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_ROOT_DIRECTORY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_COMMAND]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_COMMAND]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_STDIO_REDIRECTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_STDIO_REDIRECTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_PROGRAM_SCHEDULE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULER_STATE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_CONTINUE_PROGRAM_SCHEDULE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_START_PROGRAM]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  aResponseExpected[BRICK_RED_FUNCTION_GET_IDENTITY]:= DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
end;

procedure TBrickRED.InitializeCallbacks(var aCallBacks: TTFCallbackWrappers);
begin
  aCallBacks[BRICK_RED_CALLBACK_ASYNC_FILE_READ]:= {$ifdef FPC}@{$endif}CallbackWrapperAsyncFileRead;
  aCallBacks[BRICK_RED_CALLBACK_ASYNC_FILE_WRITE]:= {$ifdef FPC}@{$endif}CallbackWrapperAsyncFileWrite;
  aCallBacks[BRICK_RED_CALLBACK_FILE_EVENTS_OCCURRED]:= {$ifdef FPC}@{$endif}CallbackWrapperFileEventsOccurred;
  aCallBacks[BRICK_RED_CALLBACK_PROCESS_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperProcessStateChanged;
  aCallBacks[BRICK_RED_CALLBACK_PROGRAM_SCHEDULER_STATE_CHANGED]:= {$ifdef FPC}@{$endif}CallbackWrapperProgramSchedulerStateChanged;
  aCallBacks[BRICK_RED_CALLBACK_PROGRAM_PROCESS_SPAWNED]:= {$ifdef FPC}@{$endif}CallbackWrapperProgramProcessSpawned;
end;

procedure TBrickRED.CreateSession(const aLifetime: longword; out aErrorCode: byte; out aSessionId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_SESSION, 12);
  LEConvertUInt32To(aLifetime, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aSessionId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.ExpireSession(const aSessionId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_EXPIRE_SESSION, 10);
  LEConvertUInt16To(aSessionId, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.ExpireSessionUnchecked(const aSessionId: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_EXPIRE_SESSION_UNCHECKED, 10);
  LEConvertUInt16To(aSessionId, 8, _request);
  SendRequest(_request);
end;

function TBrickRED.KeepSessionAlive(const aSessionId: word; const aLifetime: longword): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_KEEP_SESSION_ALIVE, 14);
  LEConvertUInt16To(aSessionId, 8, _request);
  LEConvertUInt32To(aLifetime, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickRED.ReleaseObject(const aObjectId: word; const aSessionId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_RELEASE_OBJECT, 12);
  LEConvertUInt16To(aObjectId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.ReleaseObjectUnchecked(const aObjectId: word; const aSessionId: word);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_RELEASE_OBJECT_UNCHECKED, 12);
  LEConvertUInt16To(aObjectId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  SendRequest(_request);
end;

procedure TBrickRED.AllocateString(const aLengthToReserve: longword; const aBuffer: string; const aSessionId: word; out aErrorCode: byte; out aStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_ALLOCATE_STRING, 72);
  LEConvertUInt32To(aLengthToReserve, 8, _request);
  LEConvertStringTo(aBuffer, 12, 58, _request);
  LEConvertUInt16To(aSessionId, 70, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aStringId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.TruncateString(const aStringId: word; const aLength: longword): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_TRUNCATE_STRING, 14);
  LEConvertUInt16To(aStringId, 8, _request);
  LEConvertUInt32To(aLength, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetStringLength(const aStringId: word; out aErrorCode: byte; out aLength: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_STRING_LENGTH, 10);
  LEConvertUInt16To(aStringId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aLength:= LEConvertUInt32From(9, _response);
end;

function TBrickRED.SetStringChunk(const aStringId: word; const aOffset: longword; const aBuffer: string): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_STRING_CHUNK, 72);
  LEConvertUInt16To(aStringId, 8, _request);
  LEConvertUInt32To(aOffset, 10, _request);
  LEConvertStringTo(aBuffer, 14, 58, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetStringChunk(const aStringId: word; const aOffset: longword; out aErrorCode: byte; out aBuffer: string);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_STRING_CHUNK, 14);
  LEConvertUInt16To(aStringId, 8, _request);
  LEConvertUInt32To(aOffset, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aBuffer:= LEConvertStringFrom(9, 63, _response);
end;

procedure TBrickRED.AllocateList(const aLengthToReserve: word; const aSessionId: word; out aErrorCode: byte; out aListId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_ALLOCATE_LIST, 12);
  LEConvertUInt16To(aLengthToReserve, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aListId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetListLength(const aListId: word; out aErrorCode: byte; out aLength: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LIST_LENGTH, 10);
  LEConvertUInt16To(aListId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aLength:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetListItem(const aListId: word; const aIndex: word; const aSessionId: word; out aErrorCode: byte; out aItemObjectId: word; out aType: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LIST_ITEM, 14);
  LEConvertUInt16To(aListId, 8, _request);
  LEConvertUInt16To(aIndex, 10, _request);
  LEConvertUInt16To(aSessionId, 12, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aItemObjectId:= LEConvertUInt16From(9, _response);
  aType:= LEConvertUInt8From(11, _response);
end;

function TBrickRED.AppendToList(const aListId: word; const aItemObjectId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_APPEND_TO_LIST, 12);
  LEConvertUInt16To(aListId, 8, _request);
  LEConvertUInt16To(aItemObjectId, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickRED.RemoveFromList(const aListId: word; const aIndex: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_REMOVE_FROM_LIST, 12);
  LEConvertUInt16To(aListId, 8, _request);
  LEConvertUInt16To(aIndex, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.OpenFile(const aNameStringId: word; const aFlags: longword; const aPermissions: word; const aUID: longword; const aGID: longword; const aSessionId: word; out aErrorCode: byte; out aFileId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_OPEN_FILE, 26);
  LEConvertUInt16To(aNameStringId, 8, _request);
  LEConvertUInt32To(aFlags, 10, _request);
  LEConvertUInt16To(aPermissions, 14, _request);
  LEConvertUInt32To(uid, 16, _request);
  LEConvertUInt32To(aGID, 20, _request);
  LEConvertUInt16To(aSessionId, 24, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aFileId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.CreatePipe(const aFlags: longword; const aLength: uint64; const aSessionId: word; out aErrorCode: byte; out aFileId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_PIPE, 22);
  LEConvertUInt32To(aFlags, 8, _request);
  LEConvertUInt64To(aLength, 12, _request);
  LEConvertUInt16To(aSessionId, 20, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aFileId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetFileInfo(const aFileId: word; const aSessionId: word; out aErrorCode: byte; out aType: byte; out aNameStringId: word; out aFlags: longword; out aPermissions: word; out aUID: longword; out aGID: longword; out aLength: uint64; out aAccessTimestamp: uint64; out aModificationTimestamp: uint64; out aStatusChangeTimestamp: uint64);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_INFO, 12);
  LEConvertUInt16To(aFileId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aType:= LEConvertUInt8From(9, _response);
  aNameStringId:= LEConvertUInt16From(10, _response);
  aFlags:= LEConvertUInt32From(12, _response);
  aPermissions:= LEConvertUInt16From(16, _response);
  uid:= LEConvertUInt32From(18, _response);
  aGID:= LEConvertUInt32From(22, _response);
  aLength:= LEConvertUInt64From(26, _response);
  aAccessTimestamp:= LEConvertUInt64From(34, _response);
  aModificationTimestamp:= LEConvertUInt64From(42, _response);
  aStatusChangeTimestamp:= LEConvertUInt64From(50, _response);
end;

procedure TBrickRED.ReadFile(const aFileId: word; const aLengthToRead: byte; out aErrorCode: byte; out aBuffer: TArray0To61OfUInt8; out aLengthRead: byte);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_READ_FILE, 11);
  LEConvertUInt16To(aFileId, 8, _request);
  LEConvertUInt8To(aLengthToRead, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  for _i:= 0 to 61 do aBuffer[_i]:= LEConvertUInt8From(9 + (_i * 1), _response);
  aLengthRead:= LEConvertUInt8From(71, _response);
end;

procedure TBrickRED.ReadFileAsync(const aFileId: word; const aLengthToRead: uint64);
var
  _request: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_READ_FILE_ASYNC, 18);
  LEConvertUInt16To(aFileId, 8, _request);
  LEConvertUInt64To(aLengthToRead, 10, _request);
  SendRequest(_request);
end;

function TBrickRED.AbortAsyncFileRead(const aFileId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_ABORT_ASYNC_FILE_READ, 10);
  LEConvertUInt16To(aFileId, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.WriteFile(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte; out aErrorCode: byte; out aLengthWritten: byte);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE, 72);
  LEConvertUInt16To(aFileId, 8, _request);
  if (Length(aBuffer) <> 61) then raise EInvalidParameterException.Create('Buffer has to be exactly 61 items long');
  for _i:= 0 to Length(aBuffer) - 1 do LEConvertUInt8To(aBuffer[_i], 10 + (_i * 1), _request);
  LEConvertUInt8To(aLengthToWrite, 71, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aLengthWritten:= LEConvertUInt8From(9, _response);
end;

procedure TBrickRED.WriteFileUnchecked(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE_UNCHECKED, 72);
  LEConvertUInt16To(aFileId, 8, _request);
  if (Length(aBuffer) <> 61) then raise EInvalidParameterException.Create('Buffer has to be exactly 61 items long');
  for _i:= 0 to Length(aBuffer) - 1 do LEConvertUInt8To(aBuffer[_i], 10 + (_i * 1), _request);
  LEConvertUInt8To(aLengthToWrite, 71, _request);
  SendRequest(_request);
end;

procedure TBrickRED.WriteFileAsync(const aFileId: word; const aBuffer: array of byte; const aLengthToWrite: byte);
var
  _request: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_WRITE_FILE_ASYNC, 72);
  LEConvertUInt16To(aFileId, 8, _request);
  if (Length(aBuffer) <> 61) then raise EInvalidParameterException.Create('Buffer has to be exactly 61 items long');
  for _i:= 0 to Length(aBuffer) - 1 do LEConvertUInt8To(aBuffer[_i], 10 + (_i * 1), _request);
  LEConvertUInt8To(aLengthToWrite, 71, _request);
  SendRequest(_request);
end;

procedure TBrickRED.SetFilePosition(const aFileId: word; const aOffset: int64; const aOrigin: byte; out aErrorCode: byte; out aPosition: uint64);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_FILE_POSITION, 19);
  LEConvertUInt16To(aFileId, 8, _request);
  LEConvertInt64To(aOffset, 10, _request);
  LEConvertUInt8To(aOrigin, 18, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aPosition:= LEConvertUInt64From(9, _response);
end;

procedure TBrickRED.GetFilePosition(const aFileId: word; out aErrorCode: byte; out aPosition: uint64);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_POSITION, 10);
  LEConvertUInt16To(aFileId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aPosition:= LEConvertUInt64From(9, _response);
end;

function TBrickRED.SetFileEvents(const aFileId: word; const aEvents: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_FILE_EVENTS, 12);
  LEConvertUInt16To(aFileId, 8, _request);
  LEConvertUInt16To(aEvents, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetFileEvents(const aFileId: word; out aErrorCode: byte; out aEvents: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_FILE_EVENTS, 10);
  LEConvertUInt16To(aFileId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aEvents:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.OpenDirectory(const aNameStringId: word; const aSessionId: word; out aErrorCode: byte; out aDirectoryId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_OPEN_DIRECTORY, 12);
  LEConvertUInt16To(aNameStringId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aDirectoryId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetDirectoryName(const aDirectoryId: word; const aSessionId: word; out aErrorCode: byte; out aNameStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_DIRECTORY_NAME, 12);
  LEConvertUInt16To(aDirectoryId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aNameStringId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetNextDirectoryEntry(const aDirectoryId: word; const aSessionId: word; out aErrorCode: byte; out aNameStringId: word; out aType: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_NEXT_DIRECTORY_ENTRY, 12);
  LEConvertUInt16To(aDirectoryId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aNameStringId:= LEConvertUInt16From(9, _response);
  aType:= LEConvertUInt8From(11, _response);
end;

function TBrickRED.RewindDirectory(const aDirectoryId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_REWIND_DIRECTORY, 10);
  LEConvertUInt16To(aDirectoryId, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickRED.CreateDirectory(const aNameStringId: word; const aFlags: longword; const aPermissions: word; const aUID: longword; const aGID: longword): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_CREATE_DIRECTORY, 24);
  LEConvertUInt16To(aNameStringId, 8, _request);
  LEConvertUInt32To(aFlags, 10, _request);
  LEConvertUInt16To(aPermissions, 14, _request);
  LEConvertUInt32To(uid, 16, _request);
  LEConvertUInt32To(aGID, 20, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProcesses(const aSessionId: word; out aErrorCode: byte; out aProcessesListId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESSES, 10);
  LEConvertUInt16To(aSessionId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aProcessesListId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.SpawnProcess(const aExecutableStringId: word; const aArgumentsListId: word; const aEnvironmentListId: word; const aWorkingDirectoryStringId: word; const aUID: longword; const aGID: longword; const aStdInFileId: word; const aStdOutFileId: word; const aStdErrFileId: word; const aSessionId: word; out aErrorCode: byte; out aProcessId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SPAWN_PROCESS, 32);
  LEConvertUInt16To(aExecutableStringId, 8, _request);
  LEConvertUInt16To(aArgumentsListId, 10, _request);
  LEConvertUInt16To(aEnvironmentListId, 12, _request);
  LEConvertUInt16To(aWorkingDirectoryStringId, 14, _request);
  LEConvertUInt32To(uid, 16, _request);
  LEConvertUInt32To(aGID, 20, _request);
  LEConvertUInt16To(aStdInFileId, 24, _request);
  LEConvertUInt16To(aStdOutFileId, 26, _request);
  LEConvertUInt16To(aStdErrFileId, 28, _request);
  LEConvertUInt16To(aSessionId, 30, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aProcessId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.KillProcess(const aProcessId: word; const aSignal: byte): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_KILL_PROCESS, 11);
  LEConvertUInt16To(aProcessId, 8, _request);
  LEConvertUInt8To(aSignal, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProcessCommand(const aProcessId: word; const aSessionId: word; out aErrorCode: byte; out aExecutableStringId: word; out aArgumentsListId: word; out aEnvironmentListId: word; out aWorkingDirectoryStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_COMMAND, 12);
  LEConvertUInt16To(aProcessId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aExecutableStringId:= LEConvertUInt16From(9, _response);
  aArgumentsListId:= LEConvertUInt16From(11, _response);
  aEnvironmentListId:= LEConvertUInt16From(13, _response);
  aWorkingDirectoryStringId:= LEConvertUInt16From(15, _response);
end;

procedure TBrickRED.GetProcessIdentity(const aProcessId: word; out aErrorCode: byte; out aPID: longword; out aUID: longword; out aGID: longword);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_IDENTITY, 10);
  LEConvertUInt16To(aProcessId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aPID:= LEConvertUInt32From(9, _response);
  uid:= LEConvertUInt32From(13, _response);
  aGID:= LEConvertUInt32From(17, _response);
end;

procedure TBrickRED.GetProcessStdio(const aProcessId: word; const aSessionId: word; out aErrorCode: byte; out aStdInFileId: word; out aStdOutFileId: word; out aStdErrFileId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_STDIO, 12);
  LEConvertUInt16To(aProcessId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aStdInFileId:= LEConvertUInt16From(9, _response);
  aStdOutFileId:= LEConvertUInt16From(11, _response);
  aStdErrFileId:= LEConvertUInt16From(13, _response);
end;

procedure TBrickRED.GetProcessState(const aProcessId: word; out aErrorCode: byte; out aState: byte; out aTimestamp: uint64; out aExitCode: byte);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROCESS_STATE, 10);
  LEConvertUInt16To(aProcessId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aState:= LEConvertUInt8From(9, _response);
  aTimestamp:= LEConvertUInt64From(10, _response);
  aExitCode:= LEConvertUInt8From(18, _response);
end;

procedure TBrickRED.GetPrograms(const aSessionId: word; out aErrorCode: byte; out aProgramsListId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAMS, 10);
  LEConvertUInt16To(aSessionId, 8, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aProgramsListId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.DefineProgram(const aIdentifierStringId: word; const aSessionId: word; out aErrorCode: byte; out aProgramId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_DEFINE_PROGRAM, 12);
  LEConvertUInt16To(aIdentifierStringId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aProgramId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.PurgeProgram(const aProgramId: word; const aCookie: longword): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_PURGE_PROGRAM, 14);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt32To(aCookie, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProgramIdentifier(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aIdentifierStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_IDENTIFIER, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aIdentifierStringId:= LEConvertUInt16From(9, _response);
end;

procedure TBrickRED.GetProgramRootDirectory(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aRootDirectoryStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_ROOT_DIRECTORY, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aRootDirectoryStringId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.SetProgramCommand(const aProgramId: word; const aExecutableStringId: word; const aArgumentsListId: word; const aEnvironmentListId: word; const aWorkingDirectoryStringId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_COMMAND, 18);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aExecutableStringId, 10, _request);
  LEConvertUInt16To(aArgumentsListId, 12, _request);
  LEConvertUInt16To(aEnvironmentListId, 14, _request);
  LEConvertUInt16To(aWorkingDirectoryStringId, 16, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProgramCommand(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aExecutableStringId: word; out aArgumentsListId: word; out aEnvironmentListId: word; out aWorkingDirectoryStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_COMMAND, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aExecutableStringId:= LEConvertUInt16From(9, _response);
  aArgumentsListId:= LEConvertUInt16From(11, _response);
  aEnvironmentListId:= LEConvertUInt16From(13, _response);
  aWorkingDirectoryStringId:= LEConvertUInt16From(15, _response);
end;

function TBrickRED.SetProgramStdioRedirection(const aProgramId: word; const aStdInRedirection: byte; const aStdInFileNameStringId: word; const aStdOutRedirection: byte; const aStdOutFileNameStringId: word; const aStdErrRedirection: byte; const aStdErrFileNameStringId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_STDIO_REDIRECTION, 19);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt8To(aStdInRedirection, 10, _request);
  LEConvertUInt16To(aStdInFileNameStringId, 11, _request);
  LEConvertUInt8To(aStdOutRedirection, 13, _request);
  LEConvertUInt16To(aStdOutFileNameStringId, 14, _request);
  LEConvertUInt8To(aStdErrRedirection, 16, _request);
  LEConvertUInt16To(aStdErrFileNameStringId, 17, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProgramStdioRedirection(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aStdInRedirection: byte; out aStdInFileNameStringId: word; out aStdOutRedirection: byte; out aStdOutFileNameStringId: word; out aStdErrRedirection: byte; out aStdErrFileNameStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_STDIO_REDIRECTION, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aStdInRedirection:= LEConvertUInt8From(9, _response);
  aStdInFileNameStringId:= LEConvertUInt16From(10, _response);
  aStdOutRedirection:= LEConvertUInt8From(12, _response);
  aStdOutFileNameStringId:= LEConvertUInt16From(13, _response);
  aStdErrRedirection:= LEConvertUInt8From(15, _response);
  aStdErrFileNameStringId:= LEConvertUInt16From(16, _response);
end;

function TBrickRED.SetProgramSchedule(const aProgramId: word; const aStartMode: byte; const aContinueAfterError: boolean; const aStartInterval: longword; const aStartFieldsStringId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_PROGRAM_SCHEDULE, 18);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt8To(aStartMode, 10, _request);
  LEConvertBooleanTo(aContinueAfterError, 11, _request);
  LEConvertUInt32To(aStartInterval, 12, _request);
  LEConvertUInt16To(aStartFieldsStringId, 16, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetProgramSchedule(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aStartMode: byte; out aContinueAfterError: boolean; out aStartInterval: longword; out aStartFieldsStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULE, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aStartMode:= LEConvertUInt8From(9, _response);
  aContinueAfterError:= LEConvertBooleanFrom(10, _response);
  aStartInterval:= LEConvertUInt32From(11, _response);
  aStartFieldsStringId:= LEConvertUInt16From(15, _response);
end;

procedure TBrickRED.GetProgramSchedulerState(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aState: byte; out aTimestamp: uint64; out aMessageStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_PROGRAM_SCHEDULER_STATE, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aState:= LEConvertUInt8From(9, _response);
  aTimestamp:= LEConvertUInt64From(10, _response);
  aMessageStringId:= LEConvertUInt16From(18, _response);
end;

function TBrickRED.ContinueProgramSchedule(const aProgramId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_CONTINUE_PROGRAM_SCHEDULE, 10);
  LEConvertUInt16To(aProgramId, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

function TBrickRED.StartProgram(const aProgramId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_START_PROGRAM, 10);
  LEConvertUInt16To(aProgramId, 8, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetLastSpawnedProgramProcess(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aProcessId: word; out aTimestamp: uint64);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_LAST_SPAWNED_PROGRAM_PROCESS, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aProcessId:= LEConvertUInt16From(9, _response);
  aTimestamp:= LEConvertUInt64From(11, _response);
end;

procedure TBrickRED.GetCustomProgramOptionNames(const aProgramId: word; const aSessionId: word; out aErrorCode: byte; out aNamesListId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_NAMES, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aSessionId, 10, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aNamesListId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.SetCustomProgramOptionValue(const aProgramId: word; const aNameStringId: word; const aValueStringId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_SET_CUSTOM_PROGRAM_OPTION_VALUE, 14);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aNameStringId, 10, _request);
  LEConvertUInt16To(aValueStringId, 12, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetCustomProgramOptionValue(const aProgramId: word; const aNameStringId: word; const aSessionId: word; out aErrorCode: byte; out aValueStringId: word);
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_CUSTOM_PROGRAM_OPTION_VALUE, 14);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aNameStringId, 10, _request);
  LEConvertUInt16To(aSessionId, 12, _request);
  _response:= SendRequest(_request);
  aErrorCode:= LEConvertUInt8From(8, _response);
  aValueStringId:= LEConvertUInt16From(9, _response);
end;

function TBrickRED.RemoveCustomProgramOption(const aProgramId: word; const aNameStringId: word): byte;
var
  _request, _response: TDynamicByteArray;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_REMOVE_CUSTOM_PROGRAM_OPTION, 12);
  LEConvertUInt16To(aProgramId, 8, _request);
  LEConvertUInt16To(aNameStringId, 10, _request);
  _response:= SendRequest(_request);
  Result:= LEConvertUInt8From(8, _response);
end;

procedure TBrickRED.GetIdentity(out aUID: string; out aConnectedUid: string; out aPosition: char; out aHardwareVersion: TTFVersionNumber; out aFirmwareVersion: TTFVersionNumber; out aDeviceIdentifier: word);
var
  _request, _response: TDynamicByteArray;
  _i: longint;
begin
  _request:= IPConnection.CreateRequestPacket(self, BRICK_RED_FUNCTION_GET_IDENTITY, 8);
  _response:= SendRequest(_request);
  aUID:= LEConvertStringFrom(8, 8, _response);
  aConnectedUid:= LEConvertStringFrom(16, 8, _response);
  aPosition:= LEConvertCharFrom(24, _response);
  for _i:= 0 to 2 do aHardwareVersion[_i]:= LEConvertUInt8From(25 + (_i * 1), _response);
  for _i:= 0 to 2 do aFirmwareVersion[_i]:= LEConvertUInt8From(28 + (_i * 1), _response);
  aDeviceIdentifier:= LEConvertUInt16From(31, _response);
end;

procedure TBrickRED.CallbackWrapperAsyncFileRead(const aPacket: TDynamicByteArray);
var
  _fileId: word;
  _errorCode: byte;
  _buffer: TArray0To59OfUInt8;
  _lengthRead: byte;
  _i: longint;
begin
  _fileId:= LEConvertUInt16From(8, aPacket);
  _errorCode:= LEConvertUInt8From(10, aPacket);
  for _i:= 0 to 59 do _buffer[_i]:= LEConvertUInt8From(11 + (_i * 1), aPacket);
  _lengthRead:= LEConvertUInt8From(71, aPacket);

  if (Assigned(asyncFileReadCallback)) then begin
    asyncFileReadCallback(self, _fileId, _errorCode, _buffer, _lengthRead);
  end;
end;

procedure TBrickRED.CallbackWrapperAsyncFileWrite(const aPacket: TDynamicByteArray);
var
  _fileId: word;
  _errorCode: byte;
  _lengthWritten: byte;
begin
  _fileId:= LEConvertUInt16From(8, aPacket);
  _errorCode:= LEConvertUInt8From(10, aPacket);
  _lengthWritten:= LEConvertUInt8From(11, aPacket);

  if (Assigned(asyncFileWriteCallback)) then begin
    asyncFileWriteCallback(self, _fileId, _errorCode, _lengthWritten);
  end;
end;

procedure TBrickRED.CallbackWrapperFileEventsOccurred(const aPacket: TDynamicByteArray);
var
  _fileId: word;
  _events: word;
begin
  _fileId:= LEConvertUInt16From(8, aPacket);
  _events:= LEConvertUInt16From(10, aPacket);

  if (Assigned(fileEventsOccurredCallback)) then begin
    fileEventsOccurredCallback(self, _fileId, _events);
  end;
end;

procedure TBrickRED.CallbackWrapperProcessStateChanged(const aPacket: TDynamicByteArray);
var
  _processId: word;
  _state: byte;
  _timestamp: uint64;
  _exitCode: byte;
begin
  _processId:= LEConvertUInt16From(8, aPacket);
  _state:= LEConvertUInt8From(10, aPacket);
  _timestamp:= LEConvertUInt64From(11, aPacket);
  _exitCode:= LEConvertUInt8From(19, aPacket);

  if (Assigned(processStateChangedCallback)) then begin
    processStateChangedCallback(self, _processId, _state, _timestamp, _exitCode);
  end;
end;

procedure TBrickRED.CallbackWrapperProgramSchedulerStateChanged(const aPacket: TDynamicByteArray);
var
  _programId: word;
begin
  _programId:= LEConvertUInt16From(8, aPacket);

  if (Assigned(programSchedulerStateChangedCallback)) then begin
    programSchedulerStateChangedCallback(self, _programId);
  end;
end;

procedure TBrickRED.CallbackWrapperProgramProcessSpawned(const aPacket: TDynamicByteArray);
var
  _programId: word;
begin
  _programId:= LEConvertUInt16From(8, aPacket);

  if (Assigned(programProcessSpawnedCallback)) then begin
    programProcessSpawnedCallback(self, _programId);
  end;
end;

end.
