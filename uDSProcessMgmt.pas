// ====================================================================
// Unit uDSProcessMgmt.pas
//
// This unit contains the most importants funcions and procedures for 
// reading the memory information.
//
// Esta "unit" contém as funções e procedures mais importantes para a 
// leitura de informação em memória.
// 
//
// All the memory addresses and pointers, and offsets was get by using 
// the Cheat Engine scanner, and tables from the people in the forum.
//
// Todos os endereços de memória, ponteiros e offsets foram obtidos
// pelo scanner do Cheat Engine, e de tabelas de terceiros em foruns.
// ====================================================================

unit uDSProcessMgmt;

interface

uses
  Windows, SysUtils, uWarrior, uDefaultPlayer, uBluePhantom,
  uWhitePhantom, uRedPhantom;

  // This procedure get the stamina and HP just in progress
  // Esta procedure obtém a stamina e HP durante o progresso do jogo
  procedure UpdateStaminaHPStatus(var AWarrior: TWarrior);
  
  // This procedure checks the status of the player, such as Soul Level, Vitality, etc
  // Esta procedure checa o status do jogador, como por exemplo: Soul Level, Vitality, etc
  procedure UpdateStatus(var AWarrior: TWarrior);

  // This function just increase the Stamina value when using some special ring (ex.: FaP ring)
  // Esta função apenas aumenta a Stamina no caso do jogador estar usando um anel especial (ex.: FaP ring)
  function IncreaseStaminaWithRingBonus(const ARing1, ARing2, ActualStamina: Cardinal): Cardinal;
  
  // This function just increase the HP value when using some special ring (ex.: FaP ring)
  // Esta função apenas aumenta o HP no caso do jogador estar usando um anel especial (ex.: FaP ring)
  function IncreaseHPWithRingAndMaskBonus(const ARing1, ARing2, AMask, ActualHP: Cardinal): Cardinal;

  // This function obtains the max value of the main player's Stamina
  // Esta função obtém o valor máximo da Stamina do jogador principal
  function GetDefaultPlayerMaxStamina(const AWarrior: TWarrior): Cardinal;

  // This function obtains the max value of the Red Phantom's Stamina
  // Esta função obtém o valor máximo da Stamina do Red Phantom
  function GetRedPhantomMaxStamina(const AWarrior: TWarrior): Cardinal;

  // This function obtains the max value of the Blue Phantom's Stamina
  // Esta função obtém o valor máximo da Stamina do Blue Phantom
  function GetBluePhantomMaxStamina(const AWarrior: TWarrior): Cardinal;

  // This function obtains the max value of the White Phantom's Stamina
  // Esta função obtém o valor máximo da Stamina do White Phantom
  function GetWhitePhantomMaxStamina(const AWarrior: TWarrior): Cardinal;

  // This function obtains the max value of the main player's HP
  // Esta função obtém o valor máximo dao HP do jogador principal
  function GetDefaultPlayerMaxHP(const AWarrior: TWarrior): Cardinal;

  // This function obtains the max value of the Red Phantom's HP
  // Esta função obtém o valor máximo dao HP do Red Phantom
  function GetRedPhantomMaxHP(const AWarrior: TWarrior): Cardinal;
  
  // This function obtains the max value of the Blue Phantom's HP
  // Esta função obtém o valor máximo dao HP do Blue Phantom
  function GetBluePhantomMaxHP(const AWarrior: TWarrior): Cardinal;
  
  // This function obtains the max value of the White Phantom's HP
  // Esta função obtém o valor máximo dao HP do White Phantom
  function GetWhitePhantomMaxHP(const AWarrior: TWarrior): Cardinal;

implementation

uses
  uDSProcessMgmtUtils, uDSProcessMgmtNameUtils, uDSProcessMgmtWCUtils;

  
// Function for reading the value of some Pointer address in memory
// Função para ler o valor de algum endereço de ponteiro na memória
function GetPointerValue(const APointer: Cardinal; AOffSets: array of Cardinal): Cardinal;
var
 wHandle: hwnd;
 hProcess: integer;
 pId: integer;
 Value: Cardinal;
 Read: NativeUInt;
 i: Integer;
