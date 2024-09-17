unit AppFood.View.Components.Categoria.Observer;

interface

uses
  AppFood.View.Components.Categoria.Interfaces,
  System.Generics.Collections;

type
  TViewComponentsCategoriaObserver = class(TInterfacedObject, iSubject)
  private
    FLista: TList<iObserver>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iSubject;
    function AddObserver(aValue: iObserver): iSubject;
    function RemoveObserver(aValue: iObserver): iSubject;
    function Notify(aValue: Integer): iSubject;
  end;

implementation

function TViewComponentsCategoriaObserver.AddObserver(aValue: iObserver): iSubject;
begin
  Result := Self;
  FLista.Add(aValue);
end;

constructor TViewComponentsCategoriaObserver.Create;
begin
  FLista := TList<iObserver>.Create;
end;

destructor TViewComponentsCategoriaObserver.Destroy;
begin
  FLista.Free;
  inherited;
end;

class function TViewComponentsCategoriaObserver.New: iSubject;
begin
  Result := Self.Create;
end;

function TViewComponentsCategoriaObserver.Notify(aValue: Integer): iSubject;
begin
  Result := Self;
  for var I : Integer := 0 to Pred(FLista.Count) do
    FLista.Items[I].Update(aValue)
end;

function TViewComponentsCategoriaObserver.RemoveObserver(aValue: iObserver): iSubject;
begin
  Result := Self;
  FLista.Remove(aValue);
end;

end.

