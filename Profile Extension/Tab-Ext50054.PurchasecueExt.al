tableextension 50054 PurchasecueExt extends "Purchase Cue"
{
    fields
    {
        field(50000; "Due in 10 Days"; Integer)
        {

            CalcFormula = Count("Vendor Ledger Entry" where("Document Type" = FILTER(Invoice | "Credit Memo"),
                                                             "Due Date" = field(FilterDate),
                                                             Open = const(true)));
            Caption = 'Due in 10 Days';
            FieldClass = FlowField;
        }
        field(50001; FilterDate; Date)
        {
            Caption = 'FilterDate';
            FieldClass = FlowFilter;
        }
    }
}
