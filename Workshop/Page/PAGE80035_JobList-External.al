page 80035 "Job List - External"
{
    Caption = 'Job List';
    CardPageID = "Job Card - External";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Job List - External';
    SourceTable = Job;
    SourceTableView = WHERE("Customer Job Type" = FILTER('EXTERNAL'), Status = FILTER(<> Completed));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
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
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Invoice Exist"; Rec."Invoice Exist")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("User ID"; Rec."User ID")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Contract Invoiced Price"; Rec."Contract Invoiced Price")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
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
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
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
        area(factboxes)
        {
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = All;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action("Job Task &Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Job Task &Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = All;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;

                        trigger OnAction()
                        var
                            Job: Record Job;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SETSELECTIONFILTER(Job);
                            /// DefaultDimMultiple.SetMultiJob(Job);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("&Statistics")
                {
                    ApplicationArea = All;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                }
                action(SalesInvoicesCreditMemos)
                {
                    ApplicationArea = All;
                    Caption = 'Sales &Invoices / Credit Memos';
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                        JobInvoices: Page "Job Invoices";
                    begin
                        JobInvoices.SetPrJob(Rec);
                        JobInvoices.RUNMODAL;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job), "No." = FIELD("No.");
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    ApplicationArea = All;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page 1008;
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = All;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page 1009;
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.");
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    ApplicationArea = All;
                    Caption = '&Resource';
                    Image = Resource;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&Item")
                {
                    ApplicationArea = All;
                    Caption = '&Item';
                    Image = Item;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&G/L Account")
                {
                    ApplicationArea = All;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = All;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page 221;
                }
                action("Res. Group All&ocated per Job")
                {
                    ApplicationArea = All;
                    Caption = 'Res. Group All&ocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Res. Gr. Allocated per Job";
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = All;
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    /* RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date"); */
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Quotation)
                {
                    ApplicationArea = All;
                    Caption = 'Quotation';
                    //  RunObject = Page Page39006249;
                    //   RunPageLink = "No."=FIELD("No.");
                }
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyJob)
                {
                    ApplicationArea = All;
                    Caption = '&Copy Job';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJob2: Page 1040;
                    begin
                        CopyJob2.SetFromJob(Rec);
                        CopyJob2.RUNMODAL;
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Create Job &Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    //RunObject = Report 1093;
                }
                group(ActionGroup7)
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("<Action151>")
                    {
                        ApplicationArea = All;
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        Image = CalculateWIP;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TESTFIELD("No.");
                            Job.COPY(Rec);
                            Job.SETRANGE("No.", Rec."No.");
                            /// //REPORT.RUNMODAL(REPORT::"Job Calculate WIP", TRUE, FALSE, Job);
                        end;
                    }
                    action("<Action152>")
                    {
                        ApplicationArea = All;
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        Image = PostOrder;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TESTFIELD("No.");
                            Job.COPY(Rec);
                            Job.SETRANGE("No.", Rec."No.");
                            /// //REPORT.RUNMODAL(REPORT::"Job Post WIP to G/L", TRUE, FALSE, Job);
                        end;
                    }
                }
                group("PERIODIC PROCESS")
                {
                    Caption = 'PERIODIC PROCESS';
                    action("Job &Create Sales Invoice")
                    {
                        ApplicationArea = All;
                        Caption = 'Job &Create Sales Invoice';
                        Image = CreateJobSalesInvoice;
                        //RunObject = Report 1093;
                    }
                    action("Complete Invoiced Jobs (ReelTech)")
                    {
                        ApplicationArea = All;
                        Caption = 'Complete Invoiced Jobs (ReelTech)';
                        ///  //RunObject = Report Report50300;
                    }
                    action("Auto Job Closing")
                    {
                        ApplicationArea = All;
                        Caption = 'Auto Job Closing';
                        ///  //RunObject = Report Report50300;
                    }
                    action("Update Job I&tem Cost")
                    {
                        ApplicationArea = All;
                        Caption = 'Update Job I&tem Cost';
                        Image = "Report";
                        //RunObject = Report 1095;
                    }
                    action("Job Calculate &WIP")
                    {
                        ApplicationArea = All;
                        Caption = 'Job Calculate &WIP';
                        Image = "Report";
                        //RunObject = Report 1086;
                    }
                    action("Jo&b Post WIP to G/L")
                    {
                        ApplicationArea = All;
                        Caption = 'Jo&b Post WIP to G/L';
                        Image = "Report";
                        //RunObject = Report 1085;
                    }
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = All;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1009;
            }
            action("Job Analysis")
            {
                ApplicationArea = All;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1008;
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = All;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1006;
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = All;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1011;
            }
            action("Jobs per Customer")
            {
                ApplicationArea = All;
                Caption = 'Jobs per Customer';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report "Jobs per Customer";
            }
            action("Items per Job")
            {
                ApplicationArea = All;
                Caption = 'Items per Job';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report "Items per Job";
            }
            action("Jobs per Item")
            {
                ApplicationArea = All;
                Caption = 'Jobs per Item';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report "Jobs per Item";
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("Job WIP to G/L")
                {
                    Caption = 'Job WIP to G/L';
                    Image = "Report";
                    ApplicationArea = All;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report "Job WIP To G/L";
                }
            }
            group(ActionGroup23)
            {
                Caption = 'History';
                Image = "Report";
                action("Jobs - Transaction Detail")
                {
                    Caption = 'Jobs - Transaction Detail';
                    Image = "Report";
                    ApplicationArea = All;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report "Job - Transaction Detail";
                }
                action("Job Register")
                {
                    Caption = 'Job Register';
                    ApplicationArea = All;
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report "Job Register";
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('You cannot Create JOB from Here, Please Go thru the normal process of creating estimate.');
    end;
}

