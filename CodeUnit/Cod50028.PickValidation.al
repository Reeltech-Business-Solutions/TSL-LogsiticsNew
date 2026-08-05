codeunit 50028 PickValidation
{
procedure IsItemAlreadyPicked(var DocumentRec: Record "Inv. Voucher Line"): Boolean
  var
    LineRec: Record "Inv. Voucher Line";
  begin
    LineRec.SetRange("Document No.", DocumentRec."Document No.");
    LineRec.SetRange("Line No.", DocumentRec."Line No.");
    LineRec.SetRange("Item No.", DocumentRec."Item No.");
    LineRec.SetRange("Location Code", DocumentRec."Location Code");
    LineRec.SetFilter(LineRec."Location Code",'Yes'); // Assuming a field indicating item picked

    
    
    if LineRec.Count > 0 then
    Error(' Item already picked on the line with the same location');
      exit(false); // Item already picked on the line with the same location
    
    exit(false); // Item not yet picked on the line
  end;
    
}