begin

  Result := 0;

  if not IsDarkSoulsRunning then
    Exit;

  wHandle := FindWindow(nil,'DARK SOULS');
  GetWindowThreadProcessId(wHandle,@pId);

  if wHandle <> 0 then
  begin
    hProcess := OpenProcess(PROCESS_ALL_ACCESS,False,pId);

    ReadProcessMemory(hProcess, Ptr(APointer), Addr(Value), 4, Read);
    for i := Low(AOffSets) to High(AOffSets) do
    begin
      ReadProcessMemory(hProcess, Ptr(Value + AOffSets[i]), Addr(Value), 4, Read);
    end;

    Result := Value;

  end;

end;

// This function get the name of the player
// Esta função obtém o nome do jogador
function GetWarriorName(AWarrior: TWarrior): String;
begin
  if AWarrior.ClassType = TDefaultPlayer then
    Result := GetDefaultPlayerName
  else
    if AWarrior.ClassType = TRedPhantom then
      Result := GetRedPhantomName
    else
      if AWarrior.ClassType = TBluePhantom then
        Result := GetBluePhantomName
      else
        Result := GetWhitePhantomName;
end;

// This function get the class of the player
// Esta função obtém a classe do jogador
function GetWarriorClass(AWarrior: TWarrior): TWarriorClass;
begin
  if AWarrior.ClassType = TDefaultPlayer then
    Result := GetDefaultPlayerWarriorClass
  else
    if AWarrior.ClassType = TRedPhantom then
      Result := GetRedPhantomWarriorClass //TODO: Need implementation / Precisa de implementação
    else
      if AWarrior.ClassType = TBluePhantom then
        Result := GetBluePhantomWarriorClass //TODO: Need implementation / Precisa de implementação
      else
        Result := GetWhitePhantomWarriorClass; //TODO: Need implementation / Precisa de implementação
end;

function IncreaseStaminaWithRingBonus(const ARing1, ARing2, ActualStamina: Cardinal): Cardinal;
begin
  Result := ActualStamina;
  if (ARing1 = 143) or (ARing2 = 143) then
      Result := Round(ActualStamina * 1.2);
end;

function GetDefaultPlayerMaxStamina(const AWarrior: TWarrior): Cardinal;
  var
  MaxStamina, Ring1, Ring2: Cardinal;
begin
  MaxStamina := GetPointerValue(AWarrior.FPointer, AWarrior.FMaxStaminaOffsets);

  Result := MaxStamina;

  Ring1 := GetPointerValue(AWarrior.FPointer, [$8, $280]);
  Ring2 := GetPointerValue(AWarrior.FPointer, [$8, $284]);

  Result := IncreaseStaminaWithRingBonus(Ring1, Ring2, Result);
end;

function GetRedPhantomMaxStamina(const AWarrior: TWarrior): Cardinal;
begin
  Result := AWarrior.ActualStamina;
end;

function GetBluePhantomMaxStamina(const AWarrior: TWarrior): Cardinal;
begin
  Result := AWarrior.ActualStamina;
end;

function GetWhitePhantomMaxStamina(const AWarrior: TWarrior): Cardinal;
begin
  Result := AWarrior.ActualStamina;
end;

function CalculateMaxStamina(AWarrior: TWarrior): Cardinal;
begin
  if AWarrior.ClassType = TDefaultPlayer then
    Result := GetDefaultPlayerMaxStamina(AWarrior)
  else
    if AWarrior.ClassType = TRedPhantom then
      Result := GetRedPhantomMaxStamina(AWarrior)
    else
      if AWarrior.ClassType = TBluePhantom then
        Result := GetBluePhantomMaxStamina(AWarrior)
      else
        Result := GetWhitePhantomMaxStamina(AWarrior);
end;

// Ring and Mask Bonus
// Bonus de anel e máscara
function IncreaseHPWithRingAndMaskBonus(const ARing1, ARing2, AMask, ActualHP: Cardinal): Cardinal;
var
  V1, V2, V3: cardinal;
begin

  V1 := 0;  V2 := 0;  V3 := 0;

  Result := ActualHP;

  if (ARing1 = 143) or (ARing2 = 143) then
  begin
    V1 := Round(ActualHP * 0.2);
    if (ARing1 = 111) or (ARing2 = 111) then
    begin
      V2 := Round((ActualHP + V1) * 0.05);
      if (AMask = 600000) then
        V3 := (Round(V2 * 0.1) - 1);
    end
    else
    if (AMask = 600000) then
      V3 := (Round((ActualHP + V1) * 0.1) - 1);
  end;

  if (V1 <> 0) and (V2 <> 0) and (V3 <> 0) then
  begin
    Result := Result + V1 + V2 + V3;
    Exit;
  end;

  if (ARing1 = 111) or (ARing2 = 111) then
  begin
    V2 := Round(ActualHP * 0.05);
    if (AMask = 600000) then
      V3 := V2 + (Round((ActualHP + V2) * 0.1) - 1);
  end;

  if (V2 <> 0) and (V3 <> 0) then
  begin
    Result := Result + V1 + V2 + V3;
    Exit;
  end;

  if (V2 = 0) and (V1 = 0) then
    if (AMask = 600000) then
      V3 := Round(ActualHP * 0.1) - 1;

  if (V1 + V2 + V3) = 0 then Exit;

  Result := Result + V1 + V2 + V3;

