report 50017 "Truck Transaction LafargeWest"
{
    ApplicationArea = All;
    Caption = 'LAFARGEWEST  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction LAFARGEWEST.rdl';
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
            column(TripNo1; TripNo)
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
                //Invoice
            }

            // column(Loc1; Loc)
            // {
            // }

            // column(Distance1; Distance)
            // {
            // }

            // column(freightRate1; freightRate)
            // {
            //     //Description
            // }
            column(Description; Description)
            {
                //Description
            }
            dataitem(Locationre; Location)
            {
                column(Location; Locationre.Code)
                {
                }
                column(Loc1; Loc)
                {
                }

                column(Distance1; Distance)
                {
                }

                column(freightRate1; freightRate)
                {
                    //Description
                }
                trigger OnAfterGetRecord()
                begin

                    //  if Location.FindFirst() then begin
                    //   repeat
                    TripNo := 0;
                    loc := '';
                    Distance := 0;
                    freightRate := 0;

                    //loc := Locationre.Code;
                    BillingLineSum.Reset();
                    BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                    BillingLineSum.SetRange("Contract Id", ContractID);
                    // BillingLineSum.SetRange("Truck Type", "Truck Type");
                    // BillingLineSum.SetRange("Truck No.", "Truck Code");
                    BillingLineSum.Setfilter(Treated, '%1', true);
                    BillingLineSum.SetRange("Location Destination", Locationre.Code);
                    BillingLineSum.SetFilter("Transaction Date", '%1..%2', Dstart, DEnd);
                    if BillingLineSum.FindFirst() then begin
                        repeat
                            TripNo := TripNo + 1;

                            Distance := Distance + BillingLineSum.Quantity;



                            FixedPricePeLoca.Reset();
                            FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                            // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                            FixedPricePeLoca.SetRange("Contract ID", ContractID);
                            FixedPricePeLoca.SetFilter(Location, Locationre.Code);
                            // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                            if FixedPricePeLoca.FindFirst() then begin
                                //  repeat

                                freightRate := FixedPricePeLoca."Fixed Price";
                                // BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                // BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                // PricePerLoc := FixedPricePeLoca."Fixed Price";
                                // FixedRate += PricePerLoc;

                                //   Until FixedPricePeLoca.Next = 0;

                            end;


                        until BillingLineSum.Next = 0;

                    end;
                    // until Location.Next = 0
                end;

                // end;


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
                column(TruckNo; TruckNo)
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
                    //    Location.SetRange(Code);
                    //    if Location.FindFirst() then
                    //    repeat

                    if "Truck Code" <> '' then begin
                        BillingLineSum.Reset();
                        BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date", Treated);
                        BillingLineSum.SetRange("Contract Id", "Document No.");
                        BillingLineSum.SetRange("Truck Type", "Truck Type");
                        BillingLineSum.SetRange("Truck No.", "Truck Code");
                        BillingLineSum.Setfilter(Treated, '%1', false);
                        BillingLineSum.SetRange("Location Destination", Location.Code);
                        BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                        if BillingLineSum.FindFirst() then begin
                            repeat
                                //until BillingLineSum.Next = 0;
                                //   i:=1;

                                FixedPricePeLoca.Reset();
                                FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
                                FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
                                FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                if FixedPricePeLoca.FindFirst() then begin
                                    repeat


                                        BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                                        BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                                        PricePerLoc := FixedPricePeLoca."Fixed Price";
                                        FixedRate += PricePerLoc;

                                    Until FixedPricePeLoca.Next = 0;

                                end;



                                TruckNo := BillingLineSum."Truck NO.";
                                NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
                                TotalAmount := BillingLineSum."Fixed Cost";
                                FixedRate := BillingLineSum."Fixed Rate";
                                VariableAmount := BillingLineSum."Variable Cost";
                                VariableRate := BillingLineSum."Variable Rate";
                                ItemDescription := BillingProcessed."Item Description";
                                Qty := BillingLineSum.Quantity;
                                i += y;


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
            trigger OnAfterGetRecord()
            begin



                //        j := 0;
                //    // Location.SetRange(Code);
                //     if Location.FindFirst() then
                //         repeat
                //             BillingLineSum.Reset();
                //             BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                //             BillingLineSum.SetRange("Contract Id", "No.");
                //             // BillingLineSum.SetRange("Truck Type", "Truck Type");
                //             // BillingLineSum.SetRange("Truck No.", "Truck Code");
                //             BillingLineSum.SetRange("Location Destination", Location.Code);
                //             BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                //             if BillingLineSum.FindFirst() then begin
                //                 repeat
                //                     j := j + 1;
                //                     Loc[j] := BillingLineSum."Location Destination";
                //                     message(Loc[j] );
                //                 until BillingLineSum.Next = 0;

                //             end;
                //         until Location.Next = 0;

                //j := 0;
                // for t := 1 to J do begin
                //     Location.SetRange(Code,Loc[t]);
                //     if Location.FindFirst() then
                //         repeat
                //             BillingLineSum.Reset();
                //             BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                //             BillingLineSum.SetRange("Contract Id", ContractID);
                //             // BillingLineSum.SetRange("Truck Type", "Truck Type");
                //             // BillingLineSum.SetRange("Truck No.", "Truck Code");
                //             BillingLineSum.SetRange("Location Destination", Loc[t]);
                //             BillingLineSum.SetFilter("Transaction Date",'%1..%2',Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                //             if BillingLineSum.FindFirst() then begin
                //                 repeat
                //                     TripNo[t] :=TripNo[t] + 1;
                //                     loc[t] := BillingLineSum."Location Destination";
                //                     Distance[t] := Distance[t] + BillingLineSum.Quantity;



                //                 FixedPricePeLoca.Reset();
                //                 FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                //                // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                //                 FixedPricePeLoca.SetRange("Contract ID", "No.");
                //                 FixedPricePeLoca.SetFilter(Location, Loc[t]);
                //                // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                //                 if FixedPricePeLoca.FindFirst() then begin
                //                   //  repeat

                //                          freightRate[t] := FixedPricePeLoca."Fixed Price";
                //                         // BillingVariableAmt := FixedPricePeLoca."Fixed Price";
                //                         // BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
                //                         // PricePerLoc := FixedPricePeLoca."Fixed Price";
                //                         // FixedRate += PricePerLoc;

                //                  //   Until FixedPricePeLoca.Next = 0;

                //                 end;


                //                 until BillingLineSum.Next = 0;

                //             end;
                //         until Location.Next = 0
            end;
            //end;


            trigger OnPreDataItem()
            begin
                Description := Narration;
                ContractID := getfilter(ContractAgreement."No.");
                DStart := GetRangeMin("Date Filter");
                DEnd := GetRangeMax("Date Filter");
                //  Message(ContractID);
                j := 0;
                // TripNo[1] := 0;
                // loc[1] := '';
                // Distance[1] := 0;
                // freightRate[1] := 0;
                // TripNo[2] := 0;
                // loc[2] := '';
                // Distance[2] := 0;
                // freightRate[2] := 0;
                // TripNo[3] := 0;
                // loc[3] := '';
                // Distance[3] := 0;
                // freightRate[3] := 0;
                // TripNo[4] := 0;
                // loc[4] := '';
                // Distance[4] := 0;
                // freightRate[4] := 0;
                // TripNo[5] := 0;
                // loc[5] := '';
                // Distance[5] := 0;
                // freightRate[5] := 0;
                // TripNo := 0;
                // loc := '';
                // Distance := 0;
                // freightRate := 0;
                // Loc[1]:=''; Loc[2]:='';Loc[3]:='';Loc[4]:='';Loc[5]:='';Loc[6]:='';Loc[7]:='';Loc[8]:='';Loc[9]:='';Loc[10]:='';
                //  Loc[j]:='';
                //  Location.SetRange(Code);
                // if Location.FindFirst() then begin

                //     Repeat
                //         // Message(Location.Code);
                //         BillingLineSum.Reset();
                //         BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                //         BillingLineSum.SetRange("Contract Id", ContractID);
                //         // BillingLineSum.SetRange("Truck Type", "Truck Type");
                //         // BillingLineSum.SetRange("Truck No.", "Truck Code");
                //         BillingLineSum.SetFilter("Location Destination", Location.Code);
                //         BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                //         if BillingLineSum.FindFirst() then begin
                //             //  repeat
                //             j := j + 1;
                //             // message('Thanks');
                //             Loc[j] := BillingLineSum."Location Destination";
                //             //message(Loc[j] );
                //             //   until BillingLineSum.Next = 0;

                //         end;
                //     //   message(Loc[j] );
                //     until Location.Next = 0;
                // end;
                //  message(Format(j));
                //ContractID := getfilter(ContractAgreement."No.");


                //  for t := 1 to J do begin
                //   Location.SetRange(Code, Loc[t]);
                if Location.FindFirst() then begin
                    repeat
                        TripNo := 0;
                        //  loc := '';
                        Distance := 0;
                        freightRate := 0;
                        BillingLineSum.Reset();
                        BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                        BillingLineSum.SetRange("Contract Id", ContractID);
                        // BillingLineSum.SetRange("Truck Type", "Truck Type");
                        // BillingLineSum.SetRange("Truck No.", "Truck Code");
                        BillingLineSum.SetRange("Location Destination", Location.Code);
                        //   BillingLineSum.Setfilter(Treated, '%1', false);
                        BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                        if BillingLineSum.FindFirst() then begin
                            repeat
                                TripNo := TripNo + 1;
                                loc := BillingLineSum."Location Destination";
                                Distance := Distance + BillingLineSum.Quantity;



                                FixedPricePeLoca.Reset();
                                FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
                                // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
                                FixedPricePeLoca.SetRange("Contract ID", ContractID);
                                FixedPricePeLoca.SetFilter(Location, Loc);
                                // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

                                if FixedPricePeLoca.FindFirst() then begin
                                    //  repeat

                                    freightRate := FixedPricePeLoca."Fixed Price";


                                end;


                            until BillingLineSum.Next = 0;

                        end;
                    until Location.Next = 0
                end;

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
            //  end;


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
    trigger OnPreReport()

    begin

    end;

    var
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
        PricePerLoc: Decimal;
        ContractID: Code[20];
        Location: Record Location;
        Loc: Code[20];
        t: Integer;
        TripNo: Decimal;
        Distance: Decimal;
        freightRate: Decimal;
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
