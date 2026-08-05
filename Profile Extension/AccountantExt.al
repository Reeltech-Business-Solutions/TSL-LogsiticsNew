/// <summary>
/// PageExtension ExtendNavigationArea (ID 50001) extends Record Accounting Manager Role Center.
/// </summary>
pageextension 50014 AccountantExtendNavArea extends "Accountant Role Center"
{

    actions
    {
        addafter(Journals)
        {
            group("Purchase")
            {
                group("Requisition")
                {
                    Caption = 'Requisitions';

                    action("Purchase Local Req List")
                    {
                        RunObject = page "Purchase Local Req List";
                        ApplicationArea = All;
                    }
                    action("Purchase Foreign Req List")
                    {
                        RunObject = page "Purchase Foreign Req List";
                        ApplicationArea = All;
                    }

                }
                group("Purchase Order")
                {
                    Caption = 'Purchase Orders';

                    action("Local Purchase Order")
                    {
                        RunObject = page "Local Purchase Order List";
                        ApplicationArea = All;
                    }
                    action("Foreign Purchase Order")
                    {
                        RunObject = page "Foreign Purchase Order List";
                        ApplicationArea = All;
                    }
                }
                group(Vendor)
                {
                    Caption = 'Vendors';

                    action("Vendor Local List")
                    {
                        RunObject = page " Vendor Local List";
                        ApplicationArea = All;
                    }

                    action("Vendor Foreign List")
                    {
                        RunObject = page " Vendor Foreign List";
                        ApplicationArea = All;
                    }
                }

            }
        }

        addlast(Sections)
        {
            group("Cash Management...")
            {

                action("Staff Advance Request")
                {
                    RunObject = page "Staff Advance Request List";
                    ApplicationArea = All;
                }
                action("Staff Advance Surrender")
                {
                    RunObject = page "Staff Advance Surrender List";
                    ApplicationArea = All;
                }
                action("Payment Request List")
                {
                    RunObject = page "Payment Requests List";
                    ApplicationArea = All;
                }
                action("Payment List")
                {
                    RunObject = page "Payment List";
                    ApplicationArea = All;
                }
                action("Posted Staff Advance Request")
                {
                    RunObject = page "Posted Staff Adv Request List";
                    ApplicationArea = All;
                }
                action("Staff Claims")
                {
                    RunObject = page "Staff Claims List";
                    ApplicationArea = All;
                }

            }

            group("Vouchers")
            {
                action("Issue Voucher")
                {
                    RunObject = page "Issue Voucher List";
                    ApplicationArea = All;
                }
                action("Journal Voucher")
                {
                    RunObject = page "Journal Voucher List";
                    ApplicationArea = All;
                }
                action("Cash Payment Voucher")
                {
                    RunObject = page "Cash Payment List";
                    ApplicationArea = All;
                }
                action("Cash Receipt Voucher")
                {
                    RunObject = page "Cash Receipt  List";
                    ApplicationArea = All;
                }
                action("Bank Payment Voucher")
                {
                    RunObject = page "Bank Payment List";
                    ApplicationArea = All;
                }
                action("Bank Receipt Voucher")
                {
                    RunObject = page "Bank Receipt  List";
                    ApplicationArea = All;
                }
                action("Petty Cash Voucher")
                {
                    RunObject = page "Petty Cash List";
                    ApplicationArea = All;
                }
            }
            group("Posted Vouchers")
            {
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
        addafter(Journals)
        {
            group("Workshop Management")
            {
                action("Service Quotes")
                {
                    RunObject = page "Service Quotes - External";
                    ApplicationArea = All;
                }
                action("Job List")
                {
                    RunObject = page "Job List - Internal";
                    ApplicationArea = All;
                }
            }

        }

    }

}
