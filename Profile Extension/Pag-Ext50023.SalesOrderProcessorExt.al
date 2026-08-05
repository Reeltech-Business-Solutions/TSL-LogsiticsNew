pageextension 50145 SalesOrderProcessorExt extends "Order Processor Role Center"
{
    actions
    {
        addlast(sections)
        {
            group("Staff Advance")
            {
                action("Staff Advance Requests")
                {
                    Caption = 'Staff Advance Requests';
                    RunObject = page "Staff Advance Request List";
                    ApplicationArea = All;
                }
                action("Staff Advance Retirement")
                {
                    Caption = 'Staff Advance Retirement';
                    RunObject = page "Staff Advance Surrender List";
                    ApplicationArea = All;
                }
                action("Staff Claims")
                {
                    Caption = 'Staff Claims';
                    RunObject = page "Staff Claims List";
                    ApplicationArea = All;
                }

            }

            group("Purchase Req")
            {
                action("Local Req")
                {
                    Caption = 'Local Purchase Requisition';
                    ApplicationArea = All;
                    RunObject = page "Purchase Local Req List";
                }
                action("Foreign Req.")
                {
                    ApplicationArea = All;
                    Caption = 'Foreign Purchase Requisition';
                    RunObject = page "Purchase Foreign Req List";
                }
                action("Approved Purch Req")
                {
                    ApplicationArea = All;
                    Caption = 'Approved Purchase Requisition';
                    RunObject = page "Approved Purchase Req.";
                }
            }
        }
    }
}
