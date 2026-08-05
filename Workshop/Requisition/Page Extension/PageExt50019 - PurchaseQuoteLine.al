Pageextension 50019 PurchaseQuoteLine extends "Purchase Quote Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Expense No."; Rec."Expense No.")
            {
                Caption = 'Expense No.';
                //visible = false;
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("Direct Unit Cost Buffer"; Rec."Direct Unit Cost Buffer")
            {
                Caption = 'Direct Unit Cost Buffer';
                visible = false;
                ApplicationArea = All;
            }
        }
        addafter("Qty. to Assign")
        {
            field("PRF No."; Rec."PRF No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
    actions
    {
    }
}
