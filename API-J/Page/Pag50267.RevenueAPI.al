page 50267 RevenueAPI
{
    APIGroup = 'revenue';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'revenueAPI';
    DelayedInsert = true;
    EntityName = 'revenue';
    EntitySetName = 'revenues';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(2));
    
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
