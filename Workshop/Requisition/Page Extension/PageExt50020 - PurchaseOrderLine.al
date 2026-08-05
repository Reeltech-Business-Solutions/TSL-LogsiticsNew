
pageextension 50020 PurchaseOrderLine extends "Purchase Order Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Expense No."; Rec."Expense No.")
            {
                Caption = 'Expense No.';
                //Visible = false;
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("Direct Unit Cost Buffer"; Rec."Direct Unit Cost Buffer")
            {
                Caption = 'Direct Unit Cost Buffer';
                Visible = false;
                ApplicationArea = All;
            }
        }
        addafter("Qty. to Assign")
        {
            field("PRF No."; Rec."PRF No.")
            {
                ApplicationArea = All;
            }
            field("RFQ No."; Rec."RFQ No.")
            {
                ApplicationArea = All;
            }
        }
        modify("Over-Receipt Code")
        {
            Visible = false;
            ApplicationArea = All;
        }
        addafter("Bin Code")
        {
            field("Gen. Prod. Posting Group56002"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group26106"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Direct Unit Cost")
        {
            field("VAT Prod. Posting Group1"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = all;
            }
        }
    }

    actions
    {
    }
}
