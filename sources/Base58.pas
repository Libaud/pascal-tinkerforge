{
  Copyright (C) 2012, 2019 Matthias Bolte <matthias@tinkerforge.com>

  Redistribution and use in source and binary forms of this file,
  with or without modification, are permitted. See the Creative
  Commons Zero (CC0 1.0) License for more details.
}

unit Base58;

{$ifdef FPC}{$mode OBJFPC}{$endif}

interface

function Base58Encode(const aValue: uint64): string;
function Base58Decode(const aEncoded: string; out aDecoded: uint64): boolean;

implementation

const
  BASE58_ALPHABET = '123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';

{ https://www.fefe.de/intof.html }

function UInt64Add(const a: uint64; const b: uint64; out c: uint64): boolean;
begin
  if (High(uint64) - a < b) then begin
    Result := false;
  end
  else begin
    c := a + b;
    Result := true;
  end;
end;

function UInt64Multiply(const a: uint64; const b: uint64; out c: uint64): boolean;
var a0, a1, b0, b1, c0, c1: uint64;
begin
  a0 := a and High(longword);
  a1 := a shr 32;
  b0 := b and High(longword);
  b1 := b shr 32;
  if ((a1 > 0) and (b1 > 0)) then begin
    Result := false;
    exit;
  end;
  c1 := a1 * b0 + a0 * b1;
  if (c1 > High(longword)) then begin
    Result := false;
    exit;
  end;
  c0 := a0 * b0;
  c1 := c1 shl 32;
  Result := UInt64Add(c1, c0, c);
end;

function Base58Encode(const aValue: uint64): string;
var quotient, remainder, tmp: uint64;
begin
  Result := '';
  tmp := aValue;
  while (tmp >= 58) do begin
    quotient := tmp div 58;
    remainder := tmp mod 58;
    Result := Copy(BASE58_ALPHABET, remainder + 1, 1) + Result;
    tmp := quotient;
  end;
  Result := Copy(BASE58_ALPHABET, tmp + 1, 1) + Result;
end;

function Base58Decode(const aEncoded: string; out aDecoded: uint64): boolean;
var
  _i: longint;
  value, base, index, next: uint64;
begin
  aDecoded := 0;
  value := 0;
  base := 1;
  for _i := Length(aEncoded) - 1 downto 0 do begin
    index := Pos(Copy(aEncoded, _i + 1, 1), BASE58_ALPHABET);
    if (index = 0) then begin
      Result := false;
      exit;
    end;
    if (not UInt64Multiply(index - 1, base, next)) then begin
      Result := false;
      exit;
    end;
    if (not UInt64Add(value, next, value)) then begin
      Result := false;
      exit;
    end;
    if ((_i > 0) and not UInt64Multiply(base, 58, base)) then begin
      Result := false;
      exit;
    end;
  end;
  aDecoded := value;
  Result := true;
end;

end.
