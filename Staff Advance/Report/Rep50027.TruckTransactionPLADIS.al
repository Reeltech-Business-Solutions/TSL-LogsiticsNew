// /// <summary>
// /// Report Truck Transaction Pladis (ID 50033).
// /// </summary>
// report 50036 "Truck Transaction Pladiss"
// {
//      ApplicationArea = All;
//     Caption = 'PLADIS  Processing22';
//     DefaultLayout = RDLC;
//     RDLCLayout = './Process Transaction PLADIS2.rdl';
//     UsageCategory = Lists;
//     dataset
//     {
//         dataitem(ContractAgreement; "Contract Agreement")
//         {
//             RequestFilterFields = "No.", "Date Filter";

//             column(No; "No.")
//             {
//             }
//             column(CustomerCode; "Customer Code")
//             {
//             }
//             column(CustomerName; "Customer Name")
//             {
//             }
//             column(CustomerAddress; "Customer Address")
//             {
//             }
//             column(ContractDate; "Contract Date")
//             {
//             }
//             column(Phone; Phone)
//             {
//             }
//             column(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
//             {
//             }
//             column(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
//             {
//             }
//             column(ShortcutDimension3Code; "Shortcut Dimension 3 Code")
//             {
//             }
//             column(RevenueCalcCode; "Revenue Calc. Code")
//             {
//             }
//             column(VehicleCount; "Vehicle Count")
//             {
//             }
//             column(ContractType; "Contract Type")
//             {
//             }
//             column(NoSeries; "No. Series")
//             {
//             }
//             column(Status; Status)
//             {
//             }
//             column(FormularType; "Formular Type")
//             {
//             }
//             column(TargetAvailability; "Target Availability")
//             {
//             }
//             column(UnitOfMeasure; "Unit Of Measure")
//             {
//             }
//             column(UseNonAvailEntry; "Use Non-Avail. Entry")
//             {
//             }
//             column(ContractGroup; "Contract Group")
//             {
//             }
//             column(SystemCreatedAt; SystemCreatedAt)
//             {
//             }
//             column(SystemCreatedBy; SystemCreatedBy)
//             {
//             }
//             column(SystemId; SystemId)
//             {
//             }
//             column(SystemModifiedAt; SystemModifiedAt)
//             {
//             }
//             column(SystemModifiedBy; SystemModifiedBy)
//             {
//             }
//             column(TripNo1; TripNo[1])
//             {
//             }
//             column(TripNo2; TripNo[2])
//             {
//             }
//             column(TripNo3; TripNo[3])
//             {
//             }
//             column(TripNo4; TripNo[4])
//             {
//             }
//             column(TripNo5; TripNo[5])
//             {
//             }
//             column(TripNo6; TripNo[6])
//             {
//             }
//             column(TripNo7; TripNo[7])
//             {
//             }
//             column(TripNo8; TripNo[8])
//             {
//             }
//             column(TripNo9; TripNo[9])
//             {
//             }
//             column(TripNo10; TripNo[10])
//             {
//             }
//             column(Loc1; Loc[1])
//             {
//             }
//             column(Loc2; Loc[2])
//             {
//             }
//             column(Loc3; Loc[3])
//             {
//             }
//             column(Loc4; Loc[4])
//             {
//             }
//             column(Loc5; Loc[5])
//             {
//             }
//             column(Loc6; Loc[6])
//             {
//             }
//             column(Loc7; Loc[7])
//             {
//             }
//             column(Loc8; Loc[8])
//             {
//             }
//             column(Loc9; Loc[9])
//             {
//             }
//             column(Loc10; Loc[10])
//             {
//             }
//             column(Distance1; Distance[1])
//             {
//             }
//             column(Distance2; Distance[2])
//             {
//             }
//             column(Distance3; Distance[3])
//             {
//             }
//             column(Distance4; Distance[4])
//             {
//             }
//             column(Distance5; Distance[5])
//             {
//             }
//             column(Distance6; Distance[6])
//             {
//             }
//             column(Distance7; Distance[7])
//             {
//             }
//             column(Distance8; Distance[8])
//             {
//             }
//             column(Distance9; Distance[9])
//             {
//             }
//             column(Distance10; Distance[10])
//             {
//             }
//             column(freightRate1; freightRate[1])
//             {
//             }
//             column(freightRate2; freightRate[2])
//             {
//             }
//             column(freightRate3; freightRate[3])
//             {
//             }
//             column(freightRate4; freightRate[4])
//             {
//             }
//             column(freightRate5; freightRate[5])
//             {
//             }
//             column(freightRate6; freightRate[6])
//             {
//             }
//             column(freightRate7; freightRate[7])
//             {
//             }
//             column(freightRate8; freightRate[8])
//             {
//             }
//             column(freightRate9; freightRate[9])
//             {
//             }
//             column(freightRate10; freightRate[10])
//             {
//             }



