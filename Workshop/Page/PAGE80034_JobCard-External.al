page 80034 "Job Card - External"
{
    Caption = 'Job Card - External';
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
                field(Description; Rec.Description)
                {
                    MultiLine = true;
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("VehReg. No."; Rec."VehReg. No.")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Estimate No"; Rec."Estimate No")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
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
                    Importance = Promoted;
                    ApplicationArea = All;
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
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field(Blocked; Rec.Blocked)
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
            group("Vehicle/Equipment")
            {
                Caption = 'Vehicle/Equipment';
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Brought By"; Rec."Brought By")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Customer Identification No"; Rec."Customer Identification No")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Job Narration"; Rec."Job Narration")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("KM Run"; Rec."KM Run")
                {
                    ApplicationArea = All;
                    Caption = 'KM Run (DISCARDED )';
                    Editable = false;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("KM Reading"; Rec."KM Reading")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Visible = false;
                }
                field("Daily Availability Code"; Rec."Daily Availability Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
            group("Service App Reshedule")
            {
                field("Update Next KM Service"; Rec."Update Next KM Service")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Next KM Service/PM Service"; Rec."Next KM Service/PM Service")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Serv. Tech. Job Closure"; Rec."Serv. Tech. Job Closure")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("FLeet No."; Rec."FLeet No.")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Acquistion Date"; Rec."Acquistion Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fleet Manger  Location"; Rec."Fleet Manger  Location")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                Editable = false;
                Visible = false;
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                    ApplicationArea = All;
                }
                field("Apply Usage Link"; Rec."Apply Usage Link")
                {
                    ApplicationArea = All;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    Caption = '% Completed';
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Additional;
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    ApplicationArea = All;
                    Caption = '% of Overdue Planning Lines';
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
                Editable = false;
                field("Estimate Date"; Rec."Estimate Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = All;
                }
                field("Vehicle Reporting Date"; Rec."Vehicle Reporting Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                    ShowCaption = false;
                    ApplicationArea = All;
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
                Visible = false;
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    ApplicationArea = All;
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Additional;
                }
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
                field("Workshop Completion Date"; Rec."Workshop Completion Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = All;
                    Editable = false;
                    NotBlank = true;
                }
                field("WIP Posting Method"; Rec."WIP Posting Method")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }
                group("To Post")
                {
                    Caption = 'To Post';
                    Visible = false;
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
                    Visible = false;
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
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(167),
                              "No." = FIELD("No.");
            }
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

                    trigger OnAction()
                    begin
                        Rec.TESTFIELD(Description);
                        Rec.TESTFIELD(Description);
                        Rec.TESTFIELD("Job Narration");
                        Rec.TESTFIELD("Job Type");
                        Rec.TESTFIELD("Shortcut Dimension 3 Code");

                        //RELEASE WHN READY TO USE PREVENTIVE MAINTANACE
                        IF (Rec."Job Type" = Rec."Job Type"::"KM Service") OR (Rec."Job Type" = Rec."Job Type"::PrevMaint) THEN BEGIN
                            Rec.TESTFIELD("Curr. KM Service/PM Service");
                            Rec.TESTFIELD("KM Odometer Reading");
                        END;
                    end;
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
                        Rec.TESTFIELD(Description);
                        Rec.TESTFIELD("Job Narration");
                        Rec.TESTFIELD("Job Type");
                        Rec.TESTFIELD("Shortcut Dimension 3 Code");


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
                    ApplicationArea = All;
                    //RunObject = Report "Job Card New";
                }
                action("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(167), "No." = FIELD("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action("&Statistics")
                {
                    Caption = '&Statistics';
                    Image = Statistics;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    // RunObject = Page "Job Statistics";
                    //                RunPageLink = "No."=FIELD("No.");
                    ShortCutKey = 'F7';
                }
                separator(Separator64)
                {
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    ApplicationArea = All;
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
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    ApplicationArea = All;
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
                /*
                action("Service App Schedules")
                {
                    Caption = 'Service App Schedules';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    //RunObject = Page "Service App Schedules";
                   // RunPageLink = "JOb No Updated" = FIELD("No.");
                }
                action("Service App Schedules(ALL FOR TRUCK)")
                {
                    Caption = 'Service App Schedules(ALL FOR TRUCK)';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Service App Schedules";
                    RunPageLink = "Service Item" = FIELD("Service Item");
                }
                 action(Quotation)
                 {
                     Caption = 'Quotation';
                     Image = Quote;
                     Promoted = true;
                     PromotedCategory = Process;
                     PromotedIsBig = true;
                     RunObject = Page Page39006249;
                                     RunPageLink = "No."=FIELD("No.");
                 }*/// B.Dennis
                action("Store Req (Issue)")
                {
                    Caption = 'Store Req (Issue)';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    RunObject = Page "Store Material Issue List";
                    RunPageLink = "Entry Type" = CONST(Issue), "No." = FIELD("No.");
                }
                action("Posted Issued Entries")
                {
                    Caption = 'Posted Issued Entries';
                    Image = Quote;
                    Promoted = true;
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                }
                action("Vehicle Registration")
                {
                    Caption = 'Vehicle Registration';
                    Description = 'Vehicle Registration';
                    Image = Quote;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Vehicle Registration Card";
                    RunPageLink = "Job Card No" = FIELD("No.");
                }
                action("Posted Return Entries")
                {
                    Caption = 'Posted Return Entries';
                    Image = Quote;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Return);
                }
                /*                action("Posted Jobs Sales Invoices")
                                {
                                    Caption = 'Posted Jobs Sales Invoices';
                                    Image = Quote;
                                    Promoted = true;
                                    PromotedCategory = Process;
                                    PromotedIsBig = true;
                                    RunObject = Page "Posted Jobs Sales Invoices";
                                    RunPageLink = "Job No." = FIELD("No.");
                                }
                                */
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                Visible = false;
                action("&Resource")
                {
                    Caption = '&Resource';
                    Image = Resource;
                    ApplicationArea = All;
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
                    ApplicationArea = All;
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
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    ApplicationArea = All;
                    RunObject = Page "Resource Allocated per Job";
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
                    Caption = 'Ledger E&ntries';
                    Image = JobLedger;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = FIELD("No.");
                    RunPageView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                }
                /*
                action(Action1000000092)
                {
                    Caption = 'Quotation';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Page39006249;
                                    RunPageLink = "No."=FIELD("No.");
                }
                */
                action("Issue Entries")
                {
                    Caption = 'Issue Entries';
                    Image = Quote;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                }
                action("Return Entries")
                {
                    Caption = 'Return Entries';
                    Image = Quote;
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Return);
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

                action("&Online Map")
                {
                    Caption = '&Online Map';
                    ApplicationArea = All;
                    Image = Map;

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action("Copy Job Tasks &from...")
                {
                    Caption = 'Copy Job Tasks &from...';
                    Ellipsis = true;
                    ApplicationArea = All;
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
                    Caption = 'Copy Job Tasks &to...';
                    Ellipsis = true;
                    ApplicationArea = All;
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
            }
            group(ActionGroup26)
            {
                Caption = 'W&IP';
                Image = WIP;
                Visible = false;
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
                        //REPORT.RUNMODAL(REPORT::"Job Calculate WIP", TRUE, FALSE, Job);
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
                        //REPORT.RUNMODAL(REPORT::"Job Post WIP to G/L", TRUE, FALSE, Job);
                    end;
                }
            }
        }
        area(reporting)
        {
            action("<Job& Gate Pass>")
            {
                Caption = 'Jo&b Gate Pass';
                Image = "Report";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ////RunObject = Report Report50045;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.TESTFIELD("No.");
                    Job.COPY(Rec);
                    Rec.SETRANGE("No.", Rec."No.");
                    ////REPORT.RUNMODAL(REPORT::"Gate Pass", TRUE, FALSE, Rec);
                end;
            }
            action("Job Actual to Budget")
            {
                Caption = 'Job Actual to Budget';
                Image = "Report";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job Actual To Budget";
            }
            action("Job Analysis")
            {
                Caption = 'Job Analysis';
                Image = "Report";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job Analysis";
            }
            action("Job - Planning Lines")
            {
                Caption = 'Job - Planning Lines';
                Image = "Report";
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = "Report";
                //RunObject = Report "Job - Planning Lines";
            }
            action("Job - Suggested Billing")
            {
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                ApplicationArea = All;
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
        ERROR('You cannot Create JOB from Here, Please Go thru the normal process of creating estimate.');

        Rec."Customer Job Type" := 'EXTERNAL';
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        IF Rec.Status = Rec.Status::Completed THEN
            CurrPage.EDITABLE := FALSE;
    end;

    trigger OnOpenPage()
    begin
        IF Rec.Status = Rec.Status::Completed THEN
            CurrPage.EDITABLE := FALSE;
    end;

    var
        //  [InDataSet]
        InvoiceCurrencyCodeEditable: Boolean;
        //  [InDataSet]
        CurrencyCodeEditable: Boolean;
        Job: Record Job;

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

