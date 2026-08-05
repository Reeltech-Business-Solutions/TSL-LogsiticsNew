report 50009 "Truck Total TSL"
{
    ApplicationArea = All;
    Caption = 'TOTALTSL  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction TOTALTSL.rdl';
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
            column(City; City)
            {

            }
            column(AddressOne; AddressOne)
            {

            }
            column(AddressTwo; AddressTwo)
            {

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
                //Invoice
            }
            column(Invoice; Invoice)
            {
                //Invoice
            }
            dataitem("Contract Line"; "Contract Line")
            {
                // DataItemTableView = WHERE("Document No." = "No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                DataItemLink = "Document No." = FIELD("No."), "Date Filter" = Field("Date Filter");

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
                column(AmountNarration; AmountNarration)
                {
                    ///AmountNarraText
                }
                column(AmountNarraText; AmountNarraText)
                {
                    ///AmountNarraText
                }
                trigger OnAfterGetRecord()
                begin
                    i := 0;

                    FixedRate := 0;


                    if "Truck Code" <> '' then begin
                        BillingLineSum.Reset();
                        BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                        BillingLineSum.SetRange("Contract Id", "Document No.");
                        BillingLineSum.SetRange("Truck Type", "Truck Type");
                        BillingLineSum.SetRange("Truck No.", "Truck Code");
                        BillingLineSum.Setfilter(Treated, '%1', true);
                        // BillingLineSum.SetRange("Location Destination", Location.Code);
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
                                        AmountNarraText += PricePerLoc;
                                    Until FixedPricePeLoca.Next = 0;
                                    // Message(Format(AmountNarraText));
                                end;


                            // AmountInWord.AmountInwordUSFormat(AmountNarraText);



                            until BillingLineSum.Next = 0;
                            // AmountNarraText += FixedRate;
                        end;
                    end;
                    //   AmountNarraText += FixedRate;
                    AmountInWord.AmountInwordUSFormat(AmountNarraText);
                    ReportCheck.InitTextVariable();
                    ReportCheck.FormatNoText(AmountinWords, AmountNarraText, '');

                    AmountNarration := AmountinWords[1];


                    ///Until ContractLine.Next = 0;
                    //        end;

                end;

                trigger OnPreDataItem()
                begin
                    //  AmountNarraText := 0;

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
                    // AmountNarraText := FixedRate;
                    // AmountInWord.AmountInwordUSFormat(AmountNarraText);
                    // ReportCheck.InitTextVariable();
                    // ReportCheck.FormatNoText(AmountinWords, AmountNarraText, '');

                    // AmountNarration := AmountinWords[1];
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
                    field(Narration; Narration)
                    {
                        ApplicationArea = ALL;
                    }
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
                    field(Invoice; Invoice)
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
        Invoice: Text[50];
        Narration: Text[100];
        AmountInWord: Codeunit "Journal Post Successful1";
        WordAmount: Decimal;
        ReportCheck: Report Check;
        AmountinWords: array[2] of Text[80];
        AmountNarration: Text[250];
        AmountNarraText: Decimal;
}

