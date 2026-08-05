page 50001 "Approval Status"
{
    PageType = ListPart;
    SourceTable = "Approval Entry";

    layout
    {
        area(content)
        {
            repeater(New)
            {
                Editable = false;
                field("Approver ID"; Rec."Approver ID")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

