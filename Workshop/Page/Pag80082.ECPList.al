page 80082 "ECP List"
{
    CardPageId = ECP;
    Caption = 'ECP List';
    PageType = List;
    SourceTable = "ECP Header";
    UsageCategory = Lists;
    ApplicationArea = All;
    InsertAllowed = false;
    ModifyAllowed = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Doc. No."; Rec."Doc. No.")
                {
                    ToolTip = 'Specifies the value of the Doc. No. field.';
                    ApplicationArea = All;
                }
                field("J/C No."; Rec."J/C No.")
                {
                    ToolTip = 'Specifies the value of the J/C No. field.';
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field(Brand; Rec.Brand)
                {
                    ToolTip = 'Specifies the value of the Brand field.';
                    ApplicationArea = All;
                }
                field("5th Wheel Serial No."; Rec."5th Wheel Serial No.")
                {
                    ToolTip = 'Specifies the value of the 5th Wheel Serial No. field.';
                    ApplicationArea = All;
                }
                field("Description Of Part(Image)"; Rec."Description Of Part(Image)")
                {
                    ToolTip = 'Specifies the value of the Description Of Part(Image) field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
