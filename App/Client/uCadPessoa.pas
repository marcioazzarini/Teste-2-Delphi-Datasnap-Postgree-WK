unit uCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBActns, System.Actions,
  Vcl.ActnList, Vcl.ImgList, Data.DB, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmCadPessoa = class(TForm)
    PageControl1: TPageControl;
    tbsCadastro: TTabSheet;
    tbsConsulta: TTabSheet;
    lblTotal: TLabel;
    dbgrdDados: TDBGrid;
    Panel1: TPanel;
    btnNovo: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnGravar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnSair: TSpeedButton;
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    dtsMaster: TDataSource;
    ImageList1: TImageList;
    actListPadrao: TActionList;
    actMasterInsert: TDataSetInsert;
    actMasterDelete: TDataSetDelete;
    actMasterEdit: TDataSetEdit;
    actMasterPost: TDataSetPost;
    actMasterCancel: TDataSetCancel;
    ImageList16x16: TImageList;
    FileSaveDialog1: TFileSaveDialog;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    dbedtCEP: TDBEdit;
    dtsEnderecos: TDataSource;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    dbedtComplemento: TDBEdit;
    Label13: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dbcmbNatureza: TDBComboBox;
    btnConsultaCEP: TSpeedButton;
    Panel4: TPanel;
    btnImportarCSV: TSpeedButton;
    opnDialogCSV: TOpenDialog;
    procedure btnSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtsMasterStateChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbcmbNaturezaKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dtsMasterDataChange(Sender: TObject; Field: TField);
    procedure btnConsultaCEPClick(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbgrdDadosDblClick(Sender: TObject);
    procedure dbedtCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btnImportarCSVClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

{$R *.dfm}

uses uDM, uEnderecoClass, uPessoaClass, uCEPClass;

procedure TfrmCadPessoa.btnCancelarClick(Sender: TObject);
begin
  if (DM.cdsPessoas.State in [dsEdit, dsInsert]) then
  begin
    DM.cdsEnderecos.Cancel;
    DM.cdsPessoas.Cancel;
  end;
end;

function buscaCEP(P:Pointer):LongInt;
var
  objCEP: TCEP;
begin

    objCEP := TCEP.Create(frmCadPessoa.dbedtCEP.Text);
    if (objCEP.CEP <> '-1') then
    begin
      DM.cdsEnderecosdsuf.AsString := objCEP.UF;
      DM.cdsEnderecosnmbairro.AsString := objCEP.Bairro;
      DM.cdsEnderecosnmcidade.AsString := objCEP.Localidade;
      DM.cdsEnderecosnmlogradouro.AsString := objCEP.Logradouro;
    end
    else
    begin
      DM.cdsEnderecosdsuf.AsString := '';
      DM.cdsEnderecosnmbairro.AsString := '';
      DM.cdsEnderecosnmcidade.AsString := '';
      DM.cdsEnderecosnmlogradouro.AsString := '';
      MessageDlg(objCEP.Localidade, mtError, [mbOK], 0);
    end;

end;

procedure TfrmCadPessoa.btnConsultaCEPClick(Sender: TObject);
var
  hThreadID :THandle;
  ThreadID :DWord;
begin
  if (DM.cdsEnderecos.State in [dsEdit, dsInsert]) and (Length(Trim(frmCadPessoa.dbedtCEP.Text)) = 9) then
  begin
    hThreadID := CreateThread(nil, 0, @buscaCEP, nil, 0, ThreadID);
    dbedtComplemento.SetFocus;
  end;
end;

procedure TfrmCadPessoa.btnEditarClick(Sender: TObject);
begin
  if (DM.cdsPessoas.Active) and (DM.cdsPessoas.RecordCount > 0) then
  begin
    DM.cdsPessoas.Edit;
    PageControl1.ActivePage := tbsCadastro;
    dbcmbNatureza.SetFocus;
  end;
end;

procedure TfrmCadPessoa.btnExcluirClick(Sender: TObject);
begin
  if (DM.cdsPessoas.Active) and (DM.cdsPessoas.RecordCount > 0) then
  begin
    DM.cdsPessoas.Delete;
  end;
end;

procedure TfrmCadPessoa.btnGravarClick(Sender: TObject);
begin
  if (DM.cdsPessoas.State in [dsEdit, dsInsert]) then
  begin
    DM.cdsPessoas.Post;
  end;
end;

procedure ImportaCSV(sNomeArquivo: string);
var
  ArquivoCSV: TextFile;
  Contador, I: Integer;
  Linha: String;
  objPessoa: TPessoa;
  objEndereco: Tendereco;

  function MontaValor: String;
  var
    ValorMontado: String;
  begin
    ValorMontado := '';
    inc(I);
    While Linha[I] >= ' ' do
    begin
      If Linha[I] = ';' then
        break;
      ValorMontado := ValorMontado + Linha[I];
      inc(I);
    end;
    result := ValorMontado;
  end;

begin

  AssignFile(ArquivoCSV, sNomeArquivo);

  try
    Reset(ArquivoCSV);
    Contador := 0;

    while not Eof(ArquivoCSV) do
    begin
      Readln(ArquivoCSV, Linha);
      if Contador > 0 then // Primeira Linha do arquivo � o header;
      begin
        i := 0;
        DM.cdsPessoas.Insert;
        DM.cdsPessoasidpessoa.AsInteger := -1;
        DM.cdsPessoasnmprimeiro.AsString := MontaValor;
        DM.cdsPessoasnmsegundo.AsString := MontaValor;
        DM.cdsPessoasfinatureza.AsString := MontaValor;
        DM.cdsPessoasdsdocumento.AsString := MontaValor;
        DM.cdsPessoasdtregistro.AsDateTime := Now;

        DM.cdsEnderecos.Insert;
        DM.cdsEnderecosdscep.AsString := MontaValor;
        DM.cdsEnderecosnmlogradouro.AsString := MontaValor;
        DM.cdsEnderecosdscomplemento.AsString := MontaValor;
        DM.cdsEnderecosnmbairro.AsString := MontaValor;
        DM.cdsEnderecosnmcidade.AsString := MontaValor;
        DM.cdsEnderecosdsuf.AsString := MontaValor;

        DM.cdsPessoas.Post;
      end;

      Contador := Contador + 1;
    end;

  finally
    CloseFile(ArquivoCSV);
  end;
  ShowMessage('Arquivo importado com sucesso!');
end;

procedure TfrmCadPessoa.btnImportarCSVClick(Sender: TObject);
var
  hThreadID :THandle;
  ThreadID :DWord;
begin

  opnDialogCSV.Execute();

  if (opnDialogCSV.FileName = '') then
    Abort;

  ImportaCSV(opnDialogCSV.FileName);
end;

procedure TfrmCadPessoa.btnNovoClick(Sender: TObject);
begin
  DM.cdsPessoas.Insert;
  PageControl1.ActivePage := tbsCadastro;
  dbcmbNatureza.SetFocus;
end;

procedure TfrmCadPessoa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadPessoa.dbcmbNaturezaKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TfrmCadPessoa.dbedtCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnConsultaCEP.Click;
end;

procedure TfrmCadPessoa.dbgrdDadosDblClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbsCadastro;
end;

procedure TfrmCadPessoa.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if (Button = nbInsert) then
    dbedtCEP.SetFocus;
end;

procedure TfrmCadPessoa.dtsMasterDataChange(Sender: TObject; Field: TField);
begin
  if not (DM.cdsPessoas.State in [dsEdit, dsInsert]) then
  begin
    if (DM.cdsPessoasidpessoa.AsString <> '') then
    begin
      DM.cdsEnderecos.Close;
      DM.cdsEnderecos.ParamByName('idpessoa').AsInteger :=
                                    DM.cdsPessoasidpessoa.AsInteger;
      DM.cdsEnderecos.Open;
    end;
  end;
end;

procedure TfrmCadPessoa.dtsMasterStateChange(Sender: TObject);
begin
  if (dtsMaster.DataSet.State in [dsEdit, dsInsert]) then
  begin
    btnNovo.Enabled := False;
    btnGravar.Enabled := True;
    btnExcluir.Enabled := False;
    btnCancelar.Enabled := True;
    btnEditar.Enabled := False;
  end
  else
  begin
    btnNovo.Enabled := True;
    btnGravar.Enabled := False;
    btnExcluir.Enabled := True;
    btnCancelar.Enabled := False;
    btnEditar.Enabled := True;
  end;
end;

procedure TfrmCadPessoa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if dtsMaster.DataSet.State in [dsInsert, dsEdit] then
    if MessageDlg('Existem altera��es pendentes! Deseja sair e cancelar as altera��es?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      dtsMaster.DataSet.Cancel
    else
      CanClose := False;
end;

procedure TfrmCadPessoa.FormShow(Sender: TObject);
begin
  DM.cdsPessoas.Open;
end;

end.
