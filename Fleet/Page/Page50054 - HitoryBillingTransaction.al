page 50054 "Hitory Billing Transaction"
{
    ApplicationArea = All;
    Caption = 'History Billing Transaction';
    PageType = List;
    SourceTable = "History Billing Transaction";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    ApplicationArea = All;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                    ApplicationArea = All;
                }
                field("Monthly Status "; Rec."Monthly Status")
                {
                    ToolTip = 'Specifies the value of the Monthly Status  field.';
                    ApplicationArea = All;
                }
                field("Transaction Amount"; Rec."Transaction Amount")
                {
                    ToolTip = 'Specifies the value of the Transaction Amount field.';
                    ApplicationArea = All;
                }
                field("Truck Type"; Rec."Truck Type")
                {
                    ToolTip = 'Specifies the value of the Truck Type field.';
                    ApplicationArea = All;
                }
                field("Truck No."; Rec."Truck No.")
                {
                    ToolTip = 'Specifies the value of the Truck No. field.';
                    ApplicationArea = All;
                }
                field("Posted Transaction"; Rec."Posted Transaction")
                {
                    ToolTip = 'Specifies the value of the Posted Transaction field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
