page 80065 "Batter Maintainance List"
{

    ApplicationArea = All;
    Caption = 'Battery Maintainance List';
    PageType = List;
    SourceTable = "Battery Maintainance";
    CardPageId = "Battery Maintainance Form";
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
                field("Acid Density Test"; Rec."Acid Density Test")
                {
                    ToolTip = 'Specifies the value of the Acid Density Test field.';
                    ApplicationArea = All;
                }
                field("Awm Name"; Rec."Awm Name")
                {
                    ToolTip = 'Specifies the value of the Awm Name field.';
                    ApplicationArea = All;
                }
                field("Battery Brand"; Rec."Battery Brand")
                {
                    ToolTip = 'Specifies the value of the Battery Brand field.';
                    ApplicationArea = All;
                }
                field(Contract; Rec.Contract)
                {
                    ToolTip = 'Specifies the value of the Contract field.';
                    ApplicationArea = All;
                }
                field("Date of last Maintainance"; Rec."Date of last Maintainance")
                {
                    ToolTip = 'Specifies the value of the Date of last Maintainance field.';
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                    ApplicationArea = All;
                }
                field("General Status"; Rec."General Status")
                {
                    ToolTip = 'Specifies the value of the General Status field.';
                    ApplicationArea = All;
                }
                field("T Nos"; Rec."T Nos")
                {
                    ToolTip = 'Specifies the value of the T Nos field.';
                    ApplicationArea = All;
                }
                field("Technician Name"; Rec."Technician Name")
                {
                    ToolTip = 'Specifies the value of the Technician Name field.';
                    ApplicationArea = All;
                }
                field("Truck No"; Rec."Truck No")
                {
                    ToolTip = 'Specifies the value of the Truck No field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
