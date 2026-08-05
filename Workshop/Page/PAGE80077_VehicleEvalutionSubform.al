page 80077 "Vehicle Evalution Subform"
{

    Caption = 'Vehicle Evalution Subform';
    PageType = ListPart;
    SourceTable = "Vehicle Tyre Valuation Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Position Code"; Rec."Position Code")
                {
                    ToolTip = 'Specifies the value of the Position Code field.';
                    ApplicationArea = All;
                }
                field("Tyre Id"; Rec."Tyre Id")
                {
                    ToolTip = 'Specifies the value of the Tyre Id field.';
                    ApplicationArea = All;
                }
                field("Product Code "; Rec."Product Code")
                {
                    ToolTip = 'Specifies the value of the Product Code  field.';
                    ApplicationArea = All;
                }
                field("Retread Design"; Rec."Retread Design")
                {
                    ToolTip = 'Specifies the value of the Retread Design field.';
                    ApplicationArea = All;
                }
                field("Ply Rate"; Rec."Ply Rate")
                {
                    ToolTip = 'Specifies the value of the Ply Rate field.';
                    ApplicationArea = All;
                }
                field("Rec Air"; Rec."Rec Air")
                {
                    ToolTip = 'Specifies the value of the Rec Air field.';
                    ApplicationArea = All;
                }
                field("Air Found"; Rec."Air Found")
                {
                    ToolTip = 'Specifies the value of the Air Found field.';
                    ApplicationArea = All;
                }
                field("Tread Depth"; Rec."Tread Depth")
                {
                    ToolTip = 'Specifies the value of the Tread Depth field.';
                    ApplicationArea = All;
                }
                field(Tir; Rec.Tir)
                {
                    ToolTip = 'Specifies the value of the Tir field.';
                    ApplicationArea = All;
                }
                field("Line No"; Rec."Line No")
                {
                    ToolTip = 'Specifies the value of the Line No field.';
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

}
