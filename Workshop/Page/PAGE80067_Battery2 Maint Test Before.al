page 80067 "Battery2 Test Before"
{
    DelayedInsert = true;
    AutoSplitKey = true;
    MultipleNewLines = true;
    Caption = 'Battery2 Test Before';
    PageType = ListPart;
    SourceTable = Battery;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("ACID LEVEL"; Rec."ACID LEVEL")
                {
                    ToolTip = 'Specifies the value of the ACID LEVEL field.';
                    ApplicationArea = All;
                }
                field(Battery; Rec.Battery)
                {
                    ToolTip = 'Specifies the value of the Battery field.';
                    ////TableRelation  = Battery.Battery(C) 
                    ApplicationArea = All;
                }
                field("Battery  Document"; Rec."Battery  Document")
                {
                    ToolTip = 'Specifies the value of the Battery  Document field.';
                    ApplicationArea = All;
                }
                field(CELL; Rec.CELL)
                {
                    ToolTip = 'Specifies the value of the CELL field.';
                    ApplicationArea = All;
                }
                field(COLOUR; Rec.COLOUR)
                {
                    ToolTip = 'Specifies the value of the COLOUR field.';
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                    ApplicationArea = All;
                }
                field("VOLTAGE V"; Rec."VOLTAGE V")
                {
                    ToolTip = 'Specifies the value of the VOLTAGE V field.';
                    ApplicationArea = All;
                }
                field("Cell Temp"; Rec."Cell Temp")
                {
                    ToolTip = 'Specifies the value of the VOLTAGE V field.';
                    ApplicationArea = All;
                }
                field("Truck No"; Rec."Truck No")
                {
                    ToolTip = 'Specifies the value of the VOLTAGE V field.';
                    ApplicationArea = All;
                }
                field("Battery Status"; Rec."Battery Status")
                {
                    ToolTip = 'Specifies the value of the VOLTAGE V field.';
                    ApplicationArea = All;
                }

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Battery := Rec.Battery::"Battery 2";
        Rec."Battery Status" := Rec."Battery Status"::Neutral;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Battery := Rec.Battery::"Battery 2";
        Rec."Battery Status" := Rec."Battery Status"::Neutral;

    end;

}
