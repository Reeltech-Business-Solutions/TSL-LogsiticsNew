page 80013 "Service Quote - Insurance"
{
    Caption = 'J-Service Quote - Insurance';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Service Header";

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
                        //    IF (xRec) THEN
                        //      CurrPage.UPDATE;
                    end;
                }
                field("Job Type"; Rec."Job Type")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Truck BreakDown No."; Rec."Truck BreakDown No.")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Editable = false;
                    Importance = Promoted;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        IF Rec.GETFILTER("Contact No.") = xRec."Contact No." THEN
                            IF Rec."Contact No." <> xRec."Contact No." THEN
                                Rec.SETRANGE("Contact No.");
                    end;
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    Importance = Promoted;
                    ApplicationArea = All;

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
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Notify Customer"; Rec."Notify Customer")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    NotBlank = true;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        // { User := USERID;
                        //Usersetup.GET(User);
                        //IF (Usersetup."Service Resp. Ctr. Filter") <> (xRec."Responsibility Center") THEN
                        //FIELDERROR("Responsibility Center");ApplicationArea = All;}
                    end;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;
                }
                field("Shortcut dimension 3"; Rec."Shortcut dimension 3")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Shortcut dimension 4"; Rec."Shortcut dimension 4")
                {
                    Caption = 'Vehicle Code';
                    ApplicationArea = All;
                }
                field("Expense Job"; Rec."Expense Job")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Assigned User ID"; Rec."Assigned User ID")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    Editable = false;
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
            part(ServItemLine; "Service Quote Subform")
            {
                Caption = 'Service Lines';
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
            part("Service Item Lines"; "Service Item Worksheet Subform")
            {
                Caption = 'Service Item Lines';
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Priority; Rec.Priority)
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Starting Time"; Rec."Starting Time")
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
                field("User ID"; Rec."User ID")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Fuel Level"; Rec."Fuel Level")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    ApplicationArea = All;
                }
                field("Response Date"; Rec."Response Date")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
                }
                field("Response Time"; Rec."Response Time")
                {
                    ApplicationArea = All;
                }
                field("Max. Labour Unit Price"; Rec."Max. Labor Unit Price")
                {
                    ApplicationArea = All;
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        PricesIncludingVATOnAfterValid;
                    end;
                }
                field("Chassis No."; Rec."Chassis No.")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Engine No."; Rec."Engine No.")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle Make"; Rec."Vehicle Make")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Vehicle Model"; Rec."Vehicle Model")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Business Type"; Rec."Business Type")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("NOVATRACK ID"; Rec."NOVATRACK ID")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        //  TempPerm.GET(USERID);
                        //IF (Type = Type::Item) AND (Type = Type::Resource) THEN
                        //IF TempPerm."Modify Service Line" = FALSE THEN
                        ERROR('you do not have permission to modify customer Type, contact the administrator');
                    end;
                }
                field("Customer Job Type"; Rec."Customer Job Type")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Job Type Code"; Rec."Job Type Code")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("KM Run"; Rec."KM Run")
                {
                    Caption = 'KM Run (DISCARDED )';
                    Editable = false;
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
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                Visible = false;
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
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
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    Importance = Promoted;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Ship-to Phone"; Rec."Ship-to Phone")
                {
                    Caption = 'Ship-to Phone/Phone 2';
                    ApplicationArea = All;
                }
                field("Ship-to Phone 2"; Rec."Ship-to Phone 2")
                {
                    Visible = false;
                    ApplicationArea = All;
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
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = All;
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Warning Status"; Rec."Warning Status")
                {
                    Importance = Promoted;
                    ApplicationArea = All;
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
            }
            group(" Foreign Trade")
            {
                Caption = ' Foreign Trade';
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = All;
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        //
                    end;
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = All;
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Phone No. 2"; Rec."Phone No. 2")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Store  Location"; Rec."Store  Location")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Store Requistion No"; Rec."Store Requistion No")
                {
                    Editable = false;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Store Req Shipped"; Rec."Store Req Shipped")
                {
                    ShowCaption = false;
                    ApplicationArea = All;
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
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Transaction Specification"; Rec."Transaction Specification")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Transport Method"; Rec."Transport Method")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Exit Point"; Rec."Exit Point")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Area"; Rec.Area)
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
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
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
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.ShowDocDim;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("Job Card")
                {
                    Caption = 'Job Card';
                    Image = Job;
                    //RunObject = Report Report50529;
                    ApplicationArea = All;
                }
                separator(Separator49)
                {
                }
                action("Co&mments")
                {
                    /*
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = CONST("Service Header"), "Table Subtype" = FIELD("Document Type"), "No." = FIELD("No."), Type = CONST(General);
                    */
                    ApplicationArea = All;
                }
                action("Service Job Card2")
                {
                    Caption = 'Service Job Card';
                    ApplicationArea = All;

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
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Rec.CalcInvDiscForHeader;
                        COMMIT;
                        PAGE.RUNMODAL(PAGE::"Service Statistics", Rec);
                    end;
                }
                action("Customer Card")
                {
                    Caption = 'Customer Card';
                    Image = Customer;
                    RunObject = Page "Customer Card";
                    RunPageLink = "No." = FIELD("Customer No.");
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                separator(Separator165)
                {
                    Caption = '';
                }
                action("Service Document Lo&g")
                {
                    Caption = 'Service Document Lo&g';
                    Image = Log;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ServDocLog: Record "Service Document Log";
                    begin
                        ServDocLog.ShowServDocLog(Rec);
                    end;
                }
                action(Job)
                {
                    Caption = 'Job';
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = "Report";
                    RunObject = Page "Job Card";
                    RunPageLink = "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action(Action1000000001)
                {
                    Caption = 'Job Card';
                    Promoted = true;
                    PromotedCategory = "Report";
                    // RunObject = Report Report59532;
                    ApplicationArea = All;
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
                    Caption = '&Create Customer';
                    Image = NewCustomer;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        CLEAR(ServOrderMgt);
                        ServOrderMgt.CreateNewCustomer(Rec);
                        CurrPage.UPDATE(TRUE);
                    end;
                }
                action("Service Job card")
                {
                    Caption = 'Service Job card';
                    ApplicationArea = All;

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
                    Caption = 'Gate Pass';
                    ApplicationArea = All;

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
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        Approvalentries: Page "Approval Entries";
                        WorkflowsEntriesBuffer: Record "Workflows Entries Buffer";
                        DocumentType: Enum "Approval Document Type";
                    begin

                        // WorkflowsEntriesBuffer.RunWorkflowEntriesPage(Rec.RecordId, DATABASE::"Service Header", Rec."Document Type".AsInteger(), Rec."No.");
                        Approvalentries.SetRecordFilters(5900, DocumentType, rec."No.");
                        Approvalentries.Run();
                    end;
                }
                action("Send A&pproval Request")
                {
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //Release the Imprest for Approval
                        //idada
                        // IF   ApprovalMgt.SendLEASEQApprovalRequest(Rec) THEN;  // ApprovalMgt.SendInterRequestApprovalRequest(Rec) THEN;

                        //IF ApprovalMgt.SendServiceApprovalRequest(Rec) THEN;
                    end;
                }
                action("Cancel Approval Re&quest")
                {
                    Caption = 'Cancel Approval Re&quest';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //idada
                        // IF ApprovalMgt.CancelLEASEQRequestApprovalRequest(Rec,TRUE,TRUE) THEN;

                        //IF ApprovalMgt.CancelServiceApprovalRequest(Rec, TRUE, TRUE) THEN;
                    end;
                }
                separator(Separator205)
                {
                }
            }
            action("Make &Order")
            {
                Caption = 'Make &Order';
                Image = MakeOrder;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;

                trigger OnAction()
                begin
                    Rec."User ID" := USERID;

                    //TESTFIELD("Customer Type");
                    Rec.TESTFIELD("Customer Job Type");
                    Rec.TESTFIELD("Job Type Code");
                    Rec.TESTFIELD("Location Code");
                    Rec.TESTFIELD("Assigned User ID");
                    Rec.TESTFIELD("Job Type");
                    Rec.TESTFIELD(Description);
                    Rec.TESTFIELD("Shortcut Dimension 1 Code");
                    Rec.TESTFIELD("Shortcut Dimension 2 Code");
                    Rec.TESTFIELD("Shortcut dimension 3");
                    Rec.TESTFIELD("KM Odometer Reading");
                    //TESTFIELD("Truck BreakDown No.");

                    IF Rec."Customer Type" = Rec."Customer Type"::"Lease Operation"
                    THEN BEGIN
                        Rec.TESTFIELD("Truck BreakDown No.");
                        Rec.TESTFIELD("Shortcut dimension 4");
                        //VALIDATE("Expense Job",TRUE);  //DD hold on
                    END;


                    //RELEASE WHN READY TO USE PREVENTIVE MAINTANACE
                    IF (Rec."Job Type" = Rec."Job Type"::"KM Service") OR (Rec."Job Type" = Rec."Job Type"::PrevMaint) THEN BEGIN
                        Rec.TESTFIELD("Curr. KM Service/PM Service");
                        Rec.TESTFIELD("KM Odometer Reading");
                        JobRec.RESET;
                        JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", Rec."Registration No.");
                        ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order);
                        JobRec.SETFILTER(JobRec."Job Type", '%1|%2', Rec."Job Type"::"KM Service", Rec."Job Type"::PrevMaint);
                        ///JobRec.SETFILTER(JobRec."Creation Date",'>%1',040116D);
                        JobRec.CALCFIELDS(JobRec."Invoice Exist", JobRec."WIP Amount");
                        //JobRec.SETFILTER(JobRec."WIP Amount",'<>%1',0);
                        JobRec.SETRANGE(JobRec."Invoice Exist", FALSE);
                        IF JobRec.FIND('-') THEN
                            ERROR('There are still some pending PM-job Cards for Truck: %1, yet to be invoiced. Check Job No.: %2; created: %3 at %4 KM Service. Contact your adminsitator.',
                            JobRec."Vehicle Registr. Plate No", JobRec."No.", JobRec."Creation Date", JobRec."KM Odometer Reading");

                    END ELSE BEGIN
                        Rec.TESTFIELD("KM Odometer Reading");
                        JobRec.RESET;
                        JobRec.SETRANGE(JobRec."Vehicle Registr. Plate No", Rec."Registration No.");
                        ////JobRec.SETFILTER(JobRec.Status, '%1', JobRec.Status::Order);
                        //JobRec.SETFILTER(JobRec."Job Type",'%1',"Job Type"::Repair);
                        JobRec.SETFILTER(JobRec."Job Type", '<>%1|<>%2', Rec."Job Type"::"KM Service", Rec."Job Type"::PrevMaint);
                        ///JobRec.SETFILTER(JobRec."Creation Date",'>%1',040116D);
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
                            ServiceLine.CALCFIELDS(ServiceLine."Quantity Issued");   //DDada
                            IF ServiceLine."Service Item No." = '' THEN
                                ERROR('PLEASE ENTER SERVICE ITEM FOR ALL LINES');

                            IF ServiceLine."Quantity Issued" <> 0 THEN
                                ERROR('PLEASE Return Items : %1 back to the Store. Then you can proceeed to finish this job on the New Job Module..', ServiceLine."No.");



                            IF Rec."Customer Job Type" = 'INTERNAL' THEN BEGIN
                                IF (ServiceLine.Type = ServiceLine.Type::Item) AND (ServiceLine."Unit Price" > 0) THEN
                                    ERROR(' You need to make line with item no : %1 at Zero Price for INTERNAL JOBS', ServiceLine."No.");
                            END;


                            //////USed to check Default qty for battery and Tyres   ddada04132020
                            IF (ServiceLine."Gen. Prod. Posting Group" = 'TYRE') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 8 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine."Reason For Approval" := ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty";
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You can not collect more than 8 tires in a year \You have collected %1 Already + current qty %2 = %3 Tyres \You have excedded Default Qty , please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                    //ServiceLine."Reason For Approval" := 2;
                                    //ServiceLine."BLocking Notification" :=TRUE;
                                END;
                            END;

                            IF (ServiceLine."Gen. Prod. Posting Group" = 'BATTERY') AND (NOT ServiceLine."Allow Approved Usage") THEN BEGIN

                                TOTQty := ServiceLine."Quantity CONSM Per Year" + ServiceLine.Quantity;
                                IF TOTQty > 2 THEN BEGIN
                                    ServiceLine.TESTFIELD(ServiceLine."Approve/Reject", 0);
                                    ServiceLine."Reason For Approval" := ServiceLine."Reason For Approval"::"SparePart Issued + Qty Requesting is More than Yearly Def. Qty";
                                    ServiceLine."BLocking Notification" := TRUE;
                                    ERROR('You can not collect more than 2 Battery in a year \You have collected %1 Already + current qty %2. =%3 Batteries \You have excedded Default Qty, \please contact your Head Of Operations'
                                    , ServiceLine."Quantity CONSM Per Year", ServiceLine.Quantity, TOTQty);
                                    //ServiceLine."Reason For Approval" := 2;
                                    //ServiceLine."BLocking Notification" :=TRUE;
                                    // VALIDATE(Quantity,0);
                                END;
                            END;
                        //////USed to check Default qty for battery and Tyres   ddada04132020

                        UNTIL ServiceLine.NEXT = 0;




                    CurrPage.UPDATE;
                    CreateJobOrder.RUN(Rec);
                    //CurrPage.UPDATE;
                end;
            }
            action("&Print")
            {
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                var
                    DocPrint: Codeunit "Document-Print";
                    ShowRequestForm: Boolean;
                begin
                    ServiceLine.RESET;
                    ServiceLine.SETRANGE("Document Type", Rec."Document Type");
                    ServiceLine.SETRANGE("Document No.", Rec."No.");
                    IF ServiceLine.FIND('-') THEN
                        REPEAT
                            ServiceLine.CALCFIELDS(ServiceLine."Quantity Issued");   //DDada
                            IF ServiceLine."Service Item No." = '' THEN
                                ERROR('PLEASE ENTER SERVICE ITEM FOR ALL LINES');

                            IF ServiceLine."Quantity Issued" <> 0 THEN
                                ERROR('PLEASE Return Items : %1 back to the Store. Then you can proceeed to finish this job on the New Job Module..', ServiceLine."Quantity Issued");



                            IF Rec."Customer Job Type" = 'INTERNAL' THEN BEGIN
                                IF (ServiceLine.Type = ServiceLine.Type::Item) AND (ServiceLine."Unit Price" > 0) THEN
                                    ERROR(' You need to make line with item no : %1 at Zero price for INTERNAL JOBS', ServiceLine."No.");
                            END;


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
                    REPORT.RUN(50530, TRUE, TRUE, Rec);
                    Rec.RESET;
                end;
            }
            action(Action1000000006)
            {
                Caption = 'Job Card';
                Promoted = true;
                PromotedCategory = "Report";
                // RunObject = Report Report59532;
                ApplicationArea = all;
            }
        }
    }

    trigger OnClosePage()
    begin
        //TESTFIELD("Location Code");
        //TESTFIELD("Assigned User ID");
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."Document Type"::Quote;
        Rec."Responsibility Center" := UserMgt.GetPurchasesFilter;
        //"Customer Type" := "Customer Type"::Internal;
        Rec."Customer Job Type" := 'INTERNAL';
        Rec."User ID" := USERID;
    end;

    trigger OnOpenPage()
    begin
        /*IF UserMgt.GetPurchasesFilter <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center",UserMgt.GetPurchasesFilter);
          FILTERGROUP(0);
        END;
        //"Customer Type" := "Customer Type"::Internal;
        */

    end;

    var
        UserMgt: Codeunit "User Setup Management";
        ChangeExchangeRate: Page "Change Exchange Rate";
        ServOrderMgt: Codeunit ServOrderManagement;
        CreateServiceOrder: Codeunit "Serv-Quote to Order (Yes/No)";
        User: Code[50];
        Usersetup: Record "User Setup";
        ReportSelection: Record "Report Selections";
        EstType: Integer;
        ServiceHeader: Record "Service Header";
        //TempPerm: Record Table39006162;
        JobRec: Record Job;
        CreateJobOrder: Codeunit "Serv-Quote to Job (Yes/No)";
        ServiceLine: Record "Service Line";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None","Payment Voucher","Petty Cash",Imprest,Requisition;
        ApprovalEntries: Page "Approval Entries";
        //ApprovalMgt: Codeunit Codeunit439;
        TOTQty: Decimal;

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
}

