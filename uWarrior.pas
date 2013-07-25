// ====================================================================
//
// Unit uWarrior.pas
//
// This class contains the main properties from the player/character
//
// Esta classe contém as propriedades principais do jogador/personagem
//
// ====================================================================

unit uWarrior;

interface

uses
  {ExtCtrls,} Classes, SysUtils;

type
    // Enumeration with the possible player classes
    // Enumeration com as possíveis classes do usuário
    TWarriorClass = (wcDeprived,
                     wcSorcerer,
                     wcCleric,
                     wcThief,
                     wcBandit,
                     wcKnight,
                     wcHunter,
                     wcPyromancer,
                     wcWarrior,
                     wcWanderer,
                     wcNone);

    // Warrior class
    // Classe Warrior
    TWarrior = class
    private
      {FStatusGetterTimer: TTimer;
      FStaminaHPGetterTimer: TTimer;}

      FWarriorClass: TWarriorClass;
      FLevel: Integer;
      FVitality: Integer;
      FAttunement: Integer;
      FEndurance: Integer;
      FStrength: Integer;
      FDexterity: Integer;
      FResistance: Integer;
      FIntelligence: Integer;
      FFaith: Integer;
      FMaxHP: Integer;
      FHP: Integer;

      FMaxStamina: Integer;
      FActualStamina: Integer;
      FName: String;
      //FWarriorClassName: String;

      // Getters and Setters
      function GetWarriorClass: TWarriorClass;
      procedure SetWarriorClass(const AWarriorClass: TWarriorClass);

      function GetLevel: Integer;
      procedure SetLevel(const ALevel: Integer);

      function GetVitality: Integer;
      procedure SetVitality(const AVitality: Integer);

      function GetAttunement: Integer;
      procedure SetAttunement(const AAttunement: Integer);

      function GetEndurance: Integer;
      procedure SetEndurance(const AEndurance: Integer);

      function GetStrength: Integer;
      procedure SetStrength(const AStrength: Integer);

      function GetDexterity: Integer;
      procedure SetDexterity(const ADexterity: Integer);

      function GetResistance: Integer;
      procedure SetResistance(const AResistance: Integer);

      function GetIntelligence: Integer;
      procedure SetIntelligence(const AIntelligence: Integer);

      function GetFaith: Integer;
      procedure SetFaith(const AFaith: Integer);

      function GetHP: Integer;
      procedure SetHP(const AHP: Integer);

      function GetMaxHP: Integer;
      procedure SetMaxHP(const AMaxHP: Integer);

      function GetMaxStamina: Integer;
      procedure SetMaxStamina(const AMaxStamina: Integer);

      function GetActualStamina: Integer;
      procedure SetActualStamina(const AActualStamina: Integer);

      function GetName: String;
      procedure SetName(const AName: String);

      function GetWarriorClassName: String;
      //procedure SetWarriorClassName(const AWarriorClassName: String);

      //procedure OnTimerUpdateStatus(Sender: TObject);
      //procedure OnTimerUpdateStaminaHP(Sender: TObject);

    public
      // They are public because there's no need of make some get and set for them. It just contains the offsets
      // Essas "propriedades" estão públicas porque não há a necessidade de implementar get and set, visto que são apenas offsets
      FPointer: Cardinal;
      FInfoPointer: Cardinal;
      FLevelOffsets: array [0..10] of Cardinal;
      FVitalityOffsets: array [0..10] of Cardinal;
      FAttunementOffsets: array [0..10] of Cardinal;
      FEnduranceOffsets: array [0..10] of Cardinal;
      FStrengthOffsets: array [0..10] of Cardinal;
      FDexterityOffsets: array [0..10] of Cardinal;
      FResistanceOffsets: array [0..10] of Cardinal;
      FIntelligenceOffsets: array [0..10] of Cardinal;
      FFaithOffsets: array [0..10] of Cardinal;
      FMaxStaminaOffsets: array[0..10] of Cardinal;
      FMaxHPOffSets: array[0..10] of Cardinal;
      FActualStaminaOffsets: array [0..10] of Cardinal;
      FActualHPOffsets: array [0..10] of Cardinal;

      constructor Create; virtual;

      procedure UpdateStatus; virtual;
      procedure UpdateStaminaHPStatus; virtual;

      property WarriorClass: TWarriorClass read GetWarriorClass write SetWarriorClass;
      property Level: Integer read GetLevel write SetLevel;
      property Vitality: Integer read GetVitality write SetVitality;
      property Attunement: Integer read GetAttunement write SetAttunement;
      property Endurance: Integer read GetEndurance write SetEndurance;
      property Strength: Integer read GetStrength write SetStrength;
      property Dexterity: Integer read GetDexterity write SetDexterity;
      property Resistance: Integer read GetResistance write SetResistance;
      property Intelligence: Integer read GetIntelligence write SetIntelligence;
      property Faith: Integer read GetFaith write SetFaith;

      property HP: Integer read GetHP write SetHP;
      property MaxHP: Integer read GetMaxHP write SetMaxHP;

      property MaxStamina: Integer read GetMaxStamina write SetMaxStamina;
      property ActualStamina: Integer read GetActualStamina write SetActualStamina;

      property Name: String read GetName write SetName;
      property WarriorClassName: String read GetWarriorClassName;// write SetWarriorClassName;

    end;

implementation

uses
  uDSProcessMgmt;

