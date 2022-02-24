{
  @abstract(Exceptions and messages translations from GMLib.)
  @author(Xavier Martinez (cadetill) <cadetill@gmail.com>)
  @created(Septembre 30, 2015)
  @lastmod(Septembre 30, 2015)

  The GMTranslations contains all translations for the exceptions raised by GMLib.
}
unit GMTranslations;

{$I ..\gmlib.inc}

interface

uses
  GMSets;

const
  // @exclude
  MaxArray = 10;
  // Array with exception messages in Spanish language.
  // @exclude
  Lang_ES: array[0..MaxArray] of string = (
      '�ndice fuera de rango.',
      '%d no es un n�mero v�lido.',
      'Propietatio no asignado.',
      'El objeto (o su propietario) no suportan llamadas JavaScript.',
      'Error ejecutando la funci�n JavaScript %s.'#13#13'Mensaje de error: %s',
      'Objeto %s no asignado.',
      'El mapa est� activo. Debe desactivarlo antes de cambiar esta propiedad.',
      'El navegador no es del tipo esperado.',
      'No se ha podido cargar el recurso del mapa.',
      'Tiempo de espera excedido.',
      'El mapa no est� activo.'
  );

  // Array with exception messages in English language.
  // @exclude
  Lang_EN: array[0..MaxArray] of string = (
      'Index out of range.',
      '%d is not a valid real value.',
      'Owner not assigned.',
      'The object (or its owner) does not support JavaScript calls.',
      'An error occurs executing %s JavaScript function.'#13#13'Error message: %s',
      'Unassigned %s object.',
      'The map is active. To change this property you must to deactivate it first.',
      'The browser is not of the desired type.',
      'Can''t load map resource.',
      'A timeout occurred.',
      'Map is not active.'
  );

  // Array with exception messages in French language.
  // @exclude
  Lang_FR: array[0..MaxArray] of string = (
      'Indice hors limites.',
      '%d n''est pas un numero valide.',
      'Sans propri�taire.',
      'L''objet (ou son propri�taire) ne supporte pas appels JavaScript.',
      'Une erreur est survenue a l''ex�cution de la fonction javascript %s.'#13#13'Message d''erreur: %s',
      'Objet %s non initialis�.',
      'La carte est active. Tu dois le d�sactiver avant de changer cette propri�t�.',
      'Le navigateur n''est pas du type d�sir�.',
      'Impossible de charger la ressource de la carte.',
      'Un d�lai d''attente est produite.',
      'La carte n''est pas active.'
  );

  { -------------------------------------------------------------------------- }
  // @include(..\Help\docs\GMTranslations.GetTranslateText_1.txt)
  function GetTranslateText(Text: string; const Args: array of const; Lang: TGMLang): string; overload;

  { -------------------------------------------------------------------------- }
  // @include(..\Help\docs\GMTranslations.GetTranslateText_2.txt)
  function GetTranslateText(Idx: Integer; const Args: array of const; Lang: TGMLang): string; overload;

implementation

uses
  {$IFDEF DELPHIXE2}
  System.SysUtils;
  {$ELSE}
  SysUtils;
  {$ENDIF}

function GetTranslateText(Text: string; const Args: array of const;
  Lang: TGMLang): string;
var
  Idx: Integer;
begin
  Result := '';

  for Idx := 0 to MaxArray do
    if SameText(Text, Lang_EN[Idx]) then
    begin
      Result := GetTranslateText(Idx, Args, Lang);
      Break;
    end;

  if Result = '' then
    Result := GetTranslateText(0, Args, Lang);
end;

function GetTranslateText(Idx: Integer; const Args: array of const;
  Lang: TGMLang): string;
begin
  if Idx > MaxArray then Idx := 0;

  case Lang of
    lnEspanol: Result := Lang_ES[Idx];
    lnFrench: Result := Lang_FR[Idx];
    else Result := Lang_EN[Idx];
  end;

  Result := Format(Result, Args);
end;

end.
