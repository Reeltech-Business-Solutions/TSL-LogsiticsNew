pageextension 50052 PostedPurchaseRcptSubform extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter("Quantity Invoiced")
        {
            field("Requisition No."; Rec."PRF No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Requisition No.. field.';
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the RFQ No. field.';
            }
            field("Expense No."; Rec."Expense No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Expense No. field.';
            }
        }
    }
}
