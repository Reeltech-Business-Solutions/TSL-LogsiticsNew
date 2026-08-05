page 80075 "Vehicle Evaluation Header List"
{

    ApplicationArea = All;
    Caption = 'Vehicle Evaluation Header List';
    PageType = List;
    CardPageId = "Vehicle Tyre Evaluation";
    SourceTable = "Vehicle Tyre Valuation ";
    UsageCategory = Lists;


    layout
    {
        area(content)
        {
            repeater(General)
            {
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
                field("Drive Size"; Rec."Drive Size")
                {
                    ToolTip = 'Specifies the value of the Drive Size field.';
                    ApplicationArea = All;
                }
                field("Fleet Name"; Rec."Fleet Name")
                {
                    ToolTip = 'Specifies the value of the Fleet Name field.';
                    ApplicationArea = All;
                }
                field("Free Rolling Size"; Rec."Free Rolling Size")
                {
                    ToolTip = 'Specifies the value of the Free Rolling Size field.';
                    ApplicationArea = All;
                }
                field("Inspection By"; Rec."Inspection By")
                {
                    ToolTip = 'Specifies the value of the Inspection By field.';
                    ApplicationArea = All;
                }
                field(Odometer; Rec.Odometer)
                {
                    ToolTip = 'Specifies the value of the Odometer field.';
                    ApplicationArea = All;
                }
                field("Spare Size"; Rec."Spare Size")
                {
                    ToolTip = 'Specifies the value of the Spare Size field.';
                    ApplicationArea = All;
                }
                field("Steer Size"; Rec."Steer Size")
                {
                    ToolTip = 'Specifies the value of the Steer Size field.';
                    ApplicationArea = All;
                }
                field("Unit Of Measure"; Rec."Unit Of Measure")
                {
                    ToolTip = 'Specifies the value of the Unit Offf Measure field.';
                    ApplicationArea = All;
                }
                field(VIR; Rec.VIR)
                {
                    ToolTip = 'Specifies the value of the VIR field.';
                    ApplicationArea = All;
                }
                field("Vehicle Number"; Rec."Vehicle Number")
                {
                    ToolTip = 'Specifies the value of the Vehicle Number field.';
                    ApplicationArea = All;
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(VehicleTyreValuation)
            {
                Promoted = true;
                RunObject = report VehicleTyreValuation;
                ApplicationArea = All;
            }
        }
    }
}
