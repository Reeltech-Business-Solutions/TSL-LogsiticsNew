page 50107 "Invoice Revenue Calc."
{
    
    ApplicationArea = All;
    Caption = 'Invoice Revenue Calc.';
    PageType = List;
    SourceTable = "Invoice Revenue";
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Client Code"; Rec."Client Code")
                {
                    ToolTip = 'Specifies the value of the Client Code field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    
}
