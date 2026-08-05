page 50165 "Haulage Contract Group Card"
{
    Caption = 'Haulage Contract Group Card';
    PageType = Card;
    SourceTable = "Haulage Contract Group";

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
