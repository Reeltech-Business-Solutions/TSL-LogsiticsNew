pageextension 50018 JobsSetupExt extends "Jobs Setup"
{
    layout
    {
        addafter("Job WIP Nos.")
        {
            field("Registaration ID"; Rec."Registaration ID")
            {
                ApplicationArea = All;
            }
            field("ECP No."; Rec."ECP No.")
            {
                ApplicationArea = All;
            }
            field("Quality Check No."; Rec."Quality Check No.")
            {
                ApplicationArea = All;
            }

        }
    }
}
