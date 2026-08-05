pageextension 50038 "Service Legder Ext" extends "Service Ledger Entries"
{
    layout
    {
        addafter("Global Dimension 2 Code")
        {
            field("Item Cost value"; Rec."Item Cost value") { ApplicationArea = All; }
            field("Customer Posting Group"; Rec."Customer Posting Group") { ApplicationArea = All; }
            field("Bill-to Name"; Rec."Bill-to Name") { ApplicationArea = All; }
            field("Expense Job"; Rec."Expense Job") { ApplicationArea = All; }
            field("Item Type"; Rec."Item Type") { ApplicationArea = All; }
            field("KM Run"; Rec."KM Run") { ApplicationArea = All; }
        }

    }

    actions
    {
    }
}
