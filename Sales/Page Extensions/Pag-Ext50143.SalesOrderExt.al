pageextension 50143 SalesOrderExt extends "Sales Order"
{
    layout
    {
        addafter("Sell-to")
        {
            field("OEM Code"; Rec."OEM Code")
            {
                ApplicationArea = All;
            }
            field(LPO; Rec.LPO)
            {
                ApplicationArea = All;
            }
        }
        addafter("Promised Delivery Date")
        {
            field("Planned Shipment Date"; Rec."Planned Shipment Date")
            {
                ApplicationArea = All;
            }
            field("Planned Receipt Date"; Rec."Planned Receipt Date")
            {
                ApplicationArea = All;
            }
            field("Planned Clearing Date"; Rec."Planned Clearing Date")
            {
                ApplicationArea = All;
            }
            field("Planned Assembly EndDate"; Rec."Planned Assembly EndDate")
            {
                ApplicationArea = All;
            }
            field("PDI Date"; Rec."PDI Date")
            {
                ApplicationArea = All;
            }
            field("PDI Form Attached"; Rec."PDI Form Attached")
            {
                ApplicationArea = All;
            }
            field("Release Note Attached"; Rec."Release Note Attached")
            {
                ApplicationArea = All;
            }

        }

        modify("Promised Delivery Date")
        {
            Caption = 'Planned Delivery Date';
        }
    }
}
