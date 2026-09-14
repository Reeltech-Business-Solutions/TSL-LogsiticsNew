page 50271 "Resource API"
{
    APIGroup = 'resource';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'resourceAPI';
    DelayedInsert = true;
    EntityName = 'resource';
    EntitySetName = 'resources';
    PageType = API;
    SourceTable = Resource;

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
                field(name; Rec.Name)
                {
                }

            }
        }
    }
}
