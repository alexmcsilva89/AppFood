unit AppFood.View.Components.Categoria.Enum;

interface

type
   TCategoriaEnum = (catBurguers = 1, catBebidas = 2, catPizzas = 3, catCafes = 4);

   TCategoriaEnumHelper = record helper for TCategoriaEnum
    function PegarFormatoInteger: Integer;
    function PegarNomeRecursoImagem: string;
   end;

implementation

{ TCategoriaEnumHelper }

function TCategoriaEnumHelper.PegarFormatoInteger: Integer;
begin
  Result := Ord(Self);
end;

function TCategoriaEnumHelper.PegarNomeRecursoImagem: string;
begin
  case Self of
    catBurguers: Result := 'burguer';
    catBebidas: Result := 'bebida';
    catPizzas: Result := 'pizza';
    catCafes: Result := 'cafe';
  end;
end;

end.