{ TWarrior }

constructor TWarrior.Create;
begin
  Self.WarriorClass := wcNone;
{  FStatusGetterTimer := TTimer.Create(nil);
  FStaminaHPGetterTimer := TTimer.Create(nil);

  FStatusGetterTimer.Interval := 2000;
  FStaminaHPGetterTimer.Interval := 3;

  FStatusGetterTimer.OnTimer := OnTimerUpdateStatus;
  FStaminaHPGetterTimer.OnTimer := OnTimerUpdateStaminaHP;

  FStatusGetterTimer.Enabled := True;
  FStaminaHPGetterTimer.Enabled := True; }

  UpdateStatus;
  //UpdateStaminaHPStatus;
end;

// Just getters and setters below
// Apenas getters e setters abaixo

function TWarrior.GetActualStamina: Integer;
begin
  Result := FActualStamina;
end;

function TWarrior.GetAttunement: Integer;
begin
   Result := FAttunement;
end;

function TWarrior.GetDexterity: Integer;
begin
  Result := FDexterity;
end;

function TWarrior.GetEndurance: Integer;
begin
  Result := FEndurance;
end;

function TWarrior.GetFaith: Integer;
begin
  Result := FFaith;
end;

function TWarrior.GetHP: Integer;
begin
  Result := FHP;
end;

function TWarrior.GetIntelligence: Integer;
begin
  Result := FIntelligence;
end;

function TWarrior.GetLevel: Integer;
begin
  Result := FLevel;
end;

function TWarrior.GetMaxHP: Integer;
begin
  Result := FMaxHP;
end;

function TWarrior.GetMaxStamina: Integer;
begin
  Result := FMaxStamina;
end;

function TWarrior.GetName: String;
begin
  Result := FName;
end;

function TWarrior.GetResistance: Integer;
begin
  Result := FResistance;
end;

function TWarrior.GetStrength: Integer;
begin
  Result := FStrength;
end;

function TWarrior.GetVitality: Integer;
begin
  Result := FVitality;
end;

function TWarrior.GetWarriorClass: TWarriorClass;
begin
  Result := FWarriorClass;
end;

function TWarrior.GetWarriorClassName: String;
begin
  Result := EmptyStr;

  case Self.WarriorClass of
    wcWarrior: Result     := 'Warrior';
    wcKnight: Result      := 'Knight';
    wcWanderer: Result    := 'Wanderer';
    wcThief: Result       := 'Thief';
    wcBandit: Result      := 'Bandit';
    wcHunter: Result      := 'Hunter';
    wcSorcerer: Result    := 'Sorcerer';
    wcPyromancer: Result  := 'Pyromancer';
    wcCleric: Result      := 'Cleric';
    wcDeprived: Result    := 'Deprived';
  else
    Result := EmptyStr;
  end;

end;

{procedure TWarrior.OnTimerUpdateStaminaHP(Sender: TObject);
begin
  UpdateStaminaHPStatus;
end;

procedure TWarrior.OnTimerUpdateStatus(Sender: TObject);
begin
  UpdateStatus;
end;}

procedure TWarrior.SetActualStamina(const AActualStamina: Integer);
begin
  FActualStamina := AActualStamina;
end;

procedure TWarrior.SetAttunement(const AAttunement: Integer);
begin
  FAttunement := AAttunement;
end;

procedure TWarrior.SetDexterity(const ADexterity: Integer);
begin
  FDexterity := ADexterity;
end;

procedure TWarrior.SetEndurance(const AEndurance: Integer);
begin
  FEndurance := AEndurance;
end;

procedure TWarrior.SetFaith(const AFaith: Integer);
begin
  FFaith := AFaith;
end;

procedure TWarrior.SetHP(const AHP: Integer);
begin
  FHP := AHP;
end;

procedure TWarrior.SetIntelligence(const AIntelligence: Integer);
begin
  FIntelligence := AIntelligence;
end;

procedure TWarrior.SetLevel(const ALevel: Integer);
begin
  FLevel := ALevel;
end;

procedure TWarrior.SetMaxHP(const AMaxHP: Integer);
begin
  FMaxHP := AMaxHP;
end;

procedure TWarrior.SetMaxStamina(const AMaxStamina: Integer);
begin
  FMaxStamina := AMaxStamina;
end;

procedure TWarrior.SetName(const AName: String);
begin
  FName := AName;
end;

procedure TWarrior.SetResistance(const AResistance: Integer);
begin
  FResistance := AResistance;
end;

procedure TWarrior.SetStrength(const AStrength: Integer);
begin
  FStrength := AStrength;
end;

procedure TWarrior.SetVitality(const AVitality: Integer);
begin
  FVitality := AVitality;
end;

procedure TWarrior.SetWarriorClass(const AWarriorClass: TWarriorClass);
begin
  FWarriorClass := AWarriorClass;
end;

procedure TWarrior.UpdateStaminaHPStatus;
begin
  uDSProcessMgmt.UpdateStaminaHPStatus(Self);
end;

// This procedure calls the DS Process Management for read the Dark Souls Memory data, and update the var Warrior (as parameter)
// Esta procedure chama o DS Process Management para ler os dados da memória do Dark Souls e atualiza a classe (tipo var no parãmetro)
procedure TWarrior.UpdateStatus;
begin
  uDSProcessMgmt.UpdateStatus(Self);
  UpdateStaminaHPStatus;
end;

end.
