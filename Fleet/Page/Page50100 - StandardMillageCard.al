page 50100 "Standard Millage Card"
{
    Caption = 'Standard Millage Card';
    PageType = Card;
    SourceTable = "Standard Millage";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
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
            }
        }
    }
}
