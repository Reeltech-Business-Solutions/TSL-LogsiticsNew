page 80080 "Vehicle Make"
{

    Caption = 'Vehicle Make';
    PageType = List;
    SourceTable = "Vehicle Make";

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
                field(Manufacturer; Rec.Manufacturer)
                {
                    ToolTip = 'Specifies the value of the Manufacturer field.';
                    ApplicationArea = All;
                }
                field("Calculate Type"; Rec."Calculate Type")
                {
                    ToolTip = 'Specifies the value of the Calculate Type field.';
                    ApplicationArea = All;
                }

              
                
            }
        }
    }

}
