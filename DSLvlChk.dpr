// =====================================================================================

// DarkSouls Level Checker 
// This software was created for usign with Dark Souls: Prepare To Die Edition (TM) (PC)
// It intends to be a tool for PC players while playing online (multiplayer mode) with
// some possibility of get some informations about the coop / pvp player (and also the
// default player!), like level status, hp and stamina, name and class.
//
// I've created this application against hackers that use some cheats for modifying 
// their stats and preserving a low level. The purpose of this is just for checking
// the players stats in some livestream, by example, "banning" the player in the match.
//
//
// The main language of this app is Portuguese Brazilian.

// - 

// DarkSouls Level Checker
// Este software foi criado para ser usado com Dark Souls: Prepare To Die Edition (TM) (PC)
// Criado com a intenção de servir como uma ferramenta para jogadores do PC, para quando
// estiverem jogando online (coop ou pvp).
// Com ele, há a possibilidade de obter informações sobre o status dos jogadores, como
// por exemplo: nome, classe, stamina, hp, level e todo os status.
//
// Eu criei essa aplicação para lutar contra a prática hacker de trapassear as informações
// do status do jogador, e mantendo a soul level baixa. O propósito é apenas "checkar"
// os status dos outros nas livestreams, por exemplo, e impossibilitar o impostor de 
// jogar com os outros jogadores honestos.
//
// ====================================================================================

program DSLvlChk;

uses
  Forms,
  uWarrior in 'uWarrior.pas',
  uDefaultPlayer in 'uDefaultPlayer.pas',
  uRedPhantom in 'uRedPhantom.pas',
  uBluePhantom in 'uBluePhantom.pas',
  uWhitePhantom in 'uWhitePhantom.pas',
  uDSProcessMgmt in 'uDSProcessMgmt.pas',
  uDSProcessMgmtNameUtils in 'uDSProcessMgmtNameUtils.pas',
  uDSProcessMgmtUtils in 'uDSProcessMgmtUtils.pas',
  uDSProcessMgmtWCUtils in 'uDSProcessMgmtWCUtils.pas',
  uFrameStatusPlayer in 'uFrameStatusPlayer.pas' {FrameStatusPlayer: TFrame},
  uMainForm in 'uMainForm.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'DarkSouls Level Checker - by vrlshadow';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
