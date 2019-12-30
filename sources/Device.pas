{
  Copyright (C) 2012-2013, 2019 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit Device;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, DeviceBase;

{$I Tinkerforge.inc}

type
  TDevice = class(TDeviceBase)
    private
      // Private method's
      // Access method's
      /// <summary>
      ///  Changes the response expected flag for all setter and callback
      ///  configuration functiodevicesns of this device at once.
      /// </summary>
      procedure SetResponseExpectedAll(const aResponseExpected: boolean); virtual;
    protected
    public
      // Properties
    published
  end;

implementation

{ TDevice }

// Private method's

// Access method's

//

procedure TDevice.SetResponseExpectedAll(const aResponseExpected: boolean);
var
  _flag: byte;
  _i: longint;
begin
  if (aResponseExpected) then begin
    _flag:= DEVICE_RESPONSE_EXPECTED_TRUE;
  end
  else begin
    _flag:= DEVICE_RESPONSE_EXPECTED_FALSE;
  end;
  for _i:= 0 to Length(ResponseExpected) - 1 do begin
    if ((ResponseExpected[_i] = DEVICE_RESPONSE_EXPECTED_TRUE) or
        (ResponseExpected[_i] = DEVICE_RESPONSE_EXPECTED_FALSE)) then begin
      SetResponseExpected(_i, _flag);
    end;
  end;
end;

end.
