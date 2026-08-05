page 50158 "Truck Avail Entry Subform API"
{
    APIGroup = 'AvailEntrySubform';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'truckAvailEntrySubformAPI';
    DelayedInsert = true;
    EntityName = 'TruckAvailEntry';
    EntitySetName = 'TruckAvailEntrySubform';
    PageType = API;
    SourceTable = "Truck Avail. Entry Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(customerNo; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field(contractNo; Rec."Contract No.")
                {
                    Caption = 'Contract No.';
                }
                field(leasingTruckNo; Rec."Leasing Truck No")
                {
                    Caption = 'Leasing Truck No';
                }
                field(vehicleMake; Rec."Vehicle Make")
                {
                    Caption = 'Vehicle Make';
                }
                field(vehicleModel; Rec."Vehicle Model")
                {
                    Caption = 'Vehicle Model';
                }
                field(vehicleRegNo; Rec."Vehicle Reg. No.")
                {
                    Caption = 'Vehicle Reg. No.';
                }
                field(fleetNo; Rec."Fleet No.")
                {
                    Caption = 'Fleet No.';
                }
                field(vehicleName; Rec."Vehicle Name")
                {
                    Caption = 'Vehicle Name';
                }
                field(unavailable; Rec.Unavailable)
                {
                    Caption = 'Unavailable';
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field(quantity; Rec.Quantity)
                {
                    Caption = 'Quantity';
                }
                field(lineNo; Rec."Line No.")
                {
                    Caption = 'Line No.';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
