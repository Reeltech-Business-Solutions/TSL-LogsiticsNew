pageextension 50054 PostedPurchaseInvoice extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("Order No.")
        {
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Requisition No."; Rec."Requisition No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the Requisition No. field.';
            }
        }
    }
    actions
    {
        addafter(Approvals)
        {
            group("Related Document")
            {
                action(RFQ)
                {
                    ApplicationArea = All;
                    RunObject = Page "RFQ Header";
                    RunPageLink = "No." = FIELD("RFQ No.");

                }
                action(Quote)
                {
                    ApplicationArea = All;
                    RunObject = Page "Purchase Quote Archive";
                    RunPageLink = "No." = FIELD("Quote No.");
                }
            }
        }
        addafter(AttachAsPDF)
        {
            action("Receipt Per Purhase Req")
            {
                ApplicationArea = All;
                RunObject = report "Receipts Per Purchase Requisit";
                Image = Receipt;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
            }
        }

    }
}
