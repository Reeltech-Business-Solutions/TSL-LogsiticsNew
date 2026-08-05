page 80004 "Job List -Completion Ap LIST"
{
    CardPageID = "Job Card -Completion App Sch";
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Job Card -Completion App Sch';
    SourceTable = Job;
    SourceTableView = WHERE("Invoice Exist" = CONST(TRUE), "Next KM Service/PM Service" = FILTER(<> 0), "Job Type" = FILTER(PrevMaint | "KM Service"));

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
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("NOVATRACK ID"; Rec."NOVATRACK ID")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Buisness Type"; Rec."Buisness Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Serv. Tech. Job Closure"; Rec."Serv. Tech. Job Closure")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Job Narration"; Rec."Job Narration")
                {
                    ShowCaption = false;
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
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Service Code"; Rec."Service Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("KM Reading"; Rec."KM Reading")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("KM Run"; Rec."KM Run")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Next KM Service/PM Service"; Rec."Next KM Service/PM Service")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(RecognizeCostAcc; Rec.RecognizeCostAcc)
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fleet Manger  Location"; Rec."Fleet Manger  Location")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail")
                {
                    ShowCaption = false;
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
    actions
    {
    }
}

