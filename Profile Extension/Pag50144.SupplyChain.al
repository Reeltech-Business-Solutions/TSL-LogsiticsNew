
page 50144 "Supply Chain Agent Role Center"
{
    Caption = 'Supply Chain Agent', Comment = '{Dependency=Match,"ProfileDescription_SUPPLYCHAIN"}';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            part(ApprovalsActivities; "Approvals Activities")
            {
                ApplicationArea = Suite;
            }

        }
    }

    actions
    {
        area(reporting)
        {
            action("Vendor - T&op 10 List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor - T&op 10 List';
                Image = "Report";
                RunObject = Report "Vendor - Top 10 List";
                ToolTip = 'View a list of the vendors from whom you purchase the most or to whom you owe the most.';
            }
            action("Vendor/&Item Purchases")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Vendor/&Item Purchases';
                Image = "Report";
                RunObject = Report "Vendor/Item Purchases";
                ToolTip = 'View a list of item entries for each vendor in a selected period.';
            }
            separator(Action28)
            {
            }
            action("Inventory - &Availability Plan")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory - &Availability Plan';
                Image = ItemAvailability;
                RunObject = Report "Inventory - Availability Plan";
                ToolTip = 'View a list of the quantity of each item in customer, purchase, and transfer orders and the quantity available in inventory. The list is divided into columns that cover six periods with starting and ending dates as well as the periods before and after those periods. The list is useful when you are planning your inventory purchases.';
            }
            action("Inventory &Purchase Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory &Purchase Orders';
                Image = "Report";
                RunObject = Report "Inventory Purchase Orders";
                ToolTip = 'View a list of items on order from vendors. The report also shows the expected receipt date and the quantity and amount on back orders. The report can be used, for example, to see when items should be received and whether a reminder of a back order should be issued.';
            }
            action("Inventory - &Vendor Purchases")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory - &Vendor Purchases';
                Image = "Report";
                RunObject = Report "Inventory - Vendor Purchases";
                ToolTip = 'View a list of the vendors that your company has purchased items from within a selected period. It shows invoiced quantity, amount and discount. The report can be used to analyze a company''s item purchases.';
            }
            action("Inventory &Cost and Price List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory &Cost and Price List';
                Image = "Report";
                RunObject = Report "Inventory Cost and Price List";
                ToolTip = 'View price information for your items or stockkeeping units, such as direct unit cost, last direct cost, unit price, profit percentage, and profit.';
            }
        }
        area(embedding)
        {
            action("Diesel Issue Out")
            {
                ApplicationArea = All;
                Caption = 'Diesel Issue Out';
                RunObject = page "Item Journal";
                Visible = false;
            }
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
            action("RFQ List")
            {
                Caption = 'RFQ List';
                RunObject = page "RFQ List";
                ApplicationArea = All;
            }

            action("Purchase Credit Memos")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Credit Memos';
                RunObject = Page "Purchase Credit Memos";
                ToolTip = 'Create purchase credit memos to mirror sales credit memos that vendors send to you for incorrect or damaged items that you have paid for and then returned to the vendor. If you need more control of the purchase return process, such as warehouse documents for the physical handling, use purchase return orders, in which purchase credit memos are integrated. Purchase credit memos can be created automatically from PDF or image files from your vendors by using the Incoming Documents feature. Note: If you have not yet paid for an erroneous purchase, you can simply cancel the posted purchase invoice to automatically revert the financial transaction.';
            }
            action("Sales Orders")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Sales Orders';
                Image = "Order";
                RunObject = Page "Sales Order List";
                ToolTip = 'Record your agreements with customers to sell certain products on certain delivery and payment terms. Sales orders, unlike sales invoices, allow you to ship partially, deliver directly from your vendor to your customer, initiate warehouse handling, and print various customer-facing documents. Sales invoicing is integrated in the sales order process.';
            }
            action("Local Vendors")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Local Vendors';
                Image = Vendor;
                RunObject = Page " Vendor Local List";
                ToolTip = 'View or edit detailed information for the Local vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action("Foreign Vendors")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Foreign Vendors';
                Image = Vendor;
                RunObject = Page " Vendor Foreign List";
                ToolTip = 'View or edit detailed information for the Foreign vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action(Items)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Items';
                Image = Item;
                RunObject = Page "Item List";
                ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labour time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Purchase Analysis Reports")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Analysis Reports';
                RunObject = Page "Analysis Report Purchase";
                RunPageView = WHERE("Analysis Area" = FILTER(Purchase));
                ToolTip = 'Analyze the dynamics of your purchase volumes. You can also use the report to analyze your vendors'' performance and purchase prices.';
            }
            action("Inventory Analysis Reports")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Inventory Analysis Reports';
                RunObject = Page "Analysis Report Inventory";
                RunPageView = WHERE("Analysis Area" = FILTER(Inventory));
                ToolTip = 'Analyze the dynamics of your inventory according to key performance indicators that you select, for example inventory turnover. You can also use the report to analyze your inventory costs, in terms of direct and indirect costs, as well as the value and quantities of your different types of inventory.';
            }
            action("Item Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item Journals';
                RunObject = Page "Item Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Item),
                                    Recurring = CONST(false));
                ToolTip = 'Post item transactions directly to the item ledger to adjust inventory in connection with purchases, sales, and positive or negative adjustments without using documents. You can save sets of item journal lines as standard journals so that you can perform recurring postings quickly. A condensed version of the item journal function exists on item cards for quick adjustment of an items inventory quantity.';
            }
            action("Purchase Journals")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase Journals';
                RunObject = Page "General Journal Batches";
                RunPageView = WHERE("Template Type" = CONST(Purchases),
                                    Recurring = CONST(false));
                ToolTip = 'Post any purchase-related transaction directly to a vendor, bank, or general ledger account instead of using dedicated documents. You can post all types of financial purchase transactions, including payments, refunds, and finance charge amounts. Note that you cannot post item quantities with a purchase journal.';
            }
            action(RequisitionWorksheets)
            {
                ApplicationArea = Planning;
                Caption = 'Requisition Worksheets';
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
            }

        }
        area(sections)
        {
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                Image = FiledPosted;
                action("Posted Purchase Receipts")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Receipts';
                    RunObject = Page "Posted Purchase Receipts";
                    ToolTip = 'Open the list of posted purchase receipts.';
                }
                action("Posted Purchase Invoices")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Invoices';
                    RunObject = Page "Posted Purchase Invoices";
                    ToolTip = 'Open the list of posted purchase invoices.';
                }

                action("Posted Purchase Credit Memos")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Posted Purchase Credit Memos';
                    RunObject = Page "Posted Purchase Credit Memos";
                    ToolTip = 'Open the list of posted purchase credit memos.';
                }
                action("Purchase Requisition Archives")
                {
                    Caption = 'Purchase Requisition Archives';
                    RunObject = page "Purchase Requisition Archives";
                    ApplicationArea = All;
                }
            }
            group("Purchase")
            {
                group(Requisition)
                {
                    action("Purchase Local Req List")
                    {
                        Caption = 'Purchase Requisition(Local)';
                        RunObject = page "Purchase Local Req List";
                        ApplicationArea = All;
                    }
                    action("Purchase Foreign Req List")
                    {
                        Caption = 'Purchase Requisition(Foreign)';
                        RunObject = page "Purchase Foreign Req List";
                        ApplicationArea = All;
                    }
                    action("Approved Purchase Requisition")
                    {
                        RunObject = page "Approved Purchase Req.";
                        ApplicationArea = All;
                        Visible = false;
                    }

                    action("Approved Req-PRO")
                    {
                        Caption = 'Purchase Requisition Approved List';
                        RunObject = page "Approved Req-PRO";
                        ApplicationArea = All;
                        Visible = false;
                    }

                }
                group("Purchase Quotes1")
                {
                    Caption = 'Purchase Quotes';
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
                    action("Purchase Credit Memo")
                    {
                        RunObject = page "Purchase Credit Memos";
                        ApplicationArea = All;
                    }
                }
                action("Charge Invoices")
                {
                    Caption = 'Charge Invoices';
                    RunObject = Page "Charge Invoices";
                    ApplicationArea = All;
                    Visible = false;
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
                    action("Import Files")
                    {
                        RunObject = page "Import Files";
                        ApplicationArea = All;
                    }
                }

            }
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
            group("Sales")
            {
                action("Sales Invoices")
                {
                    Caption = 'Sales Invoices';
                    RunObject = page "Sales Invoice List";
                    ApplicationArea = All;
                }
                action("Sales Orders1")
                {
                    Caption = 'Sales Orders';
                    RunObject = page "Sales Order List";
                    ApplicationArea = All;
                }
                action("Customers")
                {
                    Caption = 'Customers';
                    RunObject = page "Customer List";
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
        area(creation)
        {

            action("Purchase Requisition(Local)")
            {
                Caption = 'Purchase Requisition(Local)';
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
                RunPageMode = Create;
                ToolTip = 'Make a new Foreign Purchase requisition.';
            }
        }
        area(processing)
        {
            separator(Tasks)
            {
                Caption = 'Tasks';
                IsHeader = true;
            }
            action("&Purchase Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Purchase Journal';
                Image = Journals;
                RunObject = Page "Purchase Journal";
                ToolTip = 'Post purchase transactions directly to the general ledger. The purchase journal may already contain journal lines that are created as a result of related functions.';
            }
            action("Item &Journal")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Item &Journal';
                Image = Journals;
                RunObject = Page "Item Journal";
                ToolTip = 'Adjust the physical quantity of items on inventory.';
            }
            action("Order Plan&ning")
            {
                ApplicationArea = Planning;
                Caption = 'Order Plan&ning';
                Image = Planning;
                RunObject = Page "Order Planning";
                ToolTip = 'Plan supply orders order by order to fulfill new demand.';
            }
            separator(Action38)
            {
            }
            action("Requisition &Worksheet")
            {
                ApplicationArea = Planning;
                Caption = 'Requisition &Worksheet';
                Image = Worksheet;
                RunObject = Page "Req. Wksh. Names";
                RunPageView = WHERE("Template Type" = CONST("Req."),
                                    Recurring = CONST(false));
                ToolTip = 'Calculate a supply plan to fulfill item demand with purchases or transfers.';
            }
            action("Pur&chase Prices")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Pur&chase Prices';
                Image = Price;
                RunObject = Page "Purchase Prices";
                ToolTip = 'View or set up different prices for items that you buy from the vendor. An item price is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
            }
            action("Purchase &Line Discounts")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Purchase &Line Discounts';
                Image = LineDiscount;
                RunObject = Page "Purchase Line Discounts";
                ToolTip = 'View or set up different discounts for items that you buy from the vendor. An item discount is automatically granted on invoice lines when the specified criteria are met, such as vendor, quantity, or ending date.';
            }
            separator(History)
            {
                Caption = 'History';
                IsHeader = true;
            }
            action("Navi&gate")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Find entries...';
                Image = Navigate;
                RunObject = Page Navigate;
                ShortCutKey = 'Shift+Ctrl+I';
                ToolTip = 'Find entries and documents that exist for the document number and posting date on the selected document. (Formerly this action was named Navigate.)';
            }
        }
    }
}

