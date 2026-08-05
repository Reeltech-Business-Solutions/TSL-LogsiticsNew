page 50246 "Quality List Check"
{
    ApplicationArea = All;
    Caption = 'Quality Check Setup';
    PageType = List;
    SourceTable = QualityCheckList;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
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