end;

function GetDefaultPlayerMaxHP(const AWarrior: TWarrior): Cardinal;
var
  HPt: Cardinal;
  Ring1, Ring2: Cardinal;
  Head: Cardinal;
begin
  HPt := GetPointerValue(AWarrior.FPointer, AWarrior.FMaxHPOffSets);

  Result := Hpt;

  Ring1 := GetPointerValue(AWarrior.FPointer, [$8, $280]);
  Ring2 := GetPointerValue(AWarrior.FPointer, [$8, $284]);

  Head := GetPointerValue(AWarrior.FPointer, [$8, $26c]);

  Result := IncreaseHPWithRingAndMaskBonus(Ring1, Ring2, Head, Result);
end;

function GetRedPhantomMaxHP(const AWarrior: TWarrior): Cardinal;
var
  HPt: Cardinal;
begin
  HPt := GetPointerValue(AWarrior.FPointer, AWarrior.FMaxHPOffSets);
  Result := HPt;
end;

function GetBluePhantomMaxHP(const AWarrior: TWarrior): Cardinal;
var
  HPt: Cardinal;
begin
  HPt := GetPointerValue(AWarrior.FPointer, AWarrior.FMaxHPOffSets);
  Result := HPt;
end;

function GetWhitePhantomMaxHP(const AWarrior: TWarrior): Cardinal;
var
  HPt: Cardinal;
begin
  HPt := GetPointerValue(AWarrior.FPointer, AWarrior.FMaxHPOffSets);
  Result := HPt;
end;

function CalculateMaxHP(AWarrior: TWarrior): Cardinal;
begin
  if AWarrior.ClassType = TDefaultPlayer then
    Result := GetDefaultPlayerMaxHP(AWarrior)
  else
    if AWarrior.ClassType = TRedPhantom then
      Result := GetRedPhantomMaxHP(AWarrior)
    else
      if AWarrior.ClassType = TBluePhantom then
        Result := GetBluePhantomMaxHP(AWarrior)
      else
        Result := GetWhitePhantomMaxHP(AWarrior)
end;

procedure UpdateStaminaHPStatus(var AWarrior: TWarrior);
begin
  AWarrior.ActualStamina := GetPointerValue(AWarrior.FInfoPointer, AWarrior.FActualStaminaOffsets);
  AWarrior.HP := GetPointerValue(AWarrior.FInfoPointer, AWarrior.FActualHPOffsets);
end;

procedure UpdateStatus(var AWarrior: TWarrior);
begin
  AWarrior.Level := GetPointerValue(AWarrior.FPointer, AWarrior.FLevelOffsets);
  AWarrior.Vitality := GetPointerValue(AWarrior.FPointer, AWarrior.FVitalityOffsets);
  AWarrior.Attunement := GetPointerValue(AWarrior.FPointer, AWarrior.FAttunementOffsets);
  AWarrior.Endurance := GetPointerValue(AWarrior.FPointer, AWarrior.FEnduranceOffsets);
  AWarrior.Strength := GetPointerValue(AWarrior.FPointer, AWarrior.FStrengthOffsets);
  AWarrior.Dexterity := GetPointerValue(AWarrior.FPointer, AWarrior.FDexterityOffsets);
  AWarrior.Resistance := GetPointerValue(AWarrior.FPointer, AWarrior.FResistanceOffsets);
  AWarrior.Intelligence := GetPointerValue(AWarrior.FPointer, AWarrior.FIntelligenceOffsets);
  AWarrior.Faith := GetPointerValue(AWarrior.FPointer, AWarrior.FFaithOffsets);

  AWarrior.WarriorClass := GetWarriorClass(AWarrior);
  AWarrior.MaxStamina := CalculateMaxStamina(AWarrior);
  AWarrior.MaxHP := CalculateMaxHP(AWarrior);

  AWarrior.Name := GetWarriorName(AWarrior);
end;



end.
