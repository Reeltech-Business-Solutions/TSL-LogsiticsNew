page 50255 AdvanceType
{
    APIGroup = 'advanceType';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'advanceType';
    DelayedInsert = true;
    EntityName = 'advanceType';
    EntitySetName = 'advanceTypes';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Advance));
    
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
                    ApplicationArea = All;
                }
                 field(description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                 field(type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }
}
