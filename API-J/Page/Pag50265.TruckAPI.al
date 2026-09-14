page 50265 TruckAPI
{
    APIGroup = 'truck';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'truckAPI';
    DelayedInsert = true;
    EntityName = 'truckyyy';
    EntitySetName = 'trucks';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(3));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
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
