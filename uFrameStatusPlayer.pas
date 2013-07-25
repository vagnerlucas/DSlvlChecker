// ==============================================================
//
// This unit contains the routine for displaying the player stats
// Note: It requires TALProgressBar. 
// Can be found at: 
// http://store77.googlecode.com/svn/trunk/GOLD/LUX-source/ALProgressBar.pas
//
// Esta unit contém a rotina para mostrar o status do jogador
// Nota: Requer o componente TALProgressBar.
// Que pode ser encontrado em:
// http://store77.googlecode.com/svn/trunk/GOLD/LUX-source/ALProgressBar.pas
//
// ==============================================================

unit uFrameStatusPlayer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ALProgressBar, ExtCtrls, Menus, uWarrior;

type
  TFrameStatusPlayer = class(TFrame)
    
    // Some display stuff
    // Componentes para exibição
    
    MainPanel: TPanel;
    StatusImage: TImage;
    PlayerNameLabel: TLabel;
    GetPlayerStatsTimer: TTimer;
    HPProgressBar: TALProgressBar;
    StaminaProgressBar: TALProgressBar;
    SLLabel: TLabel;
    VitLabel: TLabel;
    AttLabel: TLabel;
    EndLabel: TLabel;
    StrLabel: TLabel;
    DexLabel: TLabel;
    ResLabel: TLabel;
    IntLabel: TLabel;
    FaiLabel: TLabel;
    DefaultPopupMenu: TPopupMenu;
    ShowSL: TMenuItem;
    CurseIt: TMenuItem; //TODO: implement (if possible) / Implementar (se possível)
    
    // TODO: Implement the time menu (in ms)
    // TODO: Implementar menu de tempo (em ms)
    
    // Timer for update
    // Timer para atualização
    CheckStatus: TTimer;
    CheckPlayerHealth: TTimer;
    
    procedure GetPlayerStatsTimerTimer(Sender: TObject);
    
    // Procedure for showing/hidding the Stats (just show SL)
    // Procedure para esconder/mostrar o stats (apenas mostra SL)
    procedure ShowSLClick(Sender: TObject);
    
    // Timer for CheckPlayerHealth.OnTimer
    // Timer para evento CheckPlayerHealth.OnTimer
    procedure CheckPlayerHealthTimer(Sender: TObject);

    // Proceudre for CheckStatus.OnTimer
    // Procedure para CheckStatus.OnTimer
    procedure CheckStatusTimer(Sender: TObject);
  private
    
    FWarrior: TWarrior;
    function GetFrameWarrior: TWarrior;
    procedure SetFrameWarrior(AWarrior: TWarrior);
  protected
    procedure PaintWindow(DC: HDC); override;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
    procedure HideStats;
    procedure ShowStats;
    procedure HideShowStats(const AValue: Boolean);
    procedure UpdatePlayerStats;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy(); override;
    property Warrior: TWarrior read GetFrameWarrior write SetFrameWarrior;
  end;

implementation

uses
  uDefaultPlayer, uRedPhantom, uBluePhantom, uWhitePhantom;

{$R *.dfm}

procedure TFrameStatusPlayer.CheckPlayerHealthTimer(Sender: TObject);
begin
  HPProgressBar.Max := Warrior.MaxHP;
  StaminaProgressBar.Max := Warrior.MaxStamina;
  HPProgressBar.Position := Warrior.HP;
  StaminaProgressBar.Position := Warrior.ActualStamina;
end;

procedure TFrameStatusPlayer.CheckStatusTimer(Sender: TObject);
begin
  UpdatePlayerStats;
end;

constructor TFrameStatusPlayer.Create(AOwner: TComponent);
begin
  inherited;
  Self.DoubleBuffered := True;
end;

destructor TFrameStatusPlayer.Destroy;
begin
  inherited;
end;

function TFrameStatusPlayer.GetFrameWarrior: TWarrior;
begin
  Result := FWarrior;
end;

procedure TFrameStatusPlayer.GetPlayerStatsTimerTimer(Sender: TObject);
begin
  if Warrior = nil then
    if Warrior.ClassType = TDefaultPlayer then
        Warrior := TDefaultPlayer.Create
    else
      if Warrior.ClassType = TRedPhantom then
        Warrior := TRedPhantom.Create
      else
        if Warrior.ClassType = TBluePhantom then
          Warrior := TBluePhantom.Create
        else
          if Warrior.ClassType = TWhitePhantom then
            Warrior := TWhitePhantom.Create
          else
            Exit;
end;

procedure TFrameStatusPlayer.HideShowStats(const AValue: Boolean);
begin
  VitLabel.Visible := AValue;
  AttLabel.Visible := AValue;
  EndLabel.Visible := AValue;
  StrLabel.Visible := AValue;
  DexLabel.Visible := AValue;
  ResLabel.Visible := AValue;
  IntLabel.Visible := AValue;
  FaiLabel.Visible := AValue;
end;



procedure TFrameStatusPlayer.HideStats;
begin
  HideShowStats(False);
end;

procedure TFrameStatusPlayer.PaintWindow(DC: HDC);
begin
  inherited;
end;

procedure TFrameStatusPlayer.SetFrameWarrior(AWarrior: TWarrior);
begin
  FWarrior := AWarrior;
end;

procedure TFrameStatusPlayer.ShowSLClick(Sender: TObject);
begin
  if ShowSL.Checked  then
  begin
    ShowSL.Checked := False;
    ShowStats;
  end
  else
  begin
    ShowSL.Checked := True;
    HideStats;
  end;
end;

procedure TFrameStatusPlayer.ShowStats;
begin
  HideShowStats(True)
end;

procedure TFrameStatusPlayer.UpdatePlayerStats;
begin
  Warrior.UpdateStatus;
  PlayerNameLabel.Caption := Warrior.Name + ' - ' + Warrior.WarriorClassName;
  SLLabel.Caption := IntToStr(Warrior.Level);
  VitLabel.Caption := IntToStr(Warrior.Vitality);
  AttLabel.Caption := IntToStr(Warrior.Attunement);
  EndLabel.Caption := IntToStr(Warrior.Endurance);
  StrLabel.Caption := IntToStr(Warrior.Strength);
  DexLabel.Caption := IntToStr(Warrior.Dexterity);
  ResLabel.Caption := IntToStr(Warrior.Resistance);
  IntLabel.Caption := IntToStr(Warrior.Intelligence);
  FaiLabel.Caption := IntToStr(Warrior.Faith);

end;

procedure TFrameStatusPlayer.WMPaint(var Message: TWMPaint);
begin
  inherited;
end;

end.
