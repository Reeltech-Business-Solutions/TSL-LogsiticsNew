page 80024 "Job Material Request List"
{
    CardPageID = "Job Material Request";
    Editable = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    AdditionalSearchTerms = 'Job Material Request List';
    SourceTable = "Material Request Header";
    SourceTableView = WHERE("Request Type" = CONST(Job), "Entry Type" = CONST(Issue), "Store Issue No." = FILTER(''));
    InsertAllowed = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Request Type"; Rec."Request Type")
                {
                    ApplicationArea = All;
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = All;
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
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

