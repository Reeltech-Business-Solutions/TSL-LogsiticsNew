page 50085 "Cash Office Setup"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Cash Office Setup";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("LC Request Nos"; Rec."LC Request Nos")
                {
                    ApplicationArea = ALL;
                }
                field("Cash Issue Nos"; Rec."Cash Issue Nos")
                {
                    ApplicationArea = All;
                }
                field("Normal Payments No"; Rec."Normal Payments No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Receipts No field.';
                }
                field("Payment Request Nos"; Rec."Payment Request Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Request Nos field.';
                }
                field("Petty Cash Payments No"; Rec."Petty Cash Payments No")
                {
                    ApplicationArea = All;
                }
                field("Cash Receipt Nos"; Rec."Cash Receipt Nos")
                {
                    ApplicationArea = All;
                }
                field("Cash Transfer Batch"; Rec."Cash Transfer Batch")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Voucher  Template"; Rec."Petty Cash Voucher  Template")
                {
                    ApplicationArea = All;
                }
                field("Petty Cash Voucher Batch"; Rec."Petty Cash Voucher Batch")
                {
                    ApplicationArea = All;
                }
                field("Journal Voucher Nos"; Rec."Journal Voucher Nos")
                {
                    ApplicationArea = All;
                }
                field("Surrender  Batch"; Rec."Surrender  Batch")
                {
                    ApplicationArea = All;
                }
                field("Surrender Template"; Rec."Surrender Template")
                {
                    ApplicationArea = All;
                }
                field("Staff Advance Surrender No."; Rec."Staff Advance Surrender No.")
                {
                    ApplicationArea = All;
                }
                field("Staff Claim No."; Rec."Staff Claim No.")
                {
                    ApplicationArea = All;
                }
                field("Use Central Payment System"; Rec."Use Central Payment System")
                {
                    ApplicationArea = All;
                }
                field("PV  Batch"; Rec."PV  Batch")
                {
                    ApplicationArea = All;
                }
                field("PV Template"; Rec."PV Template")
                {
                    ApplicationArea = All;
                }
                field("Other Staff Advance No."; Rec."Other Staff Advance No.")
                {
                    ApplicationArea = All;
                }
                field("Daily Tyre Repair Nos"; Rec."Daily Tyre Repair Nos")
                {
                    ApplicationArea = All;
                }
                field("Daily Tyre Groove Nos"; Rec."Daily Tyre Groove Nos")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Tyre Nos"; Rec."Vehicle Tyre Nos")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}