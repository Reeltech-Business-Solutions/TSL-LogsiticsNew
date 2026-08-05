page 50164 "Haulage Contract Groups"
{
    ApplicationArea = All;
    Caption = 'Haulage Contract Groups';
    PageType = List;
    //Editable = false;
    SourceTable = "Haulage Contract Group";
    //CardPageId = "Haulage Contract Group Card";
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
                field("Business Unit"; Rec."Business Unit")
                {
                    ToolTip = 'Specifies the value of the Business Unit field.';
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ToolTip = 'Specifies the value of the Blocked field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
