page 80051 "Posted Issue Subform"
{
    PageType = ListPart;
    SourceTable = "Posted Store Issue Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Remaining Days"; Rec."Remaining Days")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                // field("TEMP GBPG"; "TEMP GBPG")
                // {
                //     ApplicationArea = All;
                // }
            }
        }
        // trigger OnAfterGetCurrRecord()

        // var
        //     JobLedgerEntries: Record "Job Ledger Entry";

        // begin
        //     JobLedgerEntries.Reset();
        //     JobLedgerEntries.setRange("Document No.", Rec."Document No.");
        //     JobLedgerEntries.setRange("No.", Rec."Item No.");

        //     if JobLedgerEntries.findset() then
        //         repeat
        //             Rec."Remaining Days" := JobLedgerEntries."Warranty End Date" - Today();
        //         until JobLedgerEntries.Next() = 0;


        // end;
    }



    trigger OnAfterGetRecord()

    var
        JobLedgerEntries: Record "Job Ledger Entry";

    begin
        JobLedgerEntries.Reset();
        JobLedgerEntries.setRange("Document No.", Rec."Document No.");
        // JobLedgerEntries.setRange("No.", Rec."Item No.");

        if JobLedgerEntries.findset() then
            repeat
                if JobLedgerEntries."No." = Rec."Item No." then
                    if JobLedgerEntries."Warranty End Date" <> 0D then begin
                        // Rec."Remaining Days" := 0;
                        Rec."Remaining Days" := JobLedgerEntries."Warranty End Date" - Today();
                        Rec.Modify();
                    end;
            until JobLedgerEntries.Next() = 0;


    end;


    // trigger OnAfterGetRecord()

    // var
    //     JobLedgerEntries: Record "Job Ledger Entry";

    // begin
    //     JobLedgerEntries.Reset();
    //     JobLedgerEntries.setRange("Document No.", Rec."Document No.");
    //     JobLedgerEntries.setRange("No.", Rec."Item No.");

    //     if JobLedgerEntries.findset() then
    //         repeat
    //             Rec."Remaining Days" := JobLedgerEntries."Warranty End Date" - Today();
    //         until JobLedgerEntries.Next() = 0;


    // end;
}

