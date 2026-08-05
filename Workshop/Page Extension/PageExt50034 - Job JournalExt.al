pageextension 50034 "PageExt50034 - Job Journal" extends "Job Journal"
{
    layout
    {
        addafter(ShortcutDimCode4)
        {
            field("Requisition No."; Rec."Requisition No.") { ApplicationArea = All; }
            field("Job Type"; Rec."Job Type") { ApplicationArea = All; }
            field("Requested Qty"; Rec."Requested Qty") { ApplicationArea = All; }
            field("Service Item No."; Rec."Service Item No.") { ApplicationArea = All; }
            field("Service Item Line No."; Rec."Service Item Line No.") { ApplicationArea = All; }
            field("Shelf/Bin Code"; Rec."Shelf/Bin Code") { ApplicationArea = All; }
            field("Cage"; Rec."Cage") { ApplicationArea = All; }
            field("Customer Job Type"; Rec."Customer Job Type") { ApplicationArea = All; }
            field("Job Type Code"; Rec."Job Type Code") { ApplicationArea = All; }
            field("Responsibility Center"; Rec."Responsibility Center") { ApplicationArea = All; }
            field("Collector"; Rec."Collector") { ApplicationArea = All; }
            field("Department Store"; Rec."Department Store") { ApplicationArea = All; }
            field("Control No."; Rec."Control No.") { ApplicationArea = All; }
            field("Prod. Group"; Rec."Prod. Group") { ApplicationArea = All; }
            field("Clock Type"; Rec."Clock Type") { ApplicationArea = All; }
            field("Fixed Assets No."; Rec."Fixed Assets No.") { ApplicationArea = All; }
            //  field("Maintenance Code"; Rec."Maintenance Code") { ApplicationArea = All; }
            field("Operation Code"; Rec."Operation Code") { ApplicationArea = All; }
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code") { ApplicationArea = All; }
            field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code") { ApplicationArea = All; }
            field("Item Type"; Rec."Item Type") { ApplicationArea = All; }



        }

    }

    actions
    {
    }
}
