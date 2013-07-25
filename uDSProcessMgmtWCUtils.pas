// ====================================================================
// 
// Unit uDSProcessMgmtWCUtils.pas
// 
// This unit contains utilities for redading the class of the warrior
// (player). This unit, like the uDSProcessMgmtNameUtils, is separated
// just for a clear coding.
//
// Esta unit contém utilidades para leitura da classe do guerreiro.
// Ela está separada, como uDSProcessMgmtNameUtils, porque fica mais
// fácil a compreensão com o código limpo.
//
// ===================================================================

unit uDSProcessMgmtWCUtils;

interface

uses
  Windows, SysUtils, uDSProcessMgmtUtils, uWarrior;

  // These functions just read the class of the warrior (player). One for each player.
  // Estas funções apenas leem a classe do guerreiro. Uma para cada guerreiro.
  function GetDefaultPlayerWarriorClass: TWarriorClass;
  function GetRedPhantomWarriorClass: TWarriorClass;
  function GetBluePhantomWarriorClass: TWarriorClass;
  function GetWhitePhantomWarriorClass: TWarriorClass;
  function GetWarriorClassByID(AId: Integer): TWarriorClass;

implementation

function GetWarriorClassByID(AId: Integer): TWarriorClass;
begin
  Result := wcNone;

  case AId of
    0: Result := wcWarrior;
    1: Result := wcKnight;
    2: Result := wcWanderer;
    3: Result := wcThief;
    4: Result := wcBandit;
    5: Result := wcHunter;
    6: Result := wcSorcerer;
    7: Result := wcPyromancer;
    8: Result := wcCleric;
    9: Result := wcDeprived;
  end;
end;


function GetDefaultPlayerWarriorClass: TWarriorClass;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 P: Pointer;
begin

  Result := wcNone;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr($13DED50), Addr(Value), 4, Read);
    P := Ptr(Value);
    ReadProcessMemory(hProcess, Pointer(Pointer(IntegeR(p) + $8)), Addr(Value), 4, Read);

    ReadProcessMemory(hProcess, Ptr(Value + $C6), Addr(Value), 1, Read);
    Result := GetWarriorClassByID(Byte(Value));

  end;


end;

function GetRedPhantomWarriorClass: TWarriorClass;
begin
    //TODO: Implementar 
    Result := wcNone;
end;

function GetBluePhantomWarriorClass: TWarriorClass;
begin
    //TODO: Implementar 
    Result := wcNone;
end;

function GetWhitePhantomWarriorClass: TWarriorClass;
begin
    //TODO: Implementar 
    Result := wcNone;
end;


end.
