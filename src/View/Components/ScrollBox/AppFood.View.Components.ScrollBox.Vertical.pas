unit AppFood.View.Components.ScrollBox.Vertical;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, AppFood.View.Components.ScrollBox.Interfaces;

type
  TViewComponentsScrollBoxVertical = class(TForm, iScrollBox)
    lyPrincipal: TLayout;
    VertScrollBox: TVertScrollBox;
    flyItens: TFlowLayout;
    procedure flyItensResize(Sender: TObject);
  public
    function AddObject(AValue: TFmxObject): iScrollBox;
    function Layout: TFMXObject;
    function ApagarItens: iScrollBox;
    function RedimensionarLayout: iScrollBox;
  end;

var
  ViewComponentsScrollBoxVertical: TViewComponentsScrollBoxVertical;

implementation

{$R *.fmx}

function TViewComponentsScrollBoxVertical.AddObject(AValue: TFmxObject): iScrollBox;
begin
  Result := Self;
  flyItens.AddObject(AValue);
end;

function TViewComponentsScrollBoxVertical.ApagarItens: iScrollBox;
begin
  for var I := flyItens.ControlsCount - 1 downto 0 do
    flyItens.Controls[I].Free;
end;

procedure TViewComponentsScrollBoxVertical.flyItensResize(Sender: TObject);
var
  LNovaAltura: Single;
  LControl: TControl;
begin
  LNovaAltura := 0;
  for var I := 0 to flyItens.ChildrenCount - 1 do
    if (flyItens.Children[I] is TControl) then
    begin
      LControl := flyItens.Children[I] as TControl;
      if LControl.Position.Y + LControl.Height + LControl.Margins.Bottom > LNovaAltura then
        LNovaAltura := LControl.Position.Y + LControl.Height + LControl.Margins.Bottom;
    end;
  flyItens.Height := LNovaAltura;
end;

function TViewComponentsScrollBoxVertical.Layout: TFMXObject;
begin
  Result := lyPrincipal;
end;

function TViewComponentsScrollBoxVertical.RedimensionarLayout: iScrollBox;
begin
  Result := Self;

  flyItensResize(flyItens);
end;

end.
