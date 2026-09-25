page 50280 StoreIssueLines
{
    APIGroup = 'store';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'storeIssueLines';
    DelayedInsert = true;
    EntityName = 'line';
    EntitySetName = 'lines';
    PageType = API;
    SourceTable = "Inv. Voucher Line";
    ODataKeyFields = SystemId;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {

                }
                field("ItemNo"; Rec."Item No.")
                {

                }
                field(description; Rec.Description)
                {

                }
                field("IssuingStore"; Rec."Location Code")
                {

                }
                field(quantity; Rec.Quantity)
                {

                }
                field("UOM"; Rec."Unit of Measure Code")
                {

                }
                field("CostCentre"; Rec."Cost centre code")
                {

                }
                field("QTYinStore"; Rec."Quantity in Location")
                {

                }
                field("QtyRequested"; Rec."Qty Requested")
                {

                }
                field("UnitCost"; Rec."Unit Cost")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
            }
        }


    }
    var
        IsDeepInsert: Boolean;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        InvHeader: Record "Inv.Voucher Header";
        InvLine: Record "Inv. Voucher Line";

    begin
        if IsDeepInsert then begin
            InvHeader.GetBySystemId(Rec."Header ID");
            Rec."Voucher Type" := InvHeader."Voucher Type";
            Rec."Document No." := InvHeader."Document No.";

            InvLine.SetRange("Voucher Type", Rec."Voucher Type");
            InvLine.SetRange("Document No.", Rec."Document No.");
            if InvLine.FindLast() then
                Rec."Line No." := InvLine."Line No." + 10000

            else
                Rec."Line No." := 10000
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        InvHeader: Record "Inv.Voucher Header";

    begin
        IsDeepInsert := IsNullGuid(rec."Header ID");
        if not IsDeepInsert then begin
            InvHeader.GetBySystemId(Rec."Header ID");
            Rec."Document No." := InvHeader."Document No.";
        end;
    end;
}
