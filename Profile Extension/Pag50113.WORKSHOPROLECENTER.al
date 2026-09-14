page 50113 "WORKSHOP ROLE CENTER"
{

    Caption = 'WORKSHOP ROLE CENTER';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                ShowCaption = false;
                part(Control99; "Finance Performance")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                part("User Tasks Activities"; "User Tasks Activities")
                {
                    ApplicationArea = All;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = All;
                }
                part(ApprovalsActivities; "Approvals Activities")
                {
                    ApplicationArea = Suite;
                }
            }
        }
    }
    actions
    {
        area(sections)
        {
            group("Workshop Management")
            {
                //group("Service Item")
                //{
                action("Service Item List")
                {
                    Caption = 'Asset';
                    RunObject = page "Service Item List";
                    ApplicationArea = All;
                }
                //action("Service Item List Blocked")
                //{
                //RunObject = page "Service item list Blocked";
                //  ApplicationArea = All;
                //Visible = false;
                //}
                //action("Vehicle Registration (Prevent. Maint.")
                //{
                // RunObject = page "Vehicle Registration List - PM";
                //ApplicationArea = All;
                //  Visible = false;
                //}
                action("Vehicle Registration")
                {
                    RunObject = page "Vehicle Registration List";
                    ApplicationArea = All;
                }

                group("Service Quote")
                {
                    action("Service Quotes - External")
                    {
                        RunObject = page "Service Quotes - External";
                        Caption = 'Service Quotes';
                        ApplicationArea = All;
                    }
                    action("Service Quotes - internal")
                    {
                        RunObject = page "Service Quotes - Internal";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    /* action("Service Quotes - Lease Operation")
                     {
                         RunObject = page "Service Quotes - Leasing";
                         ApplicationArea = All;
                     }
                     
                    action("J-Service Quotes - Insurance")
                    {
                        RunObject = page "Service Quotes - Insurance";
                        ApplicationArea = All;
                    }
                    */
                }
                group(Job)
                {
                    action("Job List")
                    {
                        RunObject = page "Job List - Internal";
                        ApplicationArea = All;
                    }


                    /* action("Job List - Internal")
                     {
                         RunObject = page "Job List - Internal";
                         ApplicationArea = All;
                     }
                     action("Job List -External")
                     {
                         RunObject = page "Job List - External";
                         ApplicationArea = All;
                     }
                     action("Job List - Lease Operation")
                     {
                         RunObject = page "Job List - Lease Operation";
                         ApplicationArea = All;
                     }
                     action("Job List - Insurance")
                     {
                         RunObject = page "Job List - Insurance";
                         ApplicationArea = All;
                     }
                     */
                    action("Job Journal")
                    {
                        RunObject = page "Job Journal";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Job Sales Invoices")
                    {
                        RunObject = page "Jobs Sales Invoice List";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Customer Job Type")
                    {
                        RunObject = page "Customer Job Type";
                        ApplicationArea = All;
                    }
                    action("Job Type Code")
                    {
                        RunObject = page "Job Type Code";
                        ApplicationArea = All;
                    }
                    action("Posted Jobs Sales Invoices")
                    {
                        RunObject = page "Posted Jobs Sales Invoices";
                        ApplicationArea = All;
                    }
                }

                group("Material Issue")
                {
                    action("Job Material Request List")
                    {
                        RunObject = page "Job Material Request List";
                        ApplicationArea = All;
                    }
                    action("Store Material Issue List Job")
                    {
                        RunObject = page "Store Material Issue List";
                        ApplicationArea = All;
                        caption = 'Store Material Issue List';
                    }
                    action("Store Material Return List")
                    {
                        RunObject = page "Store Material Return List";
                        ApplicationArea = All;
                    }

                    //  action("Posted Material Return List")
                    //  {
                    // RunObject = page "Posted material Return List";
                    //     ApplicationArea = All;
                    // //     Visible = false;
                    //  }
                }
                group("Purchase Req")
                {
                    action("Local Req")
                    {
                        Caption = 'Purchase Requisition';
                        ApplicationArea = All;
                        RunObject = page "Purchase Local Req List";
                    }
                    // action("Foreign Req.")
                    // {
                    //     ApplicationArea = All;
                    //     Caption = 'Foreign Purchase Requisition';
                    //     RunObject = page "Purchase Foreign Req List";
                    // }
                    action("Approved Purch Req")
                    {
                        ApplicationArea = All;
                        Caption = 'Approved Purchase Requisition';
                        RunObject = page "Approved Purchase Req.";
                    }
                }
                group("Quality Assurance")
                {
                    action("Quality Check")
                    {
                        Caption = 'Quality Check Assurance Form';
                        ApplicationArea = All;
                        RunObject = page "Quality CheckList";
                    }

                    action("Job & List")
                    {
                        caption = 'Job List (Quality check & Quality Check Completed)';
                        RunObject = page "Job List -Quality Check";
                        ApplicationArea = All;
                    }
                }
                Group("Battery Management")
                {

                    action("Batter Maintainance List")
                    {
                        RunObject = page "Batter Maintainance List";
                        ApplicationArea = All;
                        Caption = 'Battery Maintenance';
                    }

                }
                Group("Tyre Management")
                {

                    action("Tyre Maintainance List")
                    {
                        RunObject = page "Vehicle Evaluation Header List";
                        ApplicationArea = All;

                    }

                    action("Daily Tyre Regroove List")
                    {
                        RunObject = page "Daily Tyre Regroove List";
                        ApplicationArea = All;
                    }
                    action("Daily Tyre Repair List")
                    {
                        RunObject = page "Daily Tyre Repair List";
                        ApplicationArea = All;
                    }
                    action("Tyre Swap")
                    {
                        RunObject = page "Tyre Swap List";
                        ApplicationArea = All;
                    }
                }
                group("Preventive Maintenance")
                {
                    action("Service Code")
                    {
                        RunObject = page "Service Code List";
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
                group("Posted Documents")
                {
                    action("Posted Material Issue")
                    {
                        RunObject = page "Posted Material Issue List";
                        ApplicationArea = All;
                        Caption = 'Posted Material Issue';
                        Image = PostedReceipts;
                    }
                    action("Posted Job Material Req. List")
                    {
                        RunObject = page "Posted Job Material Req. List";
                        ApplicationArea = All;
                    }


                    action("Posted Material Return")
                    {
                        RunObject = page "Posted Material Return List";
                        ApplicationArea = All;
                    }




                }
                /*
            action("Approved Part Usage")
            {
                //   RunObject = page "Millage Range Control List";
                //  ApplicationArea = All;
            }
            action("Reconditioned Engine Stock")
            {
                // RunObject = page "reconditioned Engine Stock";
                //ApplicationArea = All;
            }

            action("Job Material Issue Approve")
            {
                //  RunObject = page "Job Material issue Approved";
                //ApplicationArea = All;
            }
            action("Store Material Issue Approvee")
            {
                // RunObject = page "Store Material Issue Approvee";
                //ApplicationArea = All;
            }*/

            }
            group("Vouchers")
            {
                Visible = false;
                action("Issue Voucher")
                {
                    RunObject = page "Issue Voucher List";
                    ApplicationArea = All;
                }
                // action("Journal Voucher")
                // {
                //     RunObject = page "Journal Voucher List";
                //     ApplicationArea = All;
                // }
                // action("Cash Payment Voucher")
                // {
                //     RunObject = page "Cash Payment List";
                //     ApplicationArea = All;
                // }
                // action("Cash Receipt Voucher")
                // {
                //     RunObject = page "Cash Receipt  List";
                //     ApplicationArea = All;
                // }
                action("Bank Payment Voucher")
                {
                    RunObject = page "Bank Payment List";
                    ApplicationArea = All;
                }
                // action("Bank Receipt Voucher")
                // {
                //     RunObject = page "Bank Receipt  List";
                //     ApplicationArea = All;
                // }
                // action("Petty Cash Voucher")
                // {
                //     RunObject = page "Petty Cash List";
                //     ApplicationArea = All;
                // }
            }
            group("Posted Vouchers")
            {
                Visible = false;
                action("Posted JV")
                {
                    RunObject = page "Posted Voucher List";
                    ApplicationArea = All;
                }
                action("Posted CPV")
                {
                    RunObject = page "Posted CPV List";
                    ApplicationArea = All;
                }
                action("Posted CRV")
                {
                    RunObject = page "Posted CRV List";
                    ApplicationArea = All;
                }
                action("Posted BPV")
                {
                    RunObject = page "Posted BPV List";
                    ApplicationArea = All;
                }
                action("Posted BRV")
                {
                    RunObject = page "Posted BRV List";
                    ApplicationArea = All;
                }
                action("Posted Petty Cash")
                {
                    RunObject = page "Posted Petty Cash List";
                    ApplicationArea = All;
                }
                action("Posted Staff Claims")
                {
                    RunObject = page "Posted Staff Claims List";
                    ApplicationArea = All;
                }
                action("Posted Trip Advance Request")
                {
                    RunObject = page "Posted Trip Advance Requests";
                    ApplicationArea = All;
                }
                action("Posted Staff Advance Retirement")
                {
                    RunObject = page "Posted Staff Ret. List";
                    ApplicationArea = All;
                }
                action("Posted LC Utility Advances")
                {
                    RunObject = page "Posted LC-Utility Adv.Requests";
                    ApplicationArea = All;
                }
                action("Posted Trip Retirement List")
                {
                    RunObject = page "Posted Trip Retirement List";
                    ApplicationArea = All;
                }
                action("Posted LC-Utility Ret. List")
                {
                    RunObject = page "Posted LC-Utility Ret. List";
                    ApplicationArea = All;
                }
                action("Posted Issue Voucher")
                {
                    RunObject = page "Posted Issue Voucher List";
                    ApplicationArea = All;
                }
            }
        }


        area(creation)
        {
            action("Job List - Completed")
            {
                RunObject = page "Job List - Completed";
                ApplicationArea = All;
            }
            action("Job List - Closed")
            {
                RunObject = page "Job List - CLosed";
                ApplicationArea = All;
            }
            action("Item Journal")
            {
                RunObject = page "Item Journal";
                ApplicationArea = All;
            }
            action("Job WIP Cockpit")
            {
                RunObject = page "Job WIP Cockpit";
                ApplicationArea = All;
            }
        }
    }
}