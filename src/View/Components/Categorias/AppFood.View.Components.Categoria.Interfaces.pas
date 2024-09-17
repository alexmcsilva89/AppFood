unit AppFood.View.Components.Categoria.Interfaces;

interface

uses
  FMX.Types, System.SysUtils;

type
  iSubject = interface;
  iObserver = interface;

  iComponentsCategoria = interface
    ['{F18FB468-722D-4A29-8943-43C84646278A}']
    function SetImagem(aResource: String): iComponentsCategoria;
    function SetTitulo(aTitulo: String): iComponentsCategoria;
    function SetCodigo(aCodigo: Integer): iComponentsCategoria;
    function SetObserver(aValue: iSubject): iComponentsCategoria;
    function SetOnClick(aValue: TProc<TObject>): iComponentsCategoria;
    function Layout: TFMXObject;
    function AtivarFillRGBEffectAoSelecionar: iComponentsCategoria;
  end;

  iObserver = interface
    ['{161EB732-5581-4341-9C81-ED1BBBFE96F5}']
    function Update(aValue : Integer) : iObserver;
  end;

  iSubject = interface
    ['{240F633B-FCC8-4C08-B13A-B580845F4538}']
    function AddObserver(aValue : iObserver) : iSubject;
    function RemoveObserver(aValue : iObserver) : iSubject;
    function Notify(aValue : Integer) : iSubject;
  end;

implementation

end.
