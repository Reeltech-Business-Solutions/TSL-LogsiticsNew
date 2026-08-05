page 80078 "Battery Maintainance Form"
{

    Caption = 'Battery Maintenance Form';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Battery Maintainance";
    //SourceTableView = WHERE("Voltage  Test 1" = FILTER("Test Before"), "Voltage  Test 2" = FILTER("Test After"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Truck No"; Rec."Truck No")
                {
                    ToolTip = 'Specifies the value of the Truck No field.';
                    ApplicationArea = All;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ToolTip = 'Specifies the value of the Driver Name field.';
                    ApplicationArea = All;
                }
                field("Battery Brand"; Rec."Battery Brand")
                {
                    ToolTip = 'Specifies the value of the Battery Brand field.';
                    ApplicationArea = All;
                }
                field("T Nos"; Rec."T Nos")
                {
                    ToolTip = 'Specifies the value of the T Nos field.';
                    ApplicationArea = All;
                }
                field("Last Date of Battery Issue"; Rec."Last Date of Battery Issue")
                {
                    ToolTip = 'Specifies the value of the Last Date of Battery Issue field.';
                    ApplicationArea = All;
                }
                field(Contract; Rec.Contract)
                {
                    ToolTip = 'Specifies the value of the Contract field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
                field("Date of last Maintainance"; Rec."Date of last Maintainance")
                {
                    ToolTip = 'Specifies the value of the Date of last Maintainance field.';
                    ApplicationArea = All;
                }
                field("Remarks Description"; Rec."Remarks Description")
                {
                    ToolTip = 'Specifies the value of the Remarks Description field.';
                    ApplicationArea = All;
                }
                field("Battery Terminal Condition"; Rec."Battery Terminal Condition")
                {
                    ToolTip = 'Specifies the value of the Battery Terminal Condition field.';
                    ApplicationArea = All;
                }
                field("Test Color"; Rec."Test Color")
                {
                    ToolTip = 'Specifies the value of the Acid Water field.';
                    ApplicationArea = All;
                }
                field("Acid Density Test"; Rec."Acid Density Test")
                {
                    ToolTip = 'Specifies the value of the Acid Density Test field.';
                    ApplicationArea = All;
                }
                field("Battery Condition"; Rec."Battery Condition")
                {
                    ToolTip = 'Specifies the value of the Battery Condition field.';
                    ApplicationArea = All;
                }
                field("Battery Status Remark"; Rec."Battery Status Remark")
                {
                    ToolTip = 'Specifies the value of the Battery Status Remark field.';
                    ApplicationArea = All;
                }
                field("General Status"; Rec."General Status")
                {
                    ToolTip = 'Specifies the value of the General Status field.';
                    ApplicationArea = All;
                }

                field("Technician Name"; Rec."Technician Name")
                {
                    ToolTip = 'Specifies the value of the Technician Name field.';
                    ApplicationArea = All;
                }
                field("Awm Name"; Rec."Awm Name")
                {
                    ToolTip = 'Specifies the value of the Awm Name field.';
                    ApplicationArea = All;
                }
                field("Battery  Type 1"; Rec."Battery  Type 1")
                {
                    ToolTip = 'Specifies the value of the Battery field.';
                    ApplicationArea = All;
                }
                field("Battery  Type 2"; Rec."Battery  Type 2")
                {
                    ToolTip = 'Specifies the value of the Battery field.';
                    ApplicationArea = All;
                }
                field("Voltage  Test 1"; Rec."Voltage  Test 1")
                {
                    ToolTip = 'Specifies the value of the Voltage  Test field.';
                    ApplicationArea = All;
                }
                field("Voltage  Test 2"; Rec."Voltage  Test 2")
                {
                    ToolTip = 'Specifies the value of the Voltage  Test field.';
                    ApplicationArea = All;
                }
            }
            part("TEST BEFORE MAINTENANCE 1"; "Battery1 Test Before")
            {
                ApplicationArea = All;
                Caption = '"TEST BEFORE MAINTENANCE';
                SubPageLink = "Document No." = field("No."), "Battery Status" = field("Voltage  Test 1");
            }

            part("TEST BEFORE MAINTENANCE 2"; "Battery2 Test Before")
            {
                ApplicationArea = All;
                Caption = '"TEST BEFORE MAINTENANCE';
                SubPageLink = "Document No." = field("No."), "Battery Status" = field("Voltage  Test 2");
            }
            part("TEST AFTER MAINTENANCE 1"; "Battery1 Test After")
            {
                ApplicationArea = All;
                Caption = '"TEST AFTER MAINTENANCE 1';
                SubPageLink = "Document No." = field("No."), "Battery Status" = field("Voltage  Test 1");
            }
            part("TEST AFTER MAINTENANCE 2"; "Battery2 Test After")
            {
                ApplicationArea = All;
                Caption = '"TEST AFTER MAINTENANCE 2';
                SubPageLink = "Document No." = field("No."), "Battery Status" = field("Voltage  Test 2");
            }
        }
    }

}
