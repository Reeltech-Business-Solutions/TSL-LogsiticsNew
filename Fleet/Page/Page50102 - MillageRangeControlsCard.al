page 50102 "Millage Range Controls Card"
{

    Caption = 'Millage Range Controls Card';
    PageType = Card;
    SourceTable = "Millage Range Controls";

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
                field("Contract Name"; Rec."Contract Name")
                {
                    ToolTip = 'Specifies the name of the contract';
                    ApplicationArea = All;
                }
                field(Maximum; Rec.Maximum)
                {
                    ToolTip = 'Specifies the value of the Maximum field.';
                    ApplicationArea = All;
                }
                field(Minimum; Rec.Minimum)
                {
                    ToolTip = 'Specifies the value of the Minimum field.';
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ToolTip = 'Specifies the value of the Rate field.';
                    ApplicationArea = All;
                }
                field("Standard Millage Code"; Rec."Standard Millage Code")
                {
                    ToolTip = 'Specifies the value of the Standard Millage Code field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
