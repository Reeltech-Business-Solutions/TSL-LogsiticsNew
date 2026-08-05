pageextension 50055 "Job Ledg entries Ext" extends "Job Ledger Entries"
{
    layout
    {
        addafter("Job No.")
        {
            field("Service Item No."; Rec."Service Item No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Location Code")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = All;
            }
            field("Warranty Start Date"; Rec."Warranty Start Date")
            {
                ApplicationArea = All;
            }
            field("Warranty End Date"; Rec."Warranty End Date")
            {
                ApplicationArea = All;
            }
        }


    }

    actions
    {
        addbefore("Ent&ry")
        {
            action("Issue Entries")
            {
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                // PromotedIsBig = true;
                PromotedCategory = Process;
                RunObject = Report "Job Ledger Entry Report";

            }
        }
    }


}
