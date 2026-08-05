page 80070 "Daily Header List"
{
    ApplicationArea = All;
    Caption = 'Daily Header List';
    PageType = List;
    CardPageId = "Daily Repair";
    SourceTable = "Daily Tyre Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                }
                field("Daily Tyre Type"; Rec."Daily Tyre Type")
                {
                    ToolTip = 'Specifies the value of the Tyre Technician field.';
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                    ApplicationArea = All;
                }
                field("Tyre Inspector Confirmation"; Rec."Tyre Inspector Confirmation")
                {
                    ToolTip = 'Specifies the value of the Tyre Inspector Confirmation field.';
                    ApplicationArea = All;
                }
                field("Tyre Technician"; Rec."Tyre Technician")
                {
                    ToolTip = 'Specifies the value of the Tyre Technician field.';
                    ApplicationArea = All;
                }
                field(Workshop; Rec.Workshop)
                {
                    ToolTip = 'Specifies the value of the Workshop field.';
                    ApplicationArea = All;
                    TableRelation = Location;
                }

            }
        }
    }

}
