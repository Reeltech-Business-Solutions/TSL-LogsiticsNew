report 50030 "Truck Total TSL detail"
{
    ApplicationArea = All;
    Caption = 'TOTALTSL Detail  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction Detail TOTALTSL.rdl';
    UsageCategory = Lists;
    dataset
    {
        dataitem(ContractAgreement; "Contract Agreement")
        {
            RequestFilterFields = "No.", "Date Filter";
            column(No; "No.")
            {
            }
            column(CustomerCode; "Customer Code")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(CustomerAddress; "Customer Address")
            {
            }
            column(ContractDate; "Contract Date")
            {
            }
            column(Phone; Phone)
            {
            }
            column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
            {
            }
            column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
            {
            }
            column(RevenueCalcCode; "Revenue Calc. Code")
            {
            }
            column(VehicleCount; "Vehicle Count")
            {
            }
            column(ContractType; "Contract Type")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(Status; Status)
            {
            }
            column(FormularType; "Formular Type")
            {
            }
            column(TargetAvailability; "Target Availability")
            {
            }
            column(UnitOfMeasure; "Unit Of Measure")
            {
            }
            column(UseNonAvailEntry; "Use Non-Avail. Entry")
            {
            }
            column(ContractGroup; "Contract Group")
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
            dataitem("Contract Line"; "Contract Line")
            {
                // DataItemTableView = WHERE("Document No." = "No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                DataItemLink = "Document No." = FIELD("No."), "Date Filter" = Field("Date Filter");
                // DataItemLinkReference = "Contract Agreement";
                // RequestFilterFields = "Document Type", "No.";
                // RequestFilterHeading = 'Sales Document';

                column(DocumentNo; "Contract Line"."Document No.")
                {
                }
                column(TruckCode; "Contract Line"."Truck Code")
                {
                }
                column(TruckType; "Contract Line"."Truck Type")
                {
                }
                column(TruckId; "Contract Line"."Asset Tin No.")
                {
                }
                column(TruckNo; TruckNo)
                {
                }
                column(Truck_No_; "Contract Line"."Asset Registration No.")
                {
                }
                column(NoDays; NoDays)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(AssetTinNo; "Contract Line"."Asset Tin No.")
                {
                }
                column(FixedRate; FixedRate)
                {
                }
                column(i; i)
                {
                }
                column(VariableAmount; VariableAmount)
                {
                }
                column(VariableRate; VariableRate)
                {
                }
                column(ItemDescription; ItemDescription)
                {
                }
                column(TruckCapacity; TruckCapacity)
                {
                }
                column(Qty; Qty)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    i := 0;
                    //ContractAgreement.Reset();
                    // ContractAgreement.SetRange("No.", "Contract Id");
                    // if ContractAgreement.FindFirst() then

                    // ContractLine.Reset();
                    //   ContractLine.SetCurrentKey("Document No.");
                    //   ContractLine.SetRange("Document No.", "No.");
                    //  if ContractLine.FindFirst() then begin
                    //     repeat
                    //    TruckNo :='';
                    //   NoDays := 0;
                    //   TotalAmount := 0;
                    FixedRate := 0;
                    //    Location.SetRange(Code);
                    //    if Location.FindFirst() then
                    //    repeat

                    if "Truck Code" <> '' then begin
                        BillingLineSum.Reset();
                        BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                        BillingLineSum.SetRange("Contract Id", "Document No.");
                        BillingLineSum.SetRange("Truck Type", "Truck Type");
                        BillingLineSum.SetRange("Truck No.", "Truck Code");
                        BillingLineSum.SetFilter(Treated, '%1', true);
                        BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                        if BillingLineSum.FindFirst() then begin
                            repeat
                                //until BillingLineSum.Next = 0;
                                i += 1;

                                FixedPricePeLoca.Reset();
                                FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                //       FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                if FixedPricePeLoca.FindFirst() then begin
                                    repeat


                                        BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                        BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                        PricePerLoc := FixedPricePeLoca."Fixed Price";
                                        FixedRate += PricePerLoc;

                                    Until FixedPricePeLoca.Next = 0;

                                end;



                            //     TruckNo := BillingLineSum."Truck NO.";
                            //   //  NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                            //     TotalAmount := BillingLineSum."Fixed Cost";
                            //     FixedRate := BillingLineSum."Fixed Rate";
                            //     VariableAmount := BillingLineSum."Variable Cost";
                            //     VariableRate := BillingLineSum."Variable Rate";
                            //     ItemDescription := BillingProcessed."Item Description";
                            //     Qty := BillingLineSum.Quantity;
                            //   i += y;


                            until BillingLineSum.Next = 0;
                        end;
                    end;

                    ///Until ContractLine.Next = 0;
                    //        end;

                end;

                trigger OnPreDataItem()
                begin
                    // y := 1;
                    // i := 0;
                    // TruckNo := '';
                    // NoDays := 0;
                    // TotalAmount := 0;
                    // FixedRate := 0;
                    // VariableAmount := 0;
                    // ItemDescription := '';
                    // TruckCapacity := '';
                    // VariableRate := 0;
                    // Qty := 0;
                    //ContractID := getfilter(ContractAgreement."No.");
                end;

            }
            dataitem("Processed Billing Line"; "Processed Billing Line")
            {
                DataItemLink = "Contract Id" = FIELD("No."), "Date Filter" = Field("Date Filter");
                column(Transaction_Date; "Transaction Date")
                { }
                column("Truck_Number"; "Truck Id")
                { }
                column(Trip_No_; "Trip No.")
                { }
                column(Trip_Based; TripBased)
                { }
                column(SMR_Number; "SMR Number")
                { }
                column(Drivers_Code; "Drivers Code")
                { }
                column(Customer_Name; "Customer Name")
                { }
                column(Direct_Dispatch; "Direct Dispatch")
                { }
                column(Location_Destination; "Location Destination")
                { }
                column(Product_Type; "Product Type")
                { }
                column(Quantity_Loaded; Quantity)
                { }
                column(Shortages_quantity; Shortages)
                { }
                column(Quantity_Delivered; "Quantity Offloaded Kg")
                { }
                column(New_Rate; NewRate)
                { }
                column(TotalAmountTrip; TotalAmountTrip)
                { }
                column(CuminativAmount; CuminativAmount)
                { }
                column(BusinessType; BusinessType)
                { }
                column(Drivers_Name; "Drivers Name")
                { }
                column(City; City)
                { }
                column(Source_Location_Name; "Source Location Name")
                { }
                column(Destination_Location_Name; "Destination Location Name")
                { }
                trigger OnAfterGetRecord()
                begin
                    NewRate := 0;

                    TripBased := 0;
                    //         FixedPricePeLoca.Reset();
                    //         FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                    //         FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                    //         FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                    //         FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                    //  //       FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                    //         if FixedPricePeLoca.FindFirst() then begin
                    //             repeat


                    //                 BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                    //                 BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                    //                 PricePerLoc := FixedPricePeLoca."Fixed Price";
                    //                 FixedRate += PricePerLoc;

                    //             Until FixedPricePeLoca.Next = 0;

                    //         end;


                    BillingVariableAmt := Quantity * "Fixed Rate";
                    NewRate := "Fixed Rate";
                    CuminativAmount += BillingVariableAmt;
                    TripBased := 1;
                    // PricePerLoc := FixedPricePeLoca."Fixed Price";
                    //  FixedRate += PricePerLoc;

                    //  Until FixedPricePeLoca.Next = 0;

                    //  end;


                end;

                trigger OnPreDataItem()
                begin
                    CuminativAmount := 0;
                    //BillingVariableAmt := 0;
                end;




            }

            trigger OnAfterGetRecord()
            begin





            end;


            trigger OnPreDataItem()
            begin
                ContractID := getfilter(ContractAgreement."No.");
                // StartDate := GetFilter(ContractAgreement."Date Filter");
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
        //     BillingProcessed: Record "Processed Billing Line";
        //    // ContractAgreement: Record "Contract Agreement";
        //     ContractLine: Record "Contract Line";
        //     BillingLineSum: Record "Processed Billing Line";
        //     ProcessedBillingLineFixed: Record "Processed Billing Line";
        //     TruckNo: Code[20];
        //     Nodays: Decimal;
        //     FixedRate: Decimal;
        //     TotalAmount: decimal;
        //     i:Integer;
        //     FixedCostAmount: Decimal;
        //     VariableCostAmount: Decimal;
        //     FixedAmount: Decimal;
        //     VariableAmount: Decimal;
        //     y:Integer;
        //     ItemDescription: Text[150];
        //     TruckCapacity:Text[20];
        //     VariableRate:Decimal;
        //     Qty:Decimal;
        ContractID: Code[20];
        StartDate: Date;
        Enddate: Date;
        BillingProcessed: Record "Processed Billing Line";
        // ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        BillingLineSum: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        TruckNo: Code[20];
        Nodays: Decimal;
        TotalAmount: decimal;
        i: Integer;
        //  t:Integer;
        FixedCostAmount: Decimal;
        VariableCostAmount: Decimal;
        FixedAmount: Decimal;
        VariableAmount: Decimal;
        y: Integer;
        j: Integer;
        ItemDescription: Text[150];
        TruckCapacity: Text[20];
        VariableRate: Decimal;
        Qty: Decimal;
        TruckAvaiCount: Decimal;
        NodaysAvailable: Decimal;
        TotalTruckAvail: Decimal;
        TotalTruckAvailValue: Decimal;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        MillageRange: Record "Millage Range Controls";
        BillingLine: Record "Billing Line";
        BillingLineUpdate: Record "Billing Line";
        transactionBuffer: Record "Transaction Buffer";
        transactionBuffSum: Record "Transaction Buffer";
        NoDayWork: Record "No. Days Work";
        BillingTruckCount: Integer;
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        FixedPricePerKm: Record "Millage Range Controls";
        PricePeLocaDire: Decimal;
        PricePeLocaDepot: Decimal;
        PricePerKm: Decimal;
        ContractAmunt: Decimal;
        FixedRate: Decimal;
        FreightCharge: Decimal;
        FixedCalc: Decimal;
        VariableCalc: Decimal;
        SalesHeaderType: Record "Sales Header";
        TotalAvailAmount2: Decimal;
        ContractTransacHist: Record "Contract Transaction History";
        ContractAmuntTotal: Decimal;
        QuantityLoaded: Decimal;
        BillingPricePerKm: Decimal;
        BillingFixedRate: Decimal;
        BillingVariableCalc: Decimal;
        BillingFixedPriceKm: Decimal;
        TotalDistance: Decimal;
        FixedAsset: Record "Fixed Asset";
        ProcessedBillingLine: Record "Processed Billing Line";
        EmployeeRec: Record Employee;
        FixedCalc2: decimal;
        VariableCalc2: decimal;
        FixedCalc3: decimal;
        FixedCalc4: decimal;
        VariableCalc3: decimal;
        TotalFixedCalc: decimal;
        TotalVariableCalc: decimal;
        BillingVariableAmt: Decimal;
        BillingFXPriceLoc: Decimal;
        TripBased: Decimal;
        DriversNo: Code[20];
        SourceFrom: Text[100];
        NewRate: Decimal;
        TotalAmountTrip: Decimal;
        CuminativAmount: Decimal;
        BusinessType: Code[20];
        PricePerLoc: Decimal;
}
