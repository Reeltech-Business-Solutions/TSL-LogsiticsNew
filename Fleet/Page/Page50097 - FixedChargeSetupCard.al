page 50097 "Fixed Charge Setup Card"
{

    Caption = 'FixedChargeSetupCard';
    PageType = Card;
    SourceTable = "Fixed Charge Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Contract No."; Rec."Contract No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                    ApplicationArea = All;
                }
                field("Fixed Charge"; Rec."Fixed Charge")
                {
                    ToolTip = 'Specifies the value of the Fixed Charge field.';
                    ApplicationArea = All;
                }
                field("Fixed Per Truck Type"; Rec."Fixed Per Truck Type")
                {
                    ToolTip = 'Specifies the value of the Fixed Per Truck Type field.';
                    ApplicationArea = All;
                }
                field("Rate Per Trip"; Rec."Rate Per Trip")
                {
                    ToolTip = 'Specifies the value of the Rate Per Trip Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
