page 50099 "Approval CodeList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Approval code";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Approval Code"; Rec."Approval Code")
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


}