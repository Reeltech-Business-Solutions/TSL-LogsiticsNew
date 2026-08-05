page 50115 "Fixed Price Per Location"
{

    ApplicationArea = All;
    Caption = 'Fixed Price Per Location';
    PageType = List;
    SourceTable = "Fixed Price Per Location";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract ID"; Rec."Contract ID")
                {
                    ToolTip = 'Specifies the value of the Contract ID field.';
                    ApplicationArea = All;
                }
                field("Fixed Price"; Rec."Fixed Price")
                {
                    ToolTip = 'Specifies the value of the Fixed Price field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                    ApplicationArea = All;
                }
                field("Source Location"; Rec."Source Location")
                {
                    ToolTip = 'Specifies the value of the Source Location field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
