page 80017 "Job Card - Completed"
{
    Caption = 'Job Card - Completed';
    DeleteAllowed = false;
    Editable = false;
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Estimate No"; Rec."Estimate No")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
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
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
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
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Workshop Completion Date"; Rec."Workshop Completion Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    Caption = '% Invoiced';
                    Editable = true;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
            }
            group("Vehicle/Equipment")
            {
                Caption = 'Vehicle/Equipment';
                field("Job Narration"; Rec."Job Narration")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Estimate Date"; Rec."Estimate Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Estimate Value (Price)"; Rec."Estimate Value (Price)")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Brought By"; Rec."Brought By")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Customer Identification No"; Rec."Customer Identification No")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
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
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                    NotBlank = true;
                    ApplicationArea = All;
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
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    Caption = '% Completed';
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Failure Code"; Rec."Failure Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Failure Sub Code"; Rec."Failure Sub Code")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
            }
            group(Duration)
            {
                Caption = 'Duration';
                field("Starting Date"; Rec."Starting Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
            }
            group("Foreign Trade")
            {
                Caption = 'Foreign Trade';
                Visible = false;
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Workshop Status"; Rec."Workshop Status")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle In Date"; Rec."Vehicle In Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Vehicle In Time"; Rec."Vehicle In Time")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
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
                field("Work Order No"; Rec."Work Order No")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Work Order Date"; Rec."Work Order Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Work Order Rcpt. Date"; Rec."Work Order Rcpt. Date")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
                field("Work Order Value"; Rec."Work Order Value")
                {
                    ShowCaption = true;
                    ApplicationArea = All;
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
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
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                    {
                        ApplicationArea = All;
                    }
                    field("Applied Costs G/L Amount"; Rec."Applied Costs G/L Amount")
                    {
                        Visible = false;
                        ApplicationArea = All;
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
                        Caption = 'Recog. Profit Amount';
                        ApplicationArea = All;
                    }
                    field("Recog. Profit %"; Rec.CalcRecognizedProfitPercentage)
                    {
                        Caption = 'Recog. Profit %';
                        ApplicationArea = All;
                    }
                    field("Acc. WIP Costs Amount"; Rec.CalcAccWIPCostsAmount)
                    {
                        Caption = 'Acc. WIP Costs Amount';
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Acc. WIP Sales Amount"; Rec.CalcAccWIPSalesAmount)
                    {
                        Caption = 'Acc. WIP Sales Amount';
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Calc. Recog. Sales Amount"; Rec."Calc. Recog. Sales Amount")
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Calc. Recog. Costs Amount"; Rec."Calc. Recog. Costs Amount")
                    {
                        Visible = false;
                        ApplicationArea = All;
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
                        Caption = 'Recog. Profit G/L Amount';
                        ApplicationArea = All;
                    }
                    field("Recog. Profit G/L %"; Rec.CalcRecognProfitGLPercentage)
                    {
                        Caption = 'Recog. Profit G/L %';
                        ApplicationArea = All;
                    }
                    field("Calc. Recog. Sales G/L Amount"; Rec."Calc. Recog. Sales G/L Amount")
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Calc. Recog. Costs G/L Amount"; Rec."Calc. Recog. Costs G/L Amount")
                    {
                        Visible = false;
                        ApplicationArea = All;
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
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
                ApplicationArea = All;
            }
            part(Control1902136407; "Job No. of Prices FactBox")
            {
                SubPageLink = "No." = FIELD("No."), "Resource Filter" = FIELD("Resource Filter"), "Posting Date Filter" = FIELD("Posting Date Filter"), "Resource Gr. Filter" = FIELD("Resource Gr. Filter"), "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = true;
                ApplicationArea = All;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                SubPageLink = "No." = FIELD("No."), "Resource Filter" = FIELD("Resource Filter"), "Posting Date Filter" = FIELD("Posting Date Filter"), "Resource Gr. Filter" = FIELD("Resource Gr. Filter"), "Planning Date Filter" = FIELD("Planning Date Filter");
                Visible = false;
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
                action("Job &Task Lines")
                {
                    Caption = 'Job &Task Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                }
                action("Job &Planning Lines")
                {
                    Caption = 'Job &Planning Lines';
                    Image = JobLines;
                    ShortCutKey = 'Shift+Ctrl+P';
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        JobPlanningLine: Record "Job Planning Line";
                        JobPlanningLines: Page "Job Planning Lines";
                    begin
                        Rec.TESTFIELD("No.");
                        JobPlanningLine.SETRANGE("Job No.", Rec."No.");
                        ///JobPlanningLines.SetJobNoVisible(FALSE);
                        JobPlanningLines.SETTABLEVIEW(JobPlanningLine);
                        JobPlanningLines.EDITABLE := FALSE;
                        JobPlanningLines.RUN;
                    end;
                }
                action("Job Card")
                {
                    Caption = 'Job Card';
                    Image = Import;
                    // //RunObject = Report "Job Card New";
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
                    RunObject = page "Job Statistics";
                    RunPageLink = "No." = FIELD("No.");
                    ShortCutKey = 'F7';
                    ApplicationArea = All;
                }
                separator(Separator64)
                {
                    ;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Job), "No." = FIELD("No.");
                    ApplicationArea = All;
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                Visible = false;
                action("&WIP Entries")
                {
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    // RunPageLink = "Job No." = FIELD("No.");
                    //RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date");
                    ApplicationArea = All;
                }
                action("WIP &G/L Entries")
                {
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    //  RunObject = Page "Job WIP G/L Entries";
                    //RunPageLink = "Job No." = FIELD("No.");
                    //RunPageView = SORTING("Job No.");
                    ApplicationArea = All;
                }
                action("Service App Schedules")
                {
                    Caption = 'Service App Schedules';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Cash Office User Template";
                    /// RunPageLink = "JOb No Updated" = FIELD("No.");
                    ApplicationArea = All;
                }
                action(Quotation)
                {
                    Caption = 'Quotation';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // RunObject = Page Page39006249;
                    // RunPageLink = "No."=FIELD("No.");
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
                    /// RunObject = Page "Posted Jobs Sales Invoices";
                    ///RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
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
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                }
                action("&Item")
                {
                    Caption = '&Item';
                    Image = Item;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("&G/L Account")
                {
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = FIELD("No.");
                    ApplicationArea = All;
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                Visible = false;
                action("Resource &Allocated per Job")
                {
                    Caption = 'Resource &Allocated per Job';
                    ApplicationArea = all;
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                }
                action("Res. &Gr. All&ocated per Job")
                {
                    Caption = 'Res. &Gr. All&ocated per Job';
                    Image = ResourceGroup;
                    RunObject = Page 228;
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
                    Image = JobLedger;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page 92;
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ApplicationArea = All;
                }
                action(Action1000000094)
                {
                    Caption = 'Quotation';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    /// RunObject = Page Page39006249;
                    ///  RunPageLink = "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Issue Entries")
                {
                    Caption = 'Issue Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                    ApplicationArea = All;
                }
                action("Return Entries")
                {
                    Caption = 'Return Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Return);
                    ApplicationArea = All;
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
                    Caption = 'Copy Job Tasks &from...';
                    ApplicationArea = All;
                    Ellipsis = true;
                    Image = CopyToTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //ApplicationArea = All;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page 1041;
                    begin
                        CopyJobTasks.SetToJob(Rec);
                        CopyJobTasks.RUNMODAL;
                    end;
                }
                action("Copy Job Tasks &to...")
                {
                    Caption = 'Copy Job Tasks &to...';
                    ApplicationArea = All;
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        CopyJobTasks: Page 1041;
                    begin
                        CopyJobTasks.SetFromJob(Rec);
                        CopyJobTasks.RUNMODAL;
                    end;
                }
                action("&Online Map")
                {
                    Caption = '&Online Map';
                    Image = Map;
                    ApplicationArea = All;

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
                action("<Action82>")
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
                action("<Action83>")
                {
                    Caption = '&Post WIP to G/L';
                    Ellipsis = true;
                    Image = PostOrder;
                    ApplicationArea = All;
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
                        REPORT.RUNMODAL(1085, TRUE, FALSE, Job);
                    end;
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
                PromotedIsBig = true;
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
                //RunObject = Report "Job Suggested Billing";
                ApplicationArea = All;
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
    end;

    var
        //  [InDataSet]
        InvoiceCurrencyCodeEditable: Boolean;
        //   [InDataSet]
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

