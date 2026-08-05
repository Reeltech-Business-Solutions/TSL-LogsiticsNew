page 80059 "Sales Invoice - JOB"
{
    // Caption = 'Sales Invoice';
    // PageType = Document;
    // RefreshOnActivate = true;
    // SourceTable = "Sales Header";
    // SourceTableView = WHERE("Document Type" = FILTER(Invoice));//, "Job No." = FILTER(<> ''));

    // layout
    // {
    //     area(content)
    //     {
    //         group(General)
    //         {
    //             Caption = 'General';
    //             field("No."; "No.")
    //             {
    //                 Editable = false;
    //                 Importance = Promoted;

    //                 trigger OnAssistEdit()
    //                 begin
    //                     IF AssistEdit(xRec) THEN
    //                         CurrPage.UPDATE;
    //                 end;
    //             }
    //             field("Sell-to Customer No."; "Sell-to Customer No.")
    //             {
    //                 Importance = Promoted;

    //                 trigger OnValidate()
    //                 begin
    //                     SelltoCustomerNoOnAfterValidat;
    //                 end;
    //             }
    //             field("Sell-to Contact No."; "Sell-to Contact No.")
    //             {

    //                 trigger OnValidate()
    //                 begin
    //                     IF GETFILTER("Sell-to Contact No.") = xRec."Sell-to Contact No." THEN
    //                         IF "Sell-to Contact No." <> xRec."Sell-to Contact No." THEN
    //                             SETRANGE("Sell-to Contact No.");
    //                 end;
    //             }
    //             field("Sell-to Customer Name"; "Sell-to Customer Name")
    //             {
    //                 Visible = false;
    //             }
    //             field("Sell-to Address"; "Sell-to Address")
    //             {
    //                 Importance = Additional;
    //                 Visible = false;
    //             }
    //             field("Sell-to Address 2"; "Sell-to Address 2")
    //             {
    //                 Importance = Additional;
    //                 Visible = false;
    //             }
    //             field("Bill-to Customer No."; "Bill-to Customer No.")
    //             {
    //                 Importance = Promoted;

    //                 trigger OnValidate()
    //                 begin
    //                     BilltoCustomerNoOnAfterValidat;
    //                 end;
    //             }
    //             field("Bill-to Contact No."; "Bill-to Contact No.")
    //             {
    //             }
    //             field("Bill-to Name"; "Bill-to Name")
    //             {
    //             }
    //             field("Bill-to Address"; "Bill-to Address")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Posting Description"; "Posting Description")
    //             {
    //             }
    //             field("Customer Price Group"; "Customer Price Group")
    //             {
    //             }
    //             field("Posting Date"; "Posting Date")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Document Date"; "Document Date")
    //             {
    //             }
    //             /* field("Customer Job Type";"Customer Job Type")
    //             {
    //                 ShowCaption = false;
    //             } */
    //             /* field("Job Type Code";"Job Type Code")
    //             {
    //                 ShowCaption = false;
    //             } */
    //             field("External Document No."; "External Document No.")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Campaign No."; "Campaign No.")
    //             {
    //                 Importance = Additional;
    //                 Visible = false;
    //             }
    //             field("Responsibility Center"; "Responsibility Center")
    //             {
    //                 Importance = Standard;
    //             }
    //             field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
    //             {

    //                 trigger OnValidate()
    //                 begin
    //                     ShortcutDimension1CodeOnAfterV;
    //                 end;
    //             }
    //             field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
    //             {

    //                 trigger OnValidate()
    //                 begin
    //                     ShortcutDimension2CodeOnAfterV;
    //                 end;
    //             }
    //             /* field("Shortcut Dimension 3 Code";"Shortcut Dimension 3 Code")
    //             {
    //                 ShowCaption = false;
    //             } */
    //             /* field("Shortcut Dimension 4 Code";"Shortcut Dimension 4 Code")
    //             {
    //                 ShowCaption = false;
    //             } */
    //             /* field("Shortcut Dimension 5 Code";"Shortcut Dimension 5 Code")
    //             {
    //                 ShowCaption = false;
    //             } */
    //             field("Assigned User ID"; "Assigned User ID")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Job Queue Status"; "Job Queue Status")
    //             {
    //                 Importance = Additional;
    //                 Visible = false;
    //             }
    //             field("VAT Bus. Posting Group"; "VAT Bus. Posting Group")
    //             {
    //             }
    //             field(Status; Status)
    //             {
    //                 Editable = false;
    //                 Importance = Promoted;
    //             }
    //         }
    //         /*  part(SalesLines;50395)
    //          {
    //              Editable = false;
    //              SubPageLink = "Document No."=FIELD("No.");
    //          } */
    //         group(JOBS)
    //         {
    //             Caption = 'JOBS';
    //             /* field("Job No.";"Job No.")
    //             {
    //                 ShowCaption = false;
    //                 Visible = false;
    //             } */
    //             /*  field("Cost Amount";"Cost Amount")
    //              {
    //                  ShowCaption = false;
    //                  Style = Attention;
    //                  StyleExpr = TRUE;
    //              } */
    //             field("Amount Including VAT"; "Amount Including VAT")
    //             {
    //             }
    //             /* field("Quotation Cost Amount";"Quotation Cost Amount")
    //             {
    //                 ShowCaption = false;
    //             }
    //             field("Quotation Price  Amount";"Quotation Price  Amount")
    //             {
    //                 ShowCaption = false;
    //             } */
    //         }
    //         group(Invoicing)
    //         {
    //             Caption = 'Invoicing';
    //             Visible = false;
    //             field("Prices Including VAT"; "Prices Including VAT")
    //             {

    //                 trigger OnValidate()
    //                 begin
    //                     PricesIncludingVATOnAfterValid;
    //                 end;
    //             }
    //             field("Due Date"; "Due Date")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Payment Discount %"; "Payment Discount %")
    //             {
    //             }
    //             field("Pmt. Discount Date"; "Pmt. Discount Date")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Payment Terms Code"; "Payment Terms Code")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Payment Method Code"; "Payment Method Code")
    //             {
    //             }
    //         }
    //         group("Foreign Trade")
    //         {
    //             Caption = 'Foreign Trade';
    //             Visible = false;
    //             field("Ship-to Code"; "Ship-to Code")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Ship-to Name"; "Ship-to Name")
    //             {
    //             }
    //             field("Ship-to Address"; "Ship-to Address")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Incoming Document Entry No."; "Incoming Document Entry No.")
    //             {
    //                 Visible = false;
    //             }
    //             field("Sell-to Post Code"; "Sell-to Post Code")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Sell-to City"; "Sell-to City")
    //             {
    //             }
    //             field("Sell-to Contact"; "Sell-to Contact")
    //             {
    //             }
    //             field("Bill-to Address 2"; "Bill-to Address 2")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Bill-to Post Code"; "Bill-to Post Code")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Bill-to City"; "Bill-to City")
    //             {
    //             }
    //             field("Bill-to Contact"; "Bill-to Contact")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Direct Debit Mandate ID"; "Direct Debit Mandate ID")
    //             {
    //             }
    //             /*  field("Credit Card No.";"Credit Card No.")
    //              {
    //                  ShowCaption = false;
    //              }
    //              field(GetCreditcardNumber;GetCreditcardNumber)
    //              {
    //                  Caption = 'Cr. Card Number (Last 4 Digits)';
    //              } */
    //             field("Ship-to Address 2"; "Ship-to Address 2")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Ship-to Post Code"; "Ship-to Post Code")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Ship-to City"; "Ship-to City")
    //             {
    //             }
    //             field("Ship-to Contact"; "Ship-to Contact")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Location Code"; "Location Code")
    //             {
    //             }
    //             field("Shipment Method Code"; "Shipment Method Code")
    //             {
    //             }
    //             field("Shipping Agent Code"; "Shipping Agent Code")
    //             {
    //             }
    //             field("Package Tracking No."; "Package Tracking No.")
    //             {
    //                 Importance = Additional;
    //             }
    //             field("Shipment Date"; "Shipment Date")
    //             {
    //                 Importance = Promoted;
    //             }
    //             field("Currency Code"; "Currency Code")
    //             {
    //                 Importance = Promoted;

    //                 trigger OnAssistEdit()
    //                 var
    //                     ChangeExchangeRate: Page 511;
    //                 begin
    //                     CLEAR(ChangeExchangeRate);
    //                     IF "Posting Date" <> 0D THEN
    //                         ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", "Posting Date")
    //                     ELSE
    //                         ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WORKDATE);
    //                     IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
    //                         VALIDATE("Currency Factor", ChangeExchangeRate.GetParameter);
    //                         CurrPage.UPDATE;
    //                     END;
    //                     CLEAR(ChangeExchangeRate);
    //                 end;
    //             }
    //             field("EU 3-Party Trade"; "EU 3-Party Trade")
    //             {
    //             }
    //             field("Transaction Type"; "Transaction Type")
    //             {
    //             }
    //             field("Transaction Specification"; "Transaction Specification")
    //             {
    //             }
    //             field("Transport Method"; "Transport Method")
    //             {
    //             }
    //             field("Exit Point"; "Exit Point")
    //             {
    //             }
    //             field("Area"; Area)
    //             {
    //             }
    //         }
    //     }
    //     area(factboxes)
    //     {
    //         part(Control1903720907; "Sales Hist. Sell-to FactBox")
    //         {
    //             SubPageLink = "No." = FIELD("Sell-to Customer No.");
    //             Visible = false;
    //         }
    //         part(Control1907234507; "Sales Hist. Bill-to FactBox")
    //         {
    //             SubPageLink = "No." = FIELD("Bill-to Customer No.");
    //             Visible = false;
    //         }
    //         part(Control1902018507; "Customer Statistics FactBox")
    //         {
    //             SubPageLink = "No." = FIELD("Bill-to Customer No.");
    //             Visible = true;
    //         }
    //         part(Control1900316107; "Customer Details FactBox")
    //         {
    //             SubPageLink = "No." = FIELD("Sell-to Customer No.");
    //             Visible = true;
    //         }
    //         /*  part(Control1906127307;"Sales Line FactBox")
    //          {
    //              Provider = SalesLines;
    //              SubPageLink = "Document Type"=FIELD("Document Type"), "Document No."=FIELD("Document No."), "Line No."=FIELD("Line No.");
    //              Visible = false;
    //          } */
    //         part(Control1901314507; "Item Invoicing FactBox")
    //         {
    //             // Provider = SalesLines;
    //             SubPageLink = "No." = FIELD("No.");
    //             Visible = true;
    //         }
    //         part(Control1906354007; "Approval FactBox")
    //         {
    //             SubPageLink = "Table ID" = CONST(36), "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
    //             Visible = false;
    //         }
    //         part(Control1907012907; "Resource Details FactBox")
    //         {
    //             // Provider = SalesLines;
    //             SubPageLink = "No." = FIELD("No.");
    //             Visible = false;
    //         }
    //         systempart(Control1900383207; Links)
    //         {
    //             Visible = false;
    //         }
    //         systempart(Control1905767507; Notes)
    //         {
    //             Visible = true;
    //         }
    //     }
    // }

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("&Invoice")
    //         {
    //             Caption = '&Invoice';
    //             Image = Invoice;
    //             action(Statistics)
    //             {
    //                 Caption = 'Statistics';
    //                 Image = Statistics;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ShortCutKey = 'F7';

    //                 trigger OnAction()
    //                 begin
    //                     CalcInvDiscForHeader;
    //                     COMMIT;
    //                     PAGE.RUNMODAL(PAGE::"Sales Statistics", Rec);
    //                 end;
    //             }
    //             action(Dimensions)
    //             {
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 ShortCutKey = 'Shift+Ctrl+D';

    //                 trigger OnAction()
    //                 begin
    //                     ShowDocDim;
    //                     CurrPage.SAVERECORD;
    //                 end;
    //             }
    //             action(Customer)
    //             {
    //                 Caption = 'Customer';
    //                 Image = Customer;
    //                 /*  RunObject = Page "Customer Card";
    //                                  RunPageLink = "No."=FIELD("Sell-to Customer No."); */
    //                 ShortCutKey = 'Shift+F7';
    //                 Visible = false;
    //             }
    //             action("Co&mments")
    //             {
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 RunObject = Page "Sales Comment Sheet";
    //                 RunPageLink = "Document Type" = FIELD("Document Type"), "No." = FIELD("No."), "Document Line No." = CONST(0);
    //             }
    //             action(Quotation)
    //             {
    //                 Caption = 'Quotation';
    //                 Image = Quote;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ///  RunObject = Page Page39006249;
    //                 ///  RunPageLink = No.=FIELD(Job No.);
    //             }
    //             action("Issue Entries")
    //             {
    //                 Caption = 'Issue Entries';
    //                 Image = Quote;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ///  RunObject = Page Page50375;
    //                 ///             RunPageLink = Job No.=FIELD(Job No.), Entry Type=FILTER(Issue);
    //             }
    //             action("Return Entries")
    //             {
    //                 Caption = 'Return Entries';
    //                 Image = Quote;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 /// RunObject = Page Page50375;
    //                 ///              RunPageLink = Job No.=FIELD(Job No.), Entry Type=FILTER(Return);
    //             }
    //             separator(Separator171)
    //             {
    //             }
    //         }
    //         group("Credit Card")
    //         {
    //             Caption = 'Credit Card';
    //             Image = CreditCardLog;
    //             Visible = false;
    //             action("Credit Cards Transaction Lo&g Entries")
    //             {
    //                 Caption = 'Credit Cards Transaction Lo&g Entries';
    //                 Image = CreditCardLog;
    //                 /// RunObject = Page Page829;
    //                 ///              RunPageLink = Document Type=FIELD(Document Type), Document No.=FIELD(No.), Customer No.=FIELD(Bill-to Customer No.);
    //             }
    //         }
    //     }
    //     area(processing)
    //     {
    //         group(ActionGroup9)
    //         {
    //             Caption = 'Release';
    //             Image = ReleaseDoc;
    //             Visible = false;
    //             action(Release)
    //             {
    //                 Caption = 'Re&lease';
    //                 Image = ReleaseDoc;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ShortCutKey = 'Ctrl+F9';

    //                 trigger OnAction()
    //                 var
    //                     ReleaseSalesDoc: Codeunit "Release Sales Document";
    //                 begin
    //                     ReleaseSalesDoc.PerformManualRelease(Rec);
    //                 end;
    //             }
    //             action("Re&open")
    //             {
    //                 Caption = 'Re&open';
    //                 Image = ReOpen;

    //                 trigger OnAction()
    //                 var
    //                     ReleaseSalesDoc: Codeunit "Release Sales Document";
    //                 begin
    //                     ReleaseSalesDoc.PerformManualReopen(Rec);
    //                 end;
    //             }
    //             separator(Separator168)
    //             {
    //             }
    //         }
    //         group("F&unctions")
    //         {
    //             Caption = 'F&unctions';
    //             Image = "Action";
    //             action("Calculate &Invoice Discount")
    //             {
    //                 Caption = 'Calculate &Invoice Discount';
    //                 Image = CalculateInvoiceDiscount;

    //                 trigger OnAction()
    //                 begin
    //                     ApproveCalcInvDisc;
    //                 end;
    //             }
    //             separator(Separator141)
    //             {
    //             }
    //             action(Approvals)
    //             {
    //                 Caption = 'Approvals';
    //                 Image = Approvals;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalEntries: Page 658;
    //                 begin
    //                     ApprovalEntries.Setfilters(DATABASE::"Sales Header", "Document Type", "No.");
    //                     ApprovalEntries.RUN;
    //                 end;
    //             }
    //             action("Send A&pproval Request")
    //             {
    //                 Caption = 'Send A&pproval Request';
    //                 Image = SendApprovalRequest;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalMgt: Codeunit 1535;
    //                 begin
    //                     //DDADA

    //                     TESTFIELD("Shortcut Dimension 1 Code");
    //                     TESTFIELD("Shortcut Dimension 2 Code");

    //                     ///  IF "Customer Job Type" = 'LEASE OPERATION' THEN
    //                     BEGIN
    //                         ///  TESTFIELD("Shortcut Dimension 4 Code");
    //                     END;

    //                     //DDADA


    //                     /// IF ApprovalMgt.SendSalesApprovalRequest(Rec) THEN;
    //                 end;
    //             }
    //             action("Cancel Approval Re&quest")
    //             {
    //                 Caption = 'Cancel Approval Re&quest';
    //                 Image = Cancel;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 var
    //                     ApprovalMgt: Codeunit 1535;
    //                 begin
    //                     /// IF ApprovalMgt.CancelSalesApprovalRequest(Rec,TRUE,TRUE) THEN;
    //                 end;
    //             }
    //             separator(Separator161)
    //             {
    //             }
    //         }
    //         group(ActionGroup11)
    //         {
    //             Caption = 'Credit Card';
    //             Image = AuthorizeCreditCard;
    //             Visible = false;
    //             separator(Separator142)
    //             {
    //             }
    //             action("Get St&d. Cust. Sales Codes")
    //             {
    //                 Caption = 'Get St&d. Cust. Sales Codes';
    //                 Ellipsis = true;
    //                 Image = CustomerCode;

    //                 trigger OnAction()
    //                 var
    //                     StdCustSalesCode: Record "Standard Customer Sales Code";
    //                 begin
    //                     StdCustSalesCode.InsertSalesLines(Rec);
    //                 end;
    //             }
    //             separator(Separator139)
    //             {
    //             }
    //             action("Copy Document")
    //             {
    //                 Caption = 'Copy Document';
    //                 Ellipsis = true;
    //                 Image = CopyDocument;
    //                 Promoted = true;
    //                 PromotedCategory = Process;

    //                 trigger OnAction()
    //                 var
    //                     CopySalesDoc: Report "Copy Sales Document";
    //                 begin
    //                     CopySalesDoc.SetSalesHeader(Rec);
    //                     CopySalesDoc.RUNMODAL;
    //                     CLEAR(CopySalesDoc);
    //                 end;
    //             }
    //             action("Move Negative Lines")
    //             {
    //                 Caption = 'Move Negative Lines';
    //                 Ellipsis = true;
    //                 Image = MoveNegativeLines;

    //                 trigger OnAction()
    //                 var
    //                     MoveNegSalesLines: Report "Move Negative Sales Lines";
    //                 begin
    //                     CLEAR(MoveNegSalesLines);
    //                     MoveNegSalesLines.SetSalesHeader(Rec);
    //                     MoveNegSalesLines.RUNMODAL;
    //                     MoveNegSalesLines.ShowDocument;
    //                 end;
    //             }
    //             action(Authorize)
    //             {
    //                 Caption = 'Authorize';
    //                 Image = AuthorizeCreditCard;

    //                 trigger OnAction()
    //                 begin
    //                     /// Authorize;
    //                 end;
    //             }
    //             action("Void A&uthorize")
    //             {
    //                 Caption = 'Void A&uthorize';
    //                 Image = VoidCreditCard;

    //                 trigger OnAction()
    //                 begin
    //                     /// Void;
    //                 end;
    //             }
    //         }
    //         group("P&osting")
    //         {
    //             Caption = 'P&osting';
    //             Image = Post;
    //             action(Post)
    //             {
    //                 Caption = 'P&ost';
    //                 Image = PostOrder;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'F9';

    //                 trigger OnAction()
    //                 begin
    //                     //DDada
    //                     StoreReqLine.SETRANGE(StoreReqLine."Document Type", "Document Type");
    //                     StoreReqLine.SETRANGE(StoreReqLine."Document No.", "No.");
    //                     ///StoreReqLine.SETRANGE(StoreReqLine."Customer Job Type",'INTERNAL');
    //                     IF StoreReqLine.FIND('-') THEN BEGIN
    //                         REPEAT
    //                             IF (StoreReqLine.Type = StoreReqLine.Type::Item) AND (StoreReqLine."Unit Price" > 0) THEN
    //                                 ERROR(' You need to make line with item no : %1 at Zero price for INTERNAL JOBS, Delete Invoice and Adjust from the planning Lines', StoreReqLine."No.");
    //                         UNTIL StoreReqLine.NEXT = 0;
    //                     END;
    //                     /*
    //                                             PStoreIssueHead.SETRANGE(PStoreIssueHead."Job No.", "No.");
    //                                             IF PStoreIssueHead.FIND('-') THEN BEGIN
    //                                                 REPEAT
    //                                                     IF PStoreIssueHead."Request Date" > "Posting Date" THEN
    //                                                         ERROR('You cannot post the Job-sales Invoice, Your Job-Sales Invoice Posting Date must be after Issue Date:%1', PStoreIssueHead."Request Date");
    //                                                 UNTIL PStoreIssueHead.NEXT = 0;
    //                                             END;
    //                     */ //Dennis
    //                        /*
    //                        //USED TO STOP HAVING MORE THAN ONE OPEN SERVICE APP SCHEDULE OPENED FOR A TRUCK AT THE SAME TIME  //ddada
    //                        ServAppSchRec.RESET;
    //                        ServAppSchRec.SETRANGE(ServAppSchRec."Service Item","External Document No.");
    //                        ServAppSchRec.SETRANGE(VehicleReg."Job Type",VehicleReg."Job Type"::PrevMaint);
    //                        //VehicleReg.SETRANGE(VehicleReg."Curr. KM Service/PM Service","Curr. KM Service/PM Service");
    //                        IF VehicleReg.FIND('-') THEN
    //                         */


    //                     SalesLine.RESET;                                                        //11112020 DDADA to stop posting without Cost Amount
    //                     SalesLine.SETRANGE(SalesLine."Document Type", "Document Type");
    //                     SalesLine.SETRANGE(SalesLine."Document No.", "No.");
    //                     //SalesLine.SETFILTER(SalesLine."Job No.",'<>%1','');
    //                     //SalesLine.SETFILTER(Type,'%1',SalesLine.Type::Item);
    //                     IF SalesLine.FINDSET THEN BEGIN
    //                         REPEAT
    //                             IF SalesLine."Unit Cost (LCY)" <> 0 THEN;
    //                         /// SalesLine.TESTFIELD(SalesLine."Cost Amount")
    //                         /* SalesLine.MODIFY;*/
    //                         UNTIL SalesLine.NEXT = 0;
    //                     END;                                                                 //11112020 DDADA to stop posting without Cost Amount







    //                     //DDada

    //                     Post(CODEUNIT::"Sales-Post (Yes/No)");

    //                 end;
    //             }
    //             action("Test Report")
    //             {
    //                 Caption = 'Test Report';
    //                 Ellipsis = true;
    //                 Image = TestReport;
    //                 Promoted = true;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 var
    //                     ReportPrint: Codeunit "Test Report-Print";
    //                 begin
    //                     //TESTFIELD("Salesperson Code");
    //                     ReportPrint.PrintSalesHeader(Rec);
    //                 end;
    //             }
    //             action("Post and &Print")
    //             {
    //                 Caption = 'Post and &Print';
    //                 Image = PostPrint;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ShortCutKey = 'Shift+F9';

    //                 trigger OnAction()
    //                 begin
    //                     SETRANGE("Document Type", "Document Type");
    //                     SETRANGE("No.", "No.");
    //                     SETRANGE("Sell-to Customer No.", "Sell-to Customer No.");
    //                     /// //REPORT.RUNMODAL(REPORT::"Workshop Sales - Invoice 2",TRUE,FALSE,Rec);
    //                     SETRANGE("No.");


    //                     SalesLine.RESET;                                                        //11112020 DDADA to stop posting without Cost Amount
    //                     SalesLine.SETRANGE(SalesLine."Document Type", "Document Type");
    //                     SalesLine.SETRANGE(SalesLine."Document No.", "No.");
    //                     //SalesLine.SETFILTER(SalesLine."Job No.",'<>%1','');
    //                     //SalesLine.SETFILTER(Type,'%1',SalesLine.Type::Item);
    //                     IF SalesLine.FINDSET THEN BEGIN
    //                         REPEAT
    //                             IF SalesLine."Unit Cost (LCY)" <> 0 THEN;
    //                         ///  SalesLine.TESTFIELD(SalesLine."Cost Amount")
    //                         /* SalesLine.MODIFY;*/
    //                         UNTIL SalesLine.NEXT = 0;
    //                     END;                                                                //11112020 DDADA to stop posting without Cost Amount





    //                     Post(CODEUNIT::"Sales-Post + Print");

    //                 end;
    //             }
    //             action("Post &Batch")
    //             {
    //                 Caption = 'Post &Batch';
    //                 Ellipsis = true;
    //                 Image = PostBatch;
    //                 Visible = false;

    //                 trigger OnAction()
    //                 begin
    //                     //REPORT.RUNMODAL(REPORT::"Batch Post Sales Invoices", TRUE, TRUE, Rec);
    //                     CurrPage.UPDATE(FALSE);
    //                 end;
    //             }
    //             action("Remove From Job Queue")
    //             {
    //                 Caption = 'Remove From Job Queue';
    //                 Enabled = false;
    //                 Image = RemoveLine;
    //                 Visible = JobQueueVisible;

    //                 trigger OnAction()
    //                 begin
    //                     CancelBackgroundPosting;
    //                 end;
    //             }
    //             action("Pre Invoice")
    //             {
    //                 Image = print;
    //                 Promoted = true;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     RESET;
    //                     SETFILTER("No.", "No.");
    //                     REPORT.RUN(50268, TRUE, TRUE, Rec);
    //                     RESET;
    //                 end;
    //             }
    //             action("JOB Invoice")
    //             {
    //                 Image = print;
    //                 Promoted = true;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     RESET;
    //                     SETFILTER("No.", "No.");
    //                     REPORT.RUN(50253, TRUE, TRUE, Rec);
    //                     RESET;
    //                 end;
    //             }
    //             action("Workshop Invoice")
    //             {
    //                 Caption = 'Workshop Invoice';
    //                 Image = Print;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;

    //                 trigger OnAction()
    //                 begin
    //                     //CurrPage.SETSELECTIONFILTER(SaleHeader);
    //                     //SaleHeader.PrintRecords(TRUE);
    //                 end;
    //             }
    //         }
    //     }
    // }

    // trigger OnAfterGetRecord()
    // begin
    //     JobQueueVisible := "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting";
    // end;

    // trigger OnDeleteRecord(): Boolean
    // begin
    //     CurrPage.SAVERECORD;
    //     EXIT(ConfirmDeletion);
    // end;

    // trigger OnInit()
    // begin
    //     //
    // end;

    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     "Responsibility Center" := UserMgt.GetSalesFilter;
    // end;

    // trigger OnNextRecord(Steps: Integer): Integer
    // begin
    //     /*IF (Status = Status:: "pending pre") OR (Status = Status:: "Pending Approval") THEN
    //       CurrPage.EDITABLE:=FALSE;
    //     //idada
    //      */

    // end;

    // trigger OnOpenPage()
    // begin
    //     IF UserMgt.GetSalesFilter <> '' THEN BEGIN
    //         FILTERGROUP(2);
    //         SETRANGE("Responsibility Center", UserMgt.GetSalesFilter);
    //         FILTERGROUP(0);
    //     END;
    // end;

    // var
    //     ChangeExchangeRate: Page "Change Exchange Rate";
    //     CopySalesDoc: Report "Copy Sales Document";
    //     MoveNegSalesLines: Report "Move Negative Sales Lines";
    //     ReportPrint: Codeunit "Test Report-Print";
    //     UserMgt: Codeunit "User Setup Management";
    //     [InDataSet]

    //     JobQueueVisible: Boolean;
    //     ////  TempPerm: Record Table39006162;
    //     StoreReqLine: Record "Sales Line";
    //     JobUsage: Code[20];
    //     SalesQuote: Code[20];
    //     SaleHeader: Record "Sales Header";
    //     //PStoreIssueHead: Record "Posted Store Issue Header";
    //     //PStoreIssueLine: Record "Posted Store Issue Line";
    //     //// ServAppSchRec: Record Table50070;
    //     PurchLine: Record "Purchase Line";
    //     SalesLines: Record "Sales Line";
    //     SalesLine: Record "Sales Line";

    // local procedure Post(PostingCodeunitID: Integer)
    // begin
    //     SendToPosting(PostingCodeunitID);
    //     IF "Job Queue Status" = "Job Queue Status"::"Scheduled for Posting" THEN
    //         CurrPage.CLOSE;
    //     CurrPage.UPDATE(FALSE);
    // end;

    // local procedure ApproveCalcInvDisc()
    // begin
    //     CurrPage.SalesLines.PAGE.ApproveCalcInvDisc;
    // end;

    // local procedure SelltoCustomerNoOnAfterValidat()
    // begin
    //     IF GETFILTER("Sell-to Customer No.") = xRec."Sell-to Customer No." THEN
    //         IF "Sell-to Customer No." <> xRec."Sell-to Customer No." THEN
    //             SETRANGE("Sell-to Customer No.");
    //     CurrPage.UPDATE;
    // end;

    // local procedure SalespersonCodeOnAfterValidate()
    // begin
    //     CurrPage.SalesLines.PAGE.UpdateForm(TRUE);
    // end;

    // local procedure BilltoCustomerNoOnAfterValidat()
    // begin
    //     CurrPage.UPDATE;
    // end;

    // local procedure ShortcutDimension1CodeOnAfterV()
    // begin
    //     CurrPage.UPDATE;
    // end;

    // local procedure ShortcutDimension2CodeOnAfterV()
    // begin
    //     CurrPage.UPDATE;
    // end;

    // local procedure PricesIncludingVATOnAfterValid()
    // begin
    //     CurrPage.UPDATE;
    // end;
}

