unit AppFood.View.Services.Utils;

interface

uses
  FMX.Objects;

type
  TServiceUtils = class
    private
    public
      class procedure ResourceImage(aResource : String; aImage : TImage); overload;
      class procedure ResourceImage(aResource: String; aRecImage: TRectangle); overload;

  end;

implementation

uses
  System.Classes, System.Types;

{ TServiceUtils }

class procedure TServiceUtils.ResourceImage(aResource: String;
  aImage: TImage);
var
  LResource : TResourceStream;
begin
  LResource := TResourceStream.Create(HInstance, aResource, RT_RCDATA);
  try
    aImage.Bitmap.LoadFromStream(LResource);
  finally
    LResource.Free;
  end;
end;

class procedure TServiceUtils.ResourceImage(aResource: String;
  aRecImage: TRectangle);
var
  LResource : TResourceStream;
begin
  LResource := TResourceStream.Create(HInstance, aResource, RT_RCDATA);
  try
    aRecImage.Fill.Bitmap.Bitmap.LoadFromStream(LResource)
  finally
    LResource.Free;
  end;
end;

end.
