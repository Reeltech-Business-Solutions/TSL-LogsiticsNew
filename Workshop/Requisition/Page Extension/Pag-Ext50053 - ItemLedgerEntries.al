pageextension 50053 ItemLedgerEntries extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Truck No."; Rec."Truck No.")
            {
                ApplicationArea = All;
            }
            field("Driver No."; Rec."Driver No.")
            {
                ApplicationArea = All;
            }
            field("Contract Code"; Rec."Contract Code")
            {
                ApplicationArea = All;
            }
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
