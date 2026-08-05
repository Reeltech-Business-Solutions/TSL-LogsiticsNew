report 50008 "Sales OVH"
{
    ApplicationArea = All;
    Caption = 'OVH  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction OVH.rdl';
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
            column(City; City)
            {
                //Invoice  Description
            }
            column(Description; Description)
            {
                //Invoice  Description
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
                trigger OnAfterGetRecord()
                begin
                    NewRate := 0;

                    TripBased := 0;
                    //   //  CuminativAmount := 0;
                    //     FixedPricePeLoca.Reset();
                    //     FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                    //     FixedPricePeLoca.SetRange("Truck Type", "Truck Type");
                    //     FixedPricePeLoca.SetRange("Contract ID", "Contract Id");
                    //     FixedPricePeLoca.SetFilter(Location, "Location Destination");
                    //     //  FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                    //     if FixedPricePeLoca.FindFirst() then begin
                    //             repeat


                    //                     BillingVariableAmt := Quantity*"Fixed Rate";
                    //                     NewRate := "Fixed Rate";
                    //                     CuminativAmount += BillingVariableAmt; 
                    //                     TripBased := 1;
                    //                     // PricePerLoc := FixedPricePeLoca."Fixed Price";
                    //                     //  FixedRate += PricePerLoc;

                    //             Until FixedPricePeLoca.Next = 0;

                    //     end;


                end;

                trigger OnPreDataItem()
                begin
                    CuminativAmount := 0;
                    //BillingVariableAmt := 0;
                end;




            }

            dataitem("Millage Range Controls"; "Millage Range Controls")
            {
                // DataItemTableView = WHERE("Document No." = "No.");
                //   DataItemTableView = SORTING("Document No.", "Line No.");
                DataItemLink = "Contract No." = FIELD("No."), "Date Filter" = Field("Date Filter");
                // DataItemLinkReference = "Contract Agreement";
                // RequestFilterFields = "Document Type", "No.";
                // RequestFilterHeading = 'Sales Document';
                column(DocumentNo; "Millage Range Controls"."Contract No.")
                {
                }
                // column(TruckCode;"Millage Range Controls"."Truck No.") 
                // {
                // }
                column(TruckType; "Millage Range Controls"."Truck Type")
                {
                }
                column(TruckNo; TruckNo)
                {
                }
                column(NoDays; NoDays)
                {
                }
                column(TotalAmount; TotalAmount)
                {
                }
                column(FixedRate; FixedRate)
                {
                }
                column(i; i)
                {
                }
                column(FixedRateOVH; "Millage Range Controls"."Fixed Rate")
                {
                }
                column(ShortageRate; "Millage Range Controls"."Shortage Rate")
                {
                }
                column(ShortageTolerance; "Millage Range Controls"."Shortage Tolerance")
                {
                }
                column(DiscountRate; "Millage Range Controls"."Discount Rate")
                {
                }
                column(FreightCharge; "Millage Range Controls"."Freight Charge")
                {
                }
                column(y; y)
                {
                }
                column(BillingVariableAmt; BillingVariableAmt)
                {
                }
                column(BillingFXPriceLoc; BillingFXPriceLoc)
                {
                }
                trigger OnAfterGetRecord()
                begin
                    // "Processed Billing Line".Setrange("Transaction Date",Getrangemin("Date Filter") , Getrangemax("Date Filter"));
                    //   i:=1;
                    //ContractAgreement.Reset();
                    // ContractAgreement.SetRange("No.", "Contract Id");
                    // if ContractAgreement.FindFirst() then

                    //            ContractLine.Reset();
                    //            ContractLine.SetCurrentKey("Document No.");
                    //            ContractLine.SetRange("Document No.", ContractID);
                    //            if ContractLine.FindFirst() then begin
                    //                repeat
                    //                //    TruckNo :='';
                    //                 //   NoDays := 0;
                    //                 //   TotalAmount := 0;
                    //                  //  FixedRate :=0;

                    y := 0;
                    //                 i:=0;
                    //                 TruckNo :='';
                    //                 NoDays := 0;
                    //                 TotalAmount := 0;
                    //                 FixedRate :=0;
                    //                 VariableAmount := 0;
                    //                 ItemDescription :='';
                    //                 TruckCapacity:='';
                    //                 VariableRate:=0;
                    //                 Qty:=0;
                    BillingVariableAmt := 0;
                    BillingFXPriceLoc := 0;
                    //                      if "Truck Code" <> '' then begin
                    BillingLineSum.Reset();
                    BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Transaction Date");
                    BillingLineSum.SetRange("Contract Id", ContractID);
                    BillingLineSum.SetRange("Truck Type", "Truck Type");
                    BillingLineSum.Setfilter(Treated, '%1', True);
                    // BillingLineSum.SetRange("Truck No.", "Truck Code");
                    BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                    if BillingLineSum.FindFirst() then begin
                        repeat


                            FixedPricePeLoca.Reset();
                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                            FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                            FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                            FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                            //  FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                            if FixedPricePeLoca.FindFirst() then begin
                                //    repeat


                                BillingVariableAmt := FixedPricePeLoca."Fixed Price" * BillingLineSum.Quantity;
                                BillingFXPriceLoc += BillingVariableAmt;
                                y += 1;
                                // PricePerLoc := FixedPricePeLoca."Fixed Price";
                                //  FixedRate += PricePerLoc;

                                //  Until FixedPricePeLoca.Next = 0;

                            end;

                        //until BillingLineSum.Next = 0;
                        //   i:=1;
                        //    TruckNo := BillingLineSum."Truck NO.";
                        //    NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                        //    TotalAmount := BillingLineSum."Fixed Cost";
                        //    FixedRate := BillingLineSum."Fixed Rate";
                        //    VariableAmount := BillingLineSum."Variable Cost";
                        //    VariableRate := BillingLineSum."Variable Rate";
                        //    ItemDescription := BillingProcessed."Item Description";
                        //    Qty:=BillingLineSum.Quantity;
                        //     i+=y;
                        until BillingLineSum.Next = 0;

                        // //89
                    end;
                    //                      end; 

                    //                 Until ContractLine.Next = 0;
                    //            end;

                end;

                trigger OnPreDataItem()
                begin
                    y := 1;
                    i := 0;
                    TruckNo := '';
                    NoDays := 0;
                    TotalAmount := 0;
                    FixedRate := 0;
                    VariableAmount := 0;
                    ItemDescription := '';
                    TruckCapacity := '';
                    VariableRate := 0;
                    Qty := 0;
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
        SaveValues = true;
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
        Narration: Text[150];
        Description: Text[150];
        DStart: Date;
        DEnd: Date;
}

