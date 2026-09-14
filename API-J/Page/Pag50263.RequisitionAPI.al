page 50263 "Requisition API"
{
    APIGroup = 'requisition';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'requisitionAPI';
    DelayedInsert = true;
    EntityName = 'requisition';
    EntitySetName = 'requisitions';
    PageType = API;
    SourceTable = "Purchase Header";
    SourceTableView = where("Document Type" = const(Quote), "Purchase Type" = filter("Local Requisition"));

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
                field(description; Rec.Description)
                {

                }
                field(purchase_type; Rec."Purchase Type")
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
                field(status; Rec.Status)
                {

                }
                part(lines; RequisitionLines)
                {

                    EntityName = 'line';
                    EntitySetName = 'lines';
                    //   SubPageLink = "No." = field("No.");
                    SubPageLink = "Header Id" = field(SystemId);
                }

            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Purchase Type" := Rec."Purchase Type"::"Local Requisition";
        Rec."Buy-from Vendor No." := 'INT0001';
        Rec."Pay-to Vendor No." := 'INT0001';
        Rec.status := Rec.Status::Open;
    end;
}
