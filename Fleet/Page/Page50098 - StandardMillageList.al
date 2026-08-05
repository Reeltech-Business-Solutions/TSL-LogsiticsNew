page 50098 "Standard Millage List"
{

    Caption = 'StandardMillageList';
    PageType = List;
    CardPageId = "Standard Millage Card";
    SourceTable = "Standard Millage";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                    ApplicationArea = All;
                }
                field(Maximum; rec.Maximum)
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
