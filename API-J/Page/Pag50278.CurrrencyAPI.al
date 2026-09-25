page 50278 "Currrency API"
{
    APIGroup = 'currency';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'currrencyAPI';
    DelayedInsert = true;
    EntityName = 'currency';
    EntitySetName = 'currencies';
    PageType = API;
    SourceTable = Currency;

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
                field(description; Rec.Description)
                {

                }
            }
        }
    }
}
