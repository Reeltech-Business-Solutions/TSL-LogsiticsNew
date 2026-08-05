page 50103 "Contract Agreement List"
{

    Caption = 'Contract Agreement List';
    PageType = List;
    Editable = false;
    CardPageId = "Contract Agreement Card";
    SourceTable = "Contract Agreement";
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contract No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Contract No. field.';
                    ApplicationArea = All;
                }
                field("Contract Name"; Rec."Contract Name")
                {

                }
                field("Customer Address"; Rec."Customer Address")
                {
                    ToolTip = 'Specifies the value of the Customer Address field.';
                    ApplicationArea = All;
                }
                field("Contract Date"; Rec."Contract Date")
                {
                    ToolTip = 'Specifies the value of the Contract Date field.';
                    ApplicationArea = All;
                }

                field("Contract Type"; Rec."Contract Type")
                {
                    ToolTip = 'Specifies the value of the Contract Type field.';
                    ApplicationArea = All;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Customer Code field.';
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.';
                    ApplicationArea = All;
                }
                field(Phone; Rec.Phone)
                {
                    ToolTip = 'Specifies the value of the Phone field.';
                    ApplicationArea = All;
                }
                field("Revenue Calc. Code"; Rec."Revenue Calc. Code")
                {
                    ToolTip = 'Specifies the value of the Revenue Calc. Code field.';
                    ApplicationArea = All;
                }

                field("Vehicle Count"; Rec."Vehicle Count")
                {
                    ToolTip = 'Specifies the value of the Vehicle Count field.';
                    ApplicationArea = All;
                }

                field("Formular Type"; Rec."Formular Type")
                {
                    ToolTip = 'Specifies the value of the Formular Type" field.';
                    ApplicationArea = All;
                }

            }
        }
    }

}
