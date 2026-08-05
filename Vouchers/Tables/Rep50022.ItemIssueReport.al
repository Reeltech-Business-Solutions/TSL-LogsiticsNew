report 50022 "Item Issue Report"
{
    ApplicationArea = All;
    Caption = 'Item Issuance Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './ItemIssueReReports.rdl';
    //ExcelLayout = 'ItemISsueReports.Xlsx';

    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")

        {
            DataItemTableView = where("Entry Type" = const("Entry Type"::Usage), Type = const(Type::Item));

            column("item_no"; "No.")
            {

            }
            column("item_description"; itemDescription)
            {

            }
            column("item_category"; itemCategory)
            {

            }
            column("service_item"; "Service Item No.")
            {

            }

            column(Job_No_; "Job No.")
            {

            }
            column(FA_No; FANO)
            {

            }



            column(Truck_No; Asset)
            {

            }

            column(last_mileage; odometer)
            {

            }

            column(location; location)
            {

            }

            column(Document_No_; "Document No.")
            {

            }

            column(Unit_Cost; "Unit Cost (LCY)")
            {

            }

            column(Posted_Unit_Cost; "Unit Cost (LCY)")
            {

            }

            column(Posted_Amount; "Amt. Posted to G/L")
            {

            }

            //      column(Posted_Amount; "Line Amount")
            // {

            // }



            column(Line_Amount; "Line Amount")
            {

            }

            column(maintenance_type; "Shortcut Dimension 8 Code")
            {

            }

            column(repair_location; "Shortcut Dimension 4 Code")
            {

            }

            column(maker; maker)
            {

            }

            column(model; model)
            {

            }

            column(matReq; matReq)
            {

            }

            column(counter; counter)
            {

            }

            column(picture; CompanyInfo.Picture)
            {

            }

            column(Flters; GetFilter("Posting Date"))
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }

            column(Quantity; Quantity)
            {

            }

            column(Posted_Quantity; Quantity)
            {

            }

            column("Quantity_variance"; (Quantity - Quantity))
            {

            }






            // column(AppliedEntrytoAdjust; "Applied Entry to Adjust")
            // {
            // }
            // column(AppliestoEntry; "Applies-to Entry")
            // {
            // }
            // column(Area1; "Area")
            // {
            // }
            // column(AssembletoOrder; "Assemble to Order")
            // {
            // }
            // column(CompletelyInvoiced; "Completely Invoiced")
            // {
            // }
            // column(ContractCode; "Contract Code")
            // {
            // }
            // column(Correction; Correction)
            // {
            // }
            // column(CostAmountActual; "Cost Amount (Actual)")
            // {
            // }
            // column(CostAmountActualACY; "Cost Amount (Actual) (ACY)")
            // {
            // }
            // column(CostAmountExpected; "Cost Amount (Expected)")
            // {
            // }
            // column(CostAmountExpectedACY; "Cost Amount (Expected) (ACY)")
            // {
            // }
            // column(CostAmountNonInvtbl; "Cost Amount (Non-Invtbl.)")
            // {
            // }
            // column(CostAmountNonInvtblACY; "Cost Amount (Non-Invtbl.)(ACY)")
            // {
            // }
            // column(CountryRegionCode; "Country/Region Code")
            // {
            // }
            // column(DerivedfromBlanketOrder; "Derived from Blanket Order")
            // {
            // }
            // column(Description; Description)
            // {
            // }
            // column(DimensionSetID; "Dimension Set ID")
            // {
            // }
            // column(DocumentDate; "Document Date")
            // {
            // }
            // column(DocumentLineNo; "Document Line No.")
            // {
            // }
            // column(DocumentNo; "Document No.")
            // {
            // }
            // column(DocumentType; "Document Type")
            // {
            // }
            // column(DriverName; "Driver Name")
            // {
            // }
            // column(DriverNo; "Driver No.")
            // {
            // }
            // column(DropShipment; "Drop Shipment")
            // {
            // }
            // column(EntryNo; "Entry No.")
            // {
            // }
            // column(EntryType; "Entry Type")
            // {
            // }
            // column(EntryExitPoint; "Entry/Exit Point")
            // {
            // }
            // column(ExpirationDate; "Expiration Date")
            // {
            // }
            // column(ExternalDocumentNo; "External Document No.")
            // {
            // }
            // column(GlobalDimension1Code; "Global Dimension 1 Code")
            // {
            // }
            // column(GlobalDimension2Code; "Global Dimension 2 Code")
            // {
            // }
            // column(InvoicedQuantity; "Invoiced Quantity")
            // {
            // }
            // column(ItemCategoryCode; "Item Category Code")
            // {
            // }
            // column(ItemNo; "Item No.")
            // {
            // }
            // column(ItemReferenceNo; "Item Reference No.")
            // {
            // }
            // column(ItemTracking; "Item Tracking")
            // {
            // }
            // column(JobNo; "Job No.")
            // {
            // }
            // column(JobPurchase; "Job Purchase")
            // {
            // }
            // column(JobTaskNo; "Job Task No.")
            // {
            // }
            // column(LastInvoiceDate; "Last Invoice Date")
            // {
            // }
            // column(LocationCode; "Location Code")
            // {
            // }
            // column(LotNo; "Lot No.")
            // {
            // }
            // column(NoSeries; "No. Series")
            // {
            // }
            // column(Nonstock; Nonstock)
            // {
            // }
            // column(Open; Open)
            // {
            // }
            // column(OrderLineNo; "Order Line No.")
            // {
            // }
            // column(OrderNo; "Order No.")
            // {
            // }
            // column(OrderType; "Order Type")
            // {
            // }
            // column(OriginallyOrderedNo; "Originally Ordered No.")
            // {
            // }
            // column(OriginallyOrderedVarCode; "Originally Ordered Var. Code")
            // {
            // }
            // column(OutofStockSubstitution; "Out-of-Stock Substitution")
            // {
            // }
            // column(PRFNo; "PRF No.")
            // {
            // }
            // column(PackageNo; "Package No.")
            // {
            // }
            // column(Positive; Positive)
            // {
            // }
            // column(PostingDate; "Posting Date")
            // {
            // }
            // column(ProdOrderCompLineNo; "Prod. Order Comp. Line No.")
            // {
            // }
            // column(PurchaseAmountActual; "Purchase Amount (Actual)")
            // {
            // }
            // column(PurchaseAmountExpected; "Purchase Amount (Expected)")
            // {
            // }
            // column(PurchasingCode; "Purchasing Code")
            // {
            // }
            // column(QtyperUnitofMeasure; "Qty. per Unit of Measure")
            // {
            // }
            // column(Quantity; Quantity)
            // {
            // }
            // column(RFQNo; "RFQ No.")
            // {
            // }
            // column(AssetNo; AssetNo)
            // {

            // }
            // column(RemainingQuantity; "Remaining Quantity")
            // {
            // }
            // column(ReservedQuantity; "Reserved Quantity")
            // {
            // }
            // column(ReturnReasonCode; "Return Reason Code")
            // {
            // }
            // column(SalesAmountActual; "Sales Amount (Actual)")
            // {
            // }
            // column(SalesAmountExpected; "Sales Amount (Expected)")
            // {
            // }
            // column(SerialNo; "Serial No.")
            // {
            // }
            // column(ShippedQtyNotReturned; "Shipped Qty. Not Returned")
            // {
            // }
            // column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            // {
            // }
            // column(ShortcutDimension4Code; "Shortcut Dimension 4 Code")
            // {
            // }
            // column(ShortcutDimension5Code; "Shortcut Dimension 5 Code")
            // {
            // }
            // column(ShortcutDimension6Code; "Shortcut Dimension 6 Code")
            // {
            // }
            // column(ShortcutDimension7Code; "Shortcut Dimension 7 Code")
            // {
            // }
            // column(ShortcutDimension8Code; "Shortcut Dimension 8 Code")
            // {
            // }
            // column(ShptMethodCode; "Shpt. Method Code")
            // {
            // }
            // column(SourceNo; "Source No.")
            // {
            // }
            // column(SourceType; "Source Type")
            // {
            // }
            // column(SystemCreatedAt; SystemCreatedAt)
            // {
            // }
            // column(SystemCreatedBy; SystemCreatedBy)
            // {
            // }
            // column(SystemId; SystemId)
            // {
            // }
            // column(SystemModifiedAt; SystemModifiedAt)
            // {
            // }
            // column(SystemModifiedBy; SystemModifiedBy)
            // {
            // }
            // column(TransactionSpecification; "Transaction Specification")
            // {
            // }
            // column(TransactionType; "Transaction Type")
            // {
            // }
            // column(TransportMethod; "Transport Method")
            // {
            // }
            // column(TruckNo; "Truck No.")
            // {
            // }
            // column(ItemDescrp; ItemDescrp)
            // {

            // }
            // column(UnitofMeasureCode; "Unit of Measure Code")
            // {
            // }
            // column(VariantCode; "Variant Code")
            // {
            // }
            // column(WarrantyDate; "Warranty Date")
            // {
            // }
            // column(QTY; QTY)
            // {

            // }
            // column(UnitCost; UnitCost)
            // {

            // }
            // column(VehicleMake; VehicleMake)
            // {

            // }
            // column(BadPart; BadPart)
            // {

            // }
            // column(VehicleMake2; VehicleMake2)
            // {

            // }

            // column(Vehiclemodel; Vehiclemodel)
            // {

            // }
            // column(Reason; Reason)
            // {

            // }
            // column(ContractName2; ContractName2)
            // {

            // }
            // column(Flters; ItemLedgerEntry.GetFilter("Posting Date"))
            // {

            // }




            // trigger OnPreDataItem()
            // begin
            //     SetFilter("Entry Type", '%1', "Entry Type"::"Negative Adjmt.");

            // end;

            trigger OnAfterGetRecord()

            begin




                // QTY := 0;
                // UnitCost := 0;
                // Clear(VehicleMake);
                // Clear(Reason);
                // Clear(BadPart);

                counter += 1;

                if items.GET("No.") then begin
                    itemDescription := items.Description;
                    itemCategory := items."Item Category Code"

                end;

                if job.Get("Job No.") then begin
                    FANO := job."Service Vehicle";
                    Asset := job."FLeet No.";
                    odometer := job."KM Odometer Reading";
                    maker := job."Vehicle/Equipment Make";
                    model := job."Vehicle/Equipment Model";
                    location := job."Location Codes";

                end;

                if pmIssue.Get("Document No.") then
                    MatReq := PmIssue."Material Request No.";



                // pstdStoreIssueHeader.Reset();
                // pstdStoreIssueHeader.setRange("Job No.", "Job No.");

                // if pstdStoreIssueHeader.FindFirst() then


            end;

            trigger onPreDataItem()
            begin
                companyInfo.Get();
                companyInfo.CalcFields(Picture);
            end;





            // if FixAsst.Get("Truck No.") then
            //     AssetNo := FixAsst."Asset Type No.";
            // if
            //    ItemSD.Get("Item No.") then
            //     ItemDescrp := ItemSD.Description;

            // If ContractName.Get("Contract Code") then
            //     ContractName2 := ContractName."Contract Name";

            // if
            // FixAsst.Get(FixAsst."No.") then
            //     VehicleMake2 := FixAsst."Vehicle Make";
            // if
            //                 FixAsst.Get(FixAsst."No.") then
            //     Vehiclemodel := FixAsst."Vehicle Model";

            // InvLineRec.Reset();
            // InvLineRec.SetFilter("Document No.", '%1', ItemLedgerEntry."Document No.");
            // InvLineRec.SetFilter("Item No.", '%1', ItemLedgerEntry."Item No.");
            // if InvLineRec.FindFirst() then begin
            //     QTY := InvLineRec.Quantity;
            //     UnitCost := InvLineRec."Unit Cost";
            //     BadPart := Format(InvLineRec."Bad Part Provided");
            //     Reason := InvLineRec."Reason for Non Prov.";

            //     ContractLineRec.Reset();
            //     ContractLineRec.SetFilter("Document No.", '%1', InvLineRec."Contract No.");
            //     ContractLineRec.SetFilter("Truck Code", '%1', InvLineRec."Trucks code");
            //     if ContractLineRec.FindFirst() then begin
            //         VehicleMake := ContractLineRec."Truck Type";
            //     end;
            //     end;



            // end;


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


        items: Record Item;
        itemDescription: Text;
        itemCategory: Text;
        Asset: Code[30];
        serviceItem: Record "service item";
        job: Record Job;
        FANO: code[30];
        odometer: Decimal;
        maker: code[20];
        model: code[20];
        location: code[20];
        pstdStoreIssueHeader: Record "Posted Store Issue Header";
        counter: integer;
        companyInfo: Record "Company Information";
        DocumentNo: code[20];
        pmIssue: Record "Posted Store Issue Header";
        matReq: code[30];


    // TruckProperty : Record 




}
