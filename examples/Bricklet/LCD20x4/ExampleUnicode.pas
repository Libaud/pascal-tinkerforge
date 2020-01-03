program ExampleUnicode;

{$ifdef MSWINDOWS}{$apptype CONSOLE}{$endif}
{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

uses
  SysUtils, IPConnection, BrickletLCD20x4;

type
  TExample = class
  private
    ipcon: TIPConnection;
    lcd: TBrickletLCD20x4;
  public
    function WideStringToKS0066U(const text: WideString): string;
    procedure Execute;
  end;

const
  HOST = 'localhost';
  PORT = 4223;
  UID = 'XYZ'; { Change XYZ to the UID of your LCD 20x4 Bricklet }

var
  e: TExample;

function TExample.WideStringToKS0066U(const text: WideString): string;
var i, codePoint: longint; w: word; c: char; ks0066u: string;
begin
  i := 1;
  SetLength(ks0066u, 0);
  while (i <= Length(text)) do begin
    { WideString is UTF-16, handle surrogates }
    w := word(text[i]);
    if ((w >= $D800) and (w <= $DBFF)) then begin
      codePoint := $10000 + (w - $D800) * $400 + (w - $DC00);
      i := i + 2;
    end
    else begin
      codePoint := w;
      i := i + 1;
    end;
    { ASCII subset from JIS X 0201 }
    if ((codePoint >= $0020) and (codePoint <= $007E)) then begin
      { The LCD charset doesn't include '\' and '~', use similar characters instead }
      case codePoint of
        $005C: c := char($A4); { REVERSE SOLIDUS maps to IDEOGRAPHIC COMMA }
        $007E: c := char($2D); { TILDE maps to HYPHEN-MINUS }
        else   c := char(codePoint);
      end;
    end
    { Katakana subset from JIS X 0201 }
    else if ((codePoint >= $FF61) and (codePoint <= $FF9F)) then begin
      c := char(codePoint - $FEC0);
    end
    { Special characters }
    else begin
      case codePoint of
        $00A5: c := char($5C); { YEN SIGN }
        $2192: c := char($7E); { RIGHTWARDS ARROW }
        $2190: c := char($7F); { LEFTWARDS ARROW }
        $00B0: c := char($DF); { DEGREE SIGN maps to KATAKANA SEMI-VOICED SOUND MARK }
        $03B1: c := char($E0); { GREEK SMALL LETTER ALPHA }
        $00C4: c := char($E1); { LATIN CAPITAL LETTER A WITH DIAERESIS }
        $00E4: c := char($E1); { LATIN SMALL LETTER A WITH DIAERESIS }
        $00DF: c := char($E2); { LATIN SMALL LETTER SHARP S }
        $03B5: c := char($E3); { GREEK SMALL LETTER EPSILON }
        $00B5: c := char($E4); { MICRO SIGN }
        $03BC: c := char($E4); { GREEK SMALL LETTER MU }
        $03C2: c := char($E5); { GREEK SMALL LETTER FINAL SIGMA }
        $03C1: c := char($E6); { GREEK SMALL LETTER RHO }
        $221A: c := char($E8); { SQUARE ROOT }
        $00B9: c := char($E9); { SUPERSCRIPT ONE maps to SUPERSCRIPT (minus) ONE }
        $00A4: c := char($EB); { CURRENCY SIGN }
        $00A2: c := char($EC); { CENT SIGN }
        $2C60: c := char($ED); { LATIN CAPITAL LETTER L WITH DOUBLE BAR }
        $00F1: c := char($EE); { LATIN SMALL LETTER N WITH TILDE }
        $00D6: c := char($EF); { LATIN CAPITAL LETTER O WITH DIAERESIS }
        $00F6: c := char($EF); { LATIN SMALL LETTER O WITH DIAERESIS }
        $03F4: c := char($F2); { GREEK CAPITAL THETA SYMBOL }
        $221E: c := char($F3); { INFINITY }
        $03A9: c := char($F4); { GREEK CAPITAL LETTER OMEGA }
        $00DC: c := char($F5); { LATIN CAPITAL LETTER U WITH DIAERESIS }
        $00FC: c := char($F5); { LATIN SMALL LETTER U WITH DIAERESIS }
        $03A3: c := char($F6); { GREEK CAPITAL LETTER SIGMA }
        $03C0: c := char($F7); { GREEK SMALL LETTER PI }
        $0304: c := char($F8); { COMBINING MACRON }
        $00F7: c := char($FD); { DIVISION SIGN }
        $25A0: c := char($FF); { BLACK SQUARE }
        else   c := char($FF); { BLACK SQUARE }
      end
    end;
    { Special handling for 'x' followed by COMBINING MACRON }
    if (c = char($F8)) then begin
      if (ks0066u[Length(ks0066u) - 1] <> 'x') then begin
        c := char($FF); { BLACK SQUARE }
      end;
      if (Length(ks0066u) > 0) then begin
        SetLength(ks0066u, Length(ks0066u) - 1);
      end;
    end;
    ks0066u := ks0066u + c;
  end;
  result := ks0066u;
end;

procedure TExample.Execute;
begin
  { Create IP connection }
  ipcon := TIPConnection.Create;

  { Create device object }
  lcd := TBrickletLCD20x4.Create(UID, ipcon);

  { Connect to brickd }
  ipcon.Connect(HOST, PORT);
  { Don't use device before ipcon is connected }

  { Turn backlight on }
  lcd.BacklightOn;

  { Write a string using the WideStringToKS0066U function to map to the LCD charset }
  { Note: For the Free Pascal Compiler (and Lazarus) UTF8Decode is used to create a
          WideString. It assumes that your source file is UTF-8 encoded }
  lcd.WriteLine(0, 0, WideStringToKS0066U({$ifdef FPC}UTF8Decode{$endif}('Stromstärke: 17µA')));
  lcd.WriteLine(1, 0, WideStringToKS0066U({$ifdef FPC}UTF8Decode{$endif}('Temperatur:  23°C')));

  { Write a string directly including characters from the LCD charset }
  lcd.WriteLine(2, 0, 'Drehzahl:   750min' + char($E9));

  WriteLn('Press key to exit');
  ReadLn;
  ipcon.Destroy; { Calls ipcon.Disconnect internally }
end;

begin
  e := TExample.Create;
  e.Execute;
  e.Destroy;
end.
