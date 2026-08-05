pageextension 50061 GenJournalExt extends "General Journal"
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
            field("Job Quantity"; Rec."Job Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
