report 50012 "Receipts Per Purchase Requisit"
{
    Caption = 'Receipts Per Purchase Requisition';
    DefaultLayout = RDLC;
    RDLCLayout = './ReceiptPerPurchRequisit.rdl';
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            column(No_; "No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(CompanyInfoName; CompanyInfo.Name)
            {
            }
            column(CompanyInfoAdd; CompanyInfo.Address)
            {
            }
            column(CompanyInfoAdd2; CompanyInfo."Address 2")
            {
            }
            column(CompanyInfoPicture; CompanyInfo.Picture)
            {
            }

            dataitem(PurchRcptLine; "Purch. Rcpt. Line")
            {
                DataItemLink = "Document No." = field("No.");

                column(OrderNo; "Order No.")
                {
                }
                column(OrderDate; "Order Date")
                {
                }
                column(DocumentNo; "Document No.")
                {
                }
                column(PostingDate; "Posting Date")
                {
                }
                column(ExpectedReceiptDate; "Expected Receipt Date")
                {
                }
                column(Type; "Type")
                {
                }
                column(No; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(RFQ_No_; "RFQ No.")
                {
                }
                column(PRF_No_; "PRF No.")
                {
                }
                column(Order_No_; "Order No.")
                {
                }
                column(ItemCategoryCode; "Item Category Code")
                {
                }
                column(UnitofMeasure; "Unit of Measure")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(UnitCost; "Unit Cost")
                {
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        CompanyInfo.GET;
        CompanyInfo.CALCFIELDS(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        TotalAmount: Decimal;

}
