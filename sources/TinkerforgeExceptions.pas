unit TinkerforgeExceptions;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils;

type
  { ETinkerforgeException }
  ETinkerforgeException = class(Exception);

  { ETimeoutException }
  ETimeoutException = class(ETinkerforgeException);

  TimeoutException = ETimeoutException; { for backward compatibility }

  { EAlreadyConnectedException }
  EAlreadyConnectedException = class(ETinkerforgeException);

  { ENotConnectedException }
  ENotConnectedException = class(ETinkerforgeException);

  { EInvalidParameterException }
  EInvalidParameterException = class(ETinkerforgeException);

  { ENotSupportedException }
  ENotSupportedException = class(ETinkerforgeException);
  NotSupportedException = ENotSupportedException; { for backward compatibility }

  { EUnknownErrorCodeException }
  EUnknownErrorCodeException = class(ETinkerforgeException);

  { EStreamOutOfSyncException }
  EStreamOutOfSyncException = class(ETinkerforgeException);

  { EInvalidUIDException }
  EInvalidUIDException = class(ETinkerforgeException);

implementation

end.

