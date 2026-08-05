pageextension 50141 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to")
        {
            field("OEM Code"; Rec."OEM Code")
            {
                ApplicationArea = All;
            }

            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field(LPO; Rec.LPO)
            {
                ApplicationArea = All;
            }
            field("Contract Id"; Rec."Contract Id")
            {
                ApplicationArea = All;

            }
            field("Asset No."; Rec."Asset No.")
            {
                ApplicationArea = All;
            }
            field("Service Vehicle"; Rec."Service Vehicle")
            {
                ApplicationArea = All;
            }
            field(Trailer; Rec.Trailer)
            {
                ApplicationArea = All;
            }
            field("Trailer No."; Rec."Trailer No.")
            {
                ApplicationArea = All;
            }
        }

    }
}
