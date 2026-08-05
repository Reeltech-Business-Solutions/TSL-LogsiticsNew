page 80057 "Job Card - Returned Job Opn"
{
    Caption = 'Job Card - Internal';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Prices';
    RefreshOnActivate = true;
    SourceTable = Job;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Estimate No"; Rec."Estimate No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = All;
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
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
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    ApplicationArea = All;
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Additional;
                }
                field("Workshop Completion Date"; Rec."Workshop Completion Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group("Vehicle/Equipment")
            {
                Caption = 'Vehicle/Equipment';
                field("Estimate Value (Price)"; Rec."Estimate Value (Price)")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Contract Total Price"; Rec."Contract Total Price")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StrongAccent;
                    StyleExpr = TRUE;
                }
                field("Contract Invoiced Price"; Rec."Contract Invoiced Price")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Unfavorable;
                    StyleExpr = TRUE;
                }
                field("Consumed Value (Cost)"; Rec."Consumed Value (Cost)")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Brought By"; Rec."Brought By")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Customer Identification No"; Rec."Customer Identification No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Job Narration"; Rec."Job Narration")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                Visible = false;
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                    ApplicationArea = All;
                }
                field("Apply Usage Link"; Rec."Apply Usage Link")
                {
                    ApplicationArea = All;
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    ApplicationArea = All;
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Importance = Additional;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    ApplicationArea = All;
                    Caption = '% Completed';
                    Editable = false;
                    Importance = Additional;
                }
                field("Failure Code"; Rec."Failure Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Failure Sub Code"; Rec."Failure Sub Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group(Duration)
            {
                Caption = 'Duration';
                field("Estimate Date"; Rec."Estimate Date")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Vehicle In Date"; Rec."Vehicle In Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Vehicle In Time"; Rec."Vehicle In Time")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Job Collection Date"; Rec."Job Collection Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Visible = false;
                field("Workshop Status"; Rec."Workshop Status")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Work Order No"; Rec."Work Order No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Work Order Date"; Rec."Work Order Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Work Order Rcpt. Date"; Rec."Work Order Rcpt. Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Work Order Value"; Rec."Work Order Value")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                    Editable = CurrencyCodeEditable;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        CurrencyCheck;
                    end;
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = All;
                    Editable = InvoiceCurrencyCodeEditable;

                    trigger OnValidate()
                    begin
                        CurrencyCheck;
                    end;
                }
                field("Exch. Calculation (Cost)"; Rec."Exch. Calculation (Cost)")
                {
                    ApplicationArea = All;
                }
                field("Exch. Calculation (Price)"; Rec."Exch. Calculation (Price)")
                {
                    ApplicationArea = All;
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
                group("To Post")
                {
                    Caption = 'To Post';
                    field("WIP Posting Date"; Rec."WIP Posting Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Applied Sales G/L Amount"; Rec."Applied Sales G/L Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Recog. Sales Amount"; Rec."Recog. Sales Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Recog. Profit Amount"; Rec.CalcRecognizedProfitAmount)
                    {
                        ApplicationArea = All;
                        Caption = 'Recog. Profit Amount';
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage)
                    {
                        ApplicationArea = All;
                        Caption = 'Recog. Profit %';
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount)
                    {
                        ApplicationArea = All;
                        Caption = 'Acc. WIP Costs Amount';
                        Visible = false;
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount)
                    {
                        ApplicationArea = All;
                        Caption = 'Acc. WIP Sales Amount';
                        Visible = false;
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
                group(Posted)
                {
                    Caption = 'Posted';
                    field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Recog. Profit G/L Amount"; Rec.CalcRecognizedProfitGLAmount)
                    {
                        ApplicationArea = All;
                        Caption = 'Recog. Profit G/L Amount';
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage)
                    {
                        ApplicationArea = All;
                        Caption = 'Recog. Profit G/L %';
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        ApplicationArea = All;
                        Visible = false;
                    }
                }
            }
            group(HIDE)
            {
                Caption = 'HIDE';
                Visible = false;
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = All;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(factboxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1902136407; "Job No. of Prices FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No."), "Resource Filter" = FIELD("Resource Filter"), "Posting Date Filter" = FIELD("Posting Date Filter"), "Resource Gr. Filter" = FIELD("Resource Gr. Filter"), "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = true;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No."), "Resource Filter" = FIELD("Resource Filter"), "Posting Date Filter" = FIELD("Posting Date Filter"), "Resource Gr. Filter" = FIELD("Resource Gr. Filter"), "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = false;
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
                action("Job &Task Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Job &Task Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                }
                action("Job &Planning Lines")
                {
                    ApplicationArea = All;
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';
                    Visible = false;

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
                    ApplicationArea = All;
                    Caption = 'Job Card';
                    Image = Print;
                    ////RunObject = Report "Job Card New";
                }
                action("&Dimensions")
                {
                    ApplicationArea = All;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
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
                separator(Separator64)
                {
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
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                Visible = false;
                action("&Resource")
                {
                    ApplicationArea = All;
                    Caption = '&Resource';
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&Item")
                {
                    ApplicationArea = All;
                    Caption = '&Item';
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&G/L Account")
                {
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                Visible = false;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = All;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page 221;
                }
                action("Res. &Gr. All&ocated per Job")
                {
                    Caption = 'Res. &Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    ApplicationArea = All;
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
                    Image = JobLedger;
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
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /// RunObject = Page Page39006249;
                    ///                RunPageLink = No.=FIELD(No.);
                }
                action("Store Req (Issue)")
                {
                    Caption = 'Store Req (Issue)';
                    Image = Quote;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ///    RunObject = Page "Store Material Issue List";
                    ///                  RunPageLink = Entry Type=CONST(Issue), No.=FIELD(No.);
                }
                action("Posted Issued Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Issued Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /// RunObject = Page "Posted Material Issue List";
                    ///      RunPageLink = Job No.=FIELD(No.), Entry Type=FILTER(Issue);
                }
                action("Posted Return Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Return Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /// RunObject = Page "Posted Material Issue List";
                    ///              RunPageLink = Job No.=FIELD(No.), Entry Type=FILTER(Return);
                }
                action(Action1000000096)
                {
                    ApplicationArea = All;
                    Caption = 'Posted Return Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /// RunObject = Page "Posted Jobs Sales Invoices";
                    ///              RunPageLink = Job No.=FIELD(No.);
                }
            }
        }
        area(processing)
        {
            group("&Copy")
            {
                Caption = '&Copy';
                Image = Copy;
                Visible = false;
                action("Copy Job Tasks &from...")
                {
                    ApplicationArea = All;
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RUNMODAL;
                    end;
                }
                action("Copy Job Tasks &to...")
                {
                    ApplicationArea = All;
                    Caption = 'Copy Job Tasks &to...';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page "Copy Job Tasks";
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RUNMODAL;
                    end;
                }
                action("&Online Map")
                {
                    ApplicationArea = All;
                    Caption = '&Online Map';
                    Image = Map;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
            }
            group(ActionGroup26)
            {
                Caption = 'W&IP';
                Image = WIP;
                Visible = false;
                action("<Action82>")
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
                action("<Action83>")
                {
                    ApplicationArea = All;
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Process;
                    ShortCutKey = 'F9';

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
            group("PERIODIC PROCESS")
            {
                Caption = 'PERIODIC PROCESS';
                action("Job &Create Sales Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'Job &Create Sales Invoice';
                    Image = CreateJobSalesInvoice;
                    //RunObject = Report "Job Create Sales Invoice";
                }
                action("Complete Invoiced Jobs (ReelTech)")
                {
                    ApplicationArea = All;
                    Caption = 'Complete Invoiced Jobs (ReelTech)';
                    //RunObject = Report "Complete Invoiced Jobs";
                }
                action("Auto Job Closing")
                {
                    ApplicationArea = All;
                    Caption = 'Auto Job Closing';
                    //RunObject = Report "Complete Invoiced Jobs";
                }
                action("Update Job I&tem Cost")
                {
                    ApplicationArea = All;
                    Caption = 'Update Job I&tem Cost';
                    Image = "Report";
                    //RunObject = Report "Update Job Item Cost";
                }
                action("Job Calculate &WIP")
                {
                    ApplicationArea = All;
                    Caption = 'Job Calculate &WIP';
                    Image = "Report";
                    //RunObject = Report "Job Calculate WIP";
                }
                action("Jo&b Post WIP to G/L")
                {
                    ApplicationArea = All;
                    Caption = 'Jo&b Post WIP to G/L';
                    Image = "Report";
                    //RunObject = Report "Job Post WIP to G/L";
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



        }

    }

    trigger OnAfterGetRecord()
    begin
        CurrencyCheck;
    end;

    trigger OnInit()
    begin
        CurrencyCodeEditable := TRUE;
        InvoiceCurrencyCodeEditable := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Customer Job Type" := 'INTERNAL';
        Rec."Job Type Code" := 'LEASE OPERATION'
    end;

    var
        // [InDataSet]
        InvoiceCurrencyCodeEditable: Boolean;
        // [InDataSet]
        CurrencyCodeEditable: Boolean;

    procedure CurrencyCheck()
    begin
        IF Rec."Currency Code" <> '' THEN
            InvoiceCurrencyCodeEditable := FALSE
        ELSE
            InvoiceCurrencyCodeEditable := TRUE;

        IF Rec."Invoice Currency Code" <> '' THEN
            CurrencyCodeEditable := FALSE
        ELSE
            CurrencyCodeEditable := TRUE;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.UPDATE;
    end;
}

