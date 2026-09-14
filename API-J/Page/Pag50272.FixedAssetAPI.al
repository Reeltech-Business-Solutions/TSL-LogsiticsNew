page 50272 "FixedAsset API"
{
    APIGroup = 'fixedasset';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'fixedAssetAPI';
    DelayedInsert = true;
    EntityName = 'fixedasset';
    EntitySetName = 'fixedassets';
    PageType = API;
    SourceTable = "Fixed Asset";

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
