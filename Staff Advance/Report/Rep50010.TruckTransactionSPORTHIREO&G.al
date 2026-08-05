report 50010 "Truck Transaction Report"
{
    ApplicationArea = All;
    Caption = 'SPORTHIRE O&G  Processing2';
    DefaultLayout = RDLC;
    RDLCLayout = './Process Transaction SPORTHIREO&G2.rdl';
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
            column(Description; Description)
            {
                //Description
            }

            dataitem(Locationre; Location)
            {
                column(Location; Locationre.Code)
                {
                }
                column(Distance1; Distance)
                {
                }
                column(VariableAmount; VariableAmount)
                {
                }
                column(TruckCapacity; TruckCapacity)
                {
                }
                column(VariableRate; VariableRate)
                {
                    //Description
                }
                column(ItemDescription; ItemDescription)
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
                    VariableRate := 0;
                    ItemDescription := '';
                    VariableAmount := 0;

                    //loc := Locationre.Code;
                    BillingLineSum.Reset();
                    BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination", Treated);
                    BillingLineSum.SetRange("Contract Id", ContractID);
                    // BillingLineSum.SetRange("Truck Type", "Truck Type");
                    // BillingLineSum.SetRange("Truck No.", "Truck Code");
                    BillingLineSum.SetRange("Location Destination", Locationre.Code);
                    BillingLineSum.Setfilter(Treated, '%1', true);
                    BillingLineSum.SetFilter("Transaction Date", '%1..%2', Dstart, DEnd);
                    if BillingLineSum.FindFirst() then begin
                        repeat
                            VariableAmount += (BillingLineSum.Quantity * BillingLineSum."Variable Rate");
                            VariableRate := BillingLineSum."Variable Rate";
                            TruckCapacity := BillingLineSum."Truck Capacity";
                            ItemDescription := BillingLineSum."Location Destination";
                            Distance += BillingLineSum.Quantity;







                        until BillingLineSum.Next = 0;

                    end;
                    // until Location.Next = 0
                end;

                // end;


            }



            trigger OnAfterGetRecord()
            begin





            end;


            trigger OnPreDataItem()
            begin
                Description := Narration;
                ContractID := getfilter(ContractAgreement."No.");
                DStart := GetRangeMin("Date Filter");
                DEnd := GetRangeMax("Date Filter");






                // if Location.FindFirst() then begin
                //     repeat


                //         Distance := 0;
                //         VariableAmount := 0;
                //         VariableRate := 0;
                //         TruckCapacity := '';

                //         BillingLineSum.Reset();
                //         BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
                //         BillingLineSum.SetRange("Contract Id", ContractID);
                //         BillingLineSum.SetRange("Location Destination", Location.Code);
                //         BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
                //         if BillingLineSum.FindFirst() then begin
                //             repeat
                //                 VariableAmount += (BillingLineSum.Quantity * BillingLineSum."Variable Rate");
                //                 VariableRate := BillingLineSum."Variable Rate";
                //                 TruckCapacity := BillingLineSum."Truck Capacity";

                //                 Distance += BillingLineSum.Quantity;




                //             until BillingLineSum.Next = 0;

                //         end;
                //     until Location.Next = 0
                // end;

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
        ItemDescription: Text[150];
        TruckCapacity: Text[20];
        VariableRate: Decimal;
        Qty: Decimal;
        ContractID: Code[20];
        DStart: Date;
        DEnd: Date;
        TruckType: Code[20];
        Description: Text[150];
        Narration: Text[150];
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



}
