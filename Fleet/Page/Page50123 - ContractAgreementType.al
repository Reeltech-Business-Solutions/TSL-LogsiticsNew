page 50123 "Contract Agreement Type"
{
    
    ApplicationArea = All;
    Caption = 'Contract Agreement Type';
    PageType = List;
    SourceTable = "Contract Agreement Type";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Agreement Type"; Rec."Agreement Type")
                {
                    ToolTip = 'Specifies the value of the Agreement Type field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
