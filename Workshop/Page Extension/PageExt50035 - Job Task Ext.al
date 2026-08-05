pageextension 50035 "Job Task Ext" extends "Job Task Card"
{
    layout
    {
        addafter(General)
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code") { ApplicationArea = All; }
            field("Customer Job Type"; Rec."Customer Job Type") { ApplicationArea = All; }
            field("Job Type Code"; Rec."Job Type Code") { ApplicationArea = All; }


        }
    }

    actions
    {
    }
}

