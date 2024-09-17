unit AppFood.View.Pages.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  AppFood.View.Styles, AppFood.View.Components.Categoria.Observer,
  AppFood.View.Components.Categoria, AppFood.View.Components.Categoria.Interfaces,
  AppFood.View.Components.ScrollBox.Interfaces, AppFood.View.Components.ScrollBox.Horizontal,
  AppFood.View.Components.Produto, AppFood.View.Components.ScrollBox.Vertical,
  AppFood.View.Components.Categoria.Enum;

type
  TViewPagesPrincipal = class(TForm)
    lyLabelCategorias: TLayout;
    lyLabelProdutos: TLayout;
    lyListaCategorias: TLayout;
    lyListaProdutos: TLayout;
    lblListaDe: TLabel;
    lblCategorias: TLabel;
    lyPrincipal: TLayout;
    lblEscolher: TLabel;
    lblProdutos: TLabel;
    recFundoPrincipal: TRectangle;
    procedure FormCreate(Sender: TObject);
  private
    FObserverCategoria: iSubject;
    FScrollBoxVertical: iScrollBox;
    procedure PreencherProdutos(const aCategoria: TCategoriaEnum; const aNomeProduto: TArray<String>; const aValorProduto: TArray<Currency>);
    procedure PreencherCategorias;
    procedure PreencherBurguer;
    procedure PreencherBebidas;
    procedure PreencherPizzas;
    procedure PreencherCafes;
  end;

var
  ViewPagesPrincipal: TViewPagesPrincipal;

implementation

{$R *.fmx}

procedure TViewPagesPrincipal.FormCreate(Sender: TObject);
begin
  recFundoPrincipal.Fill.Color := COR_FUNDO_TELA_PRINCIPAL;

  FObserverCategoria := TViewComponentsCategoriaObserver.New;
  FScrollBoxVertical := TViewComponentsScrollBoxVertical.Create(Self);

  PreencherCategorias;
end;

procedure TViewPagesPrincipal.PreencherBebidas;
const
  LNomeBebidas: TArray<String> = ['Refrigerante 1,5L', 'Guaraná Antarctica 1,5L', 'Refrigerante 2L',
                                  'Refrigerante Lata 350ml', 'Suco Del Valle',
                                  'Cervejas', 'Água Sem Gas 510 ML Acquissima',
                                  'Água Com Gas 510 ML Acquissima'];
  LValorBebidas: TArray<Currency> = [10.90, 10.90, 12.90, 7.90, 9.90, 9.90, 6.90, 6.90];
begin
  PreencherProdutos(catBebidas, LNomeBebidas, LValorBebidas);
end;

procedure TViewPagesPrincipal.PreencherBurguer;
const
  LNomeBurguers: TArray<String> = ['Magic Futuro', 'Magic Futuro Vegano', 'Magic Mushroom Vegano',
                                    'Rockslide', 'Crooked Grind', 'Classic', 'Salad Grind', 'Backflip',
                                    'Ollie', 'Drop Burguer', 'Bigodon'];
  LValorBurguers: TArray<Currency> = [30.00, 30.00, 32.00, 28.00, 37.00, 33.00, 31.00, 31.00, 24.00,
                                       33.00, 30.00];
begin
  PreencherProdutos(catBurguers, LNomeBurguers, LValorBurguers);
end;

procedure TViewPagesPrincipal.PreencherCafes;
const
  LNomeCafes: TArray<String> = ['Expresso 40 ml', 'Ristretto 20 ml', 'Doppio 80 ml', 'Naked 80 ml',
                                'Filtrado Hario V60', 'Aeropress 180 ml', 'Macchiato 60 ml',
                                'Capuccino 160 ml', 'Latte 200 ml', 'Moka 200 ml', 'Ice Naked'];
  LValorCafes: Tarray<Currency> = [8.00, 8.00, 13.50, 16.00, 13.00, 17.00, 11.00, 14.50, 15.50,
                                   18.00, 17.60];
begin
  PreencherProdutos(catCafes, LNomeCafes, LValorCafes);
end;

