unit AppFood.View.Components.Produto;

interface

uses
  System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  AppFood.View.Components.Produto.Interfaces, AppFood.View.Services.Utils,
  AppFood.View.Components.Produto.Styles;

type
  TViewComponentsProduto = class(TForm, iComponentsProduto)
    lyPrincipal: TLayout;
    recFundo: TRectangle;
    lyImagemProduto: TLayout;
    recImagemProduto: TRectangle;
    lyInformacoesProduto: TLayout;
    lblNomeProduto: TLabel;
    lblValor: TLabel;
    btnProduto: TSpeedButton;
  private
    procedure PreencherCorProdutoPadrao;
    procedure PrepararRecImagemProduto;
  public
    constructor Create(AOwner: TComponent); override;
    function SetImagem(aResource: string): iComponentsProduto;
    function SetNome(aNome: string): iComponentsProduto;
    function SetValor(aValor: Currency): iComponentsProduto;
    function SetCodigo(aCodigo: Integer): iComponentsProduto;
    function SetOnClick(aValue: TNotifyEvent): iComponentsProduto;
    function Layout: TFMXObject;
  end;

implementation

uses
  System.SysUtils;

{$R *.fmx}

constructor TViewComponentsProduto.Create(AOwner: TComponent);
begin
  inherited;
  PrepararRecImagemProduto;
  PreencherCorProdutoPadrao;
end;

function TViewComponentsProduto.Layout: TFMXObject;
begin
  Result := lyPrincipal;
end;

procedure TViewComponentsProduto.PreencherCorProdutoPadrao;
begin
  recFundo.Fill.Color := COR_FUNDO_PADRAO_PRODUTO;
  lblNomeProduto.TextSettings.FontColor := COR_LABEL_PADRAO_PRODUTO_NOME;
  lblValor.TextSettings.FontColor := COR_LABEL_PADRAO_PRODUTO_VALOR;
end;

procedure TViewComponentsProduto.PrepararRecImagemProduto;
begin
  recImagemProduto.Fill.Kind := TBrushKind.Bitmap;
  recImagemProduto.Fill.Bitmap.WrapMode := TWrapMode.TileStretch;
end;

function TViewComponentsProduto.SetCodigo(aCodigo: Integer): iComponentsProduto;
begin
  Result := Self;

  lyPrincipal.Tag := aCodigo;
end;

function TViewComponentsProduto.SetImagem(aResource: string): iComponentsProduto;
begin
  Result := Self;

  TServiceUtils.ResourceImage(aResource, recImagemProduto);
end;

function TViewComponentsProduto.SetOnClick(aValue: TNotifyEvent): iComponentsProduto;
begin
  Result := Self;

  btnProduto.OnClick := aValue;
end;

function TViewComponentsProduto.SetValor(aValor: Currency): iComponentsProduto;
begin
  Result := Self;

  lblValor.Text := 'R$ '+FormatFloat('#0.00', aValor);
end;

function TViewComponentsProduto.SetNome(aNome: string): iComponentsProduto;
begin
  Result := Self;

  lblNomeProduto.Text := aNome;
end;

end.

