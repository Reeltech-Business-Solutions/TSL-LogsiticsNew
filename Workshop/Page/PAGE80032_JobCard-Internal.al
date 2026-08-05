page 80032 "Job Card - Internal"
{
    Caption = 'Job Card - Internal';
    DeleteAllowed = false;
    PageType = Card;
    InsertAllowed = false;
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
                    NotBlank = true;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ApplicationArea = All;
                    Caption = 'Job Type';
                    Visible = false;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    Editable = True;
                    //ShowCaption = false;
                    // TableRelation = "Job Type Code";

                    // trigger OnValidate()
                    // var
                    //     JobPostingGroup: Record "Job Type Code";
                    // Begin
                    //     If JobPostingGroup.Get(Rec."Job Type Code") then
                    //         JobPostingGroup.SetRange(JobPostingGroup."Job Type Code", Rec."Job Type Code");
                    //     If JobPostingGroup.Find('-') then begin
                    //         Rec."Job Posting Group" := JobPostingGroup."Job Posting Group";
                    //     End;
                    // End;


                }
                field("Estimate No"; Rec."Estimate No")
                {
                    ApplicationArea = All;
                    Caption = 'Estimate No.';
                }
                field("FLeet No."; Rec."FLeet No.")
                {
                    Caption = 'Asset No.';
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Service Vehicle"; Rec."Service Vehicle")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Trailer; Rec.Trailer)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Trailer No."; Rec."Trailer No.")
                {
                    ApplicationArea = All;
                }
                field("VehReg. No."; Rec."VehReg. No.")
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Reg. No';
                    Editable = false;

                }
                field("ECP No."; Rec."ECP No.")
                {
                    ApplicationArea = All;
                    Caption = 'ECP No.';
                }
                field("Vehicle Registr. Plate No"; Rec."Vehicle Registr. Plate No")
                {
                    ApplicationArea = All;
                    caption = 'Vehicle Registr.Plate No.';
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    ApplicationArea = All;
                    Caption = 'Truck BreakDown No.';
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
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    // ShowCaption = false;
                    ApplicationArea = All;
                }

                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                    Editable = false;
                    Visible = false;
                }
                field("Repair Location"; Rec."Repair Location")
                {
                    ApplicationArea = all;
                    TableRelation = "Repair Location";
                    Editable = True;
                    Visible = false;
                }

                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                    Visible = false;
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }

                field("Location Code"; Rec."Location Codes")
                {
                    ApplicationArea = All;
                    caption = 'Location';
                }


                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                    Editable = False;
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
                field("Job Narration"; Rec."Job Narration")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Consumed Value (Cost)"; Rec."Consumed Value (Cost)")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Customer Ship to Name"; Rec."Customer Ship to Name")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Brought By"; Rec."Brought By")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Customer Identification No"; Rec."Customer Identification No")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Vehicle/Equipment Make"; Rec."Vehicle/Equipment Make")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Vehicle/Equipment Model"; Rec."Vehicle/Equipment Model")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Daily Availability Code"; Rec."Daily Availability Code")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("KM Odometer Reading"; Rec."KM Odometer Reading")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                    Editable = false;
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
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Next KM Service/PM Service"; Rec."Next KM Service/PM Service")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Next Service Date"; Rec."Next Service Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Serv. Tech. Job Closure"; Rec."Serv. Tech. Job Closure")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Acquistion Date"; Rec."Acquistion Date")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field("Fleet Manager"; Rec."Fleet Manager")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field("Fleet Manager Name"; Rec."Fleet Manager Name")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Fleet Manager Phone No."; Rec."Fleet Manager Phone No.")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field("Fleet Manger  Location"; Rec."Fleet Manger  Location")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Fleet  Manager E-Mail"; Rec."Fleet  Manager E-Mail")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                Visible = false;
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
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
                    //ShowCaption = false;
                }
                field("Failure Sub Code"; Rec."Failure Sub Code")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }

            }
            group(Duration)
            {
                Caption = 'Duration';
                Editable = true;
                field("Estimate Date"; Rec."Estimate Date")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                    Editable = true;
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
                    //ShowCaption = false;
                }
                field("Vehicle Reporting Time"; Rec."Vehicle Reporting Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Vehicle In Date"; Rec."Vehicle In Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Vehicle In Time"; Rec."Vehicle In Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Invoice Date*"; Rec."Invoice Date*")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //ShowCaption = false;
                }
                field("Job Completion Date"; Rec."Job Completion Date")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Job Collection Date"; Rec."Job Collection Date")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Workshop Status"; Rec."Workshop Status")
                {
                    //ShowCaption = false;
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
            group("WIP and Recognition")
            {
                Caption = 'WIP and Recognition';
                Visible = false;
                field("Workshop Completion Date"; Rec."Workshop Completion Date")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    ApplicationArea = All;
                    Caption = '% Invoiced';
                    Editable = false;
                    Importance = Additional;
                }
                // field("Workshop Status"; Rec."Workshop Status")
                // {
                //     //ShowCaption = false;
                //     ApplicationArea = All;
                // }
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
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("Work Order Date"; Rec."Work Order Date")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Work Order Rcpt. Date"; Rec."Work Order Rcpt. Date")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field("Work Order Value"; Rec."Work Order Value")
                {
                    ApplicationArea = All;
                    //ShowCaption = false;
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = All;
                    Editable = false;
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
                    field("Estimate Value (Price)"; Rec."Estimate Value (Price)")
                    {
                        //ShowCaption = false;
                        ApplicationArea = All;
                    }
                    field("Contract Total Price"; Rec."Contract Total Price")
                    {
                        //ShowCaption = false;
                        ApplicationArea = All;
                        Style = StrongAccent;
                        StyleExpr = TRUE;
                    }
                    field("Contract Invoiced Price"; Rec."Contract Invoiced Price")
                    {
                        ApplicationArea = All;
                        // ShowCaption = false;
                        Style = Unfavorable;
                        StyleExpr = TRUE;
                    }
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
            // part(Control1902018507; "Customer Statistics FactBox")
            // {
            //     ApplicationArea = All;
            //     SubPageLink = "No." = FIELD("Bill-to Customer No.");
            //     Visible = false;
            // }

            part("No. of Material Request Created"; "Job Card FactBox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = All;


            }
            // part(Control1902136407; "Job No. of Prices FactBox")
            // {
            //     ApplicationArea = All;
            //     /*    SubPageLink = "No."=FIELD("No."), "Resource Filter"=FIELD("Resource Filter"), "Posting Date Filter"=FIELD("Posting Date Filter"), "Resource Gr. Filter="FIELD("Resource Gr. Filter"), "Planning Date Filter"=FIELD("Planning Date Filter"); */
            //     Visible = true;
            // }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = All;
                /*  SubPageLink =  "No."=FIELD("No."), "Resource Filter"=FIELD("Resource Filter"), "Posting Date Filter"=FIELD("Posting Date Filter"), "Resource Gr. Filter="FIELD("Resource Gr. Filter"), "Planning Date Filter"=FIELD("Planning Date Filter"); */
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

                    trigger OnAction()
                    begin
                        Rec.TESTFIELD(Description);
                        Rec.TESTFIELD("Job Narration");
                        // Rec.TESTFIELD("Job Type");
                        //TESTFIELD("Truck BreakDown No.");
                        Rec.TESTFIELD("KM Odometer Reading");
                        Rec."User ID" := USERID;
                        //  Rec.TESTFIELD("Shortcut Dimension 3 Code");

                        IF Rec."Job Type Code" = 'Lease Operation' THEN BEGIN
                            IF Rec."Shortcut Dimension 4 Code" = '' THEN
                                ERROR('Please Put a VEHICLE CODE for This Job Before Moving on or Contact MIS for Update');
                            Rec.TESTFIELD("Truck BreakDown No.");
                        END;


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
                    ApplicationArea = All;
                    ShortCutKey = 'Shift+Ctrl+P';
                    Visible = True;

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



                        IF Rec."Job Type Code" = 'Lease Operation' THEN BEGIN
                            IF Rec."Shortcut Dimension 4 Code" = '' THEN
                                ERROR('Please Put a VEHICLE CODE for This Job Before Moving on or Contact MIS for Update');
                            Rec.TESTFIELD("Truck BreakDown No.");
                        END;



                        //RELEASE WHN READY TO USE PREVENTIVE MAINTANACE
                        IF (Rec."Job Type" = Rec."Job Type"::"KM Service") OR (Rec."Job Type" = Rec."Job Type"::PrevMaint) THEN BEGIN
                            Rec.TESTFIELD("Curr. KM Service/PM Service");
                            Rec.TESTFIELD("KM Odometer Reading");
                        END;



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
                    //RunObject = Report "Job Card New";
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
                Visible = false;
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
                action("Vehicle Registration")
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Registration';
                    Description = 'Vehicle Registration';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Vehicle Registration Card";
                    RunPageLink = "Job Card No" = FIELD("No.");
                }
                /*  action("Service App Schedules")
                  {
                      Caption = 'Service App Schedules';
                      Image = Quote;
                      Promoted = true;
                      PromotedCategory = Process;
                      PromotedIsBig = true;
                      RunObject = Page "Cash Office User Template";
                      RunPageLink = "JOb No Updated" = FIELD("No.");
                  }
                  action("Service App Schedules(ALL FOR TRUCK)")
                  {
                      Caption = 'Service App Schedules(ALL FOR TRUCK)';
                      Image = Quote;
                      Promoted = true;
                      PromotedCategory = Process;
                      PromotedIsBig = true;
                       RunObject = Page "Cash Office User Template";
                       RunPageLink = "Service Item" = FIELD("Service Item");
                  }
  */
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
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                }
                action(Action1000000125)
                {
                    ApplicationArea = All;
                    Caption = 'Vehicle Registration';
                    Description = 'Vehicle Registration';
                    Image = Quote;
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
                /*
                action("Posted Jobs Sales Invoices")
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
                    ApplicationArea = All;
                    Caption = '&G/L Account';
                    Image = JobPrice;
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
                    ApplicationArea = All;
                    Caption = 'Res. &Gr. All&ocated per Job';
                    Image = ResourceGroup;
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
                action(Action1000000094)
                {
                    ApplicationArea = All;
                    Caption = 'Quotation';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    // RunObject = Page Page39006249;
                    // RunPageLink = "No." = FIELD("No.");
                }
                action("Issue Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Issue Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Issue);
                }
                action("Return Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Return Entries';
                    Image = Quote;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Posted Material Issue List";
                    RunPageLink = "Job No." = FIELD("No."), "Entry Type" = FILTER(Return);
                }

                action("Return Material")
                {
                    ApplicationArea = All;
                    Caption = 'Create a Material Return';
                    Image = Return;
                    Promoted = True;
                    PromotedCategory = Process;
                    RunObject = page "Store Material Return List";
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
                action("ReOpen Job")
                {
                    Caption = 'ReOpen Job';
                    Image = Open;
                    Promoted = True;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()

                    Var
                        UserSetup: Record "User Setup";

                    begin
                        If UserSetup.Get(UserId) then begin
                            IF UserSetup."ReOpen Job Card" = False Then
                                Error('You are no permitted to Perform this action,please contact your system administrator')
                            Else
                                if Confirm('Do you want to ReOpen Job?') then begin
                                    Rec.Validate(rec.Status, Rec.Status::Open);
                                    Rec.Modify();
                                end;
                        end;
                    end;
                }
                action("Close Job")
                {
                    Caption = 'Close Job';
                    Image = Close;
                    Promoted = True;
                    PromotedCategory = Process;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        UserSet: Record "User Setup";
                        ErrorText: Label 'You are not permitted to perform this action, please contact your system administrator';
                    begin
                        if UserSet.get(UserId) then begin
                            if UserSet."Close Job" = false then
                                Error(ErrorText)
                            else
                                if Confirm('Do you want to close Job?') then begin
                                    rec.Validate(rec.Status, rec.Status::Completed);
                                    rec.Modify();

                                end;
                        end;
                    end;
                }

                group("PERIODIC PROCESS")
                {
                    Image = Action;
                    Caption = 'PERIODIC PROCESS';
                    action("Job &Create Sales Invoice")
                    {
                        ApplicationArea = All;
                        Caption = 'Job &Create Sales Invoice';
                        Image = CreateJobSalesInvoice;
                        RunObject = Report "Job Create Sales Invoice";
                    }
                    action("Complete Invoiced Jobs (ReelTech)")
                    {
                        ApplicationArea = All;
                        Caption = 'Complete Invoiced Jobs (ReelTech)';
                        //  RunObject = Report "Complete Invoiced Jobs";
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
                        RunObject = Report "Update Job Item Cost";
                    }
                    action("Job Calculate &WIP")
                    {
                        ApplicationArea = All;
                        Caption = 'Job Calculate &WIP';
                        Image = "Report";
                        RunObject = Report "Job Calculate WIP";
                    }
                    action("Jo&b Post WIP to G/L")
                    {
                        ApplicationArea = All;
                        Caption = 'Jo&b Post WIP to G/L';
                        Image = "Report";
                        RunObject = Report "Job Post WIP to G/L";
                    }

                }
                group("W&IP1")
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("&WIP Entries1")
                    {
                        ApplicationArea = Jobs;
                        Caption = '&WIP Entries';
                        Image = WIPEntries;
                        RunObject = Page "Job WIP Entries";
                        RunPageLink = "Job No." = FIELD("No.");
                        RunPageView = SORTING("Job No.", "Job Posting Group", "WIP Posting Date")
                                  ORDER(Descending);
                        ToolTip = 'View entries for the job that are posted as work in process.';
                    }
                    action("WIP &G/L Entries1")
                    {
                        ApplicationArea = Jobs;
                        Caption = 'WIP &G/L Entries';
                        Image = WIPLedger;
                        RunObject = Page "Job WIP G/L Entries";
                        RunPageLink = "Job No." = FIELD("No.");
                        RunPageView = SORTING("Job No.")
                                  ORDER(Descending);
                        ToolTip = 'View the job''s WIP G/L entries.';
                    }
                }

            }
        }
        area(reporting)
        {
            action("<Job& Gate Pass>")
            {
                ApplicationArea = All;
                Caption = 'Jo&b Gate Pass';
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;
                ////RunObject = Report Report50045;

                trigger OnAction()
                begin
                    Rec.RESET;
                    Rec.TESTFIELD("No.");
                    Job.COPY(Rec);
                    Rec.SETRANGE("No.", Rec."No.");
                    //REPORT.RUNMODAL(REPORT::"Gate Pass", TRUE, FALSE, Rec);
                end;
            }
            action("Job Mat. Req")
            {
                Caption = 'Create Job Mat. Req.';
                ApplicationArea = All;
                ToolTip = 'Create Job Material Request';
                Image = CreateDocument;
                Promoted = true;
                PromotedIsBig = true;
                Enabled = showJob;
                // RunObject = page "Job Material Request";



                trigger OnAction()
                var
                    DocNo: code[30];
                    InvSetup: Record "Inventory Setup";
                    JobMatPage: page "Job Material Request";
                    JobRec: Record Job;
                    JobMtr: Record "Material Request Line";
                    JobPlanningLine: Record "Job Planning Line";
                    JobMatMgt: Codeunit "Job Request Management";
                    JobMatPg: Page "Job Material Request";
                    JobMatRec: Record "Material Request Header";
                    JobTask: Record "Job Task";
                begin
                    if ((Rec."Workshop Status" = Rec."Workshop Status"::Completed) OR (Rec.Status = Rec.Status::Completed)) then
                        Error('A new record cannot be created if status is completed');
                    if Confirm('Do you want to create Job Material Request') then begin

                        Clear(JobMatPage);
                        DocNo := '';
                        InvSetup.Get();
                        DocNo := NoSer.GetNextNo(InvSetup."Material Request Nos.", Today, true);
                        JobMatReq.Init();
                        JobMatReq.Insert(true);
                        if JobMatReq."No." <> '' then
                            JobMatReq.Init();
                        JobMatReq."Job No." := rec."No.";

                        // if JobMatReq."Job No." <> '' then
                        JobMatReq.Validate("Job No.");
                        JobMatReq.Validate("Asset No.", JobRec."FLeet No.");
                        JobMatReq.Validate("Service Vehicle", JobRec."Service Vehicle");
                        JobMatReq.Trailer := JobRec.Trailer;
                        JobMatReq."Trailer No." := JobRec."Trailer No.";
                        if JobRec.Get(Rec."No.") then
                            JobMatReq.validate("Location Code", JobRec."Location Codes");

                        JobMatReq.Validate("Job Description", JobRec.Description);
                        JobMatReq.Validate("Trailer No.", JobRec."Trailer No.");
                        JobMatReq.Validate(JobMatReq."Requested By", JobRec."Person Responsible");
                        JobMatReq.Validate("Job No.");
                        // JobMatReq."Location Code" := JobRec."Location Code";
                        JobMatReq.Modify();
                        JobTask.Reset();
                        JobTask.SetFilter("Job No.", '%1', JobMatReq."Job No.");
                        if JobTask.Find('-') then
                            JobMatReq.Validate("Job Task No.", JobTask."Job Task No."); //100000

                        JobMatReq."Request Date" := Today;
                        JobMatReq.Modify();
                        JobMatPage.SetRecord(JobMatReq);
                        JobMatPage.Run();
                        CurrPage.Update(true);


                    end;

                end;



            }

            action("Req Add. Job Mat. Req")
            {
                Caption = '"Request Add. Job Mat. Req"';
                ApplicationArea = All;
                ToolTip = 'Request Additional Job Material Request';
                Image = CreateDocument;
                Promoted = true;
                PromotedIsBig = true;
                Enabled = showJob3;
                // RunObject = page "Job Material Request";



                trigger OnAction()
                var
                    DocNo: code[30];
                    InvSetup: Record "Inventory Setup";
                    JobMatPage: page "Job Material Request";
                    JobRec: Record Job;
                    JobMtr: Record "Material Request Line";
                    JobPlanningLine: Record "Job Planning Line";
                    JobMatMgt: Codeunit "Job Request Management";
                    JobMatPg: Page "Job Material Request";
                    JobMatRec: Record "Material Request Header";
                    JobTask: Record "Job Task";
                    jobExt: Record Job;
                begin
                    if ((Rec."Workshop Status" = Rec."Workshop Status"::Completed) OR (Rec.Status = Rec.Status::Completed)) then
                        Error('A new record cannot be created if status is completed');
                    if Confirm('Do you want to request for additional Job Material Request') then begin
                        Clear(JobMatPage);
                        //    DocNo := '';
                        InvSetup.Get();
                        //    DocNo := NoSer.GetNextNo(InvSetup."Material Request Nos.", Today, true);
                        JobMatReq.Init();
                        JobMatReq.Insert(true);

                        if JobMatReq."No." <> '' then
                            JobMatReq.Init();
                        JobMatReq."Job No." := rec."No.";

                        // if JobMatReq."Job No." <> '' then
                        JobMatReq.Validate("Job No.");
                        JobMatReq.Validate("Asset No.", JobRec."FLeet No.");
                        JobMatReq.Validate("Service Vehicle", JobRec."Service Vehicle");
                        JobMatReq.Trailer := JobRec.Trailer;
                        JobMatReq."Additional Material Request" := true;
                        JobMatReq."Trailer No." := JobRec."Trailer No.";
                        if JobRec.Get(Rec."No.") then
                            JobMatReq.validate("Location Code", JobRec."Location Codes");

                        JobMatReq.Validate("Job Description", JobRec.Description);
                        JobMatReq.Validate("Trailer No.", JobRec."Trailer No.");
                        JobMatReq.Validate(JobMatReq."Requested By", JobRec."Person Responsible");
                        JobMatReq.Validate("Job No.");
                        // JobMatReq."Location Code" := JobRec."Location Code";
                        JobMatReq.Modify();
                        JobTask.Reset();
                        JobTask.SetFilter("Job No.", '%1', JobMatReq."Job No.");
                        if JobTask.Find('-') then
                            JobMatReq.Validate("Job Task No.", JobTask."Job Task No."); //100000

                        JobMatReq."Request Date" := Today;
                        JobMatReq.Modify();
                        JobMatPage.SetRecord(JobMatReq);
                        JobMatPage.Run();
                        CurrPage.Update(true);


                    end;
                end;



            }

            action("Send for quality check")
            {
                ApplicationArea = All;
                caption = 'Send for Quality Check';
                Image = SendApprovalRequest;
                //Enabled = EditableWorkShop;
                Promoted = true;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    QualityCheck: Record "Quality Check";

                begin

                    if (Rec."Workshop Status" = Rec."Workshop Status"::Completed) or
                        (Rec."Workshop Status" = Rec."Workshop Status"::"Quality Check") then begin
                        error('This Job has already been sent for quality check');
                    end;
                    Rec."Workshop Status" := Rec."Workshop Status"::"Quality Check";
                    Rec.Modify();
                    Currpage.update;
                    QualityCheck.Init();
                    QualityCheck."No." := '';
                    QualityCheck.Validate("Job No.", Rec."No.");
                    QualityCheck.Insert(True);

                    // QualityCheck.Reset();
                    // QualityCheck.setRange("No.", QualityCheck."No.");
                    // Page.Run(Page::"Quality Check", QualityCheck);




                end;
            }
            action("Job Actual to Budget")
            {
                ApplicationArea = All;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                //RunObject = Report "Job Actual To Budget";
            }
            action("Quality Check")
            {
                ApplicationArea = All;
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
            group("Material Returns")
            {
                action("Return Material1")
                {
                    ApplicationArea = All;
                    Caption = 'Create a Material Return';
                    Image = Return;
                    Promoted = True;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = page "Store Material Return List";
                }
            }
        }

    }

    trigger OnAfterGetRecord()
    begin
        CurrencyCheck;
        Job.Reset();
        Job.SetRange("No.", Rec."No.");
        if Job.FindFirst() then begin
            Job.CalcFields("No. of Mat. Req. Created");
            Job.CalcFields("No. of Posted Mat. Req. Created");
            if ((Job."No. of Mat. Req. Created" = 0) and (Job."No. of Posted Mat. Req. Created" = 0)) then begin
                showJob := true;
                showJob3 := false;

            end else

                if (Job."No. of Mat. Req. Created" > 0) then begin
                    showJob := false;
                    showJob3 := false;

                end else

                    if (Job."No. of Posted Mat. Req. Created" > 0) then begin
                        showJob := false;
                        showJob3 := true;

                    end



        end;

        if Rec."Workshop Status" = Rec."Workshop Status"::"Quality Check" then
            EditableWorkShop := false
        else
            EditableWorkShop := true;
    end;

    trigger OnInit()
    begin
        CurrencyCodeEditable := TRUE;
        InvoiceCurrencyCodeEditable := TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ERROR('You cannot Create JOB from Here, Please Go thru the normal process of creating estimate.');

        Rec."Customer Job Type" := 'INTERNAL';
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        IF Rec.Status = Rec.Status::Completed THEN
            CurrPage.EDITABLE := FALSE;
    end;

    trigger OnOpenPage()
    var


        JobHeader: Record "Job";

    begin
        rec."Created By" := UserId;
        rec."Created Date" := Today;
        begin
            //  rec.SetFilter("Created By", '%1', UserId);
        end;

        IF Rec.Status = Rec.Status::Completed THEN
            CurrPage.EDITABLE := FALSE;


        Job.Reset();
        Job.SetRange("No.", Rec."No.");

        if Job.FindFirst() then begin
            Job.CalcFields("No. of Mat. Req. Created");
            Job.CalcFields("No. of Posted Mat. Req. Created");
            if ((Job."No. of Mat. Req. Created" = 0) and (Job."No. of Posted Mat. Req. Created" = 0)) then begin
                showJob := true;
                showJob3 := false;

            end else

                if (Job."No. of Mat. Req. Created" > 0) then begin
                    showJob := false;
                    showJob3 := false;

                end else

                    if (Job."No. of Posted Mat. Req. Created" > 0) then begin
                        showJob := false;
                        showJob3 := true;

                    end



        end;
    end;



    var

        InvoiceCurrencyCodeEditable: Boolean;

        CurrencyCodeEditable: Boolean;
        Job: Record Job;
        JobMatReq: Record "Material Request Header";
        //  NoSer: Codeunit NoSeriesManagement;
        NoSer: Codeunit "No. Series";
        TOTQty: Decimal;


        showJob: boolean;
        ShowJob2: boolean;

        ShowJob3: boolean;

        EditableWorkShop: Boolean;

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

