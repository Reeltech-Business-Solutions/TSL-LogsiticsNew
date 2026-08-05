page 80031 "Job List - Lease Operation"
{
    Caption = 'Job List';
    CardPageID = "Job Card - Lease Operation";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    AdditionalSearchTerms = 'Job List - Lease Operation';
    SourceTable = Job;
    /*  SourceTableView = WHERE("Job Type Code" = FILTER("LEASE OPERATION" | "PM-LEASING"), Status = FILTER(<> Completed)); */

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
                    ApplicationArea = All;
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
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
                    ApplicationArea = All;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
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
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /*  RunObject = Page "Job Task Lines";
                     RunPageLink = "Job No." = FIELD("No.");
                     ShortCutKey = 'Shift+Ctrl+T'; */
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        ApplicationArea = All;
                        /*  RunObject = Page "Default Dimensions";
                         RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No."); */
                        ShortCutKey = 'Shift+Ctrl+D';
                    }
                    action("Dimensions-&Multiple")
                    {
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ApplicationArea = All;

                        trigger OnAction()
                        var
                            Job: Record Job;
                        /*  DefaultDimMultiple: Page "Default Dimensions-Multiple"; */
                        begin
                            CurrPage.SETSELECTIONFILTER(Job);
                            /*  DefaultDimMultiple.SetMultiJob(Job);
                             DefaultDimMultiple.RUNMODAL; */
                        end;
                    }
                }
                action("&Statistics")
                {
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    /*  RunObject = Page "Job Statistics";
                     RunPageLink = "No." = FIELD("No."); */
                    ShortCutKey = 'F7';
                }
                action(SalesInvoicesCreditMemos)
                {
                    Caption = 'Sales &Invoices / Credit Memos';
                    Image = GetSourceDoc;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    var
                    ///JobInvoices: Page "Job Invoices";
                    begin
                        /* JobInvoices.SetPrJob(Rec);
                        JobInvoices.RUNMODAL; */
                    end;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ApplicationArea = All;
                    /*  RunObject = Page "Comment Sheet";
                     RunPageLink = "Table Name" = CONST(Job), "No." = FIELD("No."); */
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    Caption = '&WIP Entries';
                    ApplicationArea = All;
                    Image = WIPEntries;
                    /*  RunObject = "Job WIP Entries";
                     RunPageLink = "Job No." = FIELD("No.");
                     RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date"); */
                }
                action("WIP &G/L Entries")
                {
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    ApplicationArea = All;
                    /*  RunObject = "Job WIP G/L Entries";
                     RunPageLink = "Job No." = FIELD("No.");
                     RunPageView = SORTING("Job No."); */
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
                    ApplicationArea = All;
                    /*  RunObject = Page "Job Resource Prices";
                     RunPageLink = "Job No." = FIELD("No."); */
                }
                action("&Item")
                {
                    Caption = '&Item';
                    Image = Item;
                    ApplicationArea = All;
                    /* RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No."); */
                }
                action("&G/L Account")
                {
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    ApplicationArea = All;
                    /*  RunObject = Page "Job G/L Account Prices";
                     RunPageLink = "Job No."=FIELD("No."); */
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
                    ApplicationArea = All;
                    /// RunObject = Page 221;
                }
                action("Res. Group All&ocated per Job")
                {
                    Caption = 'Res. Group All&ocated per Job';
                    Image = ViewJob;
                    ApplicationArea = All;
                    ///RunObject = Page "Res. Gr. Allocated per Job";
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    Caption = 'Ledger E&ntries';
                    Image = CustomerLedger;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    /* RunObject = Page "Job Ledger Entries";
                                    RunPageLink = "Job No."=FIELD("No.");
                    RunPageView = SORTING("Job No.","Job Task No.","Entry Type","Posting Date"); */
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Quotation)
                {
                    Caption = 'Quotation';
                    ApplicationArea = All;
                    ///RunObject = Page Page39006249;
                    ///RunPageLink = No.=FIELD(No.);
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
                    ApplicationArea = All;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                    ///  CopyJob: Page "Copy Job";
                    begin
                        /* CopyJob.SetFromJob(Rec);
                        CopyJob.RUNMODAL; */
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    Caption = 'Create Job &Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    /// RunObject = Report "Job Create Sales Invoice";
                }
                group(ActionGroup7)
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("<Action151>")
                    {
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        ApplicationArea = All;
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
                            ///  //REPORT.RUNMODAL(REPORT::"Job Calculate WIP", TRUE, FALSE, Job);
                        end;
                    }
                    action("<Action152>")
                    {
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        ApplicationArea = All;
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
                        /// RunObject = Report "Job Create Sales Invoice";
                    }
                    action("Complete Invoiced Jobs (ReelTech)")
                    {
                        ApplicationArea = All;
                        Caption = 'Complete Invoiced Jobs (ReelTech)';
                        /// RunObject = Report "Complete Invoiced Jobs";
                    }
                    action("Auto Job Closing")
                    {
                        ApplicationArea = All;
                        Caption = 'Auto Job Closing';
                        /// RunObject = Report "Complete Invoiced Jobs";
                    }
                    action("Update Job I&tem Cost")
                    {
                        ApplicationArea = All;
                        Caption = 'Update Job I&tem Cost';
                        Image = "Report";
                        /// RunObject = Report "Update Job Item Cost";
                    }
                    action("Job Calculate &WIP")
                    {
                        ApplicationArea = All;
                        Caption = 'Job Calculate &WIP';
                        Image = "Report";
                        /// RunObject = Report "Job Calculate WIP";
                    }
                    action("Jo&b Post WIP to G/L")
                    {
                        ApplicationArea = All;
                        Caption = 'Jo&b Post WIP to G/L';
                        Image = "Report";
                        //// RunObject = Report "Job Post WIP to G/L";
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
                ///  RunObject = Report "Job Actual To Budget";
            }
            action("Job Analysis")
            {
                ApplicationArea = All;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                /// RunObject = Report "Job Analysis";
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = All;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                /// RunObject = Report "Job - Planning Lines";
            }
            action("Job - Suggested Billing")
            {
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                ApplicationArea = All;
                PromotedCategory = "Report";
                ///  RunObject = Report "Job Suggested Billing";
            }
            action("Jobs per Customer")
            {
                Caption = 'Jobs per Customer';
                Image = "Report";
                Promoted = false;
                ApplicationArea = All;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                /// RunObject = Report "Jobs per Customer";
            }
            action("Items per Job")
            {
                Caption = 'Items per Job';
                Image = "Report";
                Promoted = false;
                ApplicationArea = All;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                /// RunObject = Report "Items per Job";
            }
            action("Jobs per Item")
            {
                Caption = 'Jobs per Item';
                Image = "Report";
                ApplicationArea = All;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                /// RunObject = Report "Jobs per Item";
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
                    /// RunObject = Report "Job WIP To G/L";
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
                    /// RunObject = Report "Job - Transaction Detail";
                }
                action("Job Register")
                {
                    ApplicationArea = All;
                    Caption = 'Job Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    /// RunObject = Report "Job Register";
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('You cannot Create JOB from Here, Please Go thru the normal process of creating estimate.');
    end;
}

