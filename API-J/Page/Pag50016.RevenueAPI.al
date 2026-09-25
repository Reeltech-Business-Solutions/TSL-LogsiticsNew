page 50016 "Revenue API"
{
    APIGroup = 'revenue';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'revenueAPI';
    DelayedInsert = true;
    EntityName = 'rev';
    EntitySetName = 'revs';
    PageType = API;
    SourceTable = "Dimension Value";
    SourceTableView = where("Global Dimension No." = const(2));

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
