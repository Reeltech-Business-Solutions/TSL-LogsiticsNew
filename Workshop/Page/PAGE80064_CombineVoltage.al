page 80064 "Combine Voltage"
{

    Caption = 'Combine Voltage';
    PageType = ListPart;
    SourceTable = "Combine Voltage";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Document No field.';
                    ApplicationArea = All;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the VC  Measurement field.';
                    ApplicationArea = All;
                }
                field("VC  Measurement"; Rec."VC  Measurement")
                {
                    ToolTip = 'Specifies the value of the VC  Measurement field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