//             dataitem("Contract Line"; "Contract Line")
//             {
//                 // DataItemTableView = WHERE("Document No." = "No.");
//                 DataItemTableView = SORTING("Document No.", "Line No.");
//                 DataItemLink = "Document No." = FIELD("No."), "Date Filter" = Field("Date Filter");
//                 // DataItemLinkReference = "Contract Agreement";
//                 // RequestFilterFields = "Document Type", "No.";
//                 // RequestFilterHeading = 'Sales Document';

//                 column(DocumentNo; "Contract Line"."Document No.")
//                 {
//                 }
//                 column(TruckCode; "Contract Line"."Truck Code")
//                 {
//                 }
//                 column(TruckType; "Contract Line"."Truck Type")
//                 {
//                 }
//                 column(TruckNo; TruckNo)
//                 {
//                 }
//                 column(NoDays; NoDays)
//                 {
//                 }
//                 column(TotalAmount; TotalAmount)
//                 {
//                 }
//                 column(AssetTinNo; "Contract Line"."Asset Tin No.")
//                 {
//                 }
//                 column(FixedRate; FixedRate)
//                 {
//                 }
//                 column(i; i)
//                 {
//                 }
//                 column(VariableAmount; VariableAmount)
//                 {
//                 }
//                 column(VariableRate; VariableRate)
//                 {
//                 }
//                 column(ItemDescription; ItemDescription)
//                 {
//                 }
//                 column(TruckCapacity; TruckCapacity)
//                 {
//                 }
//                 column(Qty; Qty)
//                 {
//                 }
//                 column(TruckAvaiCount; TruckAvaiCount)
//                 {
//                 }
//                 column(TotalAvailAmount; TotalAvailAmount)
//                 {
//                 }
//                 column(Asset_Registration_No_;"Asset Registration No.")
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                        i:=0;
//                     //ContractAgreement.Reset();
//                     // ContractAgreement.SetRange("No.", "Contract Id");
//                     // if ContractAgreement.FindFirst() then

//                     // ContractLine.Reset();
//                     //   ContractLine.SetCurrentKey("Document No.");
//                     //   ContractLine.SetRange("Document No.", "No.");
//                     //  if ContractLine.FindFirst() then begin
//                     //     repeat
//                     //    TruckNo :='';
//                     //   NoDays := 0;
//                     VariableAmount:= 0;
//                     FixedRate :=0;
//                     TruckAvaiCount :=0;
//                     TotalAvailAmount :=0;
//                     //    Location.SetRange(Code);
//                     //    if Location.FindFirst() then
//                     //    repeat

//                     if "Truck Code" <> '' then begin
//                         BillingLineSum.Reset();
//                         BillingLineSum.SetCurrentKey("Contract Id","Truck No.", "Transaction Date");
//                         BillingLineSum.SetRange("Contract Id", "Document No.");
//                       //  BillingLineSum.SetRange("Truck Type", "Truck Type");
//                         BillingLineSum.SetRange("Truck No.", "Truck Code");
//                      //   BillingLineSum.SetRange("Location Destination", Location.Code);
//                         BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
//                         if BillingLineSum.FindFirst() then begin
//                             repeat
//                                 //until BillingLineSum.Next = 0;
//                                    i+=1;

//                                 FixedPricePeLoca.Reset();
//                                 FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
//                                 FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
//                                 FixedPricePeLoca.SetRange("Contract ID", BillingLineSum."Contract Id");
//                                 FixedPricePeLoca.SetFilter(Location, BillingLineSum."Location Destination");
//                               //  FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

//                                 if FixedPricePeLoca.FindFirst() then begin
//                                  //   repeat


//                                         BillingVariableAmt := FixedPricePeLoca."Fixed Price";
//                                         BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
//                                         PricePerLoc := FixedPricePeLoca."Fixed Price";
//                                         VariableAmount += PricePerLoc;

//                                 //    Until FixedPricePeLoca.Next = 0;

//                                 end;

//                                 MillageRange.Reset();
//                                 MillageRange.SetCurrentKey("Truck Type", "Contract No.");
//                                 MillageRange.SetRange("Truck Type",BillingLineSum."Truck Type");
//                                 MillageRange.SetRange("Contract No.",BillingLineSum."Contract Id");
//                                 if MillageRange.FindFirst() then begin
//                                     FixedRate := MillageRange."Fixed Rate";
//                                   //  TotalAmountTrip := MillageRange."Fixed Rate" * "Available days";
//                                 end;

