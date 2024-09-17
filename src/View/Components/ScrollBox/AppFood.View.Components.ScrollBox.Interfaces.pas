unit AppFood.View.Components.ScrollBox.Interfaces;

interface

uses
  FMX.Types;

type
  iScrollBox = interface
    ['{A1D66D25-D133-491D-8CA8-C6C0B816318B}']
    function AddObject(AValue: TFMXObject): iScrollBox;
    function Layout: TFMXObject;
    function ApagarItens: iScrollBox;
    function RedimensionarLayout: iScrollBox;
  end;

implementation

end.
