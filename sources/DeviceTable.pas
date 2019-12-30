unit DeviceTable;

{$ifdef FPC}
  {$mode objfpc}{$H+}
{$endif}

interface

uses
  Classes, SysUtils, Contnrs, DeviceBase;

{$I Tinkerforge.inc}

type
  TDeviceList = class(TComponentList)
    public
      function GetItemWithUID(const aUID: longword): TDeviceBase;
  end;

implementation

function TDeviceList.GetItemWithUID(const aUID: longword): TDeviceBase;
var
  _iItem: integer;
begin
  Result:= nil;
  for _iItem:= 0 to Count - 1 do
    if Items[_iItem] is TDeviceBase then
      if (Items[_iItem] as TDeviceBase).UID = aUID then
        Result:= Items[_iItem] as TDeviceBase;
end;

end.

