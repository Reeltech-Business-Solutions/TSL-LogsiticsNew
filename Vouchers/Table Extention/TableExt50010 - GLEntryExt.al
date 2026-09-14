tableextension 50010 GLEntryExt extends "G/L Entry"
{
    fields
    {
        field(50004; "Payment Request No."; Code[20])
        {

        }
        field(70013; "Loan ID"; Code[20]) { }
        field(70014; "Acct. No."; Code[20]) { }
        field(50308; "OEM Code"; Code[20])
        {
            TableRelation = Vendor;
        }
        field(50309; "LPO"; Text[50])
        {

        }

    }

}


pageextension 50002 GLEntryExt extends "General Ledger Entries"
{
    layout
    {
        addafter("G/L Account No.")
        {
            field("Loan ID"; Rec."Loan ID") { ApplicationArea = All; }
            field("Acct. No."; Rec."Acct. No.") { ApplicationArea = All; }
            field("Job No.1"; Rec."Job No.") { ApplicationArea = All; }
            field("Source_No."; Rec."Source No.") { ApplicationArea = All; }
            field("Source_Type"; Rec."Source Type") { ApplicationArea = All; }
        }

    }

    // Add changes to page layout here
}


