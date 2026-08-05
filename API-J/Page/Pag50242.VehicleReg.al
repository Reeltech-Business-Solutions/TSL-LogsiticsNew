page 50242 "VehicleReg API"
{
    APIGroup = 'Vehicle';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'vehicleRegAPI';
    DelayedInsert = true;
    EntityName = 'VehicleReg';
    EntitySetName = 'VehicleRegAPI';
    PageType = API;
    SourceTable = "Vehicle Registration";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(narrativeOfProblem; Rec."Narrative of Problem")
                {
                    Caption = 'Narrative of Problem';
                }
                field(serviceItem; Rec."Service Item")
                {
                    Caption = 'Service Item';
                }
                field(locationCode; Rec."Location Code")
                {
                    Caption = 'Location Code';
                }
            }
        }
    }
}
