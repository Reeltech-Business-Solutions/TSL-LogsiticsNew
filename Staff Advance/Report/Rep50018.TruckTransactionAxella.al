report 50018 "Truck TransactionAxella"
{
    ApplicationArea = All;
    Caption = 'Axella  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction Axella.rdl';
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
            column(AddressOne; AddressOne)
            {

            }
            column(AddressTwo; AddressTwo)
            {

            }
            column(City; City)
            {
                //MileRange
            }
            column(Attention; Attention)
            {

            }
            column(Country; Country)
            {

            }
            column(RefersNo; RefersNo)
            {

            }
            column(SubjectMatter; SubjectMatter)
            {

            }
            column(BankName; BankName)
            {

            }
            column(AcctName; AcctName)
            {

            }
            column(SortCode; SortCode)
            {

            }
            column(AcctNo; AcctNo)
            {

            }
            column(VatNo; VatNo)
            {

            }
            column(TINo; TINo)
            {

            }
            column(SignatureName; SignatureName)
            {

            }
            column(Signture; Signture)
            {

            }





            dataitem("Millage Range Controls"; "Millage Range Controls")
            {
                DataItemLink = "Contract No." = field("No."), "Date Filter" = Field("Date Filter");
                RequestFilterFields = "Truck Type";
                column(Standard_Millage_Code; "Standard Millage Code")
                {
                }
                column(NoTripCov; NoTripCov)
                {
                }
                column(KmRate; KmRate)
                {

                }
                column(VariableAmount; VariableAmount)
                {

                }
                trigger OnAfterGetRecord()
                begin

                    // if "Standard Millage Code" = '' then
                    //   CurrReport.Skip();
                    NoTripCov := 0;
                    // MileRange := '';
                    KmRate := 0;
                    VariableAmount := 0;
                    BillingLineSum.Reset();
                    BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Transaction Date");
                    BillingLineSum.SetRange("Contract Id", ContractID);
                    BillingLineSum.SetRange("Truck Type", "Truck Type");
                    // BillingLineSum.SetRange("Truck No.", "Truck Code");
                    //BillingLineSum.SetRange("Location Destination", Location.Code);
                    BillingLineSum.Setfilter(Treated, '%1', True);
                    BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                    if BillingLineSum.FindFirst() then begin
                        repeat


                            if (BillingLineSum.Quantity >= Minimum) AND (BillingLineSum.Quantity <= Maximum) AND
                                   (BillingLineSum.Quantity <> 0) THEN BEGIN

                                NoTripCov := NoTripCov + 1;
                                MileRange := "Standard Millage Code";
                                KmRate := Rate;


                            END;
                        //until BillingLineSum.Next = 0;
                        //   i:=1;

                        // FixedPricePeLoca.Reset();
                        // FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                        // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                        // FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                        // FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                        // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                        // if FixedPricePeLoca.FindFirst() then begin
                        //     repeat


                        //         BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                        //         BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                        //         PricePerLoc := FixedPricePeLoca."Fixed Price";
                        //         FixedRate += PricePerLoc;

                        //     Until FixedPricePeLoca.Next = 0;

                        // end;



                        //     TruckNo := BillingLineSum."Truck NO.";
                        // NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                        // TotalAmount := BillingLineSum."Fixed Cost";
                        // FixedRate := BillingLineSum."Fixed Rate";
                        // VariableAmount := BillingLineSum."Variable Cost";
                        // VariableRate := BillingLineSum."Variable Rate";
                        // ItemDescription := BillingProcessed."Item Description";
                        // Qty := BillingLineSum.Quantity;
                        // i += y;


                        until BillingLineSum.Next = 0;
                        VariableAmount := KmRate * NoTripCov;

                    end;

                end;
            }



            dataitem("Contract Line"; "Contract Line")
            {
                // DataItemTableView = WHERE("Document No." = "No.");
                //  DataItemTableView = SORTING("Document No.", "Line No.");
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
                // column(TruckNo; TruckNo)
                // {
                // }
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
                column(TruckAvaiCount; TruckAvaiCount)
                {
                }
                column(TotalUnAvailAmount; TotalUnAvailAmount)
                {
                }
                column(TotalAvailAmount; TotalAvailAmount)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    TruckAvaiCount := 0;
                    TotalUnAvailAmount := 0;
                    TruckAvaiCount := 0;



                    ContractAgreement.Get(ContractID);
                    MillageRange.SetCurrentKey("Truck Type", "Contract No.");
                    MillageRange.SetRange("Truck Type", "Truck Type");
                    MillageRange.SetRange("Contract No.", ContractID);
                    if MillageRange.FindFirst() then begin
                        repeat
                            // TruckNo := BillingLineSum."Truck Id";
                            FixedRate := (MillageRange."Fixed Rate");
                        //   VariableAmount += (MillageRange.Rate * BillingLineSum.Quantity);
                        //  Message(Format(VariableAmount));
                        // TotalAmount += VariableAmount;
                        //  TotalAmountTrip := MillageRange."Fixed Rate" * "Available days";
                        until MillageRange.Next = 0;
                        // TotalAmount := VariableAmount;
                        // Message(Format(TotalAmount));

                    end;


                    TruckAvailEntryLines.Reset();
                    TruckAvailEntryLines.SetCurrentKey("Leasing Truck No", "Contract No.");
                    TruckAvailEntryLines.SetRange("Leasing Truck No", "Truck Code");
                    //TruckAvailEntryLines.Setrange(sta, "Truck Type");
                    TruckAvailEntryLines.Setrange("Contract No.", "Document No.");
                    if TruckAvailEntryLines.FindFirst() then
                        repeat
                            if (TruckAvailEntryLines."Start Date" >= Getrangemin("Date Filter")) and (TruckAvailEntryLines."End Date" <= Getrangemax("Date Filter")) then begin
                                // TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
                                TruckAvaiCount += TruckAvailEntryLines.Quantity;
                            end;
                        until TruckAvailEntryLines.Next = 0;


                    if ContractAgreement."Target Availability" <> 0 then
                        TotalAvailAmount := TruckAvaiCount * (FixedRate / ContractAgreement."Target Availability");

                    TotalUnAvailAmount := TruckAvaiCount - ContractAgreement."Target Availability";
                    //  FTotalAvailAmount := TruckAvaiCount * FixedRate;

                    //   i:=1;
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
                    //  FixedRate :=0;
                    //    TruckNoation.SetRange(Code);
                    //    if Location.FindFirst() then
                    //    repeat

                    // if "Truck Code" <> '' then begin
                    //     BillingLineSum.Reset();
                    //     BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                    //     BillingLineSum.SetRange("Contract Id", "Document No.");
                    //     BillingLineSum.SetRange("Truck Type", "Truck Type");
                    //     BillingLineSum.SetRange("Truck No.", "Truck Code");
                    //     BillingLineSum.SetRange("Location Destination", Location.Code);
                    //     BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                    //     if BillingLineSum.FindFirst() then begin
                    //         repeat



                    //             //until BillingLineSum.Next = 0;
                    //             //   i:=1;

                    //             // FixedPricePeLoca.Reset();
                    //             // FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                    //             // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                    //             // FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                    //             // FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                    //             // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                    //             // if FixedPricePeLoca.FindFirst() then begin
                    //             //     repeat


                    //             //         BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                    //             //         BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                    //             //         PricePerLoc := FixedPricePeLoca."Fixed Price";
                    //             //         FixedRate += PricePerLoc;

                    //             //     Until FixedPricePeLoca.Next = 0;

                    //             // end;



                    //             //     TruckNo := BillingLineSum."Truck NO.";
                    //             NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                    //             TotalAmount := BillingLineSum."Fixed Cost";
                    //             FixedRate := BillingLineSum."Fixed Rate";
                    //             VariableAmount := BillingLineSum."Variable Cost";
                    //             VariableRate := BillingLineSum."Variable Rate";
                    //             ItemDescription := BillingProcessed."Item Description";
                    //             Qty := BillingLineSum.Quantity;
                    //             i += y;


                    //         until BillingLineSum.Next = 0;
                    //     end;
                    // end;

                    ///Until ContractLine.Next = 0;
                    //        end;

                end;

                trigger OnPreDataItem()
                begin

                    //  if "Truck Code" = '' then
                    //    CurrReport.Skip();
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

                trigger OnPostDataItem()
                begin

                    // if "Truck Code" = '' then
                    //   CurrReport.Skip();

                end;

            }
            trigger OnAfterGetRecord()
            begin

                if CustomerAddress.get("Customer Code") then begin
                    CustomerName := CustomerAddress.Name;
                    AddressOne := CustomerAddress.Address;
                    AddressTwo := CustomerAddress."Address 2";
                    City := CustomerAddress.City;
                    Country := CustomerAddress."Country/Region Code";


                end;


                CompanyInfor.get;
                //   BankName := CompanyInfor."Bank Name";
                //   AcctName := CompanyInfor.Name;
                //   AcctNo := CompanyInfor."Bank Account No.";
                SortCode := CompanyInfor."Bank Branch No.";
                VatNo := CompanyInfor."VAT Registration No.";
                TINo := CompanyInfor."Giro No.";




            end;


            trigger OnPreDataItem()
            begin
                ContractID := getfilter(ContractAgreement."No.");
                //     //   NoTripCov := 0;
                //      MileRange := '';
                //     // KmRate := 0;
                //     // VariableAmount := 0;

                //     MillageRange.Reset();
                //     MillageRange.SetCurrentKey("Contract No.");
                //     MillageRange.SetRange("Contract No." ,ContractID);
                //     if MillageRange.FindFirst() then
                //     repeat
                //        NoTripCov := 0;

                //      KmRate := 0;
                //      VariableAmount := 0;
                //  //    MileRange := MillageRange."Standard Millage Code";

                //     BillingLineSum.Reset();
                //     BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Transaction Date");
                //     BillingLineSum.SetRange("Contract Id", MillageRange."Contract No.");
                //     BillingLineSum.SetRange("Truck Type", MillageRange."Truck Type");
                //     // BillingLineSum.SetRange("Truck No.", "Truck Code");
                //     //BillingLineSum.SetRange("Location Destination", Location.Code);
                //     BillingLineSum.SetFilter("Transaction Date",'%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                //     if BillingLineSum.FindFirst() then begin
                //         repeat


                //             if (BillingLineSum.Quantity >= MillageRange.Minimum) AND (BillingLineSum.Quantity <= MillageRange.Maximum) AND
                //                    (BillingLineSum.Quantity <> 0) THEN BEGIN

                //                 NoTripCov := NoTripCov + 1;
                //                 MileRange := MillageRange."Standard Millage Code";
                //                 KmRate := MillageRange.Rate;



                //             END;
                //             //until BillingLineSum.Next = 0;
                //             //   i:=1;

                //             // FixedPricePeLoca.Reset();
                //             // FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                //             // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                //             // FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                //             // FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                //             // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                //             // if FixedPricePeLoca.FindFirst() then begin
                //             //     repeat


                //             //         BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                //             //         BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                //             //         PricePerLoc := FixedPricePeLoca."Fixed Price";
                //             //         FixedRate += PricePerLoc;

                //             //     Until FixedPricePeLoca.Next = 0;

                //             // end;



                //             //     TruckNo := BillingLineSum."Truck NO.";
                //             // NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                //             // TotalAmount := BillingLineSum."Fixed Cost";
                //             // FixedRate := BillingLineSum."Fixed Rate";
                //             // VariableAmount := BillingLineSum."Variable Cost";
                //             // VariableRate := BillingLineSum."Variable Rate";
                //             // ItemDescription := BillingProcessed."Item Description";
                //             // Qty := BillingLineSum.Quantity;
                //             // i += y;


                //         until BillingLineSum.Next = 0;
                //         VariableAmount := KmRate * NoTripCov;

                //     end

                //          until MillageRange.Next = 0;         

                //end;


            end;


        }

    }
    requestpage
    {
        SaveValues = true;
        layout
        {

            area(content)
            {
                group(GroupName)
                {
                    field(Attention; Attention)
                    {
                        ApplicationArea = ALL;
                    }
                    field(RefersNo; RefersNo)
                    {
                        ApplicationArea = ALL;
                    }
                    field(SubjectMatter; SubjectMatter)
                    {
                        ApplicationArea = ALL;
                    }
                    field(BankName; BankName)
                    {
                        ApplicationArea = ALL;
                    }
                    field(AcctName; AcctName)
                    {
                        ApplicationArea = ALL;
                    }
                    field(AcctNo; AcctNo)
                    {
                        ApplicationArea = ALL;
                    }


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

    end;

    var
        BillingProcessed: Record "Processed Billing Line";
        // ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        BillingLineSum: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        //  TruckNo: Code[20];
        Nodays: Decimal;
        TotalAmount: decimal;
        i: Integer;
        k: Integer;
        FixedCostAmount: Decimal;
        VariableCostAmount: Decimal;
        FixedAmount: Decimal;
        VariableAmount: Decimal;
        y: Integer;
        j: Integer;
        f: Integer;
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
        FixedPricePeLoca2: Record "Fixed Price Per Location";
        FixedPricePeLoca: Record "Millage Range Controls";
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
        TotalDaysNo: Decimal;
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
        PricePerLoc: Decimal;
        ContractID: Code[20];
        Location: Record Location;
        TruckNo: array[20] of Code[20];
        t: Integer;
        TripNo: Decimal;
        DaysNo: array[20] of Decimal;
        freightRate: array[20] of Decimal;
        UnavDaysNo: array[20] of Decimal;
        MileRange: Code[20];
        KmCover: array[20] of Decimal;
        KmRate: Decimal;
        NoTripCov: Integer;
        DateFilter: Date;
        TotalAvailAmount: Decimal;
        FTruckAvaiCount: Decimal;
        FTotalAvailAmount: Decimal;
        TotalUnAvailAmount: Decimal;
        CustomerAddress: Record Customer;
        CustomerName: Text[100];
        AddressOne: Text[250];
        AddressTwo: Text[250];
        Attention: Text[100];
        CompanyInfor: Record "Company Information";
        City: Text[50];
        Country: Text[50];
        RefersNo: Text[100];
        SubjectMatter: Text[70];
        BankName: Text[100];
        AcctName: Text[100];
        SortCode: Text[100];
        AcctNo: Text[20];
        VatNo: Text[30];
        TINo: Text[100];
        SignatureName: Text[100];
        Signture: Text[100];

}
