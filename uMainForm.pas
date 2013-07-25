// =================================================

// Main window form. Contains the frames with 
// players checker.

// Form principal da aplica�o. Contem os frames com 
// as informa��es dos outros jogadores.

// =================================================

unit uMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons, Menus, uFrameStatusPlayer;

type
  TMainForm = class(TForm)
    MainPanel: TPanel;
    DefaultImage: TImage;
    QuitSpeedButton: TSpeedButton;
    PopupMenu1: TPopupMenu;
    AlwaysVisibleMenu: TMenuItem;
    QuitMenu: TMenuItem;
    FrameStatusPlayer1: TFrameStatusPlayer;
    FrameStatusPlayer2: TFrameStatusPlayer;
    FrameStatusPlayer3: TFrameStatusPlayer;
    FrameStatusPlayer4: TFrameStatusPlayer;
    TransparenceMenu: TMenuItem;
    procedure QuitSpeedButtonClick(Sender: TObject);
    procedure QuitMenuClick(Sender: TObject);
    procedure DefaultImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TransparenceMenuClick(Sender: TObject);
    procedure AlwaysVisibleMenuClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FrameStatusPlayer2CheckStatusTimer(Sender: TObject);
    procedure FrameStatusPlayer2CheckPlayerHealthTimer(Sender: TObject);
  private
    { Private declarations }
    procedure WMNCHitTest(var Msg: TWMNCHitTest);  message wm_NCHitTest;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

var
  MainForm: TMainForm;

implementation
uses
  uRedPhantom, uWhitePhantom, uDefaultPlayer, uBluePhantom;

{$R *.dfm}

//Procedure: Aways Visible Option
//Procedure: Op��o "Sempre Vis�vel"
procedure TMainForm.AlwaysVisibleMenuClick(Sender: TObject);
begin
  if AlwaysVisibleMenu.Checked then
  begin
    AlwaysVisibleMenu.Checked := False;
    SetWindowPos(MainForm.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
          SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  end
  else
  begin
    AlwaysVisibleMenu.Checked := True;
    SetWindowPos(MainForm.Handle, HWND_TOPMOST, 0, 0, 0, 0,
          SWP_NOMOVE or SWP_NOSIZE or SWP_SHOWWINDOW);
  end;
end;

constructor TMainForm.Create(AOwner: TComponent);
begin
  inherited;
end;

// Create the players for the frames
// Instancia os jogadores para os frames
procedure TMainForm.FormShow(Sender: TObject);
begin
  FrameStatusPlayer1.Warrior := TDefaultPlayer.Create;
  FrameStatusPlayer2.Warrior := TRedPhantom.Create;
  FrameStatusPlayer3.Warrior := TBluePhantom.Create;
  FrameStatusPlayer4.Warrior := TWhitePhantom.Create;
end;

procedure TMainForm.FrameStatusPlayer2CheckPlayerHealthTimer(Sender: TObject);
begin
  FrameStatusPlayer2.CheckPlayerHealthTimer(Sender);

end;

procedure TMainForm.FrameStatusPlayer2CheckStatusTimer(Sender: TObject);
begin
  FrameStatusPlayer2.CheckStatusTimer(Sender);

end;

// Move the window by the mouse
// Move a janela arrastando com o mouse
procedure TMainForm.DefaultImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ReleaseCapture;
  SendMessage(MainForm.Handle, WM_SYSCOMMAND, 61458, 0);
end;

// Option for transparency window (wrong grammar :( )
// Op��o para transparencia
procedure TMainForm.TransparenceMenuClick(Sender: TObject);
var
  AlphaValueOp: String;
begin
  if TransparenceMenu.Checked then
  begin
    TransparenceMenu.Checked := False;
    MainForm.AlphaBlend := False;
  end
  else
  begin
    TransparenceMenu.Checked := True;
    AlphaValueOp := InputBox('Transpar�ncia', 'Defina o valor de transpar�ncia (0-255)', '255');
    try
      MainForm.AlphaBlendValue := StrToInt(AlphaValueOp);
    except
      MainForm.AlphaBlend := False;
      ShowMessage('Valor inv�lido');
      TransparenceMenuClick(Sender);
    end;
    MainForm.AlphaBlend := True;
  end;

end;

// Exit application by calling speedbutton click
// Sair da aplica��o chamando o evento do speedbutton
procedure TMainForm.QuitMenuClick(Sender: TObject);
begin
  QuitSpeedButtonClick(nil);
end;

// Exit application
// Sair da aplica��o
procedure TMainForm.QuitSpeedButtonClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.WMNCHitTest(var Msg: TWMNCHitTest);
begin
  inherited;
  if  Msg.Result = htClient then
    Msg.Result := htCaption;
end;


end.
