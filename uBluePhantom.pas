// ==============================================================================
//
// Unit uBluePhantom.pas
//
// This class contains the information about some pvp/pve Dark Souls player
// Note: the "Blue Phantom" definition is not really associated with the real
// invasor. It's just a definition for implementation
//
// Esta classe contém as informações sobre qualquer jogador (pvp ou pve)
// Nota: a definição de "Blue Phantom" não é realmente de um invasor. Só foi 
// definido esse nome para título de implementação.
//
// ==============================================================================

unit uBluePhantom;

interface

uses
    uWarrior;


type
    // Class inherited from TWarrir
    // Classe herdade de TWarrior
    TBluePhantom = class(TWarrior)
    public
      constructor Create; override;

      procedure UpdateStatus; override;
      procedure UpdateStaminaHPStatus; override;
    end;

implementation

{ TBluePhantom }

// Just the most important here: setting the pointers and offsets addresses for reading memory
// Apenas o mais importante: definindo os endereços de ponteiro e offsets para leitura de memória
constructor TBluePhantom.Create;
const
  DEFAULT_POINTER = $1349020;
  DEFAULT_STATS_POINTER = $1349020;
begin
  Self.FPointer := DEFAULT_POINTER;
  Self.FInfoPointer := DEFAULT_STATS_POINTER;
  Self.FLevelOffsets[0] := $60; Self.FLevelOffsets[1] := $60C;   Self.FLevelOffsets[2] := $4; Self.FLevelOffsets[3] := $3C; Self.FLevelOffsets[4] := $88;
  Self.FVitalityOffsets[0] := $60; Self.FVitalityOffsets[1] := $60C; Self.FVitalityOffsets[2] := $4; Self.FVitalityOffsets[3] := $3C; Self.FVitalityOffsets[4] := $38;
  Self.FAttunementOffsets[0] := $60;  Self.FAttunementOffsets[1] := $60C;  Self.FAttunementOffsets[2] := $4;  Self.FAttunementOffsets[3] := $3C;  Self.FAttunementOffsets[4] := $40;
  Self.FEnduranceOffsets[0] := $60; Self.FEnduranceOffsets[1] := $60C;   Self.FEnduranceOffsets[2] := $4; Self.FEnduranceOffsets[3] := $3C;   Self.FEnduranceOffsets[4] := $48;
  Self.FStrengthOffsets[0] := $60; Self.FStrengthOffsets[1] := $60C;   Self.FStrengthOffsets[2] := $4; Self.FStrengthOffsets[3] := $3C;   Self.FStrengthOffsets[4] := $50;
  Self.FDexterityOffsets[0] := $60; Self.FDexterityOffsets[1] := $60C;  Self.FDexterityOffsets[2] := $4; Self.FDexterityOffsets[3] := $3C;  Self.FDexterityOffsets[4] := $58;
  Self.FResistanceOffsets[0] := $60;   Self.FResistanceOffsets[1] := $60C;  Self.FResistanceOffsets[2] := $4;   Self.FResistanceOffsets[3] := $3C;  Self.FResistanceOffsets[4] := $80;
  Self.FIntelligenceOffsets[0] := $60;  Self.FIntelligenceOffsets[1] := $60C;  Self.FIntelligenceOffsets[2] := $4;  Self.FIntelligenceOffsets[3] := $3C;  Self.FIntelligenceOffsets[4] := $60;
  Self.FFaithOffsets[0] := $60;  Self.FFaithOffsets[1] := $60C;  Self.FFaithOffsets[2] := $4;  Self.FFaithOffsets[3] := $3C;  Self.FFaithOffsets[4] := $68;
  Self.FActualStaminaOffsets[0] := $60; Self.FActualStaminaOffsets[1] := $60C; Self.FActualStaminaOffsets[2] := $4;  Self.FActualStaminaOffsets[3] := $3C;   Self.FActualStaminaOffsets[4] := $1C;
  Self.FMaxHPOffSets[0] := $60;  Self.FMaxHPOffSets[1] := $60c;  Self.FMaxHPOffSets[2] := $4;  Self.FMaxHPOffSets[3] := $3C;  Self.FMaxHPOffSets[4] := $10;
  Self.FActualHPOffsets[0] := $60;  Self.FActualHPOffsets[1] :=$60C;  Self.FActualHPOffsets[2] := $4;  Self.FActualHPOffsets[3] := $3C;  Self.FActualHPOffsets[4] := $C;
  inherited;
end;

procedure TBluePhantom.UpdateStaminaHPStatus;
begin
  inherited;

end;

procedure TBluePhantom.UpdateStatus;
begin
  inherited;

end;

end.
