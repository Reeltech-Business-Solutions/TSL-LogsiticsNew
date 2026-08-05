page 80046 "Service Quote - External"
{
    Caption = 'Service Quote';
    PageType = Document;
    RefreshOnActivate = true;
    InsertAllowed = false;
    SourceTable = "Service Header";
    SourceTableView = WHERE("Document Type" = FILTER(Quote));
    ApplicationArea = All;
    PromotedActionCategories = 'New,Process,Report,Request Approval';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        //   IF "//---**---"(xRec) THEN
                        //     CurrPage.UPDATE;
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
                    Visible = false;

                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Importance = Promoted;


                    trigger OnValidate()
                    begin
                        CustomerNoOnAfterValidate;
                        Rec.TESTFIELD("Responsibility Center");
                        Rec.TESTFIELD("Location Code");
                    end;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = All;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        IF Rec.GETFILTER("Contact No.") = xRec."Contact No." THEN
                            IF Rec."Contact No." <> xRec."Contact No." THEN
                                Rec.SETRANGE("Contact No.");
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Importance = Promoted;

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = All;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("FLeet No."; Rec."FLeet No.")
                {
                    Caption = 'Asset No.';
                    ApplicationArea = All;
                    Editable = false;
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
                field("Trailer No"; Rec."Trailer No")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Vehicle Reg No."; Rec."Vehicle Reg No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("ECP No."; Rec."ECP No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = All;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                    caption = 'Location';
                    /// TableRelation = Location.Code WHERE (Workshop=FILTER(false));
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = All;
                    NotBlank = true;

                    trigger OnValidate()
                    begin
                        // { User := USERID;
                        //Usersetup.GET(User);
                        //IF (Usersetup."Service Resp. Ctr. Filter") <> (xRec."Responsibility Center") THEN
                        //FIELDERROR("Responsibility Center");}
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ApplicationArea = All;
                    Visible = false;
                    //Caption = 'Vehicle Code';
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    ApplicationArea = All;
                    Visible = false;


                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
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
                    NotBlank = true;
                    trigger OnValidate()
                    begin
                        rec.TestField("Assigned User ID");
                    end;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                    visible = false;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Editable = false;

                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Job Created"; Rec."Job Created")
                {
                    ApplicationArea = All;
                    Editable = false;
                }


            }
            part(ServItemLine; "Service Quote Subform")
            {
                ApplicationArea = All;
                Caption = 'Service Lines';
                SubPageLink = "Document No." = FIELD("No.");
            }
            part("Service Item Lines"; "Service Item Worksheet Subform")
            {
                ApplicationArea = All;
                Caption = 'Service Item Lines';
                SubPageLink = "Document No." = FIELD("No.");
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Service Order Type"; Rec."Service Order Type")
                {
                    ApplicationArea = All;
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                    ApplicationArea = All;
                    // ShowCaption = false;
                }
                field("Phone No. 2"; Rec."Phone No. 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        OrderDateOnAfterValidate;
                    end;
                }
                field("Order Time"; Rec."Order Time")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        OrderTimeOnAfterValidate;
                    end;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Starting Time"; Rec."Starting Time")
                {
                    ApplicationArea = All;
                }
                field("Response Date"; Rec."Response Date")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Response Time"; Rec."Response Time")
                {
                    ApplicationArea = All;
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                /*  field("Buisness Type";"Buisness Type")
                 {
                     Editable = false;
                     ShowCaption = false;
                 } */
                field("NOVATRACK ID"; Rec."NOVATRACK ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Curr. KM Service/PM Service"; Rec."Curr. KM Service/PM Service")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
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
                    // ShowCaption = false;

                    trigger OnValidate()
                    begin
                        rec."Curr. KM Service/PM Service" := rec."KM Odometer Reading";
                    end;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                    // ShowCaption = false;

                    trigger OnValidate()
                    begin
                        IF JobTypeCode.GET(Rec."Customer Job Type", Rec."Job Type Code") THEN BEGIN
                            IF JobTypeCode."Customer Code" <> '' THEN
                                Rec.VALIDATE("Bill-to Customer No.", JobTypeCode."Customer Code")
                            ELSE
                                //VALIDATE("Bill to Account No.","Customer Bill to Code");
                                Rec."Job Posting Group" := JobTypeCode."Job Posting Group";
                        END
                    end;
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                Visible = false;
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    Visible = false;
                }
                field("Ship-to Phone"; Rec."Ship-to Phone")
                {
                    ApplicationArea = All;
                    Caption = 'Ship-to Phone/Phone 2';
                }
                field("Ship-to Phone 2"; Rec."Ship-to Phone 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Ship-to E-Mail"; Rec."Ship-to E-Mail")
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
                Caption = 'Details';
                Visible = false;
                field("Warning Status"; Rec."Warning Status")
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                }
                field("Link Service to Service Item"; Rec."Link Service to Service Item")
                {
                    ApplicationArea = All;
                }
                field("Allocated Hours"; Rec."Allocated Hours")
                {
                    ApplicationArea = All;
                }
                field("No. of Allocations"; Rec."No. of Allocations")
                {
                    ApplicationArea = All;
                }
                field("No. of Unallocated Items"; Rec."No. of Unallocated Items")
                {
                    ApplicationArea = All;
                }
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                    ApplicationArea = All;
                }
                field("Actual Response Time (Hours)"; Rec."Actual Response Time (Hours)")
                {
                    ApplicationArea = All;
                }
                field("Finishing Date"; Rec."Finishing Date")
                {
                    ApplicationArea = All;
                }
                field("Finishing Time"; Rec."Finishing Time")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        FinishingTimeOnAfterValidate;
                    end;
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
            group(" Foreign Trade")
            {
                Caption = ' Foreign Trade';
                Visible = false;
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = All;
                }
                field("Max. Labour Unit Price"; Rec."Max. Labor Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        CLEAR(ChangeExchangeRate);
                        ChangeExchangeRate.SetParameter(Rec."Currency Code", Rec."Currency Factor", Rec."Posting Date");
                        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
                            Rec.VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
                            CurrPage.UPDATE;
                        END;
                        CLEAR(ChangeExchangeRate);
                    end;
                }
                field("EU 3-Party Trade"; Rec."EU 3-Party Trade")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Exit Point"; Rec."Exit Point")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Area"; Rec.Area)
                {
                    ApplicationArea = All;
                }
                field("Expense Job"; Rec."Expense Job")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Store  Location"; Rec."Store  Location")
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("Store Requistion No"; Rec."Store Requistion No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    Lookup = true;
                    LookupPageID = "Service Quotes";
                    ShowCaption = false;
                    /// TableRelation = "Transfer Header" WHERE ("Service Order No"=FIELD("No."));
                }
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Doc. Attachment List Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments1';
                SubPageLink = "Table ID" = CONST(5900), "No." = FIELD("No.");
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
                ApplicationArea = All;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = FIELD("Customer No.");
                Visible = false;
                ApplicationArea = All;
            }
            part(Control1907829707; "Service Hist. Sell-to FactBox")
            {
                SubPageLink = "No." = FIELD("Customer No.");
                Visible = true;
                ApplicationArea = All;
            }
            part(Control1902613707; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1906530507; "Service Item Line FactBox")
            {
                ApplicationArea = All;
                Provider = ServItemLine;
                /// SubPageLink = "Document Type"=FIELD("Document Type"), "Document No."=FIELD("No. of Active/Finished Allocs"), "Line No."=FIELD("Line No.");
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
            group("&Quote")
            {
                Caption = '&Quote';
                Image = Quote;
                separator(Separator163)
                {
                    Caption = '';
                }
                action("&Dimensions")
                {
                    ApplicationArea = All;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Job Card")
                {
                    Caption = 'Job Card';
                    ApplicationArea = All;
                    Image = Job;
                    ///  //RunObject = Report Report50529;
                }
                separator(Separator49)
                {
                }
                action("Co&mments")
                {
                    ApplicationArea = All;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Service Header"), "Table Subtype" = FIELD("Document Type"), "No." = FIELD("No."), Type = CONST(General);
                }
                action("Service Job Card1")
                {
                    ApplicationArea = All;
                    Caption = 'Service Job Card';

                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.SETFILTER("No.", Rec."No.");
                        REPORT.RUN(50529, TRUE, TRUE, Rec);
                    end;
                }
                separator(Separator164)
                {
                    Caption = '';
                }
                action(Statistics)
                {
                    ApplicationArea = All;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        COMMIT;
                        /// PAGE.RUNMODAL(PAGE::"Service Statistics",Rec);
                    end;
                }
                action("Customer Card8")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Card';
                    Image = Customer;
                    /* RunObject = Page "Customer Card";
                                    RunPageLink = No.=FIELD(Customer No.); */
                    ShortCutKey = 'Shift+F7';
                }
                separator(Separator165)
                {
                    Caption = '';
                }
                action("Service Document Lo&g")
                {
                    ApplicationArea = All;
                    Caption = 'Service Document Lo&g';
                    Image = Log;

                    trigger OnAction()
                    var
                        ServDocLog: Record "Service Document Log";
                    begin
                        ServDocLog.ShowServDocLog(Rec);
                    end;
                }
                action(Job)
                {
                    ApplicationArea = All;
                    Caption = 'Job';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Page "Job Card";
                    RunPageLink = "No." = FIELD("No.");
                }
                action(Action1000000001)
                {
                    ApplicationArea = All;
                    Caption = 'Job Card';
                    Promoted = true;
                    PromotedCategory = "Report";
                    // //RunObject = Report Report59532;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("&Create Customer")
                {
                    ApplicationArea = All;
                    Caption = '&Create Customer';
                    Image = NewCustomer;

                    trigger OnAction()
                    begin
                        CLEAR(ServOrderMgt);
                        ServOrderMgt.CreateNewCustomer(Rec);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Service Job card2")
                {
                    ApplicationArea = All;
                    Caption = 'Service Job card';
                    Visible = false;
                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.SETFILTER("No.", Rec."No.");
                        REPORT.RUN(59529, TRUE, TRUE, Rec);
                        Rec.RESET;
                    end;
                }
                action("Gate Pass")
                {
                    ApplicationArea = All;
                    Caption = 'Gate Pass';
                    Visible = false;

                    trigger OnAction()
                    begin
                        Rec.RESET;
                        Rec.SETFILTER("No.", Rec."No.");
                        REPORT.RUN(39006006, TRUE, TRUE, Rec);
                        Rec.RESET;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = All;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Approval Entries";
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        DocumentType: Enum "Approval Document Type";
                    begin

                        //   WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, DATABASE::"Service Header", Rec."Document Type".AsInteger(), Rec."No.");
                        Approvalentries.SetRecordFilters(5900, DocumentType, rec."No.");
                        Approvalentries.Run();

                    end;
                }
                action("Send A&pproval Request")
                {
                    ApplicationArea = All;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ServLine: Record "Service Line";
                        Confirmation: Label 'Are you sure you want to send this document for approval';
                    begin
                        ServLine.Reset();
                        ServLine.SetRange("Document No.", rec."No.");
                        if ServLine.IsEmpty then begin
                            Error('You can not send this document for approval fill in the Service Item lines fast tab');
                        end;

                        ServLine.SetRange(ServLine.Quantity, 0);
                        if ServLine.FindFirst() then
                            Error('You can not send this document for approval fill in the Quantity field Service Item lines fast tab');

                        ServiceLine.Reset();
                        ServiceLine.setRange("Document Type", ServiceLine."Document Type"::Quote);
                        ServiceLine.setRange("Document No.", Rec."No.");
                        ServiceLine.SetRange("Has Warranty", true);
                        ServiceLine.SetRange("Warranty Confirmed", false);
                        if ServiceLine.findfirst() then begin
                            Error('Some of the items in the service line has a warranty and the warranty has not been confirmed');
                        end;

                        if ApprovalsMgmt.CheckServiceQuoteApprovalsWorkflowEnable(rec) then
                            ApprovalsMgmt.OnSendServicedQuoteForApproval(Rec);
                        //Release the Imprest for Approval
                        //idada
                        //IF ApprovalMgt.SendServiceApprovalRequest(Rec) THEN;

                        //ApprovalMgt.SendLEASEQApprovalRequest(Rec) THEN;  // ApprovalMgt.SendInterRequestApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    ApplicationArea = All;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        Confirmation: Label 'Are you sure you want to cancel approval request?';
                    begin
                        ApprovalsMgmt.OnCancelServicedQuoteForApproval(Rec);
                        //idada
                        //IF ApprovalMgt.CancelServiceApprovalRequest(Rec, TRUE, TRUE) THEN;

                        //IF ApprovalMgt.CancelLEASEQRequestApprovalRequest(Rec,TRUE,TRUE) THEN;
                    end;
                }
                separator(Separator205)
                {
                }
            }
            action("Make &Order")
            {
                ApplicationArea = All;
                Caption = 'Create Job Card';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ECPRec: record "ECP Header";
                    ServiceItemSubform: Record "Service Line";
                    ServiceLine: Record "Service Line";
                    JCardEnabled: Boolean;
                begin
                    //TESTFIELD("Customer Type");
                    Rec.TESTFIELD("Customer Job Type");
                    Rec.TESTFIELD("Job Type Code");
                    Rec.TESTFIELD("Location Code");
                    Rec.TESTFIELD("Assigned User ID");
                    //TESTFIELD("KM Run");
                    Rec.TESTFIELD(Description);
                    Rec.TESTFIELD("Shortcut Dimension 1 Code");
                    // Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    // Rec.TESTFIELD("Shortcut dimension 3");
                    //TESTFIELD("Job Type");
                    Rec.TESTFIELD("KM Odometer Reading");

                    Rec.TestField("Approval Status", Rec."Approval Status"::Released);






                    //RELEASE WHN READY TO USE PREVENTIVE MAINTANACE
                    IF (Rec."Job Type" = Rec."Job Type"::"KM Service") OR (Rec."Job Type" = Rec."Job Type"::PrevMaint) THEN BEGIN
                        Rec.TESTFIELD("Curr. KM Service/PM Service");
                        Rec.TESTFIELD("KM Odometer Reading");
                        //USED TO STOP HAVING MORE THAN ONE JOB CARD OPENED FOR A TRUCK AT THE SAME TIME  //ddada
                        JobRec.RESET;
                        JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", Rec."Registration No.");
                        ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order);

                        JobRec.CALCFIELDS(JobRec."Invoice Exist", JobRec."WIP Amount");
                        //JobRec.SETFILTER(JobRec."WIP Amount",'<>%1',0);
                        JobRec.SETRANGE(JobRec."Invoice Exist", FALSE);
                        IF JobRec.FIND('-') THEN
                            ERROR('There are still some pending PM-job Cards for Truck: %1, yet to be invoiced. Check Job No.: %2; created: %3. Contact your adminsitator.',
                            JobRec."Vehicle Registr. Plate No", JobRec."No.", JobRec."Creation Date");
                    END ELSE BEGIN
                        Rec.TESTFIELD("KM Odometer Reading");
                        //USED TO STOP HAVING MORE THAN ONE JOB CARD OPENED FOR A TRUCK AT THE SAME TIME  //ddada
                        JobRec.RESET;
                        JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", Rec."Registration No.");
                        ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order);
                        JobRec.SETFILTER(JobRec."Job Type", '<>%1|<>%2', Rec."Job Type"::"KM Service", Rec."Job Type"::PrevMaint);
                        JobRec.SETFILTER(JobRec."Job Type", '%1', Rec."Job Type"::Repair);
                        /// JobRec.SETFILTER(JobRec."Creation Date",'>%1',040116D);
                        JobRec.CALCFIELDS(JobRec."Invoice Exist", JobRec."WIP Amount");
                        //JobRec.SETFILTER(JobRec."WIP Amount",'<>%1',0);
                        JobRec.SETRANGE(JobRec."Invoice Exist", FALSE);
                        IF JobRec.FIND('-') THEN
                            ERROR('There are still some pending job Cards for Truck: %1, yet to be invoiced. Check Job No.: %2; created: %3. Contact your adminsitator.',
                            JobRec."Vehicle Registr. Plate No", JobRec."No.", JobRec."Creation Date");

                    END;


                    ServiceLine.RESET;
                    ServiceLine.SETRANGE("Document Type", Rec."Document Type");
                    ServiceLine.SETRANGE("Document No.", Rec."No.");
                    IF ServiceLine.FIND('-') THEN
                        REPEAT
                            //ServiceLine.CALCFIELDS(ServiceLine."Quantity Issued");   //DDada
                            IF ServiceLine."Service Item No." = '' THEN
                                ERROR('PLEASE ENTER SERVICE ITEM FOR ALL LINES');

                            IF ServiceLine."Quantity Issued" <> 0 THEN
                                ERROR('PLEASE Return Items : %1 back to the Store(Items with Issues Quantity <>0). Then you can proceeed to finish this job on the New Job Module..', ServiceLine."No.");


                            IF Rec."Customer Job Type" = 'INTERNAL' THEN BEGIN
                                IF (ServiceLine.Type = ServiceLine.Type::Item) AND (ServiceLine."Unit Price" > 0) THEN
                                    ERROR(' You need to make line with item no : %1 at Zreo price for OPL', ServiceLine."No.");
                            END;


                            //////USed to check Default qty for battery and Tyres   ddada04132020
                            IF (ServiceLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 8 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ServiceLine."Reason For Approval" := ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty";
                                    ERROR('You can not post Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 8 Batteries Default Qty. \please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty, ServiceLine."No.");
                                    //ServiceLine."BLocking Notification" :=TRUE;

                                END;
                            END;

                            IF (ServiceLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 2 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ServiceLine."Reason For Approval" := ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty";
                                    ERROR('You can not post Item %4 \You had Prev. Consu. %1 Already + current qty %2 = %3 Tyres \You have excedded the 2 Tyres Default Qty. \please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty, ServiceLine."No.");
                                    // VALIDATE(Quantity,0);
                                END;
                            END;
                        //////USed to check Default qty for battery and Tyres   ddada04132020


                        UNTIL ServiceLine.NEXT = 0;

                    //DDada


                    CurrPage.UPDATE;

                    ServiceLine.Reset();
                    ServiceLine.setRange("Document Type", ServiceLine."Document Type"::Quote);
                    ServiceLine.setRange("Document No.", Rec."No.");
                    ServiceLine.SetRange("Has Warranty", true);
                    ServiceLine.SetRange("Warranty Confirmed", false);

                    if ServiceLine.findfirst() then begin

                        Error('Some of the items in the service line has a warranty and the warranty has not been confirmed');
                    end;

                    CreateJobOrder.RUN(Rec);
                    CurrPage.UPDATE;
                    //Message('Service Quote has been converted to a Job Order');

                    ///----->> Fola09282023
                    Jobcrtrec.Reset();
                    Jobcrtrec.setfilter("No.", '%1', rec."No.");
                    if Jobcrtrec.findfirst() then begin
                        JobLstrec.SetRecord(Jobcrtrec);
                        JobLstrec.Run();
                    end;
                    ///----->> Fola09282023
                end;
            }
            action(Reopen)
            {
                Caption = 'ReOpen';
                ApplicationArea = All;
                Image = ReOpen;
                Enabled = true;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()
                var
                    UserSet: Record "User Setup";
                begin
                    if UserSet.Get(UserId) then begin
                        if UserSet."ReOpen Service Quote" = false then
                            Error('You are not permitted to perform this action. Kindly contact your administrator');
                        if rec."Approval Status" = rec."Approval Status"::Open then
                            exit;
                        rec.Validate(rec."Approval Status", rec."Approval Status"::Open);
                        rec.Modify();
                        Message('Reopened successfully!');

                    end;
                end;


            }
            action("Get Job Card")
            {
                Caption = 'Get Job Card';
                RunObject = Page "Job List";
                ApplicationArea = All;
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                ApplicationArea = All;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                    ShowRequestForm: Boolean;
                begin
                    /*//CurrPage.UPDATE(TRUE);
                    CurrPage.SETSELECTIONFILTER(ServiceHeader);
                    //DocPrint.PrintServiceHeader(Rec);
                    ServiceHeader.PrintRec(TRUE);
                    //idada
                      */


                    ServiceLine.RESET;
                    ServiceLine.SETRANGE("Document Type", Rec."Document Type");
                    ServiceLine.SETRANGE("Document No.", Rec."No.");
                    IF ServiceLine.FIND('-') THEN
                        REPEAT
                            //ServiceLine.CALCFIELDS(ServiceLine."Quantity Issued");   //DDada
                            IF ServiceLine."Service Item No." = '' THEN
                                ERROR('PLEASE ENTER SERVICE ITEM FOR ALL LINES');

                            IF ServiceLine."Quantity Issued" <> 0 THEN
                                ERROR('PLEASE Return Items : %1 back to the Store. Then you can proceeed to finish this job on the New Job Module..', ServiceLine."Quantity Issued");


                            //////USed to check Default qty for battery and Tyres   ddada04132020
                            IF (ServiceLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 8 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You cannot collect more than 8 tires in a year. \You have consumed %1 Already + current qty %2 = %3 Tyres \have excedded Default Qty , please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                    //ServiceLine."Reason For Approval" := 2;
                                    //ServiceLine."BLocking Notification" :=TRUE;
                                END;
                            END;

                            IF (ServiceLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 2 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine.VALIDATE(ServiceLine."Reason For Approval", ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty");
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You cannot collect more than 2 Battery in a year \You have consumed %1 Already + current qty %2. =%3 Batteries \have excedded Default Qty, \please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                    //ServiceLine."Reason For Approval" := 2;
                                    //ServiceLine."BLocking Notification" :=TRUE;
                                    // VALIDATE(Quantity,0);
                                END;
                            END;
                        //////USed to check Default qty for battery and Tyres   ddada04132020

                        UNTIL ServiceLine.NEXT = 0;

                    Rec.RESET;                                            //Idada
                    Rec.SETFILTER("No.", Rec."No.");
                    REPORT.RUN(5902, TRUE, TRUE, Rec);
                    Rec.RESET;

                end;
            }
            action(Action1000000006)
            {
                Caption = 'Job Card';
                Promoted = true;
                PromotedCategory = "Report";
                ApplicationArea = All;
                // //RunObject = Report Report59532;
            }
        }
    }

    trigger OnClosePage()
    begin
        // Rec.TESTFIELD("Location Code");
        // Rec.TESTFIELD("Assigned User ID");
        //TESTFIELD("Customer Type");
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SAVERECORD;
        EXIT(Rec.ConfirmDeletion);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.CheckCreditMaxBeforeInsert(FALSE);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        // TESTFIELD("Customer Type");
        Rec."User ID" := USERID;
        Rec."Document Date" := TODAY
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Quote;
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        //"Customer Type" := "Customer Type"::External;
        Rec."User ID" := USERID;
        Rec."Document Date" := TODAY
    end;

    trigger OnOpenPage()

    var
        service_Quote: Record "Service Header";
    begin
        if Job.Get(Rec."No.") then begin
            Rec."Job Created" := Job."No.";

            Rec.Modify();
        end;
        JobRec.SetRange("No.", Rec."Job Created");

        if JobRec.FindFirst() then
            CurrPage.Editable(false);
        Currpage.Update();

        service_Quote.setRange("No.", Rec."No.");
        if service_Quote.findFirst() then begin
            if (service_Quote."Approval Status" = service_Quote."Approval Status"::"Pending Approval") OR (service_Quote."Approval Status" = service_Quote."Approval Status"::Released) then begin
                currPage.Editable(false);
            end;
            currPage.Update();
        end;

    end;

    trigger OnAfterGetRecord()
    var
        service_Quote: Record "Service Header";
        job: Record Job;
    begin
        if Job.Get(Rec."No.") then begin
            Rec."Job Created" := Job."No.";
            Rec.Modify();
        end;
        JobRec.SetRange("No.", Rec."Job Created");

        if JobRec.FindFirst() then
            CurrPage.Editable(false);
        Currpage.Update();

        service_Quote.setRange("No.", Rec."No.");
        if service_Quote.findFirst() then begin
            if (service_Quote."Approval Status" = service_Quote."Approval Status"::"Pending Approval") OR (service_Quote."Approval Status" = service_Quote."Approval Status"::Released) then begin
                currPage.Editable(false);
                currPage.Update();
            end;

        end
    end;

    var
        ChangeExchangeRate: Page "Change Exchange Rate";
        ServOrderMgt: Codeunit ServOrderManagement;
        UserMgt: Codeunit "User Setup Management";
        CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
        User: Code[50];
        Job: Record Job;
        Usersetup: Record "User Setup";
        ReportSelection: Record "Report Selections";
        EstType: Integer;
        ServiceHeader: Record "Service Header";
        ServiceLine: Record "Service Line";
        ServiceLine2: Record "Service Line";
        ServiceItemLine: Record "Service Line";
        StoreReqLines: Record "Transfer Line";
        StoreReqHead: Record "Transfer Header";
        // NoSeriesMgt: Codeunit NoSeriesManagement;
        NoSeriesMgt: Codeunit "No. Series";
        TEXT001: Label 'Store Requistion Created for Job ';
        InvSetup: Record "Inventory Setup";
        NewNo: Code[20];
        LineNo: Integer;
        JobRec: Record Job;
        CreateJobOrder: Codeunit "Serv-Quote to Job (Yes/No)";
        JobTypeCode: Record "Job Type Code";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        ///  ApprovalMgt: Codeunit Codeunit439;
        TOTQty: Decimal;
        ApprovalsMgmt: Codeunit "Approval Mgmt. ExtCal";
        Jobcrtrec: Record Job;
        JobLstrec: Page 80032;
        ControlVisibility: Boolean;


    local procedure CustomerNoOnAfterValidate()
    begin
        IF Rec.GETFILTER("Customer No.") = xRec."Customer No." THEN
            IF Rec."Customer No." <> xRec."Customer No." THEN
                Rec.SETRANGE("Customer No.");
        CurrPage.UPDATE;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.UPDATE;
    end;

    local procedure PricesIncludingVATOnAfterValid()
    begin
        CurrPage.UPDATE;
    end;

    local procedure ShiptoCodeOnAfterValidate()
    begin
        CurrPage.UPDATE;
    end;

    procedure CheckControl()
    var
        UserSet: Record "User Setup";
    begin
        if UserSet.get(UserId) then begin
            if UserSet."ReOpen Service Quote" = false then
                ControlVisibility := false
            else
                ControlVisibility := true;
            //  Error('You are not allowed to perfom this action. Kindly contact the system administrator');
        end;
    end;


    local procedure OrderTimeOnAfterValidate()
    begin
        Rec.UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure OrderDateOnAfterValidate()
    begin
        Rec.UpdateResponseDateTime;
        CurrPage.UPDATE;
    end;

    local procedure FinishingTimeOnAfterValidate()
    begin
        CurrPage.UPDATE(TRUE);
    end;

    procedure UpdateJob()
    var
        Job: Record Job;
        JobTasks: Record "Job Task";
        ServiceLine: Record "Service Line";
        ServiceItemLine: Record "Service Item Line";
        JobPlanningLine: Record "Job Planning Line";
    begin
        ServiceItemLine.SETRANGE("Document No.", Rec."No.");
        IF ServiceItemLine.FINDSET THEN
            REPEAT
                JobTasks.INIT;
                JobTasks."Job No." := Rec."No.";
                JobTasks."Job Task No." := FORMAT(ServiceItemLine."Line No.");
                //JobTasks.Description := COPYSTR(ServiceItemLine."Fault Code" +' '+ ServiceItemLine.Description,1,50);
                JobTasks.Description := COPYSTR(Rec.Description + ' ' + Rec."Bill-to Name", 1, 50);
                JobTasks.INSERT(TRUE);

                ServiceLine.SETRANGE(ServiceLine."Document No.", Rec."No.");
                ServiceLine.SETRANGE(ServiceLine."Service Item Line No.", ServiceItemLine."Line No.");
                IF ServiceLine.FINDSET THEN
                    REPEAT
                        JobPlanningLine.INIT;
                        JobPlanningLine."Job No." := Rec."No.";
                        JobPlanningLine."Job Task No." := JobTasks."Job Task No.";
                        JobPlanningLine."Line No." := ServiceLine."Line No.";
                        JobPlanningLine.VALIDATE("Line Type", JobPlanningLine."Line Type"::"Both Budget and Billable");
                        JobPlanningLine.VALIDATE("Planning Date", TODAY);
                        IF ServiceLine.Type = ServiceLine.Type::" " THEN
                            JobPlanningLine.Type := JobPlanningLine.Type::Text
                        ELSE
                            IF ServiceLine.Type = ServiceLine.Type::Item THEN
                                JobPlanningLine.Type := JobPlanningLine.Type::Item
                            ELSE
                                IF ServiceLine.Type = ServiceLine.Type::Cost THEN
                                    JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account"
                                ELSE
                                    IF ServiceLine.Type = ServiceLine.Type::"G/L Account" THEN
                                        JobPlanningLine.Type := JobPlanningLine.Type::"G/L Account";
                        JobPlanningLine.VALIDATE("No.", ServiceLine."No.");
                        JobPlanningLine.VALIDATE(Quantity, ServiceLine.Quantity);
                        JobPlanningLine.VALIDATE(JobPlanningLine."Unit Price", ServiceLine."Unit Price");

                        JobPlanningLine.INSERT(TRUE);
                    UNTIL ServiceLine.NEXT = 0;

            UNTIL ServiceItemLine.NEXT = 0;
    end;
}

