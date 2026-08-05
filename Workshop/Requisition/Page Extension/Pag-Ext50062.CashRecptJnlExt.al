pageextension 50062 CashRecptJnlExt extends "Cash Receipt Journal"
{
    layout
    {
        addafter(Description)
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
            }
            field("Currency Code1"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
