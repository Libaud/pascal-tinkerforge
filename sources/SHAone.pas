{
  SHA-1 implementation based on two Public Domain implementations by

  Steve Reid <steve@edmweb.com>
  Jordan Russell <jr-2010@jrsoftware.org>

  100% Public Domain
}

unit SHAone;

{$ifdef FPC}
  {$mode OBJFPC}{$H+}
{$endif}

interface

uses
  {$ifdef FPC}
   Sockets
  {$else}
   {$ifdef MSWINDOWS}
    WinSock
   {$else}
     Posix.ArpaInet
   {$endif}
  {$endif};

type
  TSHAoneBlock = array [0..63] of byte;
  TSHAoneDigest = array [0..19] of byte;

  TSHAone = record
    state: array [0..4] of longword;
    count: uint64;
    buffer: TSHAoneBlock;
  end;

procedure SHAoneInit(var asha1: TSHAone);
procedure SHAoneUpdate(var asha1: TSHAone; const adata: array of byte);
function SHAoneFinal(var asha1: TSHAone): TSHAoneDigest;

implementation

type
  TLongWordConverter = packed record case longword of
    0: (bytes: array [0..3] of byte);
    1: (total: longword);
  end;

procedure SHAoneTransform(var sha1: TSHAone; const aBuffer: TSHAoneBlock);
const
  K1 = $5A827999;
  K2 = $6ED9EBA1;
  K3 = $8F1BBCDC;
  K4 = $CA62C1D6;
var
  _i, _k: longint;
  _converter: TLongWordConverter;
  _temp, _A, _B, _C, _D, _E: longword;
  _W: array [0..79] of longword;
begin
  { convert aBuffer to 32-bit (big endian) numbers }
  for _i:= 0 to 15 do begin
    for _k:= 0 to 3 do begin
      _converter.bytes[_k]:= aBuffer[_i * 4 + _k];
    end;
    _W[_i]:= htonl(_converter.total);
  end;
  for _i:= 16 to 79 do begin
    _temp:= _W[_i - 3] xor _W[_i - 8] xor _W[_i - 14] xor _W[_i - 16];
    _W[_i]:= (_temp shl 1) or (_temp shr 31);
  end;
  _A:= sha1.state[0];
  _B:= sha1.state[1];
  _C:= sha1.state[2];
  _D:= sha1.state[3];
  _E:= sha1.state[4];
  for _i:= 0 to 19 do begin
    _temp:= ((_A shl 5) or (_A shr 27)) + (_D xor (_B and (_C xor _D))) + _E + _W[_i] + K1;
    _E:= _D;
    _D:= _C;
    _C:= (_B shl 30) or (_B shr 2);
    _B:= _A;
    _A:= _temp;
  end;
  for _i:= 20 to 39 do begin
    _temp:= ((_A shl 5) or (_A shr 27)) + (_B xor _C xor _D) + _E + _W[_i] + K2;
    _E:= _D;
    _D:= _C;
    _C:= (_B shl 30) or (_B shr 2);
    _B:= _A;
    _A:= _temp;
  end;
  for _i:= 40 to 59 do begin
    _temp:= ((_A shl 5) or (_A shr 27)) + ((_B and _C) or (_B and _D) or (_C and _D)) + _E + _W[_i] + K3;
    _E:= _D;
    _D:= _C;
    _C:= (_B shl 30) or (_B shr 2);
    _B:= _A;
    _A:= _temp;
  end;
  for _i:= 60 to 79 do begin
    _temp:= ((_A shl 5) or (_A shr 27)) + (_B xor _C xor _D) + _E + _W[_i] + K4;
    _E:= _D;
    _D:= _C;
    _C:= (_B shl 30) or (_B shr 2);
    _B:= _A;
    _A:= _temp;
  end;
  Inc(sha1.state[0], _A);
  Inc(sha1.state[1], _B);
  Inc(sha1.state[2], _C);
  Inc(sha1.state[3], _D);
  Inc(sha1.state[4], _E);
end;

procedure SHAoneInit(var asha1: TSHAone);
begin
  asha1.state[0]:= $67452301;
  asha1.state[1]:= $EFCDAB89;
  asha1.state[2]:= $98BADCFE;
  asha1.state[3]:= $10325476;
  asha1.state[4]:= $C3D2E1F0;
  asha1.count:= 0;
end;

procedure SHAoneUpdate(var asha1: TSHAone; const adata: array of byte);
var
  _len, _i, _j: longword;
  _buffer: TSHAoneBlock;
begin
  _len:= Length(adata);
  _j:= longword((asha1.count shr 3) and 63);
  Inc(asha1.count, _len shl 3);
  if ((_j + _len) > 63) then begin
    _i:= 64 - _j;
    Move(adata[0], asha1.buffer[_j], _i);
    SHAoneTransform(asha1, asha1.buffer);
    while ((_i + 63) < _len) do begin
      Move(adata[_i], _buffer[0], 64);
      SHAoneTransform(asha1, _buffer);
      Inc(_i, 64);
    end;
    _j:= 0;
  end
  else begin
    _i:= 0;
  end;
  Move(adata[_i], asha1.buffer[_j], _len - _i);
end;

function SHAoneFinal(var asha1: TSHAone): TSHAoneDigest;
var
  _count: array of byte;
  _i: longint;
  _pad: array of byte;
begin
  SetLength(_count, 8);
  for _i:= 0 to 7 do begin
    _count[_i]:= byte((asha1.count shr ((7 - (_i and 7)) * 8)) and 255); { endian independent }
  end;
  SetLength(_pad, 1);
  _pad[0]:= 128;
  SHAoneUpdate(asha1, _pad);
  _pad[0]:= 0;
  while ((asha1.count and 504) <> 448) do begin
    SHAoneUpdate(asha1, _pad);
  end;
  SHAoneUpdate(asha1, _count);
  for _i:= 0 to 19 do begin
    Result[_i]:= byte((asha1.state[_i shr 2] shr ((3 - (_i and 3)) * 8)) and 255);
  end;
  FillChar(asha1, SizeOf(asha1), 0);
end;

end.
