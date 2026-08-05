pageextension 50069 PurchaseCueExt extends "Purchase Agent Activities"
{
    layout
    {
        addafter(PartiallyInvoiced)
        {
            field("Due in 10 Days"; Rec."Due in 10 Days")
            {
                Caption = 'Purchase invoices due in 10 days';
                ApplicationArea = Basic, Suite;
                DrillDownPageID = "Vendor Ledger Entries";
                ToolTip = 'Specifies the number of purchase invoices due in days.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter(FilterDate, '%1', Today + 10);
    end;
}
