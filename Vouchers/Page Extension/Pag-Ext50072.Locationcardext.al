pageextension 50072 "Location card ext" extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("Responsibility Center"; Rec."Responsibility Center")
            {
                ApplicationArea = all;
            }
        }
    }
}
