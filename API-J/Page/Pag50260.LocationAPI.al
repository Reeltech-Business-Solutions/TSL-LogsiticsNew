page 50260 "Locations API"
{
    APIGroup = 'location';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'locationAPI';
    DelayedInsert = true;
    EntityName = 'location';
    EntitySetName = 'locations';
    PageType = API;
    SourceTable = Location;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(code; Rec.Code)
                {

                }
                field(name; Rec.Name)
                {

                }
            }
        }
    }
}
