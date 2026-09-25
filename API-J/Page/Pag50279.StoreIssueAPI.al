page 50279 StoreIssueAPI
{
    APIGroup = 'store';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'storeIssueAPI';
    DelayedInsert = true;
    EntityName = 'store';
    EntitySetName = 'stores';
    PageType = API;
    SourceTable = "Inv.Voucher Header";
    ODataKeyFields = SystemId;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {

                }
                field(voucherType; Rec."Voucher Type")
                {

                }
                field("documentNo"; Rec."Document No.")
                {

                }
                field("postedDate"; Rec."Posted Date")
                {

                }
                field("CostCentre"; Rec."Cost Centre Code")
                {

                }
                field("RevenueCentre"; Rec."Revenue Centre Code")
                {

                }
                field(description; Rec.Description)
                {

                }

                field("issuingStore"; Rec."Location Code")
                {

                }
                field(Status; Rec.Status)
                {

                }
                field("responsibilityCenter"; Rec."Responsibility Center")
                {

                }
                field("IssuedTo"; Rec."Issued To")
                {

                }

                part(lines; storeIssueLines)
                {
                    EntityName = 'line';
                    EntitySetName = 'lines';
                    SubPageLink = "Header ID" = field(SystemId);
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Status := Rec.Status::Released;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Released;

    end;
}
