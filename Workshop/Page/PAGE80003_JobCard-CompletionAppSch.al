page 80003 "Job Card -Completion App Sch"
{
    PageType = Card;
    SourceTable = Job;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
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
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            group("Service App Reshedule")
            {
                field("Update Next KM Service"; Rec."Update Next KM Service")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
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
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("KM Run"; Rec."KM Run")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Serv. Tech. Job Closure"; Rec."Serv. Tech. Job Closure")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Post WIP"; Rec."Post WIP")
                {
                    ShowCaption = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Post WIP to G/L"; Rec."Post WIP to G/L")
                {
                    ShowCaption = false;
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group("DO NOT USE")
            {
                Caption = 'DO NOT USE';
                Editable = false;
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
                field("Job Posting Group"; Rec."Job Posting Group")
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
            }
            group(Duration)
            {
                Caption = 'Duration';
                Editable = false;
                field("Estimate Date"; Rec."Estimate Date")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle In Date"; Rec."Vehicle In Date")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle In Time"; Rec."Vehicle In Time")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Collection Date"; Rec."Job Collection Date")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(ActionGroup1000000046)
            {
                action("Job &Task Lines")
                {
                    Caption = 'Job &Task Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                    ApplicationArea = All;
                }
                action("Job &Planning Lines")
                {
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ApplicationArea =All;

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TESTFIELD("No.");
                        JobPlanningLine.SETRANGE("Job No.", Rec."No.");
                        //JobPlanningLines.SetJobNoVisible(FALSE);
                        JobPlanningLines.SETTABLEVIEW(JobPlanningLine);
                        JobPlanningLines.EDITABLE := FALSE;
                        JobPlanningLines.RUN;
                    end;
                }
                action("Job Card")
                {
                    Caption = 'Job Card';
                    Image = Print;
                    //RunObject = Report "Job Card New";
                    ApplicationArea = All;
                }
                action("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;
                }
                action("&Statistics")
                {
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                    ApplicationArea = All;
                }
                action("Service App Schedules(ALL FOR TRUCK)")
                {
                    Caption = 'Service App Schedules(ALL FOR TRUCK)';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Page "Cash Office User Template";
                    // RunPageLink = "Service Item" = FIELD("Service Item");
                    ApplicationArea = All;
                }
                separator(Separator1000000040)
                {

                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job), "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("&Online Map")
                {
                    Caption = '&Online Map';
                    Image = Map;
                    ApplicationArea =All;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
                    ApplicationArea = All;
                }
                action("WIP &G/L Entries")
                {
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.");
                    ApplicationArea = All;
                }
                action(Quotation)
                {
                    Caption = 'Quotation';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Page Page39006249;
                    //RunPageLink = "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Store Req (Issue)")
                {
                    Caption = 'Store Req (Issue)';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Store Material Issue List";
                    RunPageLink = "Entry Type" = CONST(Issue), "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Posted Issued Entries")
                {
                    Caption = 'Posted Issued Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                    ApplicationArea = All;
                }
                action("Vehicle Registration")
                {
                    Caption = 'Vehicle Registration';
                    Description = 'Vehicle Registration';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Vehicle Registration Card";
                    RunPageLink = "Job Card No" = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Posted Return Entries")
                {
                    Caption = 'Posted Return Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Return);
                    ApplicationArea = All;
                }
                action("Posted Jobs Sales Invoices")
                {
                    Caption = 'Posted Jobs Sales Invoices';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Jobs Sales Invoices";
                    RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("<Job& Gate Pass>")
                {
                    Caption = 'Jo&b Gate Pass';
                    Image = "Report";
                    Promoted = true;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    ///RunObject = Report Report50045;

                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.TESTFIELD("No.");
                        //Job.COPY(Rec);
                        Rec.SETRANGE("No.", Rec."No.");
                        /// //REPORT.RUNMODAL(REPORT::"Gate Pass",TRUE,FALSE,Rec);
                    end;
                }
                action("Job G/L Entries")
                {
                    Caption = 'Job G/L Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
                }
            }
        }
    }
}

