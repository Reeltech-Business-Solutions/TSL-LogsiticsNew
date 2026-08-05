codeunit 80007 "Work Shop Post"
{
    procedure UpdateMaterialReqLine(FieldRef: Integer; MaterialRequestHeader: Record "Material Request Header")
    var
        // MatReqLine: Record "Material Request Line";
        MatReqLine: Record "Material Request Line";
    begin
        /*  MatReqLine.LOCKTABLE;
         MatReqLine.SETRANGE("Document No.", MaterialRequestHeader."No.");
         IF MatReqLine.FIND('-') THEN BEGIN
             REPEAT
                 CASE FieldRef OF
                     MaterialRequestHeader.FIELDNO(MaterialRequestHeader."Request Date"):
                         BEGIN
                             MaterialRequestHeader.VALIDATE("Request Date", MaterialRequestHeader."Request Date");
                         END;
                     MaterialRequestHeader.FIELDNO(MaterialRequestHeader."Request Type"):
                         MatReqLine.VALIDATE("Request Type", MaterialRequestHeader."Request Type");

                     MaterialRequestHeader.FIELDNO(Status):
                         MaterialRequestHeader.VALIDATE(Status, MaterialRequestHeader.Status);
                     MaterialRequestHeader.FIELDNO(MatReqLine."Global Dimension 1 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 1 Code", "Global Dimension 1 Code");
                     FIELDNO("Global Dimension 2 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 2 Code", "Global Dimension 2 Code");
                     FIELDNO("Shortcut Dimension 3 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 3 Code", "Shortcut Dimension 3 Code");
                     FIELDNO("Shortcut Dimension 4 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 4 Code", "Shortcut Dimension 4 Code");
                     FIELDNO("Shortcut Dimension 5 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 5 Code", "Shortcut Dimension 5 Code");
                     FIELDNO("Shortcut Dimension 6 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 6 Code", "Shortcut Dimension 6 Code");
                     FIELDNO("Shortcut Dimension 7 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 7 Code", "Shortcut Dimension 7 Code");
                     FIELDNO("Shortcut Dimension 8 Code"):
                         MatReqLine.VALIDATE("Shortcut Dimension 8 Code", "Shortcut Dimension 8 Code");
                 END;
                 MatReqLine.MODIFY(TRUE);
             UNTIL MatReqLine.NEXT = 0;
         END; */
    end;
}