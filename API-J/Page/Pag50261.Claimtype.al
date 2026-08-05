page 50261 ClaimType
{
    APIGroup = 'claimType';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'claimType';
    DelayedInsert = true;
    EntityName = 'claimType';
    EntitySetName = 'claimTypes';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Claim));

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
                field(description; Rec.Description)
                {

                }
                field(type; Rec.Type)
                {

                }


            }
        }
    }
}
