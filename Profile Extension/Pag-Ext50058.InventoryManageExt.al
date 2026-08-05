pageextension 50058 "Inventory Manage Ext" extends "Whse. Basic Role Center"
{
    actions
    {
        addbefore("Sales & Purchases")
        {
            group("Purchase Req")
            {

                Caption = 'Purchase';
                group(Requisition)
                {
                    action("Purchase Requisition")
                    {
                        Caption = 'Purchase Requisition';
                        ApplicationArea = all;
                        RunObject = page "Purchase Local Req List";
                    }
                    action("Approved Purch Req")
                    {
                        ApplicationArea = All;
                        Caption = 'Approved Purchase Requisition';
                        RunObject = page "Approved Purchase Req.";
                    }
                }
                group("Purchase Order")
                {
                    action(LocalPurchOrder)
                    {
                        ApplicationArea = all;
                        Caption = 'Local Purchase Orders';
                        RunObject = page "Local Purchase Order List";
                    }
                    action(ForeignPurchOrder)
                    {
                        ApplicationArea = All;
                        Caption = 'Foreign Purchase Orders';
                        RunObject = page "Foreign Purchase Order List";
                    }
                }
            }
            group(Workshop)
            {
                action("Job List")
                {
                    ApplicationArea = All;
                    RunObject = page "Job List - Internal";
                }

                group("Material Issue")
                {
                    action("Job Material Request")
                    {
                        ApplicationArea = all;
                        caption = 'Job Material Request';
                        RunObject = Page "Job Material Request List";

                    }
                    action("Store Material Issue")
                    {
                        ApplicationArea = all;
                        caption = 'Store Material Issue';
                        RunObject = Page "Store Material Issue List";

                    }
                    action("Store Material Return")
                    {
                        ApplicationArea = all;
                        caption = 'Store Material Return';
                        RunObject = Page "Store Material Return List";

                    }


                }

                group("Posted Document")
                {
                    action("Posted Matrial Issue")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Material Issue';
                        RunObject = Page "Posted Material Issue List";

                    }
                    action("Posted Job Material Req. List")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Job Material Req. List';
                        RunObject = Page "Posted Job Material Req. List";

                    }

                    action("Posted Material Return")
                    {
                        ApplicationArea = all;
                        caption = 'Posted Material Return';
                        RunObject = Page "Posted Material Return List";

                    }
                }
                // action("Job Mat Req")
                // {
                //     Caption = 'Job Material Request List';
                //     ApplicationArea = All;
                //     RunObject = page "Job Material Request List";

                // }
                // action("Store Mat issue")
                // {
                //     caption = 'Store Material Issue List';
                //     ApplicationArea = All;
                //     RunObject = page "Store Material Issue List";
                // }
            }
        }
        addafter(PurchaseReturnOrders)
        {
            // action(LocalPurchOrder)
            // {
            //     ApplicationArea = all;
            //     Caption = 'Local Purchase Orders';
            //     RunObject = page "Local Purchase Order List";
            // }
            // action(ForeignPurchOrder)
            // {
            //     ApplicationArea = All;
            //     Caption = 'Foreign Purchase Orders';
            //     RunObject = page "Foreign Purchase Order List";
            // }
        }
    }
}
