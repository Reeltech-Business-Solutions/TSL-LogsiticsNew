page 50270 "ExpenseNo API"
{
    APIGroup = 'expense';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'expenseNoAPI';
    DelayedInsert = true;
    EntityName = 'expense';
    EntitySetName = 'expenses';
    PageType = API;
    SourceTable = "Receipts and Payment Types";
    SourceTableView = where(Type = const(Requisition), "Account Type" = const("G/L Account"));

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
                field(accountType; Rec."Account Type")
                {
                }
            }
        }
    }
}
