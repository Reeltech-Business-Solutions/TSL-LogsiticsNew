page 50264 RequisitionLines
{
    APIGroup = 'requisition';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'requisitionLines';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Purchase Line";
    SourceTableView = where("Document Type" = filter(Quote));
    ODataKeyFields = SystemId;
    InsertAllowed = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                   
                }
                field(no; Rec."No.")
                {

                }
                field(type;Rec.Type)
                {

                }
                field(description; Rec.Description)
                {
                    
                }
                field(department_code; Rec."Shortcut Dimension 1 Code")
                {
                   
                }
                field(trucks_code; Rec."Shortcut Dimension 3 Code")
                {
                    
                }
                field(trip_type_code; Rec."Shortcut Dimension 4 Code")
                {
                    
                }
                field(location_code; Rec."Location Code")
                {

                }
                field("header_id";Rec."Header Id")
                {
                    Caption = 'HeaderId';
                    ApplicationArea = All;
                }
                
            }
        }
    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
    PurchaseHeader: Record "Purchase Header";
    PurchaseLine: Record "Purchase Line";
    begin
        if IsDeepInsert then begin
            PurchaseHeader.GetBySystemId(Rec."Header Id");

            Rec."Document Type" := PurchaseHeader."Document Type";
            Rec."Document No." := PurchaseHeader."No.";

            PurchaseLine.Reset();
            PurchaseLine.SetRange("Document Type", Rec."Document Type");
            PurchaseLine.SetRange("Document No.", Rec."Document No.");
            if PurchaseLine.FindLast() then 
                Rec."Line No." := PurchaseLine."Line No." + 10000
                
            else 
                Rec."Line No." := 10000;

        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        PurchaseHeader: Record "Purchase Header";
        Item: Record Item;
    begin
        IsDeepInsert := IsNullGuid(Rec."Header Id");
        if not IsDeepInsert then begin
            PurchaseHeader.GetBySystemId(Rec."Header Id");
            Rec."Document Type" := PurchaseHeader."Document Type";
            Rec."Document No." := PurchaseHeader."No.";
    
        end;
    end;

}