//                                 // TruckNo := BillingLineSum."Truck NO.";
//                                 // NoDays := BillingLineSum."AvaialabilityPer Truck No.Days";
//                                 // TotalAmount := BillingLineSum."Fixed Cost";
//                                 // FixedRate := BillingLineSum."Fixed Rate";
//                                 // VariableAmount := BillingLineSum."Variable Cost";
//                                 // VariableRate := BillingLineSum."Variable Rate";
//                                 // ItemDescription := BillingProcessed."Item Description";
//                                 // Qty := BillingLineSum.Quantity;
//                                 // i += y;


//                             until BillingLineSum.Next = 0;


//                         end;
//                            TruckAvailEntryLines.Reset();
//                         TruckAvailEntryLines.SetCurrentKey("Leasing Truck No","Contract No.");  
//                         TruckAvailEntryLines.SetRange("Leasing Truck No", "Truck Code");
//                       //  TruckAvailEntryLines.Setrange("Vehicle Make", "Truck Type");
//                         TruckAvailEntryLines.Setrange("Contract No.", "Document No.");
//                         if TruckAvailEntryLines.FindFirst() then
//                             repeat
//                                 if (TruckAvailEntryLines."Start Date" >= Getrangemin("Date Filter")) and (TruckAvailEntryLines."End Date" <= Getrangemax("Date Filter")) then begin
//                                    // TruckAvaiCount := TruckAvaiCount + ((TruckAvailEntryLines."End Date" - TruckAvailEntryLines."Start Date") + 1)
//                                     TruckAvaiCount += TruckAvailEntryLines.Quantity;
//                                 end;
//                             until TruckAvailEntryLines.Next = 0;

//                             TotalAvailAmount := TruckAvaiCount * FixedRate;
//                     end;

//                     ///Until ContractLine.Next = 0;
//                     //        end;
//                     TotalAmount := TotalAvailAmount + VariableAmount ;

//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     // y := 1;
//                     // i := 0;
//                     // TruckNo := '';
//                     // NoDays := 0;
//                     // TotalAmount := 0;
//                     // FixedRate := 0;
//                     // VariableAmount := 0;
//                     // ItemDescription := '';
//                     // TruckCapacity := '';
//                     // VariableRate := 0;
//                     // Qty := 0;
//                     //ContractID := getfilter(ContractAgreement."No.");
//                 end;

//             }
//             trigger OnAfterGetRecord()
//             begin



//                 //        j := 0;
//                 //    // Location.SetRange(Code);
//                 //     if Location.FindFirst() then
//                 //         repeat
//                 //             BillingLineSum.Reset();
//                 //             BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
//                 //             BillingLineSum.SetRange("Contract Id", "No.");
//                 //             // BillingLineSum.SetRange("Truck Type", "Truck Type");
//                 //             // BillingLineSum.SetRange("Truck No.", "Truck Code");
//                 //             BillingLineSum.SetRange("Location Destination", Location.Code);
//                 //             BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
//                 //             if BillingLineSum.FindFirst() then begin
//                 //                 repeat
//                 //                     j := j + 1;
//                 //                     Loc[j] := BillingLineSum."Location Destination";
//                 //                     message(Loc[j] );
//                 //                 until BillingLineSum.Next = 0;

//                 //             end;
//                 //         until Location.Next = 0;

//                 //j := 0;
//                 // for t := 1 to J do begin
//                 //     Location.SetRange(Code,Loc[t]);
//                 //     if Location.FindFirst() then
//                 //         repeat
//                 //             BillingLineSum.Reset();
//                 //             BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
//                 //             BillingLineSum.SetRange("Contract Id", ContractID);
//                 //             // BillingLineSum.SetRange("Truck Type", "Truck Type");
//                 //             // BillingLineSum.SetRange("Truck No.", "Truck Code");
//                 //             BillingLineSum.SetRange("Location Destination", Loc[t]);
//                 //             BillingLineSum.SetFilter("Transaction Date",'%1..%2',Getrangemin("Date Filter"), Getrangemax("Date Filter"));
//                 //             if BillingLineSum.FindFirst() then begin
//                 //                 repeat
//                 //                     TripNo[t] :=TripNo[t] + 1;
//                 //                     loc[t] := BillingLineSum."Location Destination";
//                 //                     Distance[t] := Distance[t] + BillingLineSum.Quantity;



