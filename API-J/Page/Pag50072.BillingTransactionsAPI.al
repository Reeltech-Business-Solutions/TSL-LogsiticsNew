page 50072 "Billing Transactions API"
{
    APIGroup = 'Billings';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'billingTransactionsAPI';
    DelayedInsert = true;
    EntityName = 'BillingTrans';
    EntitySetName = 'BillngTransApi';
    PageType = API;
    SourceTable = "Billing Line";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(entryNo; Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                }
                field(contractId; Rec."Contract Id")
                {
                    Caption = 'Contract Id';
                }
                field(transactionDate; Rec."Transaction Date")
                {
                    Caption = 'Transaction Date';
                }
                field(truckNo; Rec."Truck No.")
                {
                    Caption = 'Truck No.';
                }
                field(truckType; Rec."Truck Type")
                {
                    Caption = 'Truck Type/Vehicle Make';
                }
                field(batchEntryNo; Rec."Batch Entry No")
                {
                    Caption = 'Batch Entry No';
                }
                field(NoofDays; Rec."No of Days")
                {
                    Caption = 'No of Days';
                }
                field(CustomerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(distanceCoveredKm; Rec."Distance Covered Km")
                {
                    Caption = 'Distance Covered Km';
                }
                field(directDispatch; Rec."Direct Dispatch")
                {
                    Caption = 'Direct Dispatch';
                }
                field(fixedCost; Rec."Fixed Cost")
                {
                    Caption = 'Fixed Cost';
                }
                field(loadingDelayCost; Rec."Loading Delay Cost")
                {
                    Caption = 'Loading Delay Cost';
                }
                field(qtyLoaded; Rec.Quantity)
                {
                    Caption = 'Qty Loaded';
                }
                field(variableCost; Rec."Variable Cost")
                {
                    Caption = 'Variable Cost';
                }
                field(shortages; Rec.Shortages)
                {
                    Caption = 'Shortages';
                }
                field(shortagesAmount; Rec."Shortages Amount")
                {
                    Caption = 'Shortages Amount';
                }
                field(arrivalTimeAtOffloadingPoint; Rec."ArrivalTime at OffloadingPoint")
                {
                    Caption = 'Arrival Time at Offloading Point ';
                }
                field(arrivalTimeAtLoadingPoint; Rec."Arrival time at loading point")
                {
                    Caption = 'Arrival time at loading point';
                }
                field(departureTimeFromLoadingPoint; Rec."DepartureTimefrom LoadingPoint")
                {
                    Caption = 'Departure Time from Loading Point';
                }
                field(departureTimeFromOffloadingPoint; Rec."DepartureTimefromOfloadinPoint")
                {
                    Caption = 'Departure Time from Offloading Point ';
                }
                field(residencyTimeAtLoadingPoint; Rec."Residency Time at loadingpoint")
                {
                    Caption = 'Residency Time at loading point ';
                }
                field(residencyTimeAtOffLoadingPoint; Rec."ResidencyTime at ofloadinpoint")
                {
                    Caption = 'Residency Time at off-loading point ';
                }
                field(toleranceKG; Rec."Tolerance KG")
                {
                    Caption = 'Tolerance KG';
                }
                field(userId; Rec."User Id")
                {
                    Caption = 'TMR User ID';
                }
                field(quantityLoadedNetWgtKg; Rec."Quantity Loaded NetWgt Kg")
                {
                    Caption = 'Quantity Loaded NetWgt Kg';
                }
                field(quantityOffloadedKg; Rec."Quantity Offloaded Kg")
                {
                    Caption = 'Quantity Loaded NetWgt Kg';
                }
                field(actualJourneyTime; Rec."Actual Journey Time")
                {
                    Caption = 'Actual Journey Time';
                }
                field(expectedJourneyTime; Rec."Expected Journey Time")
                {
                    Caption = 'Expected Journey Time';
                }
                field(avaialabilityPerTruckNoDays; Rec."Avaialability Per TruckNo.Days")
                {
                    Caption = 'Avaialability Per Truck  No. Days';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
                field(TMRNo; Rec."TMR No.")
                {
                    ApplicationArea = All;
                }
                field(DriverAllowance; Rec."Driver Allowance")
                {

                }

            }
        }
    }
}
