pageextension 50017 "Sales Quote Ext" extends "Sales Quote"
{
    layout
    {
        addafter("Sell-to Customer Templ. Code")
        {
            field("OEM Code"; Rec."OEM Code")
            {
                ApplicationArea = All;
            }
            field(LPO; Rec.LPO)
            {
                ApplicationArea = All;
            }
            field("Planned Clearing Date"; Rec."Planned Clearing Date")
            {
                ApplicationArea = All;

            }

        }

    }
}