//                 //                 FixedPricePeLoca.Reset();
//                 //                 FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
//                 //                // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
//                 //                 FixedPricePeLoca.SetRange("Contract ID", "No.");
//                 //                 FixedPricePeLoca.SetFilter(Location, Loc[t]);
//                 //                // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

//                 //                 if FixedPricePeLoca.FindFirst() then begin
//                 //                   //  repeat

//                 //                          freightRate[t] := FixedPricePeLoca."Fixed Price";
//                 //                         // BillingVariableAmt := FixedPricePeLoca."Fixed Price";
//                 //                         // BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
//                 //                         // PricePerLoc := FixedPricePeLoca."Fixed Price";
//                 //                         // FixedRate += PricePerLoc;

//                 //                  //   Until FixedPricePeLoca.Next = 0;

//                 //                 end;


//                 //                 until BillingLineSum.Next = 0;

//                 //             end;
//                 //         until Location.Next = 0
//                 // end
//             end;


//             trigger OnPreDataItem()
//             begin
//                 ContractID := getfilter(ContractAgreement."No.");
//                 Message(ContractID);
//                 j := 0;
//                 TripNo[1] := 0;
//                 loc[1] := '';
//                 Distance[1] := 0;
//                 freightRate[1] := 0;
//                 TripNo[2] := 0;
//                 loc[2] := '';
//                 Distance[2] := 0;
//                 freightRate[2] := 0;
//                 TripNo[3] := 0;
//                 loc[3] := '';
//                 Distance[3] := 0;
//                 freightRate[3] := 0;
//                 TripNo[4] := 0;
//                 loc[4] := '';
//                 Distance[4] := 0;
//                 freightRate[4] := 0;
//                 TripNo[5] := 0;
//                 loc[5] := '';
//                 Distance[5] := 0;
//                 freightRate[5] := 0;
//                 TripNo[6] := 0;
//                 loc[6] := '';
//                 Distance[6] := 0;
//                 freightRate[6] := 0;
//                 // Loc[1]:=''; Loc[2]:='';Loc[3]:='';Loc[4]:='';Loc[5]:='';Loc[6]:='';Loc[7]:='';Loc[8]:='';Loc[9]:='';Loc[10]:='';
//                 //  Loc[j]:='';
//                 //  Location.SetRange(Code);
//                 if Location.FindFirst() then begin

//                     Repeat
//                         // Message(Location.Code);
//                         BillingLineSum.Reset();
//                         BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
//                         BillingLineSum.SetRange("Contract Id", ContractID);
//                         // BillingLineSum.SetRange("Truck Type", "Truck Type");
//                         // BillingLineSum.SetRange("Truck No.", "Truck Code");
//                         BillingLineSum.SetFilter("Location Destination", Location.Code);
//                         BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
//                         if BillingLineSum.FindFirst() then begin
//                             //  repeat
//                             j := j + 1;
//                             // message('Thanks');
//                             Loc[j] := BillingLineSum."Location Destination";
//                             //message(Loc[j] );
//                             //   until BillingLineSum.Next = 0;

//                         end;
//                     //   message(Loc[j] );
//                     until Location.Next = 0;
//                 end;
//                 //  message(Format(j));
//                 //ContractID := getfilter(ContractAgreement."No.");


//                 for t := 1 to J do begin
//                     Location.SetRange(Code, Loc[t]);
//                     if Location.FindFirst() then
//                         repeat
//                             BillingLineSum.Reset();
//                             BillingLineSum.SetCurrentKey("Contract Id", "Transaction Date", "Location Destination");
//                             BillingLineSum.SetRange("Contract Id", ContractID);
//                             // BillingLineSum.SetRange("Truck Type", "Truck Type");
//                             // BillingLineSum.SetRange("Truck No.", "Truck Code");
//                             BillingLineSum.SetRange("Location Destination", Loc[t]);
//                             BillingLineSum.SetFilter("Transaction Date", '%1..%2', Getrangemin("Date Filter"), Getrangemax("Date Filter"));
//                             if BillingLineSum.FindFirst() then begin
//                                 repeat
//                                     TripNo[t] := TripNo[t] + 1;
//                                     loc[t] := BillingLineSum."Location Destination";
//                                     Distance[t] := Distance[t] + BillingLineSum.Quantity;



