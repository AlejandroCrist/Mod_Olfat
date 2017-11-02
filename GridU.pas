unit GridU;

interface

uses
    Controls
   ,ExtCtrls
   ;

type TGridPanel=class(ExtCtrls.TGridPanel)
   private
   public
     procedure AddControlAtCell(AControl:TControl;AColumn:Integer;ARow:Integer); // Añadimos un Control a una celda especifica, si ya existe Control en esa celda borramos este
 end;

implementation

uses
    SysUtils, Vcl.Dialogs
   ;

type
    THackControlItem=class(TControlItem); // Para tener acceso al procedure InternalSetLocation
    ECadenaVacia = class( Exception );
procedure TGridPanel.AddControlAtCell(AControl:TControl;AColumn:Integer;ARow:Integer);
var
    TheControlItem:TControlItem; // Para colocar en una celde especifica, ya que ExtCtrls.TControlCollection.AddControl tiene mutiples BUGs
    i: integer;
begin // Añadimos un Control a una celda especifica, si ya existe Control en esa celda borramos este
     if   (-1<AColumn)and(AColumn<ColumnCollection.Count)
       and
          (-1<ARow)and(ARow<RowCollection.Count)
     then begin // Miramos si ya existe Control en dicha celda
            for i := AColumn to (AColumn -1) do
            begin
               if   (Nil<>ControlCollection.ControlItems[i,ARow])
                 and
                    (Nil<>ControlCollection.ControlItems[i,ARow].Control)
               then begin // Al existir un Control en la celda, borramos el que ibamos a colocar
                         ControlCollection.Delete(ControlCollection.IndexOf(ControlCollection.ControlItems[AColumn,ARow].Control)); // Delete the control
                         AControl.Free;
                         raise ECadenaVacia.Create( 'Celda Ocupada.' );
                         exit;
                    end;
            end;
               TheControlItem:=ControlCollection.Add; // Creamos TControlItem
               TheControlItem.Control:=TControl(AControl); // Colocamos el Control en la celda especifica sin alterar otras celdas
               THackControlItem(ControlCollection.Items[ControlCollection.IndexOf(AControl)]).InternalSetLocation(AColumn,ARow,False,False);
          end
     else begin // Celda fuera de rango
               raise Exception.CreateFmt('Celda [%d,%d] fuera de rango en ''%s''.',[AColumn,ARow,Name]);
          end;
end;
end.
