report 50033 "Truck Transaction Pladis"
{
    ApplicationArea = All;
    Caption = 'Processing PLADIS';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction PLADIS2.rdl';
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
                //Invoice
            }

            dataitem("Contract Line"; "Contract Line")
            {
                // DataItemTableView = WHERE("Document No." = "No.");
                // DataItemTableView = SORTING("Document No.", "Line No.");
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
                column(Description; Description)
                {
                }
                column(Narration; Narration)
                {

                }
                column(TotalAvailAmount; TotalAvailAmount)
                {

                }
                column(FTotalAvailAmount; FTotalAvailAmount)
                {

                }
                column(TruckAvaiCount; TruckAvaiCount)
                {

                }
                column(VVariableAmount; VVariableAmount)
                {

                }
                column(FFixedRate; FFixedRate)
                {

                }
                column(VariableAmount; VariableAmount)
                {

                }
                column(VTotalTripNo; VTotalTripNo)
                {

                }
                column(FTotalTripNo; FTotalTripNo)
                {

                }
                column(TruckId; "Contract Line"."Asset Registration No.")
                {

                }


                trigger OnAfterGetRecord()
                begin
                    Description := Narration;
                    //   i:=1;
                    //ContractAgreement.Reset();
                    // ContractAgreement.SetRange("No.", "Contract Id");
                    // if ContractAgreement.FindFirst() then

                    // ContractLine.Reset();
                    //   ContractLine.SetCurrentKey("Document No.");
                    //   ContractLine.SetRange("Document No.", "No.");
                    //  if ContractLine.FindFirst() then begin
                    //     repeat
                    TruckNo := '';
                    NoDays := 0;
                    //   TotalAmount := 0;
                    FixedRate := 0;

                    FTotalAvailAmount := 0;
                    TotalAvailAmount := 0;
                    TotalAmount := 0;
                    VariableAmount := 0;
                    TruckAvaiCount := 0;
                    FTotalTripNo := 0;
                    VTotalTripNo := 0;
                    //VTotalTripNo := 0;
                    VVariableAmount := 0;
                    FixedRate := 0;
                    VariableAmount := 0;
                    FFixedRate := 0;
                    //    TotalAvailAmount := 0;

                    //  ContractLine.Reset();
                    //  ContractLine.SetCurrentKey("Document No.");
                    //  ContractLine.SetRange("Document No.", ContractID);
                    //  if ContractLine.FindFirst() then begin


                    if "Truck Code" <> '' then begin
                        BillingLineSum.Reset();
                        BillingLineSum.SetCurrentKey("Contract Id", "Truck Type", "Truck No.", "Transaction Date");
                        BillingLineSum.SetRange("Contract Id", ContractID);
                        BillingLineSum.SetRange("Truck Type", "Truck Type");
                        BillingLineSum.SetRange("Truck No.", "Truck Code");
                        BillingLineSum.Setfilter(Treated, '%1', true);
                        BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                        if BillingLineSum.FindFirst() then begin
                            repeat
                                FTripNo := 0;
                                VTripNo := 0;
                                FixedRate := 0;
                                VariableAmount := 0;



                                //    MillageRange.Reset();
                                MillageRange.SetCurrentKey("Truck Type", "Contract No.");
                                MillageRange.SetRange("Truck Type", BillingLineSum."Truck Type");
                                MillageRange.SetRange("Contract No.", BillingLineSum."Contract Id");
                                if MillageRange.FindFirst() then begin
                                    // repeat




                                    //  TruckNo := BillingLineSum."Truck Id";
                                    FixedRate := MillageRange."Fixed Rate";
                                    VariableAmount := MillageRange.Rate;
                                    // MOD
                                    //  Message(Format(VariableAmount));
                                    // TotalAmount += VariableAmount;
                                    //  TotalAmountTrip := MillageRange."Fixed Rate" * "Available days";
                                    //  until MillageRange.Next = 0;
                                    //  TotalAmount := VariableAmount;
                                    //  Message(Format(TotalAmount));

                                end;

                                FTripNo := BillingLineSum.Quantity DIV KiloPertrip;
                                if FTripNo > FreqTrip then begin
                                    FTotalTripNo := FTotalTripNo + FreqTrip;
                                    FFixedRate += (FixedRate * FreqTrip);


                                end;

                                if FTripNo <= FreqTrip then begin
                                    FTotalTripNo := FTotalTripNo + FTripNo;
                                    FFixedRate += (FixedRate * FTripNo)
                                end;

                                VTripNo := BillingLineSum.Quantity DIV KiloPertrip;
                                if VTripNo > FreqTrip then begin
                                    VTotalTripNo := VTotalTripNo + (VTripNo - FreqTrip);
                                    VVariableAmount += (VariableAmount * (VTripNo - FreqTrip));
                                    //  += (VariableAmount * VTripNo)
                                end;



                                //   i:=1;

                                i += y;

                            until BillingLineSum.Next = 0;

                            //89
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

                        TotalAvailAmount := TruckAvaiCount * FixedRate;
                        FTotalAvailAmount := TruckAvaiCount * FixedRate;

                    end;



                    ///Until ContractLine.Next = 0;
                    //        end;





                end;

                //        end;
                //  TotalAmount := VariableAmount;
                //  end;


                trigger OnPreDataItem()
                begin
                    y := 1;
                    i := 0;
                    TotalAvailAmount := 0;
                    TotalAmount := 0;
                    VariableAmount := 0;

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
                ContractAgreement.Get(ContractID);
                KiloPertrip := ContractAgreement."Kilometer Per Trip";
                FreqTrip := ContractAgreement."Freqency Per trip";

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
        BillingProcessed: Record "Processed Billing Line";
        // ContractAgreement: Record "Contract Agreement";
        ContractLine: Record "Contract Line";
        BillingLineSum: Record "Processed Billing Line";
        ProcessedBillingLineFixed: Record "Processed Billing Line";
        TruckNo: Code[20];
        Nodays: Decimal;
        FixedRate: Decimal;
        TotalAmount: decimal;
        i: Integer;
        FixedCostAmount: Decimal;
        VariableCostAmount: Decimal;
        FixedAmount: Decimal;
        VariableAmount: Decimal;
        y: Integer;
        Narration: Text[250];
        Description: Text[250];
        TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
        FixedPricePeLoca: Record "Fixed Price Per Location";
        TruckAvaiCount: Decimal;
        TotalAvailAmount: Decimal;
        MillageRange: Record "Millage Range Controls";
        FTruckAvaiCount: Decimal;
        FTotalAvailAmount: Decimal;
        ContractID: Code[20];
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
        FTripNo: Integer;
        FTotalTripNo: Integer;
        VTripNo: Integer;
        VTotalTripNo: Integer;
        FFixedRate: Decimal;
        VVariableAmount: Decimal;
        FreqTrip: Decimal;
        KiloPertrip: Decimal;
}


//}
