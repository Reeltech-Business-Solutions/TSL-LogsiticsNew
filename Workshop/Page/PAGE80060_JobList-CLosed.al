page 80060 "Job List - CLosed"
{
    Caption = 'Job List - CLosed';
    CardPageID = "Job Card - Completed";
    DeleteAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Job;
    SourceTableView = WHERE(Status = FILTER(Completed), "WIP Amount" = CONST(0), "Final Invoice Amount" = const(0));

    layout
    {
        area(content)
        {
            repeater("Job Closed")
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
                    ApplicationArea = All;
                    ShowCaption = false;
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    Caption = '% Invoiced';
                    Editable = false;
                    ApplicationArea = All;
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    Caption = '% Completed';
                    ApplicationArea = All;
                    Editable = false;
                    Visible = false;
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
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = All;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.");
                }
            }
            group("&Prices6")
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
                action("&G/L Account3")
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
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
                action(Quotation)
                {
                    ApplicationArea = All;
                    Caption = 'Quotation';
                    /// RunObject = Page Page39006249;
                    /// RunPageLink = No.=FIELD(No.);
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
                        CopyJob: Page "Copy Job";
                    begin
                        CopyJob.SetFromJob(Rec);
                        CopyJob.RUNMODAL;
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Create Job &Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    //RunObject = Report "Job Create Sales Invoice";
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
                            //REPORT.RUNMODAL(REPORT::"Job Calculate WIP", TRUE, FALSE, Job);
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
                            //REPORT.RUNMODAL(REPORT::"Job Post WIP to G/L", TRUE, FALSE, Job);
                        end;
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
                //RunObject = Report "Job Actual To Budget";
            }
            action("Job Analysis")
            {
                ApplicationArea = All;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job Analysis";
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = All;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job - Planning Lines";
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = All;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job Suggested Billing";
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
                    ApplicationArea = All;
                    Caption = 'Job WIP to G/L';
                    Image = "Report";
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
                    ApplicationArea = All;
                    Caption = 'Jobs - Transaction Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report "Job - Transaction Detail";
                }
                action("Job Register")
                {
                    ApplicationArea = All;
                    Caption = 'Job Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    //RunObject = Report "Job Register";
                }
            }
        }
    }
}

