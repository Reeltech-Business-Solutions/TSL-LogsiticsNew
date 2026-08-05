page 50157 "Truck Non Avail Entry API"
{
    APIGroup = 'AvailabilityEntry';
    APIPublisher = 'CapitalCore';
    APIVersion = 'v1.0';
    Caption = 'truckNonAvailEntryAPI';
    DelayedInsert = true;
    EntityName = 'TruckNonAvail';
    EntitySetName = 'TruckNonAvailEntry';
    PageType = API;
    SourceTable = "Truck Availability Entry";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(no; Rec."No.")
                {
                    Caption = 'No.';
                }
                field("date"; Rec."Date")
                {
                    Caption = 'Date';
                }
                field(userID; Rec."User ID")
                {
                    Caption = 'User ID';
                }
                field(userDate; Rec."User Date")
                {
                    Caption = 'User Date';
                }
                field(systemId; Rec.SystemId)
                {
                    Caption = 'SystemId';
                }
            }
        }
    }
}
