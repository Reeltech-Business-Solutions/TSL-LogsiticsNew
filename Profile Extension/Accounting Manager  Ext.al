pageextension 50001 ExtendNavigationArea extends "Accounting Manager Role Center"
{

    actions
    {
        addafter("Fixed Assets")
        {
            group("Purchase")
            {
                group(Requisition)
                {
                    action("Purchase Local Req")
                    {
                        Caption = 'Purchase Requisition';
                        RunObject = page "Purchase Local Req List";
                        ApplicationArea = All;
                    }

                    action("Purchase Foreign Req List")
                    {
                        Caption = 'Purchase Requisition(Foreign)';
                        RunObject = page "Purchase Foreign Req List";
                        ApplicationArea = All;
                        Visible = false;
                    }
                    action("Approved Purchase Requisition")
                    {
                        RunObject = page "Approved Purchase Req.";
                        ApplicationArea = All;
                    }
                    action("RFQ List")
                    {
                        Caption = 'RFQ List';
                        RunObject = page "RFQ List";
                        ApplicationArea = All;
                    }
                    action("Purchase Requisition Archives")
                    {
                        Caption = 'Purchase Requisition Archives';
                        RunObject = page "Purchase Requisition Archives";
                        ApplicationArea = All;
                    }
                    action("Approved Req-PRO")
                    {
                        Caption = 'Purchase Requisition Approved List';
                        RunObject = page "Approved Req-PRO";
                        ApplicationArea = All;
                    }

                }
                group("Purchase Quotes")
                {
                    action("Local Purchase Quote")
                    {
                        RunObject = page "Local Purchase Quote List";
                        ApplicationArea = All;
                    }
                    action("Foreign Purchase Quote")
                    {
                        RunObject = page "Foreign Purchase Quotes";
                        ApplicationArea = All;
                    }
                    action("All Purchase Quote")
                    {
                        RunObject = page "Purchase Quotes";
                        ApplicationArea = All;
                        //Visible = false;
                    }
                    action("Quotation Request Vendor")
                    {
                        RunObject = page "Quotation Request Vendors";
                        ApplicationArea = All;

                    }
                }
                group("Purchase Order")
                {
                    action("Local Purchases")
                    {
                        Caption = 'Local Purchase Order';
                        RunObject = page "Local Purchase Order List";
                        ApplicationArea = All;
                    }
                    action("Foreign Purchase List")
                    {
                        Caption = 'Foreign Purchases';
                        RunObject = page "Foreign Purchase Order List";
                        ApplicationArea = All;
                    }
                }
                action("Charge Invoices")
                {
                    Caption = 'Charge Invoices';
                    RunObject = Page "Charge Invoices";
                    ApplicationArea = All;
                }
                action("Import Files")
                {
                    RunObject = page "Import Files";
                    ApplicationArea = All;
                }
                group("Vendor(s)")
                {
                    action("Vendor Cash List")
                    {
                        RunObject = page " Vendor Cash List";
                        ApplicationArea = All;
                        Visible = false;
                    }

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
                // group("Customer(s)")
                // {
                //     action(Cstomers)
                //     {
                //         ApplicationArea = all;
                //         RunObject = page "Customer List";
                //     }
                //     action(CustStaff)
                //     {
                //         ApplicationArea = all;
                //         RunObject = page "Customer List StaffLoan";
                //     }
                // }
            }
            group("Vouchers")
            {
                Group(Advance)
                {
                    action("Staff Advance Request")
                    {
                        RunObject = page "Staff Advance Request List";
                        ApplicationArea = All;
                    }
                    action("Approved Staff Advance")
                    {
                        RunObject = page "Approved Staff Advances";
                        ApplicationArea = All;
                    }
                    action("Staff Advance Surrender")
                    {
                        Caption = 'Staff Advance Retirement';
                        RunObject = page "Staff Advance Surrender List";
                        ApplicationArea = All;
                    }
                    action("Staff Claims")
                    {
                        RunObject = page "Staff Claims List";
                        ApplicationArea = All;
                    }
                }

                group("Trip Advance")
                {
                    Visible = true;
                    action("Trip Advances")
                    {
                        RunObject = page "Trip Advances";
                        ApplicationArea = All;
                    }
                    action("Approved Trip Advance")
                    {
                        RunObject = page "Approved Trip Advances";
                        ApplicationArea = All;
                    }
                    action("Trip Advance Retirements")
                    {
                        RunObject = page "Trip Advance Ret. List";
                        ApplicationArea = All;
                    }
                }
                Group("Payment/Receipt")
                {
                    action("Bank Payment Voucher")
                    {
                        RunObject = page "Bank Payment List";
                        ApplicationArea = All;
                    }
                    action("Bank Receipt")
                    {
                        RunObject = page "Bank Receipt  List";
                        ApplicationArea = All;
                    }
                    separator(m)
                    {

                    }
                    action("Cash Receipt")
                    {
                        RunObject = page "Cash Receipt  List";
                        ApplicationArea = All;
                    }
                    action("Cash Payment")
                    {
                        RunObject = page "Cash Payment List";
                        ApplicationArea = All;
                    }

                    action("Petty Cash")
                    {
                        RunObject = page "Petty Cash List";
                        ApplicationArea = All;
                    }
                    separator(b)
                    {

                    }
                    action("Journal Voucher")
                    {
                        RunObject = page "Journal Voucher List";
                        ApplicationArea = All;
                    }
                    action("Scrap Sales")
                    {
                        RunObject = page "Scrap Sales List";
                        ApplicationArea = All;
                    }
                    action("Issue Voucher")
                    {
                        RunObject = page "Issue Voucher List";
                        ApplicationArea = All;
                    }
                }
                group("LC Request")
                {
                    Visible = true;
                    action("LC Request List")
                    {
                        RunObject = page "LC Request List";
                        ApplicationArea = All;
                    }
                    action("Posted LC Request List")
                    {
                        RunObject = page "Posted LC Request List";
                        ApplicationArea = All;
                    }
                    action("Converted LC Request List")
                    {
                        RunObject = page "Converted LC Request List";
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
                group("LC Advance/Utility")
                {
                    Visible = true;
                    action("LC Utility Advances")
                    {
                        RunObject = page "LC-Utility Advances";
                        ApplicationArea = All;
                    }
                    action("Approved LC Utility Advance")
                    {
                        RunObject = page "Approved LC-Utility Advances";
                        ApplicationArea = All;
                    }
                    action("LC Utility Retirements")
                    {
                        RunObject = page "LC-Utility Retirement List";
                        ApplicationArea = All;
                    }
                }
                group("Staff Loan")
                {

                }
                action("Staff Loan List")
                {
                    ApplicationArea = All;
                    Caption = 'Staff Loan List', comment = '="List of Staff loan"';
                    // Promoted = true;
                    // PromotedCategory = Process;
                    // PromotedIsBig = true;
                    // Image = Image;
                    RunObject = Page "Employee Loan";

                }
                
               
                // action("Payment List")
                // {
                //     RunObject = page "Payment List";
                //     ApplicationArea = All;
                // }
                // action("Cash Payment List")
                // {
                //     RunObject = page "Payment List";
                //     ApplicationArea = All;
                // }
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
                action("Posted Staff Advance Request")
                {
                    RunObject = page "Posted Staff Adv Request List";
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

                group(API)
                {
                    action("Salary Journal")
                    {
                        RunObject = page "Salary Journal List";
                        ApplicationArea = All;
                    }
                    action("ItemJournal")
                    {
                        Caption = 'Item Journal';
                        RunObject = page ItemJournal;
                        ApplicationArea = All;
                    }
                }

            }

        }

    }



}