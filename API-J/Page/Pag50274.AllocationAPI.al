page 50274 "Allocation API "
{
    APIGroup = 'allocation';
    APIPublisher = 'TSL';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'allocationAPI';
    DelayedInsert = true;
    EntityName = 'allocation';
    EntitySetName = 'allocations';
    PageType = API;
    SourceTable = "Allocation Account";

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
