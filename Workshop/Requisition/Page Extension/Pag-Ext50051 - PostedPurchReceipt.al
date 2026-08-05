pageextension 50051 PostedPurchReceipt extends "Posted Purchase Receipt"
{
    Caption = 'Goods Received Note';

    layout
    {
        addafter("Order No.")
        {
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
                Editable = false;
                ToolTip = 'Specifies the value of the RFQ No. field.';
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
        addafter("&Receipt")
        {
            action("Receipt Per Purhase Req")
            {
                ApplicationArea = All;
                RunObject = report "Receipts Per Purchase Requisit";
                Image = Receipt;
            }
        }
    }


}
