pageextension 50044 "Job Ledger Entry Ext" extends "Job Ledger Entries Preview" //OriginalId
{
    layout
    {
        addafter("Gen. Bus. Posting Group")
        {
            field("Operation"; Rec."Operation") { ApplicationArea = All; }
            field("Requisition No."; Rec."Requisition No.") { ApplicationArea = All; }
            field("Service Item No."; Rec."Service Item No.") { ApplicationArea = All; }
            field("Qty. Requested"; Rec."Qty. Requested") { ApplicationArea = All; }
            field("Quantity Requested"; Rec."Quantity Requested") { ApplicationArea = All; }
            field("Customer Job Type"; Rec."Customer Job Type") { ApplicationArea = All; }

            field("Job Type Code"; Rec."Job Type Code") { ApplicationArea = All; }
            field("Responsibility Center"; Rec."Responsibility Center") { ApplicationArea = All; }
            field("Item Type"; Rec."Item Type") { ApplicationArea = All; }
            field("ItemTypeTemp"; Rec."ItemTypeTemp") { ApplicationArea = All; }
            field("SERVITEMTEMP"; Rec."SERVITEMTEMP") { ApplicationArea = All; }
            field("Customer No."; Rec."Customer No.") { ApplicationArea = All; }
            field("Posting Group"; Rec."Posting Group") { ApplicationArea = All; }
            field("Same part usage period"; Rec."Same part usage period") { ApplicationArea = All; }

        }
    }

    actions
    {
    }
}