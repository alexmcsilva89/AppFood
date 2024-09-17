unit AppFood.View.Components.Produto.Interfaces;

interface

uses
  System.SysUtils, FMX.Types, System.Classes;

type
  iComponentsProduto = interface
    ['{C707756C-129D-4556-9EE7-63A2F8E1B451}']
    function SetImagem(aResource: String): iComponentsProduto;
    function SetNome(aNome: String): iComponentsProduto;
    function SetValor(aValor: Currency): iComponentsProduto;
    function SetCodigo(aCodigo: Integer): iComponentsProduto;
    function SetOnClick(aValue: TNotifyEvent): iComponentsProduto;
    function Layout: TFMXObject;
  end;

implementation

end.
