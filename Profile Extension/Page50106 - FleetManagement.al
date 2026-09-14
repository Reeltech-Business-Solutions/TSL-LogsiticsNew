page 50106 "Fleet Management"
{

    Caption = 'Fleet Management', Comment = '{Dependency=Match,"ProfileDescription_FLEETMANAGER"}';
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
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
                part(Control1902304208; "Account Manager Activities")
                {
                    ApplicationArea = Basic, Suite;
                }
                part("User Tasks Activities"; "User Tasks Activities")
                {
                    ApplicationArea = Suite;
                }
                part(Control1907692008; "My Customers")
                {
                    ApplicationArea = Basic, Suite;
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
            group("Fleet Management")
            {
                action("Billing Transactions")
                {
                    RunObject = page "Billing Transactions Lines";
                    ApplicationArea = All;
                }
                action(Contracts)
                {
                    RunObject = page "Contract Agreement List";
                    ApplicationArea = All;
                }
                action("Fixed Charge Setup")
                {
                    RunObject = page "Fixed Charge Setup";
                    ApplicationArea = All;
                }
                action("Standard Millage List")
                {
                    RunObject = page "Standard Millage List";
                    ApplicationArea = All;
                }
                action("Millage Range Contract")
                {
                    RunObject = page "Millage Range Control List";
                    ApplicationArea = All;
                }
                action("Truck Availability Entry")
                {
                    RunObject = page "Truck Avail. Entry List";
                    ApplicationArea = All;
                }
                action("Contract Groups")
                {
                    RunObject = Page "Haulage Contract Groups";
                    ApplicationArea = all;
                }
                action("Processed Billing Line")
                {
                    RunObject = Page "Processed Billing Line";
                    ApplicationArea = all;
                }
                action("Fixed Price per Location")
                {
                    RunObject = Page "Fixed Price Per Location";
                    ApplicationArea = all;
                }
                action("Leasing Asset List")
                {
                    ApplicationArea = All;
                    RunObject = Page "Fixed Asset List";
                    RunPageView = where("Asset Type2" = filter("Rigid Body" | "Tank" | "Tractor" | "Trailer"));
                }
            }
            group("Vouchers")
            {
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
    }
}