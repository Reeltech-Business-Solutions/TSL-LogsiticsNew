page 50248 "Job Type CodeAdmin"
{
    PageType = List;
    SourceTable = "Job Type Code";
    ApplicationArea = All;
    Caption = 'Job Type Code';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Business Type"; Rec."Business Type")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
