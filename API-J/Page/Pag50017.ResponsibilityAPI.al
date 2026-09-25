page 50017 "Responsibility API"
{
    APIGroup = 'response';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'responsibilityAPI';
    DelayedInsert = true;
    EntityName = 'response';
    EntitySetName = 'responses';
    PageType = API;
    SourceTable = "Responsibility Center";

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
