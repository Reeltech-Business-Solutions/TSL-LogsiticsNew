pageextension 50024 ItemJournal extends "Item Journal"
{
    layout
    {
        addbefore("Location Code")
        {
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Job Task No."; Rec."Job Task No.")
            {
                ApplicationArea = All;
            }

        }
        addafter("Unit of Measure Code")
        {
            field("Truck No."; Rec."Truck No.")
            {
                ApplicationArea = All;
                NotBlank = true;
            }
            field("Driver No."; Rec."Driver No.")
            {
                ApplicationArea = All;
                NotBlank = true;
            }
            field("Driver Name"; Rec."Driver Name")
            {
                ApplicationArea = All;
            }
            field("Contract Code"; Rec."Contract Code")
            {
                ApplicationArea = All;
                NotBlank = true;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
            }
        }
    }
}