page 50015 "Bank Account API"
{
    APIGroup = 'bankacc';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'bankAccountAPI';
    DelayedInsert = true;
    EntityName = 'bankacc';
    EntitySetName = 'bankaccs';
    PageType = API;
    SourceTable = "Bank Account";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(SystemId; Rec.SystemId)
                {

                }
                field(no; Rec."No.")
                {

                }
                field(name; Rec.Name)
                {

                }
            }
        }
    }
}
