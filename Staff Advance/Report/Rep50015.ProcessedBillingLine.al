report 50015 "Processed Billing Line"
{
    ApplicationArea = All;
    Caption = 'Processed NBLPC';
    DefaultLayout = RDLC;
    RDLCLayout = './Truck Transaction NBLPC.rdl';
    UsageCategory = Lists;
    dataset
    {

        dataitem(ProcessedBillingLine; "Processed Billing Line")
        {
            // CalcFields = "Debit Amount", "Credit Amount", Amount, "Amount (LCY)";
            DataItemTableView = SORTING("Batch Entry No.");

            RequestFilterFields = "Transaction Date", "Contract Id", "Date Filter";

            column(ActualJourneyTime; "Actual Journey Time")
            {
            }
            column(Arrivaltimeatloadingpoint; "Arrival time at loading point")
            {
            }
            column(ArrivalTimeatOffloadingPoint; "ArrivalTime at OffloadingPoint")
            {
            }
            column(AvaialabilityPerTruckNoDays; "AvaialabilityPer Truck No.Days")
            {
            }
            column(BatchEntryNo; "Batch Entry No.")
            {
            }
            column(ContractId; "Contract Id")
            {

            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(DepartureTimefromLoadingPoint; "DepartureTimefrom LoadingPoint")
            {
            }
            column(DepartureTimefromOfloadinPoint; DepartureTimefromOfloadinPoint)
            {
            }
            column(DirectDispatch; "Direct Dispatch")
            {
            }
            column(DistanceCoveredKm; "Distance Covered Km")
            {
            }
            column(DriversCode; "Drivers Code")
            {
            }
            column(DriversName; "Drivers Name")
            {
            }
            column(EntryNo; "Entry No.")
            {
            }
            column(ExpectedJourneyTime; "Expected Journey Time")
            {
            }
            column(FixedCost; "Fixed Cost")
            {
            }
            column(FixedRate; "Fixed Rate")
            {
            }
            column(LoadingDelayCost; "Loading Delay Cost")
            {
            }
            column(LocationDestination; "Location Destination")
            {
            }
            column(NoofDays; "No of Days")
            {
            }
            column(OffLoadDepot; "Off Load Depot")
            {
            }
            column(ProductType; "Product Type")
            {
            }
            column(Quantity; Quantity)
            {
            }
            column(QuantityLoadedNetWgtKg; "Quantity Loaded NetWgt Kg")
            {
            }
            column(QuantityOffloadedKg; "Quantity Offloaded Kg")
            {
            }
            column(ResidencyTimeatloadingpoint; "ResidencyTime at loading point")
            {
            }
            column(ResidencyTimeatoffloadingpoint; ResidencyTimeatoffloadingpoint)
            {
            }
            column(SalesDocumentNo; "Sales Document No.")
            {
            }
            column(Shortages; Shortages)
            {
            }
            column(ShortagesAmount; "Shortages Amount")
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
            column(ToleranceKG; "Tolerance KG")
            {
            }
            column(TransactionDate; "Transaction Date")
            {
            }
            column(Treated; Treated)
            {
            }
            column(TruckId; "Truck Id")
            {
            }
            column(TruckNo; "Truck No.")
            {
            }
            column(TruckType; "Truck Type")
            {
            }
            column(UnitOfMeasure; "Unit Of Measure")
            {
            }
            column(UserId; "User Id")
            {
            }
            column(VariableCost; "Variable Cost")
            {
            }
            column(VariableRate; "Variable Rate")
            {
            }
            column(WayBillNo; "WayBill No.")
            {
            }
            column(TruckIdNo; TruckNo)
            {
            }
            column(Nodays; Nodays)
            {
            }
            column(FixedRateAmount; FixedRate)
            {
            }
            column(TotalAmount; TotalAmount)
            {
            }
            column(K; k)
            {
            }
            column(FixedAmount; FixedAmount)
            {
            }
            column(VariableAmount; VariableAmount)
            {
            }
            // column(FixedCostAmount; FixedCostAmount)
            // {
            // }
            // column(VariableCostAmon; VariableCostAmon)
            // {
            // }



            trigger OnAfterGetRecord()



            begin
                ContractId := GetFilter("Contract Id");
                TruckNo := '';
                NoDays := 0;
                TotalAmount := 0;
                FixedRate := 0;
                //  VariableCostAmon :=0;
                i := 1;



                ContractAgreement.Reset();
                ContractAgreement.SetRange("No.", ContractId);
                if ContractAgreement.FindFirst() then
                    ContractLine.Reset();
                ContractLine.SetCurrentKey("Document No.");
                ContractLine.SetRange("Document No.", ContractAgreement."No.");
                ContractLine.SetRange("Truck Code", "Truck No.");
                if ContractLine.FindFirst() then begin
                    repeat

                        k := K + 1;

                        //  if ContractLine."Truck Code" <> '' then begin
                        //     BillingLineSum.Reset();
                        //         BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                        //         BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                        //         BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                        //         BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                        //         BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter") , Getrangemax("Date Filter"));
                        //         if BillingLineSum.FindFirst() then begin
                        // repeat
                        //until BillingLineSum.Next = 0;
                        TruckNo := "Truck NO.";
                        NoDays := "AvaialabilityPer Truck No.Days";
                        TotalAmount := "Fixed Cost";
                        FixedRate := "Fixed Rate";
                        FixedCostAmount[k + 1] := FixedCostAmount[k] + "Fixed Cost";
                        VariableCostAmount[k + 1] := VariableCostAmount[k] + "Variable Cost";
                        FixedAmount := FixedCostAmount[k + 1];
                        VariableAmount := VariableCostAmount[k + 1]




                    //89
                    //   end; 
                    //    end; 

                    Until ContractLine.Next = 0;
                    // FixedAmount := FixedCostAmount[k + 1];
                    // VariableAmount := VariableCostAmount[k + 1]
                end;




            end;

            trigger OnPreDataItem()

            begin
                VariableAmount := 0;
                FixedAmount := 0;

                For i := 1 to 250 do begin
                    FixedCostAmount[i] := 0;
                    VariableCostAmount[i] := 0;
                end;
                // k := 0;
                //     FixedCostAmount := 0;
                // VariableCostAmon := 0;
                // FixedAmount := 0;
                // VariableAmount := 0;

                //   ContractAgreement.Reset();
                // ContractAgreement.SetRange("No.", ContractId);
                // if ContractAgreement.FindFirst() then
                //     ContractLine.Reset();
                // ContractLine.SetCurrentKey("Document No.");
                // ContractLine.SetRange("Document No.", ContractAgreement."No.");
                // ContractLine.SetRange("Truck Code", "Truck No.");
                // if ContractLine.FindFirst() then begin
                //     repeat

                         k := 0;

                //          if ContractLine."Truck Code" <> '' then begin
                //             BillingLineSum.Reset();
                //                 BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                //                 BillingLineSum.SetRange("Contract Id", ContractLine."Document No.");
                //                 BillingLineSum.SetRange("Truck Type", ContractLine."Truck Type");
                //                 BillingLineSum.SetRange("Truck No.", ContractLine."Truck Code");
                //                 BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter") , Getrangemax("Date Filter"));
                //                 if BillingLineSum.FindFirst() then begin
                //         //repeat


                //      //   until BillingLineSum.Next = 0;


                //                                FixedCostAmount += BillingLineSum."Fixed Cost";
                //                                VariableCostAmon += BillingLineSum."Variable Cost";



                //     //89
                //        end; 
                //         end; 

                //     Until ContractLine.Next = 0;
                // end;





            end;

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
        ContractId: code[20];
        TruckNo: Code[20];
        Nodays: Decimal;
        FixedRate: Decimal;
        TotalAmount: decimal;
        i: Integer;
        K: Integer;
        BillingProcessed: Record "Processed Billing Line";
        ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        BillingLineSum: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        FixedCostAmount: array[250] of Decimal;
        VariableCostAmount: array[250] of Decimal;
        FixedAmount: Decimal;
        VariableAmount: Decimal;
}
