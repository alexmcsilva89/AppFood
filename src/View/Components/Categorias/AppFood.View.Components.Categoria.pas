unit AppFood.View.Components.Categoria;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  AppFood.View.Components.Categoria.Interfaces,
  AppFood.View.Components.Categoria.Styles, FMX.Effects, FMX.Filter.Effects,
  AppFood.View.Services.Utils;

type
  TViewComponentsCategoria = class(TForm, iComponentsCategoria, iObserver)
    lyPrincipal: TLayout;
    recCategoria: TRectangle;
    lyImagemCategoria: TLayout;
    lyLabelCategoria: TLayout;
    recImagemCategoria: TRectangle;
    imCategoria: TImage;
    lblCategoria: TLabel;
    btnCategoria: TSpeedButton;
    FillRGBEffect: TFillRGBEffect;
    procedure btnCategoriaClick(Sender: TObject);
  private
    [weak]
    FObserver: iSubject;
    FOnClick: TProc<TObject>;
    FHabilitaFillRGBEffect: Boolean;
    procedure PreencherCorCategoriaSelecionada(aCategoriaSelecionada: integer);
    procedure PreencherCorCategoriaPadrao;
  public
    constructor Create(AOwner: TComponent); override;
    function SetImagem(aResource: string): iComponentsCategoria;
    function SetTitulo(aTitulo: string): iComponentsCategoria;
    function SetCodigo(aCodigo: Integer): iComponentsCategoria;
    function SetObserver(aValue: iSubject): iComponentsCategoria;
    function SetOnClick(aValue: TProc<TObject>): iComponentsCategoria;
    function Layout: TFMXObject;
    function Update(aValue: Integer): iObserver;
    function AtivarFillRGBEffectAoSelecionar: iComponentsCategoria;
  end;

implementation



{$R *.fmx}

{ TViewComponentsCategoria }

function TViewComponentsCategoria.AtivarFillRGBEffectAoSelecionar: iComponentsCategoria;
begin
  Result := Self;

  FHabilitaFillRGBEffect := true;
end;

procedure TViewComponentsCategoria.btnCategoriaClick(Sender: TObject);
begin
  FObserver.Notify(lyPrincipal.Tag);

  if Assigned(FOnClick) then
    FOnClick(Sender);
end;

constructor TViewComponentsCategoria.Create(AOwner: TComponent);
begin
  inherited;
  FillRGBEffect.Enabled := True;
  PreencherCorCategoriaPadrao;
end;

function TViewComponentsCategoria.Layout: TFMXObject;
begin
  Result := lyPrincipal;
end;

procedure TViewComponentsCategoria.PreencherCorCategoriaPadrao;
begin
  FillRGBEffect.Color := COR_IMAGEM_PADRAO_CATEGORIA;
  lblCategoria.FontColor := COR_LABEL_PADRAO_CATEGORIA;
  recCategoria.Fill.Color := COR_FUNDO_PADRAO_CATEGORIA;
end;

procedure TViewComponentsCategoria.PreencherCorCategoriaSelecionada(aCategoriaSelecionada: integer);
begin
  FillRGBEffect.Enabled := False;
  PreencherCorCategoriaPadrao;

  if lyPrincipal.Tag <> aCategoriaSelecionada then
    Exit;


  FillRGBEffect.Enabled := FHabilitaFillRGBEffect;
  FillRGBEffect.Color := COR_FUNDO_SELECAO_CATEGORIA;
  recCategoria.Fill.Color := COR_FUNDO_SELECAO_CATEGORIA;
  lblCategoria.FontColor := COR_LABEL_SELECAO_CATEGORIA;
end;

function TViewComponentsCategoria.SetCodigo(aCodigo: Integer): iComponentsCategoria;
begin
  Result := Self;

  lyPrincipal.Tag := aCodigo;
end;

function TViewComponentsCategoria.SetImagem(aResource: string): iComponentsCategoria;
begin
  Result := Self;

  TServiceUtils.ResourceImage(aResource, imCategoria);
end;

function TViewComponentsCategoria.SetObserver(aValue: iSubject): iComponentsCategoria;
begin
  Result := Self;

  FObserver := aValue;

  if Assigned(FObserver) then
    FObserver.AddObserver(Self);
end;

function TViewComponentsCategoria.SetOnClick(aValue: TProc<TObject>): iComponentsCategoria;
begin
  Result := Self;

  FOnClick := aValue;
end;

function TViewComponentsCategoria.SetTitulo(aTitulo: string): iComponentsCategoria;
begin
  Result := Self;

  lblCategoria.Text := aTitulo;
end;

function TViewComponentsCategoria.Update(aValue: Integer): iObserver;
begin
  Result := Self;

  PreencherCorCategoriaSelecionada(aValue);
end;

end.