//                                     FixedPricePeLoca.Reset();
//                                     FixedPricePeLoca.SetCurrentKey(FixedPricePeLoca."Truck Type", FixedPricePeLoca."Contract ID");
//                                     // FixedPricePeLoca.SetRange("Truck Type", BillingLineSum."Truck Type");
//                                     FixedPricePeLoca.SetRange("Contract ID", ContractID);
//                                     FixedPricePeLoca.SetFilter(Location, Loc[t]);
//                                     // FixedPricePeLoca.SetFilter("Source Location", BillingLineSum."Direct Dispatch");

//                                     if FixedPricePeLoca.FindFirst() then begin
//                                         //  repeat

//                                         freightRate[t] := FixedPricePeLoca."Fixed Price";
//                                         // BillingVariableAmt := FixedPricePeLoca."Fixed Price";
//                                         // BillingFXPriceLoc := FixedPricePeLoca."Fixed Price";
//                                         // PricePerLoc := FixedPricePeLoca."Fixed Price";
//                                         // FixedRate += PricePerLoc;

//                                         //   Until FixedPricePeLoca.Next = 0;

//                                     end;


//                                 until BillingLineSum.Next = 0;

//                             end;
//                         until Location.Next = 0
//                 end
//             end;


//         }

//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }

//     }
//     trigger OnPreReport()

//     begin

//     end;

//     var
//         BillingProcessed: Record "Processed Billing Line";
//         // ContractAgreement: Record "Contract Agreement";
//         ContractLine: Record "Contract Line";
//         BillingLineSum: Record "Processed Billing Line";
//         ProcessedBillingLineFixed: Record "Processed Billing Line";
//         TruckNo: Code[20];
//         Nodays: Decimal;
//         TotalAmount: decimal;
//         i: Integer;
//         //  t:Integer;
//         FixedCostAmount: Decimal;
//         VariableCostAmount: Decimal;
//         FixedAmount: Decimal;
//         VariableAmount: Decimal;
//         y: Integer;
//         j: Integer;
//         ItemDescription: Text[150];
//         TruckCapacity: Text[20];
//         VariableRate: Decimal;
//         Qty: Decimal;
//         TruckAvaiCount: Decimal;
//         NodaysAvailable: Decimal;
//         TotalTruckAvail: Decimal;
//         TotalTruckAvailValue: Decimal;
//         SalesHeader: Record "Sales Header";
//         SalesLine: Record "Sales Line";
//         MillageRange: Record "Millage Range Controls";
//         BillingLine: Record "Billing Line";
//         BillingLineUpdate: Record "Billing Line";
//         transactionBuffer: Record "Transaction Buffer";
//         transactionBuffSum: Record "Transaction Buffer";
//         NoDayWork: Record "No. Days Work";
//         BillingTruckCount: Integer;
//         TruckAvailEntryLines: Record "Truck Avail. Entry Lines";
//         FixedPricePeLoca: Record "Fixed Price Per Location";
//         FixedPricePerKm: Record "Millage Range Controls";
//         PricePeLocaDire: Decimal;
//         PricePeLocaDepot: Decimal;
//         PricePerKm: Decimal;
//         ContractAmunt: Decimal;
//         FixedRate: Decimal;
//         FreightCharge: Decimal;
//         FixedCalc: Decimal;
//         VariableCalc: Decimal;
//         SalesHeaderType: Record "Sales Header";
//         TotalAvailAmount2: Decimal;
//         ContractTransacHist: Record "Contract Transaction History";
//         ContractAmuntTotal: Decimal;
//         QuantityLoaded: Decimal;
//         BillingPricePerKm: Decimal;
//         BillingFixedRate: Decimal;
//         BillingVariableCalc: Decimal;
//         BillingFixedPriceKm: Decimal;
//         TotalDistance: Decimal;
//         FixedAsset: Record "Fixed Asset";
//         ProcessedBillingLine: Record "Processed Billing Line";
//         EmployeeRec: Record Employee;
//         FixedCalc2: decimal;
//         VariableCalc2: decimal;
//         FixedCalc3: decimal;
//         FixedCalc4: decimal;
//         VariableCalc3: decimal;
//         TotalFixedCalc: decimal;
//         TotalVariableCalc: decimal;
//         BillingVariableAmt: Decimal;
//         BillingFXPriceLoc: Decimal;
//         PricePerLoc: Decimal;
//         ContractID: Code[20];
//         Location: Record Location;
//         Loc: array[20] of Code[20];
//         t: Integer;
//         TripNo: array[20] of Decimal;
//         Distance: array[20] of Decimal;
//         freightRate: array[20] of Decimal;
//         TotalAvailAmount: Decimal;
//        // TotalAmount:Decimal;
//        // TruckAvaiCount: Decimal;


// }
