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
// Criado com a inten��o de servir como uma ferramenta para jogadores do PC, para quando
// estiverem jogando online (coop ou pvp).
// Com ele, h� a possibilidade de obter informa��es sobre o status dos jogadores, como
// por exemplo: nome, classe, stamina, hp, level e todo os status.
//
// Eu criei essa aplica��o para lutar contra a pr�tica hacker de trapassear as informa��es
// do status do jogador, e mantendo a soul level baixa. O prop�sito � apenas "checkar"
// os status dos outros nas livestreams, por exemplo, e impossibilitar o impostor de 
// jogar com os outros jogadores honestos.
//
// ====================================================================================


// About licensing
//
{
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
}

// Sobre a licen�a
//
{
    Este programa � um software livre; voc� pode redistribui-lo e/ou 
    modifica-lo dentro dos termos da Licen�a P�blica Geral GNU como 
    publicada pela Funda��o do Software Livre (FSF); na vers�o 2 da 
    Licen�a, ou (na sua opni�o) qualquer vers�o.

    Este programa � distribuido na esperan�a que possa ser  util, 
    mas SEM NENHUMA GARANTIA; sem uma garantia implicita de ADEQUA��O a qualquer
    MERCADO ou APLICA��O EM PARTICULAR. Veja a
    Licen�a P�blica Geral GNU para maiores detalhes.

    Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU
    junto com este programa, se n�o, escreva para a Funda��o do Software
    Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
}

// ---------------------------------------------------------------------------------

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
