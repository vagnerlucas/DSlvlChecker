// ================================================================
// 
// Unit uDSProcessMgmtNameUtils.pas
//
// This unit contains the utils functions for getting the name of
// the player, single and multiplayer.
// Note: For 1st player, it will get the name of the savefile title
// and for pvp/pve, the name of the player in GFWL.
//
// Esta unit contém funções de utilidade para obter os nomes dos 
// jogadores. Tanto singleplayer, como multiplayer.
// Nota: Para o "player 1", será exibido o nome de título do save,
// e para os demais, o nick na GFWL.
//
// ================================================================

unit uDSProcessMgmtNameUtils;

interface

uses
  Windows, SysUtils, uDSProcessMgmtUtils;

  // Functions for getting the name of the player, reading some pointer address
  // Função para obter o nome do jogador, lendo os endereços de ponteiros
  function GetDefaultPlayerName: String;
  function GetRedPhantomName: String;
  function GetBluePhantomName: String;
  function GetWhitePhantomName: String;

implementation

function GetDefaultPlayerName: String;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 c : AnsiChar;
 P: Pointer;
begin

  Result := EmptyStr;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr($13DED50), @Value, 4, Read);
    P := Ptr(Value);
    ReadProcessMemory(hProcess, Pointer(Pointer(IntegeR(p) + $8)), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $A0), @c, 2, Read);
    P := Ptr(Value + $A0);

    try
    repeat
      if not ReadProcessMemory(hProcess, Pointer(P), @c, 2, Read) then
        raise exception.create(syserrormessage(getlasterror));
      Result := Result + c;
      P := pointer(integer(P)+2);
    until (c=#0) or (Read<>2);
    except
    begin
      Result := EmptyStr;
      Exit;
    end;
    end;

    Result := Copy(Result, 0, Length(Result) - 1);
  end;
end;

function GetRedPhantomName: String;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 c : AnsiChar;
 P: Pointer;
begin

  Result := EmptyStr;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr($1349020), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $20), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $60C), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $4), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $3C), @Value, 4, Read);

    P := Ptr(Value + $A0);

    try
    repeat
      if not ReadProcessMemory(hProcess, Pointer(P), @c, 2, Read) then
        raise exception.create(syserrormessage(getlasterror));
      Result := Result + c;
      P := pointer(integer(P)+2);
    until (c=#0) or (Read<>2);
    except
    begin
      Result := EmptyStr;
      Exit;
    end;
    end;

    Result := Copy(Result, 0, Length(Result) - 1);
  end;
end;

function GetBluePhantomName: String;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 c : AnsiChar;
 P: Pointer;
begin

  Result := EmptyStr;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr($1349020), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $60), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $60C), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $4), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $3C), @Value, 4, Read);

    P := Ptr(Value + $A0);

    try
    repeat
      if not ReadProcessMemory(hProcess, Pointer(P), @c, 2, Read) then
        raise exception.create(syserrormessage(getlasterror));
      Result := Result + c;
      P := pointer(integer(P)+2);
    until (c=#0) or (Read<>2);
    except
    begin
      Result := EmptyStr;
      Exit;
    end;
    end;

    Result := Copy(Result, 0, Length(Result) - 1);
  end;

end;

function GetWhitePhantomName: String;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 c : AnsiChar;
 P: Pointer;
begin

  Result := EmptyStr;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr($1349020), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $40), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $60C), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $4), @Value, 4, Read);
    ReadProcessMemory(hProcess, Ptr(Value + $3C), @Value, 4, Read);

    P := Ptr(Value + $A0);

    try
    repeat
      if not ReadProcessMemory(hProcess, Pointer(P), @c, 2, Read) then
        raise exception.create(syserrormessage(getlasterror));
      Result := Result + c;
      P := pointer(integer(P)+2);
    until (c=#0) or (Read<>2);
    except
    begin
      Result := EmptyStr;
      Exit;
    end;
    end;

    Result := Copy(Result, 0, Length(Result) - 1);
  end;

end;


end.
