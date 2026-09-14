page 50273 "ItemCharge API"
{
    APIGroup = 'itemcharge';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'itemChargeAPI';
    DelayedInsert = true;
    EntityName = 'itemcharge';
    EntitySetName = 'itemcharges';
    PageType = API;
    SourceTable = "Item Charge";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(systemId; Rec.SystemId)
                {
                }

                field(no; Rec."No.")
                {
                }
                field(description; Rec.Description)
                {
                }
            }
        }
    }
}
