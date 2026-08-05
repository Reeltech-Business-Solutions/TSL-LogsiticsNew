page 80028 "Customer Job Type"
{
    PageType = List;
    //AdditionalSearchTerms = 'Customer Job Type';
    SourceTable = "Customer Job Type";
    ApplicationArea =All;
    Caption ='Customer Job Type';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
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

