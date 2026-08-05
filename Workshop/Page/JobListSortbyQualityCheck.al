page 80090 "Job List -Quality Check"
{
    Caption = 'Quality Check';
    CardPageID = "Job Card - Internal";
    DeleteAllowed = false;
    Editable = false;
    ApplicationArea = All;
    UsageCategory = Lists;
    PageType = List;
    AdditionalSearchTerms = 'Job List - Quality-check';
    SourceTable = Job;
    SourceTableView = WHERE("Workshop Status" = filter("Quality Check" | Completed));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Invoice Exist"; Rec."Invoice Exist")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Workshop Status"; Rec."Workshop Status")
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ShowCaption = True;
                    ApplicationArea = All;
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Contract Invoiced Price"; Rec."Contract Invoiced Price")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }

                field("Service Vehicle"; Rec."Service Vehicle")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }


                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    ShowCaption = true;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                    Visible = true;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                }
                field("Created By"; Rec."Created By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Created Date"; Rec."Created Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }

    }


}






