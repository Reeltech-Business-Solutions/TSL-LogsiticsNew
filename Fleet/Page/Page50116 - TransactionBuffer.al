page 50116 "Transaction Buffer"
{

    ApplicationArea = All;
    Caption = 'Transaction Buffer';
    PageType = List;
    SourceTable = "Transaction Buffer";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract ID"; Rec."Contract ID")
                {
                    ToolTip = 'Specifies the value of the Contract ID field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
                field("Distance Covered"; Rec."Distance Covered")
                {
                    ToolTip = 'Specifies the value of the DistanceTotal field.';
                    ApplicationArea = All;
                }
                field(TripTotal; Rec.TripTotal)
                {
                    ToolTip = 'Specifies the value of the TripTotal field.';
                    ApplicationArea = All;
                }
                field(BagsTotal; Rec.BagsTotal)
                {
                    ToolTip = 'Specifies the value of the BagsTotal field.';
                    ApplicationArea = All;
                }
                field(Availability; Rec.Availability)
                {
                    ToolTip = 'Specifies the value of the Availability field.';
                    ApplicationArea = All;
                }

                field("Quantity Loaded NetWgt Kg"; Rec."Quantity Loaded NetWgt Kg")
                {
                    Caption = 'Quantity Loaded NetWgt Kg';
                    ApplicationArea = All;
                }
                field("Quantity Offloaded Kg"; Rec."Quantity Offloaded Kg")
                {
                    Caption = 'Quantity Loaded NetWgt Kg';
                    ApplicationArea = All;
                }
                field("Truck No"; Rec."Truck No")
                {
                    Caption = 'Truck No';
                    ApplicationArea = All;
                }

                field("Contract Sum"; Rec."Contract Sum")
                {
                    Caption = 'Contract Sum';
                    ApplicationArea = All;
                }
            }
        }
    }

}
