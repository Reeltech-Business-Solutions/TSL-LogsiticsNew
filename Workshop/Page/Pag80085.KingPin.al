page 80085 "King Pin"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    //MultipleNewLines = true;

    Caption = 'King Pin';
    PageType = ListPart;
    SourceTable = "King Pin";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field(Measurement; Rec.Measurement)
                {
                    ToolTip = 'Specifies the value of the Measurement field.';
                    ApplicationArea = All;
                }
                field(Remark; Rec.Remark)
                {
                    ToolTip = 'Specifies the value of the Remark field.';
                    ApplicationArea = All;
                }
            }
        }
    }

}
