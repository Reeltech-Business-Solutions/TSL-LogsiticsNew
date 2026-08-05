pageextension 50027 "Service Item Lists" extends "Service Item List"
{
    Caption = 'Asset';
    AdditionalSearchTerms = 'Asset';

    layout
    {
        addbefore(Description)
        {
            field("Flee Veht No."; Rec."Flee Veht No.")
            {
                Caption = 'Asset No';
                ApplicationArea = All;
            }

        }
        modify("Item Description")
        {
            Visible = false;
        }
        modify("Item No.")
        {
            Visible = false;
        }

    }
}

