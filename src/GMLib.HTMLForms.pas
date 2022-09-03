unit GMLib.HTMLForms;

interface

uses
  System.Generics.Collections, REST.Json.Types,

  Pkg.Json.DTO, GMLib.Classes;

{$M+}

type
  TLlbResults = class
  private
    FLlbResultsBoolVal: string;
    FLlbResultsLat: string;
    FLlbResultsLng: string;
    FLlbResultsMapisnull: string;
    FLlbResultsNeLat: string;
    FLlbResultsNeLng: string;
    FLlbResultsSwLat: string;
    FLlbResultsSwLng: string;
  public
    property LlbResultsBoolVal: string read FLlbResultsBoolVal write FLlbResultsBoolVal;
    property LlbResultsLat: string read FLlbResultsLat write FLlbResultsLat;
    property LlbResultsLng: string read FLlbResultsLng write FLlbResultsLng;
    property LlbResultsMapisnull: string read FLlbResultsMapisnull write FLlbResultsMapisnull;
    property LlbResultsNeLat: string read FLlbResultsNeLat write FLlbResultsNeLat;
    property LlbResultsNeLng: string read FLlbResultsNeLng write FLlbResultsNeLng;
    property LlbResultsSwLat: string read FLlbResultsSwLat write FLlbResultsSwLat;
    property LlbResultsSwLng: string read FLlbResultsSwLng write FLlbResultsSwLng;
  end;
  
  TEventsMap = class
  private
    FEventsMapBoundsChange: string;
    FEventsMapCenterChange: string;
    FEventsMapClick: string;
    FEventsMapContextmenu: string;
    FEventsMapDblclick: string;
    FEventsMapDrag: string;
    FEventsMapDragEnd: string;
    FEventsMapDragStart: string;
    FEventsMapEventFired: string;
    FEventsMapLat: string;
    FEventsMapLng: string;
    FEventsMapMapTypeId: string;
    FEventsMapMapTypeId_changed: string;
    FEventsMapMouseMove: string;
    FEventsMapMouseOut: string;
    FEventsMapMouseOver: string;
    FEventsMapNeLat: string;
    FEventsMapNeLng: string;
    FEventsMapSwLat: string;
    FEventsMapSwLng: string;
    FEventsMapTilesLoaded: string;
    FEventsMapX: string;
    FEventsMapY: string;
    FEventsMapZoom: string;
    FEventsMapZoomChanged: string;
  public
    property EventsMapBoundsChange: string read FEventsMapBoundsChange write FEventsMapBoundsChange;
    property EventsMapCenterChange: string read FEventsMapCenterChange write FEventsMapCenterChange;
    property EventsMapClick: string read FEventsMapClick write FEventsMapClick;
    property EventsMapContextmenu: string read FEventsMapContextmenu write FEventsMapContextmenu;
    property EventsMapDblclick: string read FEventsMapDblclick write FEventsMapDblclick;
    property EventsMapDrag: string read FEventsMapDrag write FEventsMapDrag;
    property EventsMapDragEnd: string read FEventsMapDragEnd write FEventsMapDragEnd;
    property EventsMapDragStart: string read FEventsMapDragStart write FEventsMapDragStart;
    property EventsMapEventFired: string read FEventsMapEventFired write FEventsMapEventFired;
    property EventsMapLat: string read FEventsMapLat write FEventsMapLat;
    property EventsMapLng: string read FEventsMapLng write FEventsMapLng;
    property EventsMapMapTypeId: string read FEventsMapMapTypeId write FEventsMapMapTypeId;
    property EventsMapMapTypeId_changed: string read FEventsMapMapTypeId_changed write FEventsMapMapTypeId_changed;
    property EventsMapMouseMove: string read FEventsMapMouseMove write FEventsMapMouseMove;
    property EventsMapMouseOut: string read FEventsMapMouseOut write FEventsMapMouseOut;
    property EventsMapMouseOver: string read FEventsMapMouseOver write FEventsMapMouseOver;
    property EventsMapNeLat: string read FEventsMapNeLat write FEventsMapNeLat;
    property EventsMapNeLng: string read FEventsMapNeLng write FEventsMapNeLng;
    property EventsMapSwLat: string read FEventsMapSwLat write FEventsMapSwLat;
    property EventsMapSwLng: string read FEventsMapSwLng write FEventsMapSwLng;
    property EventsMapTilesLoaded: string read FEventsMapTilesLoaded write FEventsMapTilesLoaded;
    property EventsMapX: string read FEventsMapX write FEventsMapX;
    property EventsMapY: string read FEventsMapY write FEventsMapY;
    property EventsMapZoom: string read FEventsMapZoom write FEventsMapZoom;
    property EventsMapZoomChanged: string read FEventsMapZoomChanged write FEventsMapZoomChanged;
  end;
  
  THTMLForms = class(TJsonDTO)
  private
    FEventsMap: TEventsMap;
    FLlbResults: TLlbResults;
  public
    constructor Create; override;
    destructor Destroy; override;

    class function GetData(Intf: IGMExecJS): THTMLForms;
    class procedure IniData(Intf: IGMExecJS);

    property EventsMap: TEventsMap read FEventsMap;
    property LlbResults: TLlbResults read FLlbResults;
  end;
  
implementation

{ THTMLForms }

constructor THTMLForms.Create;
begin
  inherited;

  FEventsMap := TEventsMap.Create;
  FLlbResults := TLlbResults.Create;
end;

destructor THTMLForms.Destroy;
begin
  FEventsMap.Free;
  FLlbResults.Free;

  inherited;
end;

class function THTMLForms.GetData(Intf: IGMExecJS): THTMLForms;
begin
  Result := nil;
  if not Assigned(Intf) then
    Exit;

  Result := THTMLForms.Create;
  Result.AsJson := Intf.GetJsonFromHTMLForms;
end;

class procedure THTMLForms.IniData(Intf: IGMExecJS);
begin
  Intf.ExecuteJavaScript('iniEventsMapForm', '');
end;

end.