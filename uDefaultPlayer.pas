// ==============================================================================
//
// Unit uDefaultPlayer.pas
//
// This class contains the information about the default Dark Souls player
//
// Esta classe contém as informações sobre o jogador padrão (player 1, :P)
//
// ==============================================================================

unit uDefaultPlayer;

interface

uses
  uWarrior;

type
    // Class inherited from TWarrir
    // Classe herdade de TWarrior
    TDefaultPlayer = class(TWarrior)
    public
      constructor Create; override;

      procedure UpdateStatus; override;
      procedure UpdateStaminaHPStatus; override;
    end;

implementation

{ TDefaultPlayer }

// Just the most important here: setting the pointers and offsets addresses for reading memory
// Apenas o mais importante: definindo os endereços de ponteiro e offsets para leitura de memória
constructor TDefaultPlayer.Create;
const
  DEFAULT_POINTER = $13DED50;
  DEFAULT_STATS_POINTER = $1349020;
begin
  Self.FPointer := DEFAULT_POINTER;
  Self.FInfoPointer := DEFAULT_STATS_POINTER;
  Self.FLevelOffsets[0] := $8; Self.FLevelOffsets[1] := $88;
  Self.FVitalityOffsets[0] := $8; Self.FVitalityOffsets[1] := $38;
  Self.FAttunementOffsets[0] := $8;  Self.FAttunementOffsets[1] := $40;
  Self.FEnduranceOffsets[0] := $8; Self.FEnduranceOffsets[1] := $48;
  Self.FStrengthOffsets[0] := $8; Self.FStrengthOffsets[1] := $50;
  Self.FDexterityOffsets[0] := $8; Self.FDexterityOffsets[1] := $58;
  Self.FResistanceOffsets[0] := $8;   Self.FResistanceOffsets[1] := $80;
  Self.FIntelligenceOffsets[0] := $8;  Self.FIntelligenceOffsets[1] := $60;
  Self.FFaithOffsets[0] := $8;  Self.FFaithOffsets[1] := $68;
  Self.FActualStaminaOffsets[0] := $18;   Self.FActualStaminaOffsets[1] := $280;   Self.FActualStaminaOffsets[2] := $C;  Self.FActualStaminaOffsets[3] := $70;   Self.FActualStaminaOffsets[4] := $2E4;
  Self.FActualHPOffsets[0] := $18;  Self.FActualHPOffsets[1] := $280;  Self.FActualHPOffsets[2] := $C;  Self.FActualHPOffsets[3] := $70;  Self.FActualHPOffsets[4] := $2D4;
  Self.FMaxStaminaOffsets[0] := $8; Self.FMaxStaminaOffsets[1] := $30;
  Self.FMaxHPOffSets[0] := $8; Self.FMaxHPOffSets[1] := $14;
  inherited;
end;

procedure TDefaultPlayer.UpdateStaminaHPStatus;
begin
  inherited;
end;

procedure TDefaultPlayer.UpdateStatus;
begin
  inherited;

end;

end.
