page 80081 "Vehicle Model"
{

    Caption = 'Vehicle Model';
    PageType = List;
    SourceTable = "vehicle model";

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

                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    ToolTip = 'Specifies the value of the Vehicle Make field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
