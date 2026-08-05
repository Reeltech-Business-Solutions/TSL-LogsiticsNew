/// <summary>
/// PageExtension ExtendNavigationArea (ID 50001) extends Record Accounting Manager Role Center.
/// </summary>
pageextension 50007 PurchaserExtNavArea extends "Purchasing Agent Role Center"
{
    layout
    {

    }
    actions
    {
        addbefore("Posted Purchase Credit Memos")
        {
            action("Purchase Req. Archives")
            {
                Caption = 'Purchase Requisition Archives';
                RunObject = page "Purchase Requisition Archives";
                ApplicationArea = All;
            }
        }
        addfirst(creation)
        {
            action("Purchase Requisition(Local)")
            {
                Caption = 'Purchase Requisition';
                RunObject = page "Purchase Local Req";
                ApplicationArea = All;
                RunPageMode = Create;
                ToolTip = 'Make a new local purchase requisition.';
            }
            action("Purchase Requisition(Foreign)")
            {
                Caption = 'Purchase Requisition(Foreign)';
                RunObject = page "Purchase Foreign Req";
                ApplicationArea = All;
                Visible = false;
                RunPageMode = Create;
                ToolTip = 'Make a new Foreign Purchase requisition.';
            }

        }
        addfirst(embedding)
        {
            action("Local Purchase Order List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Local Purchase Orders';
                RunObject = Page "Local Purchase Order List";
            }
            action("Foreign Purchase Order List")
            {
                ApplicationArea = All;
                Caption = 'Foreign Purchase Orders';
                RunObject = page "Foreign Purchase Order List";

            }
            action("Foreign Purchase Quotes")
            {
                ApplicationArea = All;
                Caption = 'Foreign Purchase Quotes';
                RunObject = page "Foreign Purchase Quotes";
            }
            action("Local Purchase Quotes")
            {
                ApplicationArea = All;
                Caption = 'Local Purchase Quotes';
                RunObject = page "Local Purchase Quote List";
            }
            action("RFQ List1")
            {
                Caption = 'RFQ List';
                RunObject = page "RFQ List";
                ApplicationArea = All;
            }
        }
        addlast(Sections)
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
                group(Quotes1)
                {
                    Caption = 'Quote';
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
            }

            group(Item)
            {
                action("Inventory")
                {
                    Caption = 'Items';
                    RunObject = Page "Item List";
                    ApplicationArea = All;
                }
                action("ItemJournal")
                {
                    Caption = 'Item Journal';
                    RunObject = page "Item Journal";
                    ApplicationArea = All;
                }
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

                group("LC Request")
                {
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
        modify("Posted Purchase Receipts")
        {
            Caption = 'Goods Received Notes';
        }
        modify("Posted Return Shipments")
        {
            Visible = false;
        }
        modify("Posted Assembly Orders")
        {
            Visible = false;
        }
        modify("Purchase &Quote")
        {
            Visible = false;
        }
        modify("Purchase &Invoice")
        {
            Visible = false;
        }
        modify("Purchase &Order")
        {
            Visible = false;
        }
        modify("Purchase &Line Discounts")
        {
            Visible = false;
        }
        modify(PurchaseOrders)
        {
            Visible = false;
        }
        modify("Purchase Quotes")
        {
            Visible = false;
        }
        modify("Item Journals")
        {
            Visible = false;
        }
    }
}