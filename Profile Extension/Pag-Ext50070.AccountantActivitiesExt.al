pageextension 50070 AccountantActivitiesExt extends "Accountant Activities"
{
    layout
    {
        addafter("Purchase Discounts Next Week")
        {
            field("Due in 10 days"; Rec."Due in 10 days")
            {
                Caption = 'Purchase invoices due in 10 days';
                ApplicationArea = Basic, Suite;
                DrillDownPageID = "Vendor Ledger Entries";
                ToolTip = 'Specifies the number of purchase invoices due in days.';
            }
        }
        addafter("Non-Applied Payments")
        {
            field("Not Invoiced"; Rec."Not Invoiced")
            {
                ApplicationArea = Suite;
                Caption = 'Received, Not Invoiced';
                DrillDownPageID = "Purchase Order List";
                ToolTip = 'Specifies received orders that are not invoiced. The orders are displayed in the Purchase Cue on the Purchasing Agent role center, and filtered by today''s date.';

                trigger OnDrillDown()
                begin
                    Rec.ShowOrders(Rec.FieldNo("Not Invoiced"));
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(FilterDate, '%1', Today + 10);
    end;
}