procedure TViewPagesPrincipal.PreencherPizzas;
const
  LNomePizzas: TArray<String> = ['Muçarela', 'Marguerita tradicional', 'Calabresa',
                                 'Frango c/ Catupiry', 'Napolitana',
                                 'Alho', 'Espanhola',  'Havaiana', 'Palmito',
                                 'Bolonhesa', 'Frango c/ Catupiry Molho'];
  LValorPizzas: TArray<Currency> = [79.00, 79.00, 79.00, 79.00, 79.00, 79.00, 79.00, 79.00, 79.00,
                                    79.00, 79.00];
begin
  PreencherProdutos(catPizzas, LNomePizzas, LValorPizzas);
end;

procedure TViewPagesPrincipal.PreencherCategorias;
begin
  lyListaCategorias.AddObject(
                  TViewComponentsScrollBoxHorizontal.Create(Self)
                            .AddObject(
                                          TViewComponentsCategoria.Create(Self)
                                                                  .SetImagem('categoria_burguer')
                                                                  .SetTitulo('Burguers')
                                                                  .SetCodigo(1)
                                                                  .AtivarFillRGBEffectAoSelecionar
                                                                  .SetObserver(FObserverCategoria)
                                                                  .SetOnClick(procedure (Sender: TObject)
                                                                              begin
                                                                                PreencherBurguer;
                                                                              end)
                                                                  .Layout)
                            .AddObject(
                                          TViewComponentsCategoria.Create(Self)
                                                                  .SetImagem('categoria_bebida')
                                                                  .SetTitulo('Bebidas')
                                                                  .SetCodigo(2)
                                                                  .AtivarFillRGBEffectAoSelecionar
                                                                  .SetObserver(FObserverCategoria)
                                                                  .SetOnClick(procedure (Sender: TObject)
                                                                              begin
                                                                                PreencherBebidas;
                                                                              end)
                                                                  .Layout)
                           .AddObject(
                                          TViewComponentsCategoria.Create(Self)
                                                                  .SetImagem('categoria_pizza')
                                                                  .SetTitulo('Pizzas')
                                                                  .SetCodigo(3)
                                                                  .AtivarFillRGBEffectAoSelecionar
                                                                  .SetObserver(FObserverCategoria)
                                                                  .SetOnClick(procedure (Sender: TObject)
                                                                              begin
                                                                                PreencherPizzas;
                                                                              end)
                                                                  .Layout)
                            .AddObject(
                                          TViewComponentsCategoria.Create(Self)
                                                                  .SetImagem('categoria_coffee')
                                                                  .SetTitulo('Cafés')
                                                                  .SetCodigo(4)
                                                                  .AtivarFillRGBEffectAoSelecionar
                                                                  .SetObserver(FObserverCategoria)
                                                                  .SetOnClick(procedure (Sender: TObject)
                                                                              begin
                                                                                PreencherCafes;
                                                                              end)
                                                                  .Layout)
                   .Layout);
end;

procedure TViewPagesPrincipal.PreencherProdutos(const aCategoria: TCategoriaEnum; const aNomeProduto: TArray<String>; const aValorProduto: TArray<Currency>);
begin
  if TCategoriaEnum(FScrollBoxVertical.Layout.Tag) = aCategoria then
    Exit;


  TThread.CreateAnonymousThread(procedure
  begin
    TThread.Synchronize(TThread.CurrentThread, procedure
    begin
      lyListaProdutos.RemoveObject(FScrollBoxVertical.Layout);
      FScrollBoxVertical.ApagarItens;

      for var I := 0 to High(aNomeProduto) do
          FScrollBoxVertical.AddObject(
                               TViewComponentsProduto.Create(Self)
                                                     .SetCodigo(I+1)
                                                     .SetImagem(aCategoria.PegarNomeRecursoImagem+'_'+FormatFloat('##00', I+1))
                                                     .SetNome(aNomeProduto[I])
                                                     .SetValor(aValorProduto[I])
                                                     .Layout);


       FScrollBoxVertical.RedimensionarLayout;
       lyListaProdutos.AddObject(FScrollBoxVertical.Layout);

       FScrollBoxVertical.Layout.Tag := aCategoria.PegarFormatoInteger;
    end);
  end).Start;

end;

end.
