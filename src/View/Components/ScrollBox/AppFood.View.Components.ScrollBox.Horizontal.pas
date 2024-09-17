unit AppFood.View.Components.ScrollBox.Horizontal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Objects, FMX.Layouts, AppFood.View.Components.ScrollBox.Interfaces;

type
  TViewComponentsScrollBoxHorizontal = class(TForm, iScrollBox)
    lyPrincipal: TLayout;
    HorzScrollBox: THorzScrollBox;
    flyItens: TFlowLayout;
  private
    procedure RedimensionarLarguraLayout;
  public
    constructor Create(AOwner: TComponent); override;
    function AddObject(AValue: TFMXObject): iScrollBox;
    function Layout: TFmxObject;
    function ApagarItens: iScrollBox;
    function RedimensionarLayout: iScrollBox;
  end;

implementation

{$R *.fmx}

function TViewComponentsScrollBoxHorizontal.AddObject(AValue: TFMXObject): iScrollBox;
begin
  Result := Self;

  flyItens.AddObject(AValue);

  RedimensionarLarguraLayout;
end;

function TViewComponentsScrollBoxHorizontal.ApagarItens: iScrollBox;
begin
  for var I := flyItens.ControlsCount - 1 downto 0 do
    flyItens.Controls[I].Free;
end;

constructor TViewComponentsScrollBoxHorizontal.Create(AOwner: TComponent);
begin
  inherited;
  flyItens.Align := TAlignLayout.Left;
end;

function TViewComponentsScrollBoxHorizontal.Layout: TFmxObject;
begin
  Result := lyPrincipal;
end;

procedure TViewComponentsScrollBoxHorizontal.RedimensionarLarguraLayout;
var
  LLargura : Double;
begin
  LLargura := flyItens.Controls[Pred(flyItens.ControlsCount)].Width +
              flyItens.Controls[Pred(flyItens.ControlsCount)].Margins.Left +
              flyItens.Controls[Pred(flyItens.ControlsCount)].Margins.Right;

  if flyItens.ControlsCount = 1 then
  begin
    flyItens.Width := LLargura;
    Exit;
  end;

  flyItens.Width := flyItens.Width + LLargura;
end;

function TViewComponentsScrollBoxHorizontal.RedimensionarLayout: iScrollBox;
begin
  Result := Self;

  RedimensionarLarguraLayout;
end;

end.
