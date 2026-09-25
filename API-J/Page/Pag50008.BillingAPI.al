page 50008 BillingAPI
{
    APIGroup = 'billing';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'billingAPI';
    DelayedInsert = true;
    EntityName = 'billing';
    EntitySetName = 'billings';
    PageType = API;
    SourceTable = "Billing Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field("entryNo"; Rec."Entry No.")
                {

                }
                field("contractId"; Rec."Contract Id")
                {

                }
                field("truckNo"; Rec."Truck No.")
                {

                }
                field("distanceCoveredKm"; Rec."Distance Covered Km")
                {

                }
                field(quantity; Rec.Quantity)
                {

                }
                field(UOM; Rec."Unit Of Measure")
                {

                }
                field(shortages; Rec.Shortages)
                {

                }
                field("shortagesAmount"; Rec."Shortages Amount")
                {

                }
                field("ArrivalTimeAtOffLoadingPoint"; Rec."ArrivalTime at OffloadingPoint")
                {

                }
                field("ArrivalTimeAtLoadingPoint"; Rec."Arrival time at loading point")
                {

                }
                field("AvaialabilityPerTruckNoDays"; Rec."Avaialability Per TruckNo.Days")
                {

                }
                field("DepartureTimefromLoadingPoint"; Rec."DepartureTimefrom LoadingPoint")
                {

                }
                field(DepartureTimefromOfloadinPoint; Rec.DepartureTimefromOfloadinPoint)
                {

                }
                field("ResidencyTimeAtOfLoadinPoint"; Rec."ResidencyTime at ofloadinpoint")
                {

                }
                field("toleranceKG"; Rec."Tolerance KG")
                {

                }
                field("quantityLoaded"; Rec."Quantity Loaded NetWgt Kg")
                {

                }
                field("quantityDelivered"; Rec."Quantity Offloaded Kg")
                {

                }
                field("fixedRate"; Rec."Fixed Rate")
                {

                }
                field("variableRate"; Rec."Variable Rate")
                {

                }
                field("driversName"; Rec."Drivers Name")
                {

                }
                field("truckId"; Rec."Truck Id")
                {

                }
                field("wayBillNo"; Rec."WayBill No.")
                {

                }
                field("locationDestination"; Rec."Location Destination")
                {

                }
                field("productType"; Rec."Product Type")
                {

                }
                field("tripNo"; Rec."Trip No.")
                {

                }
                field("FMNIdle"; Rec."FMN Idle")
                {

                }
                field("customerIdle"; Rec."CST Idle")
                {

                }
                field("loadingPoint"; Rec."Loading Point")
                {

                }
                field("freightNaira"; Rec."Freight(rate) Naira")
                {

                }
                field(Amount; Rec.Amount)
                {

                }
                field("DieselQuantity"; Rec."Diesel Quantity/Volume")
                {

                }
                field("DieselRate"; Rec."Diesel Rate")
                {

                }
                field("FreightUSD"; Rec."Freight(rate) USD")
                {

                }
                field("DriversNo"; Rec."Driver's No.")
                {

                }
                field("LoadingDate"; Rec."Loading Date")
                {

                }
                field(Overage; Rec.Overage)
                {

                }

            }
        }
    }
}
