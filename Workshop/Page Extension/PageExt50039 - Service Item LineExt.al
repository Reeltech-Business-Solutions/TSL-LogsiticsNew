pageextension 50039 "Service Item LineExt" extends "Service Item Lines"
{
    layout
    {
        addafter("Contract No.")
        {
            field("Fault Description"; Rec."Fault Description")
            {
                ApplicationArea = All;
            }
            field("Hour"; Rec."Hour")
            {
                ApplicationArea = All;
            }
            field("User ID"; Rec."User ID")
            {
                ApplicationArea = All;
            }
        }
        addafter("Service Item No.")
        {
            field("Service Item No.2"; Rec."Service Item No.2")
            {

                ApplicationArea = All;
            }

        }


    }

    actions
    {
    }
}