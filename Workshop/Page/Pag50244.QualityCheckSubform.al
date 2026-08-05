page 50244 "Quality Check Subform"
{
    ApplicationArea = All;
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    Caption = 'Quality Check Subform';
    PageType = ListPart;
    SourceTable = "Quality Check Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field(InspectedBy; Rec.InspectedBy)
                {
                    ApplicationArea = All;
                }
                field(DateInspected; Rec.DateInspected)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
