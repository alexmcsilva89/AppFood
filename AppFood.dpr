program AppFood;



{$R *.dres}

uses
  System.StartUpCopy,
  FMX.Forms,
  AppFood.View.Pages.Principal in 'src\View\Pages\AppFood.View.Pages.Principal.pas' {ViewPagesPrincipal},
  AppFood.View.Components.ScrollBox.Horizontal in 'src\View\Components\ScrollBox\AppFood.View.Components.ScrollBox.Horizontal.pas' {ViewComponentsScrollBoxHorizontal},
  AppFood.View.Components.Categoria in 'src\View\Components\Categorias\AppFood.View.Components.Categoria.pas' {ViewComponentsCategoria},
  AppFood.View.Components.Produto in 'src\View\Components\Produtos\AppFood.View.Components.Produto.pas' {ViewComponentsProduto},
  AppFood.View.Styles in 'src\View\Styles\AppFood.View.Styles.pas',
  AppFood.View.Services.Utils in 'src\View\Services\AppFood.View.Services.Utils.pas',
  AppFood.View.Components.Categoria.Interfaces in 'src\View\Components\Categorias\AppFood.View.Components.Categoria.Interfaces.pas',
  AppFood.View.Components.Categoria.Observer in 'src\View\Components\Categorias\AppFood.View.Components.Categoria.Observer.pas',
  AppFood.View.Components.Categoria.Styles in 'src\View\Components\Categorias\AppFood.View.Components.Categoria.Styles.pas',
  AppFood.View.Components.ScrollBox.Interfaces in 'src\View\Components\ScrollBox\AppFood.View.Components.ScrollBox.Interfaces.pas',
  AppFood.View.Components.ScrollBox.Vertical in 'src\View\Components\ScrollBox\AppFood.View.Components.ScrollBox.Vertical.pas' {ViewComponentsScrollBoxVertical},
  AppFood.View.Components.Produto.Interfaces in 'src\View\Components\Produtos\AppFood.View.Components.Produto.Interfaces.pas',
  AppFood.View.Components.Produto.Styles in 'src\View\Components\Produtos\AppFood.View.Components.Produto.Styles.pas',
  AppFood.View.Components.Categoria.Enum in 'src\View\Components\Categorias\AppFood.View.Components.Categoria.Enum.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewPagesPrincipal, ViewPagesPrincipal);
  Application.CreateForm(TViewComponentsScrollBoxVertical, ViewComponentsScrollBoxVertical);
  Application.Run;

  ReportMemoryLeaksOnShutdown := True;
end.
