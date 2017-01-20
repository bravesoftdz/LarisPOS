unit uUtama;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, ExtCtrls, ActnList;

type

  { TFrmUtama }

  TFrmUtama = class(TForm)
    ActList: TActionList;
    MainMenu: TMainMenu;
    Page: TPageControl;
  private
    { private declarations }
  public
    procedure TambahFormTab(Form: TForm);
    procedure HapusFormTab(Sender: TObject; var CloseAction: TCloseAction);
    { public declarations }
  end;

var
  FrmUtama: TFrmUtama;

implementation

{$R *.lfm}

{ TFrmUtama }

procedure TFrmUtama.TambahFormTab(Form: TForm);
var
  Tab: TTabSheet;
begin
  Tab:= Page.AddTabSheet;
  Form.Parent:= Tab;
  Form.OnClose:=@HapusFormTab;
  Page.ActivePage:= Tab;
  Form.Show;
  Tab.Caption:= Form.Caption;
end;

procedure TFrmUtama.HapusFormTab(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  CloseAction:=caFree;
  TTabSheet(TForm(Sender).Parent).Free;
end;

end.

