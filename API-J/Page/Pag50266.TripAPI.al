page 50266 TripAPI
{
    APIGroup = 'trip';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'tripAPI';
    DelayedInsert = true;
    EntityName = 'trip';
    EntitySetName = 'trips';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(4));
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId;Rec.SystemId)
                {
                
                }
                field(code;Rec.Code)
                {

                }
                field(name;Rec.Name)
                {

                }
            }
        }
    }
}
