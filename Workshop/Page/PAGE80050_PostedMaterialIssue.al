page 80050 "Posted Material Issue"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Posted Store Issue Header";
    UsageCategory = Documents;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
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
                field("Material Request No."; Rec."Material Request No.")
                {
                    ApplicationArea = All;
                }
                field("Pre Assigned No."; Rec."Pre Assigned No.")
                {
                    Caption = 'Store Issue No.';
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                }
                field("Requested By"; Rec."Requested By")
                {
                    ApplicationArea = All;
                }
                field("Asset No."; Rec."Asset No.")
                {
                    ApplicationArea = All;
                }
                field("Service vehicle"; Rec."Service vehicle")
                {
                    ApplicationArea = All;
                }
                field(Trailer; Rec.Trailer)
                {
                    ApplicationArea = All;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
            }
            part(Lines; "Posted Issue Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("No.");
            }
            group("User Trail")
            {
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = All;
                }
                field("Modified By"; Rec."Modified By")
                {
                    ApplicationArea = All;
                }
                field("Modified Date"; Rec."Modified Date")
                {
                    ApplicationArea = All;
                }
                field("Modified Time"; Rec."Modified Time")
                {
                    ApplicationArea = All;
                }
                field("Released Date"; Rec."Released Date")
                {
                    ApplicationArea = All;
                }
                field("Released By"; Rec."Released By")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    purchreq.SETRANGE("No.", Rec."No.");
                    IF purchreq.FINDFIRST THEN
                        REPORT.RUN(50548, TRUE, FALSE, purchreq);
                end;
            }
        }
    }

    var
        purchreq: Record "Posted Store Issue Header";
}

