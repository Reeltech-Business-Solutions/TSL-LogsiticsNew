page 50236 "Things To Check"
{
    ApplicationArea = All;
    Caption = 'Sub Visual Check';
    PageType = List;
    SourceTable = "Things to Check";
    UsageCategory = Lists;

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
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Visual Check"; Rec."1Visual Check")
                {
                    ToolTip = 'Specifies the value of the Visual Check field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
