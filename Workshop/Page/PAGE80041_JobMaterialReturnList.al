page 80041 "Job Material Return List"
{
    CardPageID = "Job Material Return Req.";
    Editable = false;
    PageType = List;
    SourceTable = "Material Request Header";
    SourceTableView = WHERE("Request Type" = CONST(Job), "Entry Type" = CONST(Return));

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

    trigger OnOpenPage()
    var
        UserMgt: Codeunit 5700;
    begin
        IF UserMgt.GetServiceFilter <> '' THEN BEGIN
            Rec.FILTERGROUP(2);
            Rec.SETRANGE("Responsibility Center", UserMgt.GetServiceFilter);
            Rec.FILTERGROUP(0);
        END;
    end;

    var
        UserMgt: Codeunit "User Setup Management";
}

