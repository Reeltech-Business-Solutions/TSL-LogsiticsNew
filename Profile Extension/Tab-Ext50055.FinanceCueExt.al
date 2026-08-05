tableextension 50055 FinanceCueExt extends "Finance Cue"
{
    fields
    {
        field(50000; "Due in 10 days"; Integer)
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
        field(50002; "Not Invoiced"; Integer)
        {
            AccessByPermission = TableData "Purch. Rcpt. Header" = R;
            CalcFormula = Count("Purchase Header" WHERE("Document Type" = FILTER(Order),
                                                         "Completely Received" = FILTER(true),
                                                         Invoice = FILTER(false),
                                                         "Responsibility Center" = FIELD("Responsibility Center Filter")));
            Caption = 'Not Invoiced';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "Responsibility Center Filter"; Code[10])
        {
            Caption = 'Responsibility Center Filter';
            Editable = false;
            FieldClass = FlowFilter;
        }
    }

    procedure ShowOrders(FieldNumber: Integer)
    var
        PurchHeader: Record "Purchase Header";
    begin
        PurchHeader.SetRange("Document Type", PurchHeader."Document Type"::Order);
        case FieldNumber of
            FieldNo("Not Invoiced"):
                begin
                    PurchHeader.SetRange(Status);
                    PurchHeader.SetRange("Completely Received", true);
                    PurchHeader.SetRange(Invoice, false);
                end;
        end;
        FilterGroup(2);
        PurchHeader.SetFilter("Responsibility Center", GetFilter("Responsibility Center Filter"));
        //  OnShowOrdersOnAfterPurchHeaderSetFilters(PurchHeader);
        FilterGroup(0);
        PAGE.Run(PAGE::"Purchase Order List", PurchHeader);
    end;


}
