report 50021 "Store Issue Report"
{
    ApplicationArea = All;
    Caption = 'Store Issue Report';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './StoreMaterialRequests.rdl';
    dataset
    {
        dataitem(InvVoucherHeader; "Inv.Voucher Header")
        {
            column(Amount; Amount)
            {
            }
            column(CreatedBy; "Created By")
            {
            }
            column(CreatedByDate; "Created By Date")
            {
            }
            column(CreatedByName; "Created By Name")
            {
            }
            column(CreatedTime; "Created Time")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(DocumentStatus; "Document Status")
            {
            }
            column(DocumentType; "Document Type.")
            {
            }
            column(LocationCode; "Location Code")
            {
            }
            column(ModifiedBy; "Modified By")
            {
            }
            column(ModifiedByName; "Modified By Name")
            {
            }
            column(ModifiedDate; "Modified Date")
            {
            }
            column(ModifiedTime; "Modified Time")
            {
            }
            column(Narration; Narration)
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(PostedBy; "Posted By")
            {
            }
            column(PostedByName; "Posted By Name")
            {
            }
            column(PostedDate; "Posted Date")
            {
            }
            column(PostedTime; "Posted Time")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PreAssignedNo; "Pre Assigned No.")
            {
            }
            column(ReleasedBy; "Released By")
            {
            }
            column(ReleasedDate; "Released Date")
            {
            }
            column(ShortcutDimensioncode1; "Shortcut Dimension code 1")
            {
            }
            column(ShortcutDimensioncode2; "Shortcut Dimension code 2")
            {
            }
            column(Status; Status)
            {
            }
            column(SystemCreatedAt; SystemCreatedAt)
            {
            }
            column(SystemCreatedBy; SystemCreatedBy)
            {
            }
            column(SystemId; SystemId)
            {
            }
            column(SystemModifiedAt; SystemModifiedAt)
            {
            }
            column(SystemModifiedBy; SystemModifiedBy)
            {
            }
            column(VoucherType; "Voucher Type")
            {
            }
            dataitem("Inventory Line"; "Inv. Voucher Line")
            {
                DataItemLink = "Document No." = field("Document No.");

                column(Item_No_; "Item No.") { }
                column(Description; Description) { }
                column(Narration1; Narration) { }
                column(Location_Code; "Location Code") { }
                column(Quantity; Quantity) { }
                column(Unit_of_Measure_Code; "Unit of Measure Code") { }
                column(Unit_Cost; "Unit Cost") { }
                column(Posting_Date; "Posting Date") { }
                column(Quantity_in_Location; "Quantity in Location") { }
                column(Amount1; Amount)
                {

                }
                column(AmountVar; AmountVar)
                {

                }
                trigger OnAfterGetRecord()
                begin
                    AmountVar := 0;

                    AmountVar := "Inventory Line".Quantity * "Inventory Line"."Unit Cost";

                end;


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
    var

        AmountVar: Decimal;
}
