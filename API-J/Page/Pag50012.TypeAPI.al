page 50012 "Type API"
{
    APIGroup = 'type';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'typeAPI';
    DelayedInsert = true;
    EntityName = 'type';
    EntitySetName = 'types';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Payment));

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
                field(accountType; Rec."Account Type")
                {

                }
            }
        }
    }
}
