page 80023 "Job List - Insurance"
{
    Caption = 'Job List';
    CardPageID = "Job Card - Insurance";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Job List - Insurance';
    SourceTable = Job;
    //SourceTableView = WHERE("Job Type Code"=FILTER(INSURANCE), Status=FILTER(<>Completed));

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
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Invoice Exist"; Rec."Invoice Exist")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
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
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Contract Invoiced Price"; Rec."Contract Invoiced Price")
                {
                    ShowCaption = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ShowCaption = false;
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
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
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
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
                ApplicationArea = All;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
                ApplicationArea = All;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                SubPageLink = "No." = FIELD("No.");
                Visible = true;
                ApplicationArea = All;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = All;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = All;
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
                    Caption = 'Job Task &Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                    ApplicationArea = All;
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ApplicationArea = All;
                    }
                    action("Dimensions-&Multiple")
                    {
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ApplicationArea = All;
                        trigger OnAction()
                        var
                            Job: Record Job;
                            DefaultDimMultiple: Page 542;
                        begin
                            CurrPage.SETSELECTIONFILTER(Job);
                            /// DefaultDimMultiple.SetMultiJob(Job);
                            DefaultDimMultiple.RUNMODAL;
                        end;
                    }
                }
                action("&Statistics")
                {
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ///RunObject = "Job Statistics";
                    ///  RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                    ApplicationArea = All;
                }
                action(SalesInvoicesCreditMemos)
                {
                    Caption = 'Sales &Invoices / Credit Memos';
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ApplicationArea = All;
                    trigger OnAction()
                    var
                        JobInvoices: Page 1029;
                    begin
                        JobInvoices.SetPrJob(Rec);
                        JobInvoices.RUNMODAL;
                    end;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    /// RunObject = Page 124;
                    ///RunPageLink = "Table Name"=CONST(Job), "No."=FIELD("No.");
                    ApplicationArea = All;
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
                    RunObject = Page "Job WIP G/L Entries";
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
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    Caption = '&Resource';
                    Image = Resource;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("&Item")
                {
                    Caption = '&Item';
                    Image = Item;
                    /* RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No."); */
                    ApplicationArea = All;
                }
                action("&G/L Account")
                {
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    /*  RunObject = Page "Job G/L Account Prices";
                     RunPageLink = "Job No." = FIELD("No."); */
                    ApplicationArea = All;
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    /// RunObject = Page "Resource Allocated per Job";
                    ApplicationArea = All;
                }
                action("Res. Group All&ocated per Job")
                {
                    Caption = 'Res. Group All&ocated per Job';
                    Image = ViewJob;
                    ///  RunObject = Page "Res. Gr. Allocated per Job";
                    ApplicationArea = All;
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    ApplicationArea = All;
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 92;
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Quotation)
                {
                    Caption = 'Quotation';
                    ///RunObject = Page Page39006249;
                    ///RunPageLink = "No."=FIELD("No.");
                    ApplicationArea = All;
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
                    Caption = '&Copy Job';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        CopyJob: Page 140;
                    begin
                        ///CopyJob.SetFromJob(Rec);
                        CopyJob.RUNMODAL;
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    Caption = 'Create Job &Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    ///  //RunObject = Report 1093;
                    ApplicationArea = All;
                }
                group(ActionGroup7)
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("<Action151>")
                    {
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        Image = CalculateWIP;
                        ApplicationArea = All;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TESTFIELD("No.");
                            Job.COPY(Rec);
                            Job.SETRANGE("No.", Rec."No.");
                            REPORT.RUNMODAL(1086, TRUE, FALSE, Job);
                        end;
                    }
                    action("<Action152>")
                    {
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        Image = PostOrder;
                        ApplicationArea = All;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TESTFIELD("No.");
                            Job.COPY(Rec);
                            Job.SETRANGE("No.", Rec."No.");
                            REPORT.RUNMODAL(1085, TRUE, FALSE, Job);
                        end;
                    }
                }
                group("PERIODIC PROCESS")
                {
                    Caption = 'PERIODIC PROCESS';
                    action("Job &Create Sales Invoice")
                    {
                        Caption = 'Job &Create Sales Invoice';
                        Image = CreateJobSalesInvoice;
                        // //RunObject = Report 1093;
                        ApplicationArea = All;
                    }
                    action("Complete Invoiced Jobs (ReelTech)")
                    {
                        Caption = 'Complete Invoiced Jobs (ReelTech)';
                        /// //RunObject = Report "Complete Invoiced Jobs";
                        ApplicationArea = All;
                    }
                    action("Auto Job Closing")
                    {
                        Caption = 'Auto Job Closing';
                        ///  //RunObject = Report "Complete Invoiced Jobs";
                        ApplicationArea = All;
                    }
                    action("Update Job I&tem Cost")
                    {
                        Caption = 'Update Job I&tem Cost';
                        Image = "Report";
                        //RunObject = Report 1095;
                        ApplicationArea = All;
                    }
                    action("Job Calculate &WIP")
                    {
                        Caption = 'Job Calculate &WIP';
                        Image = "Report";
                        //RunObject = Report 1086;
                        ApplicationArea = All;
                    }
                    action("Jo&b Post WIP to G/L")
                    {
                        Caption = 'Jo&b Post WIP to G/L';
                        Image = "Report";
                        //RunObject = Report 1085;
                        ApplicationArea = All;
                    }
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1009;
                ApplicationArea = All;
            }
            action("Job Analysis")
            {
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1008;
                ApplicationArea = All;
            }
            action("Job - Planning Lines")
            {
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1006;
                ApplicationArea = All;
            }
            action("Job - Suggested Billing")
            {
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report 1011;
                ApplicationArea = All;
            }
            action("Jobs per Customer")
            {
                Caption = 'Jobs per Customer';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report 1012;
                ApplicationArea = All;
            }
            action("Items per Job")
            {
                Caption = 'Items per Job';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report 1013;
                ApplicationArea = All;
            }
            action("Jobs per Item")
            {
                Caption = 'Jobs per Item';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                //RunObject = Report 1014;
                ApplicationArea = All;
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("Job WIP to G/L")
                {
                    Caption = 'Job WIP to G/L';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report 1010;
                    ApplicationArea = All;
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
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report 1007;
                    ApplicationArea = All;
                }
                action("Job Register")
                {
                    Caption = 'Job Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report 1015;
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('You cannot Create JOB from Here, Please Go thru the normal process of creating estimate.');
    end;
}

